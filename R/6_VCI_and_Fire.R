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

#### Setp 6. VCI and your relatition with annual fire

# VCI_weighted

dataPath <- "C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/" # dir of the project
dataPath2 <- "C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/VCI_weighted" # dir where have raw data NDVI 

#Create an output folder for the data fire
#dir.create(paste0(dataPath, '/Raster_Fire'))

pathData <- "C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/Raster_Fire" # dir where have NDVI products 

