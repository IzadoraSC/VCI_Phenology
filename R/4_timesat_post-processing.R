library(lintr)

###Start TIMESAT post-processing


dataPath2 <- "C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/MOD13Q1_2000-2022" # dir where have raw data NDVI 

NDVI <- list.files(path=dataPath2, pattern='.tif$', recursive=F, ignore.case=T, 
                   full.names=T)
exRST <- raster(NDVI[1])
exRST

# TIMESAT path: Enter the path to your TIMESAT 3.3 installation including the subfolder
# /compiled/Win64.

TSpath <-"C:/timesat33/compiled/Win64"

#Enter the hemisphere of your study area: 1 = north; 0 = south. For South America set hemisphere = 0.
hemisphere <- 0


# Define function bintiff that reads TIMESAT outputs. In order to use the TIMESAT
# outputs in this analysis the format of the TIMESAT output needs to be changed to
# tiff.

##Function to read TIMESAT outputs using TIMESAT-tools
bintiff <- function (rast, base_image) {
  timesatbinobj <- file(rast, "rb")
  raw_vector <-
    readBin(
      timesatbinobj,
      n = file.info(rast)$size,
      what = "int",
      signed = T,
      endian = "little",
      size = 2
    )
  close(timesatbinobj)
  data_matrix <-
    matrix(raw_vector, nrow(base_image), ncol(base_image), byrow = T)
  tiff_raster <- raster(data_matrix, template = base_image)
  return(tiff_raster)
}

#Reading raw TIMESAT output (Variant B; Timesat-fortran tools)
path_tpaFile <- paste0(TSpath, "/TIMESAT_input_TS.tpa")

#Path to TIMESAT-seas2img-tool for converting
pTSpath <- gsub("compiled/Win64/", "compiled/Win64", TSpath)
seasImg <- gsub("compiled/Win64", "timesat_fortran/tools/TSF_seas2img", pTSpath)
#TIMESAT will not calculate phenology for the very first season, hence the following correction-variable
if (hemisphere == 1) {
  corr <- 1
} else{
  corr <- 2
}

noSeasons  <- length(YEARs) - corr
setwd(paste0(dataPath, "/temp/"))
base_image = exRST
#SeasonIndicators in .tpa file: 1 = SoS, 2 = EoS, Peaktime = 5

#Looping through season-indocators and writing output for each
for (d in 1:3) {
  SeasonIndicator <- d
  
  #Peaktime is indicator #5
  if (d == 3) {
    SeasonIndicator <- 5
  }
  
  if (SeasonIndicator == 1) {
    descrinfo <- "SoS"
  } else if (SeasonIndicator == 2) {
    descrinfo <- "EoS"
  } else if (SeasonIndicator == 5) {
    descrinfo <- "PoS"
  }
  
  #Loop through seasons, create output for each
  for (s in 1:noSeasons) {
    startIX <- 1 + (23 * (s))
    endIX <- 23 + (23 * (s))
    print(paste0("Reading/converting ", descrinfo, " ", s, "/", noSeasons, "..."))
    
    #Calling seas2img via command-prompt
    #(Parameters: infile, seaspar, datemin, datemax, misseason, misspix, nameout, filetype)
    system(paste0("\"",  seasImg,  "\" \"", path_tpaFile,  "\" ",  SeasonIndicator,
                  " ",  startIX,  " ",  endIX,  " 0 0 NSE", SeasonIndicator,  "_", s,  " 2"),
           wait = TRUE, show.output.on.console = F)
    
    #Convert binary to tiff
    r <- bintiff(paste0(dataPath, "/temp/NSE", SeasonIndicator, "_", s, "_season1"),
                 base_image) %% 23
    writeRaster(r, filename = paste0(dataPath,"/timesat/", as.numeric(YEARs[s]) + 1, "_",
                                     descrinfo), format = "GTiff", overwrite = T)
    }
  
}


###################
#Parsing Tiffs of Start, Peak, End of Season
timesatRasterALL <- list.files(paste0(dataPath,"/timesat/"), pattern=".tif$", recursive=F, full.names=T)
timesatRasterSOS <- stack(timesatRasterALL[grepl("_SoS",timesatRasterALL)])
timesatRasterPOS <- stack(timesatRasterALL[grepl("_PoS",timesatRasterALL)])
timesatRasterEOS <- stack(timesatRasterALL[grepl("_EoS",timesatRasterALL)])

###Checking for integrity of seasonal metrics

#(Prepare a stack of original data for later)
allDetSeas = timesatRasterSOS

