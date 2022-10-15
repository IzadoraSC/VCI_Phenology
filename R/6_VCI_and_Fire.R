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
library(terra)             # Classes and methods for raster and spatial data
library(dplyr)

#### Setp 6. VCI and your relatition with annual fire

# VCI_weighted

dataPath <- "C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/" # dir of the project
dataPath2 <- "C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/VCI_weighted" # dir where have raw data NDVI 

#Create an output folder for the data fire
#dir.create(paste0(dataPath, '/Raster_Fire'))

pathData <- "C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/Raster_Fire/" # dir where have fire products 
pathData2 <- "C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/VCI_year/" # dir where have VCI products 

##
# List all VCI images.

dscr <- '2002'
allVCI <- list.files(paste0(dataPath,'VCI_CMNP/'), pattern="_2021.tif$", recursive=F, 
                     full.names = T)
allVCI

VCI_stack <- stack(allVCI) %>% 
  plot()
#Create an output folder for the final output named weighted.
# dir.create(paste0(dataPath,'/VCI_year'))

# Create mean of the time block BlockB (VCI_Year).
VCI_stack <- calc(VCI_stack, fun=mean, na.rm=T)
my_palette <- colorRampPalette(c('#8B0000', '#FF4500', '#FFFF00', '#9ACD32', '#008000'))
# x11()
plot(VCI_stack,
     #zlim=c(0,100),
     #col=my_palette(101),                                           # sets the colors as defined above
     main=paste("VCI"," mean"," annual ",dscr,sep=""))

# plot(cmnp, bg="transparent", add=T, lwd = 2)

writeRaster(VCI_stack,filename=paste0(dataPath,"/VCI_year/",dscr,"_VCI_mean.tif"),
            format="GTiff",overwrite=T)

# Step 9: Resample the hazard map
# As the hazard map (250m) and the landcover map (30m) have different resolutions, the hazard map needs to be resampled to the pixel size of the landcover map. Before doing that, make sure they have the same projection (in this example lat/lon).

border <- readOGR(dsn = path.expand("C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/shapefile"),
                  layer = 'ret_env_modis')
cmnp <- readOGR(dsn = path.expand("C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/shapefile"),
                layer = 'limite_pncm')

sr_crs <- "+proj=longlat +datum=WGS84 +no_defs"
# sr_crs2 <- "+proj=utm +zone=23 +south +datum=WGS84 +units=m +no_defs"

#cmnp <- spTransform(cmnp, sr_crs)

#proj4string(border)


# Load hazard map and use a nearest neighbour interpolation to resample the hazard map 
# to the pixel size of the landcover map.

dscr2 <- as.numeric(c('2018', '2019', '2020', '2021'))

  
for (i in 1:length(dscr2)) {
  # add the hazard map which is to be resampled
  VCI_250m <- raster(x = paste0(pathData2, dscr2[i], "_VCI_mean_reproj.tif"))
  plot(VCI_250m)
  fire_30m <- raster(paste0(pathData,"LS_pncm_",dscr2[i],"_Reclas.tif"))
  plot(fire_30m)
  # crop the raster with VCI_250m
  r2 <- raster::crop(fire_30m, extent(VCI_250m))
  plot(r2)
  # resample with bilinear method to not loose category values
  VCI_resemp <- resample(VCI_250m, r2, method = "bilinear")
  plot(VCI_resemp)
  # clip the raster VCI with the CMNP shapefile
  VCI_clip <-mask(VCI_resemp, cmnp) %>%
    writeRaster(filename=paste0(dataPath,"/VCI_year/",dscr2[i],"_VCI_resamp.tif"),
                format="GTiff", overwrite=T) 
  plot(VCI_clip)
  # clip the raster fire with the CMNP shapefile
  fire_30m_clip <- mask(r2, cmnp) %>% 
    writeRaster(filename=paste0(dataPath,"/Raster_Fire/","LS_pncm_",dscr2[i],"_clip.tif"),
                format="GTiff", overwrite=T)
  plot(fire_30m_clip)
}

#clear all plots
dev.off(dev.list()["RStudioGD"]) 

#attempt to clear all plots (suppress error if not plots exist)
# try(dev.off(dev.list()["RStudioGD"]), silent=TRUE)  

############
# dscr <- '2015'
# VCI_250m <- raster(x=paste0(pathData2,dscr,"_VCI_mean_reproj.tif")) # add the hazard map which is to be resampled
# plot(VCI_250m)
# 
# fire_30m <- raster(paste0(pathData,"LS_pncm_",dscr,"_Reclas.tif"))
# 
# plot(fire_30m)
# 
# r2 <- raster::crop(fire_30m, extent(VCI_250m))  # crop the raster with VCI_250m
# plot(r2)
# 
# VCI_resemp <- resample(VCI_250m, r2, method = "bilinear") # resample with nearest neighbour method to not loose category values
# plot(VCI_resemp)
# 
# VCI_clip <-mask(VCI_resemp, cmnp) %>%  # clip the raster with the CMNP shapefile
#   writeRaster(filename=paste0(dataPath,"/VCI_year/",dscr,"_VCI_resamp.tif"),
#               format="GTiff", overwrite=T) 
# plot(VCI_clip)
# 
# fire_30m_clip <- mask(r2, cmnp) %>%  # clip the raster with the CMNP shapefile
#   writeRaster(filename=paste0(dataPath,"/Raster_Fire/","LS_pncm_",dscr,"_clip.tif"),
#               format="GTiff", overwrite=T)
# 
# plot(fire_30m_clip)

