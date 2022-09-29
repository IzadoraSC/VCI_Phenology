

#### Load packages using the function library when required.

library(rgdal)             # Functions for spatial data input/output
library(sp)                # classes and methods for spatial data types
library(raster)            # Classes and methods for raster data
library(rasterVis)         # Advanced plotting functions for raster objects 
library(ggplot2)           # Functions for graphing and mapping
library(RColorBrewer)      # Creates nice color schemes
library(stringr)
library(terra)
library(filesstrings)
library(ggmap)
library(maptools)
library(rgeos)




        # Drought hazard assessment - Avaliacao dos riscos de seca
  # focuses on the drought hazard assessment which uses a weighted 
  # linear combination of Normalized Difference Vegetation Index (NDVI) phenology 
  # and Vegetation condition index (VCI).
  # concentra-se na avaliação do risco de seca que utiliza uma combinação linear 
  # ponderada de fenologia do Índice de Vegetação da Diferença Normalizada (NDVI)
  # e do Índice de Vegetação Condicionada (VCI).

## After Download MOD13Q1 data at https://lpdaacsvc.cr.usgs.gov/appeears/
## Processing based on the tutorial published at: https://rpubs.com/UN-SPIDER/VCI
## Remarks: with adaptations.

## 4 Scrip 2: Pre-processing, organization data;

# Create two folders, where you will store all data, one for the NDVI files 
# and one for the Pixel Reliability files, e.g. C:/Data_EVI and C:/Data_Pixel_Reliability.

# dir mean
dataPath <- "C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data"

dir(dataPath)

# Create output folders for masked NDVI and VCI.
# create folder if it doesn't exist
if (!file.exists(paste0(dataPath,'/data_NDVI')))
  dir.create(paste0(dataPath,'/data_NDVI'))
if (!file.exists(paste0(dataPath,'/data_Pixel_Reliability')))
  dir.create(paste0(dataPath,'/data_Pixel_Reliability'))

# In both folders for each day of the year (DOY) create one subfolder. 
# The name of each folder must start with “DOY_”, e.g. DOY_033.

pathData <- "C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/data_NDVI"
pathData <- "C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/data_Pixel_Reliability"

# create folders if it doesn't exist
if (!file.exists(paste0(pathData,'/DOY_001')))
  dir.create(paste0(pathData,'/DOY_001'))
if (!file.exists(paste0(pathData,'/DOY_017')))
  dir.create(paste0(pathData,'/DOY_017'))
if (!file.exists(paste0(pathData,'/DOY_033')))
  dir.create(paste0(pathData,'/DOY_033'))
if (!file.exists(paste0(pathData,'/DOY_049')))
  dir.create(paste0(pathData,'/DOY_049'))
if (!file.exists(paste0(pathData,'/DOY_065')))
  dir.create(paste0(pathData,'/DOY_065'))
if (!file.exists(paste0(pathData,'/DOY_081')))
  dir.create(paste0(pathData,'/DOY_081'))
if (!file.exists(paste0(pathData,'/DOY_097')))
  dir.create(paste0(pathData,'/DOY_097'))
if (!file.exists(paste0(pathData,'/DOY_113')))
  dir.create(paste0(pathData,'/DOY_113'))
if (!file.exists(paste0(pathData,'/DOY_129')))
  dir.create(paste0(pathData,'/DOY_129'))
if (!file.exists(paste0(pathData,'/DOY_145')))
  dir.create(paste0(pathData,'/DOY_145'))
if (!file.exists(paste0(pathData,'/DOY_161')))
  dir.create(paste0(pathData,'/DOY_161'))
if (!file.exists(paste0(pathData,'/DOY_177')))
  dir.create(paste0(pathData,'/DOY_177'))
if (!file.exists(paste0(pathData,'/DOY_193')))
  dir.create(paste0(pathData,'/DOY_193'))
if (!file.exists(paste0(pathData,'/DOY_209')))
  dir.create(paste0(pathData,'/DOY_209'))
if (!file.exists(paste0(pathData,'/DOY_225')))
  dir.create(paste0(pathData,'/DOY_225'))
