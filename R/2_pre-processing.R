

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

# Drought hazard assessment - Avaliacao dos riscos de seca
  # focuses on the drought hazard assessment which uses a weighted 
  # linear combination of Normalized Difference Vegetation Index (NDVI) phenology 
  # and Vegetation condition index (VCI).
  # concentra-se na avaliação do risco de seca que utiliza uma combinação linear 
  # ponderada de fenologia do Índice de Vegetação da Diferença Normalizada (NDVI)
  # e do Índice de Vegetação Condicionada (VCI).

## After Download MOD13Q1 data at https://lpdaacsvc.cr.usgs.gov/appeears/

## 4.2 Scrip 2: Pre-processing;

# Create two folders, where you will store all data, one for the NDVI files 
# and one for the Pixel Reliability files, e.g. C:/Data_EVI and C:/Data_Pixel_Reliability.

# dir mean
dataPath <- "C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data"

dir(dataPath)

# Create output folders for masked NDVI and VCI.
if (!file.exists(paste0(dataPath,'/data_NDVI')))
  dir.create(paste0(dataPath,'/data_NDVI'))
if (!file.exists(paste0(dataPath,'/data_Pixel_Reliability')))
  dir.create(paste0(dataPath,'/data_Pixel_Reliability'))

# In both folders for each day of the year (DOY) create one subfolder. 
# The name of each folder must start with “DOY_”, e.g. DOY_033.

pathData <- "C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/data_NDVI"
pathData <- "C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/data_Pixel_Reliability"

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
dir(pathData_c)

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
plot(exNDVI, add=border)

# #Showing an example of the corresponding Pixel Reliability
exNDVIqc <- raster(NDVIqc[1])
plot(exNDVIqc)


#enter the links to the folder where you want to store the resulting .jpg-images and .tif-files.

if (!file.exists(paste0(dataPath,'/VCI_Maps_CMNP_jpg')))
  dir.create(paste0(dataPath,'/VCI_Maps_CMNP_jpg'))

path_jpg <- "C:/Users/user/Documents/GitHub/VCI_Phenology/data/VCI_Maps_CMNP_jpg"  
path_tif <- "C:/Users/user/Documents/GitHub/VCI_Phenology/data/VCI_Maps_CMNP_jpg"

# Creating a progress bar in the Console, wich ends at the end of the loop. The progress bar
# looks like this:

pb <- txtProgressBar (min=0, max=length(dlist), style=1)
setTxtProgressBar (pb, 0)



#file.rename(list.files(), paste(as.Date(substr(list.files(),35,41),"%Y%j"),".tif", sep=""))
#file.rename(list.files(), paste(as.Date(substr(list.files(),1,13),"%Y.%m.%d"), "%Y%j"),".tif", sep=""))


# t4 <- "001_2001001_aid0001.tif"
# t <- "MOD13Q1.006__250m_16_days_NDVI_doy2000049_aid0001.tif"
# t <- "MOD13Q1.006__250m_16_days_pixel_reliability_doy2000081_aid0001.tif"
# str_count(t4)
# str_locate(t, 'o')







# # custom function
# my_function <- function(x){
#   file.rename( from = file.path("yourpath/folder1", x) ,
#                to = file.path("yourpath/folder3", x) )
# }
# 
# # apply the function to all files
# lapply(names, my_function)

########################
#AnalysisPeriod <- c(2000, 2022)


# List all downloaded tifs (NDVI and pixel reliability) in the data folder and extract 
# their basenames
# rasterData <- list.files(path=dataPath, pattern='.tif$', recursive=F, ignore.case=T, 
#                          full.names=T)
# 
# rasterFiles <- basename(rasterData)


#Starting VCI processing
# List all NDVI rasters (NDVIrasterData) and their corresponding pixel reliability 
# data (NDVIqc).
# NDVIrasterData <- rasterData[grepl('NDVI',basename(rasterData))]
# NDVIqc <- rasterData[grepl('pixel_reliability',basename(rasterData))]
# 
# 
# # Load example image of downloaded rasters for chunk shapefile determination and 
# # automatically adjust chunk size for small scenes (if needed).
# exRST <- raster(NDVIrasterData[1])
# exPR <- raster(NDVIqc[1])
# plot(exPR)

# Extract all Days of Year (DOY) and YEARs from the filenames. MODIS vegetation 
# data consists of 16-day composites. The filename contains the year and Julian
# day of acquisition
# DOYs <- unique(substr(basename(NDVIrasterData),38,40))
# YEARs <- unique(substr(basename(NDVIrasterData),34,37))


# open modis bands (layers with sur_refl in the name)
# all_modis <- list.files(dataPath, pattern = glob2rx("*_aid0001.tif$"),
#                         full.names = TRUE)
# # create spatial raster stack
# all_modis_bands_pre_st <- stack(all_modis)
# all_modis_bands_pre_br <- brick(all_modis_bands_pre_st)

########################





