#Ploting maps
library(raster)
library(sp)
library(rgdal)
library(ggplot2)
#library(ggspatial)
library(ggmap)
library(maps)
library(mapdata)
library(tmap)

#insert link to the shapefile with the country borders

border <- readOGR(dsn = path.expand("C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/shapefile"),
                  layer = 'ret_env_modis')

plot(border)

cmnp <- readOGR(dsn = path.expand("C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/shapefile"),
                layer = 'limite_pncm')

border_crs <- "+proj=longlat +datum=WGS84 +no_defs"
cmnp <- spTransform(cmnp, border_crs)

plot(cmnp)

SeasonInd <- list.files(path= "C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/timesat",
                        pattern='.tif$', recursive=F, ignore.case=T,
                        full.names=T)

exSeason <- raster(SeasonInd[2])
exSeason

## Raster layers
SoS_year <- raster(SeasonInd[3])
PoS_year <- raster(SeasonInd[2])
EoS_year <- raster(SeasonInd[1])

## Raster stack
raster_stack <- raster::stack(SoS_year, PoS_year, EoS_year)
raster_stack

## Mudar o modo de exibição do tmap
tmap::tmap_mode(mode = "plot")

## Mapa facetado

mapa_seasons_tmap <- tm_shape(raster_stack) + 
  tm_raster(pal = terrain.colors(5), style = 'cont') + li +
  tm_scale_bar(text.size = .5, position = c(.02, 0)) +
  tm_graticules(lines = FALSE) +
  tm_credits("CRS: WGS84/Geo", position = c(.02, .07)) +
  tm_layout(
    legend.title.color='white',
    panel.labels = c("SoS - 2002", "PoS - 2002", "EoS - 2002"),
  ) +
  tm_facets(nrow = 1)
mapa_seasons_tmap
x11()

tm_raster(palette = terrain.colors(5), style = 'cont') + li +
  tm_layout(
    title.color = "red",
    panel.labels = c("SoS - 2002"),
    legend.title.color='white',
    panel.label.color = "black",
    legend.text.color = "black",
    legend.outside=TRUE,
    lwd = 10)

## Plot raster stack
old_par <- par(mfrow = c(1, 3))

plot(SoS_year, main = "SoS - 2002")
plot(cmnp, bg="transparent", add=T, lwd = 2)

plot(PoS_year, main = "PoS - 2002")
plot(cmnp, bg="transparent", add=T, lwd = 2)

plot(EoS_year, main = "EoS - 2002")
plot(cmnp, bg="transparent", add=T, lwd = 2)

par(old_par)

x11()

plot(raster_stack[[c(1, 2, 3)]])
plot(cmnp, col = NA, border = "black", lwd = 3, add = TRUE)

plot(exSeason, main = "Season - Chapada das Mesas National Park")

plot(cmnp, bg="transparent", add=T )

#https://github.com/EmilHvitfeldt/r-color-palettes

tmaptools::palette_explorer()

li <- tm_shape(cmnp) + tm_borders(lwd = 2, col = 'black')
li

palette = 'RdYlGn'
p_sos <- tm_shape(SoS_year) + tm_raster(palette = terrain.colors(5), style = 'cont') + li +
  tm_layout(
            title.color = "red",
            panel.labels = c("SoS - 2002"),
            legend.title.color='white',
            panel.label.color = "black",
            legend.text.color = "black",
            legend.outside=TRUE,
            lwd = 10)
  #tm_layout("Season - SoS - 2002", legend.outside=TRUE, legend.title.color='white',
            #position=c("left", "bottom")) +
  #tm_credits("Eckert IV projection", position = c("right", "BOTTOM")) 

p_sos

p <- tm_shape(bavaria) +
  tm_polygons(col = "type", pal = c("white", "skyblue")) +
  tm_logo("datasets/chapter_2/bavaria.png", height = 2) +
  tm_scale_bar(position = c("left", "bottom"), width = 0.15) +
  tm_compass(position = c("left", "top"), size = 2)

#############

## Mapa


mapa_srtm_rio_claro_tmap <- tm_shape(geo_raster_srtm_rio_claro) +
  tm_raster(pal = "viridis", title = "Elevação (m)") +
  tm_shape(geo_vetor_rio_claro) +
  tm_borders(col = "red", lwd = 2) +
  tm_compass(position = c(.9, .08)) +
  tm_scale_bar(text.size = .6, position = c(.67, 0)) +
  tm_graticules(lines = FALSE) +
  tm_credits("CRS: WGS84/Geo", position = c(.67, .06)) +
  tm_layout(title = "Elevação Rio Claro/SP",
            title.size = 1,
            title.fontface = "bold",
            legend.title.size = .7,
            legend.text.size = .6,
            legend.frame = TRUE,
            legend.position = c(.01, .01),
            legend.title.fontface = "bold")
mapa_srtm_rio_claro_tmap


########### VCI
WeightedVCI <- list.files(path= "C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/VCI_weighted",
                          pattern='.tif$', recursive=F, ignore.case=T,
                          full.names=T)

VCI_ponder <- raster(WeightedVCI[5])
VCI_ponder

# Mapa

vci_2020_2021 <- tm_shape(VCI_ponder) + 
  tm_raster(palette = terrain.colors(5), style = 'cont') + li +
  tm_compass(position = c(.9, .08)) +
  tm_scale_bar(text.size = .5, position = c(.02, 0)) +
  tm_graticules(lines = FALSE) +
  tm_credits("CRS: WGS84/Geo", position = c(.02, .07)) +
  tm_layout(
    legend.title.color='white',
    panel.labels = c("classified VCI 2020/2021"),
  ) +
  tm_facets(nrow = 1)

vci_2020_2021
x11()

plot(VCI_ponder)
plot(cmnp, bg="transparent", add=T, lwd = 2)

##################
## Plot
# mapa_vetor_biomas_ggplot2 <- ggplot(data = cmnp) +
#   # geom_raster(SoS_year) +
#   # aes(fill = nome_bioma) +
#   geom_sf(color = "black") +
#   # scale_fill_manual(values = c("darkgreen", "orange", "orange4", 
#   #                              "forestgreen", "yellow", "yellow3")) +
#   annotation_scale(location = "br") +
#   annotation_north_arrow(location = "br", which_north = "true",
#                          pad_x = unit(0, "cm"), pad_y = unit(.5, "cm"),
#                          style = north_arrow_fancy_orienteering) +
#   annotate(geom = "text", label = "CRS: WGS84", x = -38, y = -31, size = 2.5) +
#   annotate(geom = "text", label = "Fonte: IBGE (2019)", x = -39, y = -32.5, size = 2.5) +
#   labs(title = "SoS - 2002", fill = "Legenda", x = "Longitude", y = "Latitude") +
#   theme_bw() +
#   theme(title = element_text(size = 15, face = "bold"),
#         legend.title = element_text(size = 10, face = "bold"),
#         legend.position = c(.15, .25),
#         legend.background = element_rect(colour = "black"),
#         axis.title = element_text(size = 10, face = "plain"))
# mapa_vetor_biomas_ggplot2



library(cols4all)
cols4all::c4a_gui()
