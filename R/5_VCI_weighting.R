# list and remove objects from workspace
ls()
rm(list = ls())

#### Load packages using the function library when required.

library(rgdal)             # Functions for spatial data input/output
library(sp)                # classes and methods for spatial data types
library(raster)            # Classes and methods for raster data
library(rasterVis)         # Advanced plotting functions for raster objects 
library(ggplot2)           # Functions for graphing and mapping
library(RColorBrewer)      # Creates nice color schemes
library(stringr)
library(rts)

# Start VCI weighting block
# The weighted VCI uses a weighted linear combination. Thus, the raw VCI values
# are split into three groups depending on their timely position and given different
# weights when averaged over the season; Block A is the time from SoS to PoS, block B 
# is PoS and block C is the time from PoS to EoS. From the mean seasonal metrics, 
# the respective VCI images are derived per pixel and then averaged over the season.


#### Setp 5. VCI weighting
# Data path: Enter the path to a folder where you have enough free space to store your 
# MODIS data and the resulting products. 

dataPath <- "C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/" # dir of the project
#pathData <- "C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/NDVI_mask" # dir where have NDVI products 
dataPath2 <- "C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/MOD13Q1_2000-2022" # dir where have raw data NDVI 

#Enter the hemisphere of your study area: 1 = north; 0 = south. For South Africa set hemisphere = 0.
hemisphere <- 0

# Analysis period: Define the period of analysis with a vector of two components. 
# The first is the starting year and the second the final year. If you want to 
# process all available years just comment the line with a #. In this example all 
# data is used, thus the line is commented.

# AnalysisPeriod <- c(2001, 2002)
# remove(AnalysisPeriod)

# Extract all Days of Year (DOY) and YEARs from the filenames. MODIS vegetation 
# data consists of 16-day composites. The filename contains the year and Julian
# day of acquisition

rasterData <- list.files(path=dataPath2, pattern='.tif$', recursive=F, ignore.case=T,
                         full.names=T)
NDVIrasterData <- rasterData[grepl('NDVI',basename(rasterData))]
DOYs <- unique(substr(basename(NDVIrasterData),39,41))
YEARs <- unique(substr(basename(NDVIrasterData),35,38))
#YEARs <- c("2001", "2002")
length(YEARs)

# List all VCI images.
allVCI <- list.files(paste0(dataPath,'VCI_CMNP/'), pattern=".tif$", recursive=F, full.names = T)

# # List all VCI images.
# allVCI <- list.files(paste0(dataPath,'/VCI_CMNP/'), pattern=".tif$", recursive=F, full.names = T)
test <- list.files(paste0(dataPath,"timesat/"), pattern="_SoS.tif$", recursive=F, full.names = T)

    
#Load mean seasonality rasters.
SoS <- as.integer(raster(paste0(dataPath,"/timesat/SOS-MEAN.tif")))
PoS <- as.integer(raster(paste0(dataPath,"/timesat/POS-MEAN.tif")))
EoS <- as.integer(raster(paste0(dataPath,"/timesat/EOS-MEAN.tif")))


#Create an output folder for the final output named weighted.
dir.create(paste0(dataPath,'/VCI_weighted'))

# Loop through each year(or season) and check whether analysis period is defined.
for (sy in min(as.numeric(YEARs)):max(as.numeric(YEARs))) {
  if ((exists("AnalysisPeriod") && (sy > AnalysisPeriod[1] && sy < AnalysisPeriod[2])) || exists("AnalysisPeriod") == F){
    if (!(sy == max(as.numeric(YEARs)) && hemisphere == 0)) {
      
      #Check for hemisphere, load VCI data for the season
      if (hemisphere == 1){
        lyVCI <- allVCI[grepl(sy, allVCI)]
        dscr <- sy
      }else{
        #Load correct data if southern hemisphere was selected (seasonality shift)
        lyVCI <- c(allVCI[grepl(sy,allVCI)],allVCI[grepl(sy+1,allVCI)])
        #Adjusting output filenames if southern hemisphere was selected
        if (sy == min(as.numeric(YEARs))){
          lyVCI <- lyVCI[1:23]
        }else{
          lyVCI <- lyVCI[13:35]
        }
        #Adjusting output filenames if southern hemisphere was selected
        dscr <- paste0(sy,"_",sy+1)
      }
    }
  }
}

# Stack all VCI for each year.
yVCI <- stack(lyVCI)

plot(yVCI)