if (!file.exists(paste0(pathData,'/DOY_241')))
  dir.create(paste0(pathData,'/DOY_241'))
if (!file.exists(paste0(pathData,'/DOY_257')))
dir.create(paste0(pathData,'/DOY_257'))
if (!file.exists(paste0(pathData,'/DOY_273')))
dir.create(paste0(pathData,'/DOY_273'))
if (!file.exists(paste0(pathData,'/DOY_289')))
  dir.create(paste0(pathData,'/DOY_289'))
if (!file.exists(paste0(pathData,'/DOY_305')))
  dir.create(paste0(pathData,'/DOY_305'))
if (!file.exists(paste0(pathData,'/DOY_321')))
  dir.create(paste0(pathData,'/DOY_321'))
if (!file.exists(paste0(pathData,'/DOY_337')))
  dir.create(paste0(pathData,'/DOY_337'))
if (!file.exists(paste0(pathData,'/DOY_353')))
  dir.create(paste0(pathData,'/DOY_353'))


#insert link to the shapefile with the country borders

border <- readOGR(dsn = path.expand("C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/shapefile"),
                  layer = 'ret_env_modis')

plot(border)

cmnp <- readOGR(dsn = path.expand("C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/shapefile"),
                layer = 'limite_pncm')
border_crs <- "+proj=longlat +datum=WGS84 +no_defs"
cmnp <- spTransform(cmnp, border_crs)

plot(cmnp)


# str(border)
# extent(border)
# extent(exNDVI)

# Rename the files by addding a prefix following the pattern DOY_YYYY_, e.g. 033_2001 or 001_2005.
# MOD13Q1.006__250m_16_days_NDVI_doy2000049_aid0001.tif  to  049_2000.tif
# MOD13Q1.006__250m_16_days_pixel_reliability_doy2000049_aid0001.tif to 049_2000.tif

pathData_d <- "C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/MOD13Q1_2000-2022"
setwd(pathData_d)

li<-as.data.frame(list.files(path = pathData_d, pattern = ".tif|.TIF"))
## conversao de dias julianos "%Y%j" para "%Y.%m.%d" and rename
#li$nn<-paste0(substr(li[,1],1,34),format(as.Date(substr(li[,1],35,41), "%Y%j"),"%Y.%m.%d"),substr(li[,1],42,53))
li$nn <- paste0(gsub(li[,1],1,substr(li[,1],39,41)), "_", substr(li[,1],35,53))
for (i in 1:nrow(li)){
  is.pattern = grep(li[i,1],li)
  if (identical(is.pattern,integer(0)) == FALSE){
    sapply(li[is.pattern],FUN=function(eachPath){ 
      file.rename(from=eachPath,to= sub(pattern= li[i,1],replacement = li[i,2],eachPath))
    })
  }
}

# 001_2001001_aid0001.tif to 001_2001.tif

#Conversao II
li<-as.data.frame(list.files(path = pathData_d, pattern = ".tif|.TIF"))
li$nn <- paste0(gsub(li[,1],1,substr(li[,1],1,8)), "", substr(li[,1],20,23))

for (i in 1:nrow(li)){
  is.pattern = grep(li[i,1],li)
  if (identical(is.pattern,integer(0)) == FALSE){
    sapply(li[is.pattern],FUN=function(eachPath){ 
      file.rename(from=eachPath,to= sub(pattern= li[i,1],replacement = li[i,2],eachPath))
    })
  }
}

# files Pixel Reliability
pathData_e <- "C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/px_reliability"
setwd(pathData_e)

li<-as.data.frame(list.files(path = pathData_e, pattern = ".tif|.TIF"))
## conversao de dias julianos "%Y%j" para "%Y.%m.%d" and rename (Pixel Reliability)
#li$nn<-paste0(substr(li[,1],1,34),format(as.Date(substr(li[,1],35,41), "%Y%j"),"%Y.%m.%d"),substr(li[,1],42,66))
li$nn <- paste0(gsub(li[,1],1,substr(li[,1],52,54)), "_", substr(li[,1],48,66))