#Filter out TIMESAT-NAs
timesatRasterSOS[timesatRasterSOS == 0] <- NA
timesatRasterPOS[timesatRasterPOS == 0] <- NA
timesatRasterEOS[timesatRasterEOS == 0] <- NA

###For analysis applied to agriculture, follow
# TIMESAT detects the phenology parameters based on the EVI or NDVI signal but does not necessarily 
# consider temporal crop phenology stages e.g. grain filling periods. Thus, minimum and maximum 
# time gaps are defined to ensure that agricultural growth stages are guaranteed. 
# The minimum time between SoS and PoS is 20 days, between PoS and EoS 10 days and the overall
# season can only (maximum) have 240 days. These thresholds can be adjusted here in the script.

##Check for difference between Start, Peak, End to remove unreliable data (in days)
# thresh1:  minimum allowed difference between peak of the season (POS) and start of the season (SOS) in days
thresh1 <- 20
# thresh2:  maximum allowed difference between start of the season (SOS) and end of the season (EOS) or the equivalent length of the season (LOS) in days
thresh2 <- 240
# thresh3:  minimum allowed difference between end of the season (EOS) and peak of the season (POS) in days
thresh3 <- 10

#Convert to image-index
thresh1 <- thresh1/16
thresh2 <- thresh2/16
thresh3 <- thresh3/16

#Detect all pixels for which less than 75% of all possible seasons were detected (filters out heavily mixed pixels with less vegetation)
allDetSeas[allDetSeas == 0] <- NA
allDetSeas <- allDetSeas/allDetSeas
nSeasons <- calc(allDetSeas, fun = sum, na.rm=T)
nSeasons[nSeasons<(0.75*length(YEARs)-corr)] <- NA
#Binarize the mask
unrelpxmask <- nSeasons/nSeasons

for(i in 1:nlayers(timesatRasterSOS)){
  
  diffT1 <- timesatRasterPOS[[i]] - timesatRasterSOS[[i]]
  diffT2 <- timesatRasterEOS[[i]] - timesatRasterSOS[[i]]
  diffT3 <- timesatRasterEOS[[i]] - timesatRasterPOS[[i]]
  
  #Preparing Masks
  diffT1[diffT1<thresh1] <- NA
  diffT2[diffT2>thresh2] <- NA
  diffT3[diffT3<thresh3] <- NA
  
  #Combining the masks to one binary mask
  diffALL <- (diffT1/diffT1) * (diffT2/diffT2) * (diffT3/diffT3) * unrelpxmask
  
  #Apply mask and write files
  timesatRasterSOS[[i]] <- timesatRasterSOS[[i]]*diffALL
  timesatRasterPOS[[i]] <- timesatRasterPOS[[i]]*diffALL
  timesatRasterEOS[[i]] <- timesatRasterEOS[[i]]*diffALL
  
  namestr <- formatC(i,digits=2,flag=0)
  
  writeRaster(timesatRasterSOS[[i]], filename=paste0(dataPath,'/timesat/SOS-',namestr), format="GTiff", overwrite = T )
  writeRaster(timesatRasterPOS[[i]], filename=paste0(dataPath,'/timesat/POS-',namestr), format="GTiff", overwrite = T )
  writeRaster(timesatRasterEOS[[i]], filename=paste0(dataPath,'/timesat/EOS-',namestr), format="GTiff", overwrite = T )
  
}

### Rotate this part after the stage to apply it to agricultural studies or not.

#Calculation of mean Seasonal Metrics + output
meanSOS <- calc(timesatRasterSOS,fun=mean,na.rm=T)
meanPOS <- calc(timesatRasterPOS,fun=mean,na.rm=T)
meanEOS <- calc(timesatRasterEOS,fun=mean,na.rm=T)

writeRaster(meanSOS, filename=paste0(dataPath,'/timesat/SOS-MEAN'), format="GTiff", overwrite = T )
writeRaster(meanPOS, filename=paste0(dataPath,'/timesat/POS-MEAN'), format="GTiff", overwrite = T )
writeRaster(meanEOS, filename=paste0(dataPath,'/timesat/EOS-MEAN'), format="GTiff", overwrite = T )


#### using the rTIMESAT package to read the TIMESAT output files
file_tpa <- "C:/timesat33/compiled/Win64/TIMESAT_input_TS.tpa"
d_tpa <- read_tpa(file_tpa)

file_tts <- "C:/timesat33/compiled/Win64/TIMESAT_input_fit.tts" 
d_tts <- read_tts(file_tts)



##########