# Block A: Start of Season (SoS) * Extract all pixels that fall in Block A 
# (SoS to PoS) and set all other pixels NA.

BlockA <- stack()
#Iterating through all 23 images of the season
for (i in 1:23){
  #Read start-of-season dates
  s <- SoS
  #Read dates up to 16 days before peak of season
  e <- (PoS - 1)
  
  #Check if current iteration lies within the seasonal dates of each pixel
  s[s > i] <- NA
  e[e < i] <- NA
  
  #Creating a binary mask and apply to the VCI image
  m <- s*e
  v <- yVCI[[i]]*(m/m)
  
  #Add layer to stack
  BlockA <- stack(BlockA, v)
  
}

# Create mean of the time block BlockA (SoS to PoS).
BlockA <- calc(BlockA, fun=mean, na.rm=T)
plot(BlockA)

writeRaster(BlockA,filename=paste0(dataPath,"/VCI_weighted/",dscr,"_BlockA_SOS.tif"),
            format="GTiff",overwrite=T)

# Block B: Peak of Season (PoS) * Extract all pixels that fall in Block P (PoS)
# and set all other pixels NA.

BlockB <- stack()

#Iterating through all 23 images of the season
for (i in 1:23){
  s <- PoS
  e <- PoS
  
  s[s > i] <- NA
  e[e < i] <- NA
  
  m <- s*e
  v <- yVCI[[i]]*(m/m)
  
  BlockB <- stack(BlockB, v)
}

# Create mean of the time block BlockB (PoS).
BlockB <- calc(BlockB, fun=mean, na.rm=T)
plot(BlockB)

writeRaster(BlockB,filename=paste0(dataPath,"/VCI_weighted/",dscr,"_BlockB_POS.tif"),
            format="GTiff",overwrite=T)

# Block C: End of Season (EoS) * Extract all pixels that fall in Block C
# (PoS to EoS) and set all other pixels NA.
BlockC <- stack()

#Iterating through all 23 images of the season
for (i in 1:23){
  s <- (PoS + 1)
  e <- EoS
  
  s[s > i] <- NA
  e[e < i] <- NA
  
  m <- s*e
  v <- yVCI[[i]]*(m/m)
  
  BlockC <- stack(BlockC, v)
}

# Create mean of the timeblock BlockC (EOS).
BlockC <- calc(BlockC, fun=mean, na.rm=T)
plot(BlockC)

writeRaster(BlockC,filename=paste0(dataPath,"/VCI_weighted/",dscr,"_BlockC_EOS.tif"),
            format="GTiff",overwrite=T)

# Stack the VCI blocks (according of their weight) and calculate the mean.
#Weighting: 5-7-1 start-peak-end of season mean
#Result: weighted VCI by season

WeightedStack <- stack(BlockA,BlockA,BlockA,BlockA,BlockA,
                       BlockB,BlockB,BlockB,BlockB,BlockB,BlockB,BlockB,
                       BlockC)

WeightedVCI <- calc(WeightedStack, fun=mean, na.rm=T)
plot(WeightedVCI)

writeRaster(WeightedVCI,filename=paste0(dataPath,"/VCI_weighted/",dscr,"_WeightedVCI.tif"),
            format="GTiff",overwrite=T)

# The weighted indices are then classified into five classes resulting in the following values 
# for the final product:

#Output: five classes
cWeightedVCI <- reclassify(WeightedVCI, c(-1, 10, 4,  10, 20, 3,  20, 30, 2, 30,40, 1,40,101,0))  
plot(cWeightedVCI)

writeRaster(cWeightedVCI,filename=paste0(dataPath,"/VCI_weighted/",dscr,"_FiveCl.tif"),
            format="GTiff",overwrite=T)

# 

#Output: three classes
dWeightedVCI <- reclassify(WeightedVCI, c(-1, 10, 2,  10, 40, 1,  40, 101, 0))  
plot(dWeightedVCI)

writeRaster(dWeightedVCI,filename=paste0(dataPath,"/VCI_weighted/",dscr,"_ThreeCl.tif"),
            format="GTiff",overwrite=T)

#Delete all temporary files and finish.
#Deleting all temp files
tmp <- list.files(path=paste0(dataPath,'/temp/'), recursive=F, ignore.case=T, full.names=T)
file.remove(tmp)

#Finished
print(paste0(Sys.time(),
             ' +++++ Finished. You will find the data in the subfolders \'VCI_CMNP\' and \'VCI_weighted\' at ', 
             dataPath,"."))