for (i in 1:nrow(li)){
  is.pattern = grep(li[i,1],li)
  if (identical(is.pattern,integer(0)) == FALSE){
    sapply(li[is.pattern],FUN=function(eachPath){ 
      file.rename(from=eachPath,to= sub(pattern= li[i,1],replacement = li[i,2],eachPath))
    })
  }
}

#Conversao II
li<-as.data.frame(list.files(path = pathData_e, pattern = ".tif|.TIF"))
li$nn <- paste0(gsub(li[,1],1,substr(li[,1],1,8)), "", substr(li[,1],20,23))


for (i in 1:nrow(li)){
  is.pattern = grep(li[i,1],li)
  if (identical(is.pattern,integer(0)) == FALSE){
    sapply(li[is.pattern],FUN=function(eachPath){ 
      file.rename(from=eachPath,to= sub(pattern= li[i,1],replacement = li[i,2],eachPath))
    })
  }
}


setwd("C:/Users/Administrador/Documents/GitHub/VCI_Phenology")

## Move Files
## move files "DOY_YYYY.tif" to subfolders "DOY_YYYY"
 
# # list files to be move


pathData <- "C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/data_NDVI"
pathData_c <- "C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/data_Pixel_Reliability"

output_folder <- dir(pathData,pattern="DOY", full.names = T)
output_folder <- dir(pathData_c,pattern="DOY", full.names = T) #data_Pixel_Reliability

#DOYs <- unique(substr(basename(pathData_c),1,3))

day <- c("001_" ,"017_", "033_", "049_", "065_", "081_", "097_", "113_", "129_", "145_", "161_", "177_", 
         "193_", "209_", "225_", "241_", "257_", "273_", "289_", "305_", "321_", "337_", "353_")

day

# input_files <- list.files(path= pathData_e, #pathData_d=NDVI; pathData_e=px_reliability
#                           pattern= day[23], recursive=F, ignore.case=T,
#                           full.names=T)
# input_files
# output_folder[23]
# 
# # Create copy of files
# file.copy(input_files, output_folder[23])
# #warnings()
#  

n <- length(output_folder)
input_files <- numeric()

for (i in 1:n) {
  input_files <- list.files(path= pathData_e, #pathData_d=NDVI; pathData_e=px_reliability
                            pattern= day[23], recursive=F, ignore.case=T,
                            full.names=T)
  print(input_files[i])
  for (j in 1:n) {
    file.copy(input_files, output_folder[23])
  }
}



####

peso <- c(80, 70, 90, 55)
altura <- c(1.77, 1.60, 1.65, 1.90)
n <- length(peso)
vetor <- numeric(n)
for (i in 1:n) {
  vetor[i] <- (peso[i] / altura[i] ^ 2)
}
# for(x in 1:length(day)) {
#   input_files <- list.files(path= pathData_e, #px_reliability
#                             pattern= day[x], recursive=F, ignore.case=T,
#                             full.names=F)
#   print(x)
#   
#   for (y in 1:length(input_files)) {
#   # Create copy of file
#     file.copy(input_files, file.path(output_folder[y]))
#     print(y)
#     }
#   }



#enter link to the folder where you have stored the MODIS EVI data

pathData <- "C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/data_NDVI"
dlist <- dir(pathData,pattern="DOY")

# enter link to the folder where you have stored the MODIS Pixel Reliability data

pathData_c <- "C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/data_Pixel_Reliability"  
dlist_c <- dir(pathData_c,pattern="DOY")

# List all NDVI rasters (NDVI) and their corresponding pixel reliability 
# data (NDVIqc).

NDVI <- list.files(path="C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/MOD13Q1_2000-2022",
                   pattern='.tif$', recursive=F, ignore.case=T, 
                   full.names=T)

NDVIqc <- list.files(path= "C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/px_reliability",
                     pattern='.tif$', recursive=F, ignore.case=T,
                     full.names=T)

# #Showing an example of the downloaded NDVI data
exNDVI <- raster(NDVI[1])
x11()

plot(exNDVI, main = "NDVI - Chapada das Mesas National Park")

#plot(border, bg="transparent", add=T )
plot(cmnp, bg="transparent", add=T )

# #Showing an example of the corresponding Pixel Reliability
exNDVIqc <- raster(NDVIqc[1])
plot(exNDVIqc, main = "Pixel Reliability - Chapada das Mesas National Park")
plot(cmnp, bg="transparent", add=T )

# enter the links to the folder where you want to store the resulting 
# .jpg-images and .tif-files.

# create folder if it doesn't exist
if (!file.exists(paste0(dataPath,'/VCI_CMNP')))
  dir.create(paste0(dataPath,'/VCI_CMNP'))

path_jpg <- "C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/VCI_CMNP"  
path_tif <- "C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/VCI_CMNP"

# Creating a progress bar in the Console, wich ends at the end of the loop. The progress bar
# looks like this:

pb <- txtProgressBar (min=0, max=length(dlist), style=1)
setTxtProgressBar (pb, 0)



#######################
####### Drought monitoring using the Vegetation Condition Index (VCI) - R script

### Step 5: Generating the VCI

#Creating a progress bar in the Console, wich ends at the end of the loop. The progress bar looks
# like this:
#Main code for processing the EVI data, masking out clouds, calculating the VCI and writing the results

for (i in 1:length(dlist)) {                   # start of the outer for-loop
  fold <- paste(pathData,dlist[i],sep="/")         # the respective DOY folder of the data_NDVI folder
  fls <- dir(fold,pattern=".tif")              # all files that are available in the respective NDVI DOY folder
  flsp <-paste(fold,fls,sep="/")               # all files that are available in the respective NDVI DOY folder with complete path name
  
  ndvistack <- stack(flsp)                      # creates a layer stack of all files within the NDVI DOY folder
  ndviresize<- crop(ndvistack,border)            # resizes the NDVI layer stack to the rectangular extent of the border shapefile
  ndvimask<-mask(ndviresize,border)              # masks the EVI layer stack using the border shapefile
  ndvi<-ndvimask*0.0001                          # rescaling of MODIS NDVI data
  ndvi[ndvi==-0.3]<-NA                           # NDVI fill value(-0,3) in NA 
  ndvi[ndvi<(0)]<-NA                             # as we are only interested in vegetation valid NDVI range is 0 to 1 and all NDVI values smaller than 0 set to NA
  
  fold_c <- paste(pathData_c,dlist_c[i],sep="/")   # the respective DOY folder of the Data_Pixel_Reliability folder
  fls_c <- dir(fold_c,pattern=".tif")          # all files that are available in the respective Pixel Reliability DOY folder
  flsp_c <-paste(fold_c,fls_c,sep="/")         # all files that are available in the respective Pixel Reliability DOY folder with complete path name
  
  cloudstack <- stack(flsp_c)                  # creates a layer stack of all files within the Pixel Relaibility DOY folder
  cloudresize<- crop(cloudstack,border)        # resizes the Pixel Reliability layer stack to the rectangular extent of the border shapefile
  cloudmask<-mask(cloudresize,border)          # masks the Pixel Reliability layer stack using the border shapefile
  cloudmask[cloudmask==(3)]<-NA                # Pixel Reliability rank 3 pixels (cloudy) set to NA
  cloudmask[cloudmask==(2)]<-NA                # Pixel Reliability rank 2 pixels (snow&ice) set to NA
  cloudmask[cloudmask==(0)]<-1                 # Pixel Reliability rank 0 pixels (good quality) set to 1
  cloudmask[cloudmask>(3)]<-NA                 # as valid Pixel Reliability range is -1 to 3, all Pixel Reliability values >3 set to NA
  # (as -1 rank pixels show value 255)
  
  ndvi_c=ndvi*cloudmask                          # multiplying the EVI layer stack by the Pixel Reliability layer stack
  # to get one single layer stack with applied cloud mask
  
  # extracting max and min value for each pixel
  ndvimax <- stackApply (ndvi_c, rep (1, nlayers (ndvi)), max, na.rm=T) #calculating the max value for the layer stack for each individual pixel
  ndvimin <- stackApply (ndvi_c, rep (1, nlayers (ndvi)), min, na.rm=T) #calculating the min value for the layer stack for each individual pixel
  
  
  # if na.rm is TRUE NA values are ignored, otherwise an NA value in any of the arguments will cause a value of NA to be returned,
  # https://stat.ethz.ch/R-manual/R-devel/library/base/html/Extremes.html
  
  VCI_all <- ((ndvi_c-ndvimin)/(ndvimax-ndvimin))*100 #calculating VCI
  
  
  # define breaks and color scheme
  
  my_palette <- colorRampPalette(c('#8B0000', '#FF4500', '#FFFF00', '#9ACD32', '#008000'))
  
  fold_jpg <- paste(path_jpg)                                         # the respective folder where you want to store the resulting .jpg-images.
  fold_tif <- paste(path_tif)                                         # the respective folder where you want to store the resulting .tif-files.
  
  
  for (k in 1:nlayers(VCI_all)) {     # start of the inner for-loop
    
    
    year <- substr(fls[k],5,8)        # extracting the fifth to eigths letter of the filename, which is the year (cf. data preparation above)
    doy <- substr(fls[k],1,3)         # extracting the first to third letter of the filename, which is the DOY (cf. data preparation above)
    
    
    # writeRaster(evi[[k]], filename=paste(fold,"/",doy,"_",year,sep=""), format="ENVI", datatype='FLT4S', overwrite=TRUE)
    # in case you would like to have Envi files (Attention: note the datatype)
    
    jpeg(filename=paste(fold_jpg,"/",doy,"_",year,".jpg",sep=""), quality = 100) 
    # writes the jpg maps and names the files autmatically according to the pattern DOY_YYYY
    
    
    plot(VCI_all[[k]],
         zlim=c(0,100),
         col=my_palette(101),                                           # sets the colors as defined above
         main=paste("VCI"," (NDVI)"," sample ",doy," ",year,sep="")) # automizes the title of the plot.
    plot(cmnp, bg="transparent", add=T) # insert shapefile limit area
    # ToDo: Adjust the file naming according to the data you are processing!
    # E.g. if you base your VCI on EVI data, write (EVI)
    
    
    dev.off()
    
    
    writeRaster(VCI_all[[k]], filename=paste(fold_tif,"/",doy,"_",year,".tif",sep=""), format="GTiff", overwrite=TRUE)
    # writes the geotiff and automizes the file naming according to the pattern DOY_YYYY
    
  } # end of the inner for-loop
  
  
  setTxtProgressBar (pb, i)
  
}   # end of the outer for-loop



#######################
####### Normalized Diference Vegetation Index (NDVI) 

### Step 5: Generating the NDVI with mask cloud

#enter the links to the folder where you want to store the resulting .jpg-images and .tif-files.

if (!file.exists(paste0(dataPath,'/NDVI_mask')))
  dir.create(paste0(dataPath,'/NDVI_mask'))


#data NDVI whit cloudmask
path_jpg <- "C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/NDVI_mask"  
path_tif <- "C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/NDVI_mask"
# 

#Main code for processing the EVI data, masking out clouds, and writing the results

for (i in 1:length(dlist)) {                   # start of the outer for-loop
  fold <- paste(pathData,dlist[i],sep="/")         # the respective DOY folder of the data_NDVI folder
  fls <- dir(fold,pattern=".tif")              # all files that are available in the respective NDVI DOY folder
  flsp <-paste(fold,fls,sep="/")               # all files that are available in the respective NDVI DOY folder with complete path name
  
  ndvistack <- stack(flsp)                      # creates a layer stack of all files within the NDVI DOY folder
  ndviresize<- crop(ndvistack,border)            # resizes the NDVI layer stack to the rectangular extent of the border shapefile
  ndvimask<-mask(ndviresize,border)              # masks the EVI layer stack using the border shapefile
  ndvi<-ndvimask*0.0001                          # rescaling of MODIS NDVI data
  ndvi[ndvi==-0.3]<-NA                           # NDVI fill value(-0,3) in NA 
  ndvi[ndvi<(0)]<-NA                             # as we are only interested in vegetation valid NDVI range is 0 to 1 and all NDVI values smaller than 0 set to NA
  
  fold_c <- paste(pathData_c,dlist_c[i],sep="/")   # the respective DOY folder of the Data_Pixel_Reliability folder
  fls_c <- dir(fold_c,pattern=".tif")          # all files that are available in the respective Pixel Reliability DOY folder
  flsp_c <-paste(fold_c,fls_c,sep="/")         # all files that are available in the respective Pixel Reliability DOY folder with complete path name
  
  cloudstack <- stack(flsp_c)                  # creates a layer stack of all files within the Pixel Relaibility DOY folder
  cloudresize<- crop(cloudstack,border)        # resizes the Pixel Reliability layer stack to the rectangular extent of the border shapefile
  cloudmask<-mask(cloudresize,border)          # masks the Pixel Reliability layer stack using the border shapefile
  cloudmask[cloudmask==(3)]<-NA                # Pixel Reliability rank 3 pixels (cloudy) set to NA
  cloudmask[cloudmask==(2)]<-NA                # Pixel Reliability rank 2 pixels (snow&ice) set to NA
  cloudmask[cloudmask==(0)]<-1                 # Pixel Reliability rank 0 pixels (good quality) set to 1
  cloudmask[cloudmask>(3)]<-NA                 # as valid Pixel Reliability range is -1 to 3, all Pixel Reliability values >3 set to NA
  # (as -1 rank pixels show value 255)
  
  ndvi_c=ndvi*cloudmask                          # multiplying the EVI layer stack by the Pixel Reliability layer stack
  # to get one single layer stack with applied cloud mask
  
  # define breaks and color scheme
  
  my_palette <- colorRampPalette(c('#8B0000', '#FF4500', '#FFFF00', '#9ACD32', '#008000'))
  
  fold_jpg <- paste(path_jpg)                                         # the respective folder where you want to store the resulting .jpg-images.
  fold_tif <- paste(path_tif)                                         # the respective folder where you want to store the resulting .tif-files.
  
  
  for (k in 1:nlayers(ndvi_c)) {     # start of the inner for-loop
    
    
    year <- substr(fls[k],5,8)        # extracting the fifth to eigths letter of the filename, which is the year (cf. data preparation above)
    doy <- substr(fls[k],1,3)         # extracting the first to third letter of the filename, which is the DOY (cf. data preparation above)
    
    
    writeRaster(ndvi_c[[k]], filename=paste(fold,"/",doy,"_",year,sep=""), format="ENVI", datatype='FLT4S', overwrite=TRUE)
    # in case you would like to have Envi files (Attention: note the datatype)
    
    jpeg(filename=paste(fold_jpg,"/",doy,"_",year,".jpg",sep=""), quality = 100) 
    # writes the jpg maps and names the files autmatically according to the pattern DOY_YYYY
    
    
    plot(ndvi[[1]],
         zlim=c(0,1),
         col=my_palette(101),                                           # sets the colors as defined above
         main=paste("NDVI"," (with Cloudmask)"," sample ",doy," ",year,sep="")) # automizes the title of the plot.
    plot(cmnp, bg="transparent", add=T) # insert shapefile limit area
    # ToDo: Adjust the file naming according to the data you are processing!
    # E.g. if you base your VCI on NDVI data, write (NDVI)
    
    
    dev.off()
    
    
    writeRaster(ndvi_c[[k]], filename=paste(fold_tif,"/",doy,"_",year,".tif",sep=""), format="GTiff", overwrite=TRUE)
    # writes the geotiff and automizes the file naming according to the pattern DOY_YYYY
    # writeRaster(ndvi[[k]], filename=paste(fold_tif,"/",doy,"_",year,".tif",sep=""), format="GTiff", datatype='INT1S' overwrite=TRUE)
    
    
  } # end of the inner for-loop
  
  
  setTxtProgressBar (pb, i)
  
}   # end of the outer for-loop




