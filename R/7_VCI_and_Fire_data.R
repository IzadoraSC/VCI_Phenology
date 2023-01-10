#Carregando pacotes
library(tidyverse)
library(ggplot2)
library(readr)
library(dplyr)

list_table <- readxl::read_xlsx('C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/Raster_Fire/LS_pncm_2018_clip.xlsx')

as.data.frame(list_table)

df.2001 <- list_table
df.2001$Fire <- c('Sem fogo', 'Fogo')
df.2001$Year <- c('2001')
as.data.frame(df.2001)


df.2002 <- list_table
df.2002
df.2002$km2 <- df.2002$m2 * 0.000001
df.2002$Fire <- c('Sem fogo', 'Fogo')
df.2002$Year <- c('2002')
as.data.frame(df.2002)


df.2003 <- list_table
df.2003
df.2003$km2 <- df.2003$m2 * 0.000001
df.2003$Fire <- c('Sem fogo', 'Fogo')
df.2003$Year <- c('2003')
as.data.frame(df.2003)

df.2004 <- list_table
df.2004
df.2004$km2 <- df.2003$m2 * 0.000001
df.2004$Fire <- c('Sem fogo', 'Fogo')
df.2004$Year <- c('2004')
as.data.frame(df.2004)

df.2005 <- list_table
df.2005
df.2005$km2 <- df.2005$m2 * 0.000001
df.2005$Fire <- c('Sem fogo', 'Fogo')
df.2005$Year <- c('2005')
as.data.frame(df.2005)

df.2006 <- list_table
df.2006
df.2006$km2 <- df.2006$m2 * 0.000001
df.2006$Fire <- c('Sem fogo', 'Fogo')
df.2006$Year <- c('2006')
as.data.frame(df.2006)

df.2007 <- list_table
df.2007
df.2007$km2 <- df.2007$m2 * 0.000001
df.2007$Fire <- c('Sem fogo', 'Fogo')
df.2007$Year <- c('2007')
as.data.frame(df.2007)

df.2008 <- list_table
df.2008
df.2008$km2 <- df.2008$m2 * 0.000001
df.2008$Fire <- c('Sem fogo', 'Fogo')
df.2008$Year <- c('2008')
as.data.frame(df.2008)

df.2009 <- list_table
df.2009
df.2009$km2 <- df.2009$m2 * 0.000001
df.2009$Fire <- c('Sem fogo', 'Fogo')
df.2009$Year <- c('2009')
as.data.frame(df.2009)

df.2010 <- list_table
df.2010
df.2010$km2 <- df.2010$m2 * 0.000001
df.2010$Fire <- c('Sem fogo', 'Fogo')
df.2010$Year <- c('2010')
as.data.frame(df.2010)

df.2011 <- list_table
df.2011
df.2011$km2 <- df.2011$m2 * 0.000001
df.2011$Fire <- c('Sem fogo', 'Fogo')
df.2011$Year <- c('2011')
as.data.frame(df.2011)

df.2012 <- list_table
df.2012
df.2012$km2 <- df.2012$m2 * 0.000001
df.2012$Fire <- c('Sem fogo', 'Fogo')
df.2012$Year <- c('2012')
as.data.frame(df.2012)

df.2013 <- list_table
df.2013
df.2013$km2 <- df.2013$m2 * 0.000001
df.2013$Fire <- c('Sem fogo', 'Fogo')
df.2013$Year <- c('2013')
as.data.frame(df.2013)

df.2014 <- list_table
df.2014
df.2014$km2 <- df.2014$m2 * 0.000001
df.2014$Fire <- c('Sem fogo', 'Fogo')
df.2014$Year <- c('2014')
as.data.frame(df.2014)

df.2015 <- list_table
df.2015
df.2015$km2 <- df.2015$m2 * 0.000001
df.2015$Fire <- c('Sem fogo', 'Fogo')
df.2015$Year <- c('2015')
as.data.frame(df.2015)

df.2016 <- list_table
df.2016
df.2016$km2 <- df.2016$m2 * 0.000001
df.2016$Fire <- c('Sem fogo', 'Fogo')
df.2016$Year <- c('2016')
as.data.frame(df.2016)

df.2017 <- list_table
df.2017
df.2017$km2 <- df.2017$m2 * 0.000001
df.2017$Fire <- c('Sem fogo', 'Fogo')
df.2017$Year <- c('2017')
as.data.frame(df.2017)

df.2018 <- list_table
df.2018 <- dplyr::add_row(df.2018,
                          value = 0,
                          count = 1631882,
                          m2 = 1468693800)
df.2018 <- df.2018[c("2","1"),]
df.2018$km2 <- df.2018$m2 * 0.000001
df.2018$Fire <- c('Sem fogo', 'Fogo')
df.2018$Year <- c('2018')
as.data.frame(df.2018)

df.2019 <- list_table
df.2019 <- dplyr::add_row(df.2019,
                          value = 0,
                          count = 1582964,
                          m2 = 1424667600)
df.2019 <- df.2019[c("2","1"),]
df.2019$km2 <- df.2019$m2 * 0.000001
df.2019$Fire <- c('Sem fogo', 'Fogo')
df.2019$Year <- c('2019')
as.data.frame(df.2019)


1778338 - 146456


1631882 * 900

df.2020 <- list_table
df.2020 <- dplyr::add_row(df.2020,
                          value = 0,
                          count = 1347260,
                          m2 = 1212534000)
df.2020 <- df.2020[c("2","1"),]
df.2020$km2 <- df.2020$m2 * 0.000001
df.2020$Fire <- c('Sem fogo', 'Fogo')
df.2020$Year <- c('2020')
as.data.frame(df.2020)

df.2021 <- list_table
df.2021 <- dplyr::add_row(df.2021,
                          value = 0,
                          count = 1667531,
                          m2 = 1500777900)
df.2021 <- df.2021[c("2","1"),]
df.2021$km2 <- df.2021$m2 * 0.000001
df.2021$Fire <- c('Sem fogo', 'Fogo')
df.2021$Year <- c('2021')
as.data.frame(df.2021)

#put all data frames into list
df_list <- list(df.2001, df.2002, df.2003, df.2004, df.2005, df.2006, df.2007,
                df.2008, df.2009, df.2010, df.2011, df.2012, df.2012, df.2013,
                df.2014, df.2015, df.2015, df.2016, df.2017, df.2018, df.2019,
                df.2020, df.2021)
#merge all data frames in 


df.geral <- Reduce(function(x, y) merge(x, y, all=TRUE), df_list) 

write_csv(df.geral, "df_geral_fogo.csv")

df.geral.fogo <- df.geral[-c(1:21),]

# PNCM_annual.LocProt <- ddply(PNCM_DF_Total, .(Year,Local,Protection), summarise, 
#                              Scars = length(unique(Area)),
#                              Total_BA = sum(Area),
#                              percentBA = sum(Percent), 
#                              MeanArea = mean(Area), 
#                              MaxArea = max(Area),
#                              SdBA = sd(Area),
#                              IgnBA = (Scars/at))

b1  <-  ggplot(df.geral.fogo, aes(x=Year, y= km2, fill=Fire)) + 
  geom_bar(position = position_dodge(), col = 'black',
           stat="identity", width = 0.85, show.legend = NA) +
  #facet_grid( .~ Local ) +
  scale_fill_manual(values=c("#E25508")) +
  ylab('Total de ?rea Queimada (km?)') +  xlab("Ano") +
  scale_y_continuous(breaks = seq(0,850,100)) + 
  #theme(legend.title = element_text(face="bold")) +
  theme(legend.position = 'none') +
  theme(panel.background = element_rect(fill = "white")) +
  theme(axis.line = element_line(colour = 'black', size = NULL, linetype = 'solid',
                                 lineend = NULL, color = NULL, arrow = NULL, inherit.blank = FALSE)) +
  theme(axis.title.x = element_text(colour="black", size=15, face="bold")) +
  theme(axis.title.y = element_text(colour="black", size=15, face="bold")) +
  theme(axis.text = element_text(colour = "black", size =13))+
  #ggtitle("PNCM e Buffer (1990-2017)") +
  theme(text = element_text(family = "Times New Roman")) +
  theme(plot.title = element_text(colour="black", size=25, face="bold", family = "Times New Roman"))

b1

##############

list_table <- readxl::read_xlsx('C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/VCI_year/2021_VCI_reclass.xlsx')

as.data.frame(list_table)

df.2001 <- list_table
df.2001
df.2001$km2 <- df.2001$m2 * 0.000001
df.2001$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2001$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2001$Year <- c('2001')
as.data.frame(df.2001)

df.2002 <- list_table
df.2002
df.2002$km2 <- df.2002$m2 * 0.000001
df.2002$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2002$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2002$Year <- c('2002')
as.data.frame(df.2002)

df.2003 <- list_table
df.2003
df.2003 <- dplyr::add_row(df.2003,
                          value = 4,
                          count = 0,
                          m2 = 0)
df.2003$km2 <- df.2003$m2 * 0.000001
df.2003$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2003$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2003$Year <- c('2003')
as.data.frame(df.2003)

df.2004 <- list_table
df.2004
df.2004 <- dplyr::add_row(df.2004,
                          value = 4,
                          count = 0,
                          m2 = 0)
df.2004$km2 <- df.2004$m2 * 0.000001
df.2004$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2004$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2004$Year <- c('2004')
as.data.frame(df.2004)

df.2005 <- list_table
df.2005
df.2005$km2 <- df.2005$m2 * 0.000001
df.2005$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2005$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2005$Year <- c('2005')
as.data.frame(df.2005)

df.2006 <- list_table
df.2006
df.2006$km2 <- df.2006$m2 * 0.000001
df.2006$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2006$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2006$Year <- c('2006')
as.data.frame(df.2006)


df.2007 <- list_table
df.2007
df.2007$km2 <- df.2007$m2 * 0.000001
df.2007$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2007$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2007$Year <- c('2007')
as.data.frame(df.2007)

df.2008 <- list_table
df.2008
df.2008$km2 <- df.2008$m2 * 0.000001
df.2008$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2008$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2008$Year <- c('2008')
as.data.frame(df.2008)

df.2009 <- list_table
df.2009
df.2009 <- dplyr::add_row(df.2009,
                          value = 4,
                          count = 0,
                          m2 = 0)
df.2009$km2 <- df.2009$m2 * 0.000001
df.2009$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2009$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2009$Year <- c('2009')
as.data.frame(df.2009)

df.2010 <- list_table
df.2010
df.2010 <- dplyr::add_row(df.2010,
                          value = 4,
                          count = 0,
                          m2 = 0)
df.2010$km2 <- df.2010$m2 * 0.000001
df.2010$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2010$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2010$Year <- c('2010')
as.data.frame(df.2010)

df.2011 <- list_table
df.2011
df.2011 <- dplyr::add_row(df.2011,
                          value = 3,
                          count = 0,
                          m2 = 0)
df.2011 <- dplyr::add_row(df.2011,
                          value = 4,
                          count = 0,
                          m2 = 0)
df.2011$km2 <- df.2011$m2 * 0.000001
df.2011$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2011$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2011$Year <- c('2011')
as.data.frame(df.2011)

df.2012 <- list_table
df.2012
df.2012 <- dplyr::add_row(df.2012,
                          value = 4,
                          count = 0,
                          m2 = 0)
df.2012$km2 <- df.2012$m2 * 0.000001
df.2012$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2012$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2012$Year <- c('2012')
as.data.frame(df.2012)

df.2013 <- list_table
df.2013
df.2013 <- dplyr::add_row(df.2013,
                          value = 3,
                          count = 0,
                          m2 = 0)
df.2013 <- dplyr::add_row(df.2013,
                          value = 4,
                          count = 0,
                          m2 = 0)
df.2013$km2 <- df.2013$m2 * 0.000001
df.2013$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2013$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2013$Year <- c('2013')
as.data.frame(df.2013)

df.2014 <- list_table
df.2014
df.2014 <- dplyr::add_row(df.2014,
                          value = 4,
                          count = 0,
                          m2 = 0)
df.2014$km2 <- df.2014$m2 * 0.000001
df.2014$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2014$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2014$Year <- c('2014')
as.data.frame(df.2014)

df.2015 <- list_table
df.2015
df.2015 <- dplyr::add_row(df.2015,
                          value = 4,
                          count = 0,
                          m2 = 0)
df.2015$km2 <- df.2015$m2 * 0.000001
df.2015$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2015$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2015$Year <- c('2015')
as.data.frame(df.2015)

df.2016 <- list_table
df.2016
df.2016 <- dplyr::add_row(df.2016,
                          value = 4,
                          count = 0,
                          m2 = 0)
df.2016$km2 <- df.2016$m2 * 0.000001
df.2016$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2016$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2016$Year <- c('2016')
as.data.frame(df.2016)

df.2017 <- list_table
df.2017
df.2017$km2 <- df.2017$m2 * 0.000001
df.2017$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2017$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2017$Year <- c('2017')
as.data.frame(df.2017)

df.2018 <- list_table
df.2018
df.2018 <- dplyr::add_row(df.2018,
                          value = 4,
                          count = 0,
                          m2 = 0)
df.2018$km2 <- df.2018$m2 * 0.000001
df.2018$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2018$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2018$Year <- c('2018')
as.data.frame(df.2018)

df.2019 <- list_table
df.2019
df.2019 <- dplyr::add_row(df.2019,
                          value = 3,
                          count = 0,
                          m2 = 0)
df.2019 <- dplyr::add_row(df.2019,
                          value = 4,
                          count = 0,
                          m2 = 0)
df.2019$km2 <- df.2019$m2 * 0.000001
df.2019$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2019$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2019$Year <- c('2019')
as.data.frame(df.2019)


df.2020 <- list_table
df.2020
df.2020 <- dplyr::add_row(df.2020,
                          value = 4,
                          count = 0,
                          m2 = 0)
df.2020$km2 <- df.2020$m2 * 0.000001
df.2020$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2020$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2020$Year <- c('2020')
as.data.frame(df.2020)

df.2021 <- list_table
df.2021
df.2021 <- dplyr::add_row(df.2021,
                          value = 4,
                          count = 0,
                          m2 = 0)
df.2021$km2 <- df.2021$m2 * 0.000001
df.2021$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2021$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2021$Year <- c('2021')
as.data.frame(df.2021)


#put all data frames into list
df_list <- list(df.2001, df.2002, df.2003, df.2004, df.2005, df.2006, df.2007,
                df.2008, df.2009, df.2010, df.2011, df.2012, df.2012, df.2013,
                df.2014, df.2015, df.2015, df.2016, df.2017, df.2018, df.2019,
                df.2020, df.2021)
#merge all data frames in 


df.geral <- Reduce(function(x, y) merge(x, y, all=TRUE), df_list) 
library(readr)
readr::write_csv(df.geral, "df_geral_VCI.csv")

df.geral.seca <- df.geral[-c(1:21),]


###Mudar name levels
df.geral$Fire <- revalue(df.geral$Fire, c("before"="Before", "after"="After"))
PNCM.annual.LocProt$Local <- revalue(PNCM.annual.LocProt$Local, c("park"="Park", "buffer"="Buffer"))
## Inverter barras
df.geral$Fire <- as.factor(df.geral$Fire)
df.geral$Fire = factor(df.geral$Fire, levels = c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                                                 'Risco de incêndio muito alto', 'Risco de incêndio extremo',
                                                 'Risco de incêndio extremamente alto'))

df.geral$Seca <- as.factor(df.geral$Seca)
df.geral$Seca = factor(df.geral$Seca, levels = c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema'))

str(df.geral)


b2  <-  ggplot(df.geral, aes(x=Year, y= km2, fill=Seca)) + 
  geom_bar(position = position_dodge(), col = 'black',
            stat="identity", width = 0.85, show.legend = NA) +
  #facet_grid( .~ Local ) +
  #scale_fill_manual(values=c("#00A600", "#E6E600", "#EAB64E", "#EEB99F", "#F2F2F2")) +
  ylab('Total de Área (km²)') +  xlab("Ano") +
  scale_y_continuous(expand = c(0,0), breaks = seq(0,1600,150)) + 
  #scale_x_continuous(?expand = expansion(add = c(0.1, 0.2))) + 
  #theme(legend.title = element_text(face="bold")) +
  #theme(legend.position = 'none') +
  theme(panel.background = element_rect(fill = "white")) +
  theme(axis.line = element_line(colour = 'black', size = NULL, linetype = 'solid',
                                 lineend = NULL, color = NULL, arrow = NULL, inherit.blank = FALSE)) +
  theme(axis.title.x = element_text(colour="black", size=15, face="bold")) +
  theme(axis.title.y = element_text(colour="black", size=15, face="bold")) +
  theme(axis.text = element_text(colour = "black", size =13))+
  #ggtitle("PNCM e Buffer (1990-2017)") +
  theme(text = element_text(family = "Times New Roman")) +
  # coord_flip() + # Horizontal bar plot
  theme(plot.title = element_text(colour="black", size=25, face="bold", family = "Times New Roman"))

b2
x11()
#Output: five classes (based in https://www.un-spider.org/advisory-support/recommended-practices/recommended-practice-drought-monitoring/in-detail)
# -1, 10, 4, -> Extreme Drought
# 10, 20, 3, -> Severe Drought
# 20, 30, 2, -> Moderate Drought
# 30,40, 1, -> Light Drought
# 40,101,0 -> No Drought
# -1, 10, 4, -> Seca Extrema
# 10, 20, 3, -> Seca Severa
# 20, 30, 2, -> Seca Moderada
# 30,40, 1, -> Seca Leve
# 40,101,0 -> Sem Seca
# Risco de incêndio extremamente alto
# Risco de incêndio extremo
# Risco de incêndio muito alto
# Risco de incêndio alto
# Risco de incêndio acima da média

###########
list_table <- readxl::read_xlsx('C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/VCI_Fire/2012_VCI_Fire.xlsx')

as.data.frame(list_table)

df.2001 <- list_table
df.2001
df.2001 <- dplyr::add_row(df.2001,
                          value = 24,
                          count = 0,
                          m2 = 0)
df.2001$km2 <- df.2001$m2 * 0.000001
df.2001$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema',
                  'Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2001$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto',
                  'Risco de incêndio acima da média', 'Risco de incêndio alto', 'Risco de incêndio muito alto', 
                  'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2001$Queima <- c('Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada',
                  'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada')
df.2001$Year <- c('2001')
as.data.frame(df.2001)

df.2002 <- list_table
df.2002
df.2002 <- dplyr::add_row(df.2002,
                          value = 14,
                          count = 0,
                          m2 = 0)
df.2002 <- df.2002[c(1:4, 10, 5:9), ] 
df.2002$km2 <- df.2002$m2 * 0.000001
df.2002$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema',
                  'Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2002$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto',
                  'Risco de incêndio acima da média', 'Risco de incêndio alto', 'Risco de incêndio muito alto', 
                  'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2002$Queima <- c('Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada',
                    'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada')
df.2002$Year <- c('2002')
as.data.frame(df.2002)


df.2003 <- list_table
df.2003
df.2003 <- dplyr::add_row(df.2003,
                          value = 14,
                          count = 0,
                          m2 = 0)
df.2003 <- df.2003[c(1:4, 9, 5:8), ]
df.2003 <- dplyr::add_row(df.2003,
                          value = 24,
                          count = 0,
                          m2 = 0)
df.2003$km2 <- df.2003$m2 * 0.000001
df.2003$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema',
                  'Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2003$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto',
                  'Risco de incêndio acima da média', 'Risco de incêndio alto', 'Risco de incêndio muito alto', 
                  'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2003$Queima <- c('Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada',
                    'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada')
df.2003$Year <- c('2003')
as.data.frame(df.2003)


df.2004 <- list_table
df.2004
df.2004 <- dplyr::add_row(df.2004,
                          value = 14,
                          count = 0,
                          m2 = 0)
df.2004 <- df.2004[c(1:4, 9, 5:8), ]
df.2004 <- dplyr::add_row(df.2004,
                          value = 24,
                          count = 0,
                          m2 = 0)
df.2004$km2 <- df.2004$m2 * 0.000001
df.2004$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema',
                  'Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2004$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto',
                  'Risco de incêndio acima da média', 'Risco de incêndio alto', 'Risco de incêndio muito alto', 
                  'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2004$Queima <- c('Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada',
                    'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada')
df.2004$Year <- c('2004')
as.data.frame(df.2004)


df.2005 <- list_table
df.2005
df.2005$km2 <- df.2005$m2 * 0.000001
df.2005$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema',
                  'Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2005$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto',
                  'Risco de incêndio acima da média', 'Risco de incêndio alto', 'Risco de incêndio muito alto', 
                  'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2005$Queima <- c('Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada',
                    'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada')
df.2005$Year <- c('2005')
as.data.frame(df.2005)


df.2006 <- list_table
df.2006
df.2006 <- dplyr::add_row(df.2006,
                          value = 24,
                          count = 0,
                          m2 = 0)
df.2006$km2 <- df.2006$m2 * 0.000001
df.2006$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema',
                  'Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2006$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto',
                  'Risco de incêndio acima da média', 'Risco de incêndio alto', 'Risco de incêndio muito alto', 
                  'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2006$Queima <- c('Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada',
                    'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada')
df.2006$Year <- c('2006')
as.data.frame(df.2006)


df.2007 <- list_table
df.2007
df.2007 <- dplyr::add_row(df.2007,
                          value = 24,
                          count = 0,
                          m2 = 0)
df.2007$km2 <- df.2007$m2 * 0.000001
df.2007$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema',
                  'Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2007$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto',
                  'Risco de incêndio acima da média', 'Risco de incêndio alto', 'Risco de incêndio muito alto', 
                  'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2007$Queima <- c('Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada',
                    'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada')
df.2007$Year <- c('2007')
as.data.frame(df.2007)


df.2008 <- list_table
df.2008
df.2008$km2 <- df.2008$m2 * 0.000001
df.2008$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema',
                  'Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2008$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto',
                  'Risco de incêndio acima da média', 'Risco de incêndio alto', 'Risco de incêndio muito alto', 
                  'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2008$Queima <- c('Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada',
                    'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada')
df.2008$Year <- c('2008')
as.data.frame(df.2008)

df.2009 <- list_table
df.2009
df.2009 <- dplyr::add_row(df.2009,
                          value = 23,
                          count = 0,
                          m2 = 0)
df.2009 <- dplyr::add_row(df.2009,
                          value = 14,
                          count = 0,
                          m2 = 0)
df.2009 <- df.2009[c(1:4, 9, 5:8), ]
df.2009 <- dplyr::add_row(df.2009,
                          value = 24,
                          count = 0,
                          m2 = 0)
df.2009$km2 <- df.2009$m2 * 0.000001
df.2009$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema',
                  'Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2009$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto',
                  'Risco de incêndio acima da média', 'Risco de incêndio alto', 'Risco de incêndio muito alto', 
                  'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2009$Queima <- c('Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada',
                    'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada')
df.2009$Year <- c('2009')
as.data.frame(df.2009)

df.2010 <- list_table
df.2010
df.2010 <- dplyr::add_row(df.2010,
                          value = 14,
                          count = 0,
                          m2 = 0)
df.2010 <- df.2010[c(1:4, 9, 5:8), ]
df.2010 <- dplyr::add_row(df.2010,
                          value = 24,
                          count = 0,
                          m2 = 0)
df.2010$km2 <- df.2010$m2 * 0.000001
df.2010$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema',
                  'Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2010$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto',
                  'Risco de incêndio acima da média', 'Risco de incêndio alto', 'Risco de incêndio muito alto', 
                  'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2010$Queima <- c('Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada',
                    'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada')
df.2010$Year <- c('2010')
as.data.frame(df.2010)

df.2011 <- list_table
df.2011
df.2011 <- dplyr::add_row(df.2011,
                          value = 23,
                          count = 0,
                          m2 = 0)
df.2011 <- dplyr::add_row(df.2011,
                          value = 13,
                          count = 0,
                          m2 = 0)
df.2011 <- df.2011[c(1:3, 8, 4:7), ]
df.2011 <- dplyr::add_row(df.2011,
                          value = 24,
                          count = 0,
                          m2 = 0)
df.2011 <- dplyr::add_row(df.2011,
                          value = 14,
                          count = 0,
                          m2 = 0)
df.2011 <- df.2011[c(1:4, 10, 5:9), ]
df.2011$km2 <- df.2011$m2 * 0.000001
df.2011$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema',
                  'Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2011$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto',
                  'Risco de incêndio acima da média', 'Risco de incêndio alto', 'Risco de incêndio muito alto', 
                  'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2011$Queima <- c('Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada',
                    'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada')
df.2011$Year <- c('2011')
as.data.frame(df.2011)

df.2012 <- list_table
df.2012
df.2012 <- dplyr::add_row(df.2012,
                          value = 14,
                          count = 0,
                          m2 = 0)
df.2012 <- df.2012[c(1:4, 9, 5:8), ]
df.2012 <- dplyr::add_row(df.2012,
                          value = 24,
                          count = 0,
                          m2 = 0)
df.2012$km2 <- df.2012$m2 * 0.000001
df.2012$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema',
                  'Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2012$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto',
                  'Risco de incêndio acima da média', 'Risco de incêndio alto', 'Risco de incêndio muito alto', 
                  'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2012$Queima <- c('Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada',
                    'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada')
df.2012$Year <- c('2012')
as.data.frame(df.2012)


df.2013 <- list_table
df.2013
df.2013 <- dplyr::add_row(df.2013,
                          value = 23,
                          count = 0,
                          m2 = 0)
df.2013 <- dplyr::add_row(df.2013,
                          value = 13,
                          count = 0,
                          m2 = 0)
df.2013 <- df.2013[c(1:3, 8, 4:7), ]
df.2013 <- dplyr::add_row(df.2013,
                          value = 24,
                          count = 0,
                          m2 = 0)
df.2013 <- dplyr::add_row(df.2013,
                          value = 14,
                          count = 0,
                          m2 = 0)
df.2013 <- df.2013[c(1:4, 10, 5:9), ]
df.2013$km2 <- df.2013$m2 * 0.000001
df.2013$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema',
                  'Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2013$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto',
                  'Risco de incêndio acima da média', 'Risco de incêndio alto', 'Risco de incêndio muito alto', 
                  'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2013$Queima <- c('Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada',
                    'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada')
df.2013$Year <- c('2013')
as.data.frame(df.2013)


df.2014 <- list_table
df.2014
df.2014 <- dplyr::add_row(df.2014,
                          value = 14,
                          count = 0,
                          m2 = 0)
df.2014 <- df.2014[c(1:4, 9, 5:8), ]
df.2014 <- dplyr::add_row(df.2014,
                          value = 24,
                          count = 0,
                          m2 = 0)
df.2014$km2 <- df.2014$m2 * 0.000001
df.2014$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema',
                  'Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2014$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto',
                  'Risco de incêndio acima da média', 'Risco de incêndio alto', 'Risco de incêndio muito alto', 
                  'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2014$Queima <- c('Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada',
                    'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada')
df.2014$Year <- c('2014')
as.data.frame(df.2014)


df.2015 <- list_table
df.2015
df.2015 <- dplyr::add_row(df.2015,
                          value = 14,
                          count = 0,
                          m2 = 0)
df.2015 <- df.2015[c(1:4, 9, 5:8), ]
df.2015 <- dplyr::add_row(df.2015,
                          value = 24,
                          count = 0,
                          m2 = 0)
df.2015$km2 <- df.2015$m2 * 0.000001
df.2015$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema',
                  'Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2015$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto',
                  'Risco de incêndio acima da média', 'Risco de incêndio alto', 'Risco de incêndio muito alto', 
                  'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2015$Queima <- c('Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada',
                    'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada')
df.2015$Year <- c('2015')
as.data.frame(df.2015)


df.2016 <- list_table
df.2016
df.2016 <- dplyr::add_row(df.2016,
                          value = 14,
                          count = 0,
                          m2 = 0)
df.2016 <- df.2016[c(1:4, 9, 5:8), ]
df.2016 <- dplyr::add_row(df.2016,
                          value = 24,
                          count = 0,
                          m2 = 0)
df.2016$km2 <- df.2016$m2 * 0.000001
df.2016$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema',
                  'Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2016$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto',
                  'Risco de incêndio acima da média', 'Risco de incêndio alto', 'Risco de incêndio muito alto', 
                  'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2016$Queima <- c('Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada',
                    'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada')
df.2016$Year <- c('2016')
as.data.frame(df.2016)


df.2017 <- list_table
df.2017
df.2017 <- dplyr::add_row(df.2017,
                          value = 24,
                          count = 0,
                          m2 = 0)
df.2017$km2 <- df.2017$m2 * 0.000001
df.2017$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema',
                  'Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2017$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto',
                  'Risco de incêndio acima da média', 'Risco de incêndio alto', 'Risco de incêndio muito alto', 
                  'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2017$Queima <- c('Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada',
                    'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada')
df.2017$Year <- c('2017')
as.data.frame(df.2017)


df.2018 <- list_table
df.2018
df.2018 <- dplyr::add_row(df.2018,
                          value = 23,
                          count = 0,
                          m2 = 0)
df.2018 <- dplyr::add_row(df.2018,
                          value = 24,
                          count = 0,
                          m2 = 0)
df.2018 <- dplyr::add_row(df.2018,
                          value = 14,
                          count = 0,
                          m2 = 0)
df.2018 <- df.2018[c(1:4, 10, 5:9), ]
df.2018$km2 <- df.2018$m2 * 0.000001
df.2018$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema',
                  'Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2018$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto',
                  'Risco de incêndio acima da média', 'Risco de incêndio alto', 'Risco de incêndio muito alto', 
                  'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2018$Queima <- c('Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada',
                    'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada')
df.2018$Year <- c('2018')
as.data.frame(df.2018)


df.2019 <- list_table
df.2019
df.2019 <- dplyr::add_row(df.2019,
                          value = 23,
                          count = 0,
                          m2 = 0)
df.2019 <- dplyr::add_row(df.2019,
                          value = 13,
                          count = 0,
                          m2 = 0)
df.2019 <- df.2019[c(1:3, 8, 4:7), ]
df.2019 <- dplyr::add_row(df.2019,
                          value = 24,
                          count = 0,
                          m2 = 0)
df.2019 <- dplyr::add_row(df.2019,
                          value = 14,
                          count = 0,
                          m2 = 0)
df.2019 <- df.2019[c(1:4, 10, 5:9), ]
df.2019$km2 <- df.2019$m2 * 0.000001
df.2019$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema',
                  'Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2019$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto',
                  'Risco de incêndio acima da média', 'Risco de incêndio alto', 'Risco de incêndio muito alto', 
                  'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2019$Queima <- c('Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada',
                    'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada')
df.2019$Year <- c('2019')
as.data.frame(df.2019)


df.2020 <- list_table
df.2020
df.2020 <- dplyr::add_row(df.2020,
                          value = 14,
                          count = 0,
                          m2 = 0)
df.2020 <- df.2020[c(1:4, 9, 5:8), ]
df.2020 <- dplyr::add_row(df.2020,
                          value = 24,
                          count = 0,
                          m2 = 0)
df.2020$km2 <- df.2020$m2 * 0.000001
df.2020$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema',
                  'Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2020$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto',
                  'Risco de incêndio acima da média', 'Risco de incêndio alto', 'Risco de incêndio muito alto', 
                  'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2020$Queima <- c('Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada',
                    'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada')
df.2020$Year <- c('2020')
as.data.frame(df.2020)


df.2021 <- list_table
df.2021
df.2021 <- dplyr::add_row(df.2021,
                          value = 23,
                          count = 0,
                          m2 = 0)
df.2021 <- dplyr::add_row(df.2021,
                          value = 24,
                          count = 0,
                          m2 = 0)
df.2021 <- dplyr::add_row(df.2021,
                          value = 14,
                          count = 0,
                          m2 = 0)
df.2021 <- df.2021[c(1:4, 10, 5:9), ]
df.2021$km2 <- df.2021$m2 * 0.000001
df.2021$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema',
                  'Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema')
df.2021$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto',
                  'Risco de incêndio acima da média', 'Risco de incêndio alto', 'Risco de incêndio muito alto', 
                  'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2021$Queima <- c('Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada', 'Sem Queimada',
                    'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada', 'Com Queimada')
df.2021$Year <- c('2021')
as.data.frame(df.2021)



#put all data frames into list
df_list <- list(df.2001, df.2002, df.2003, df.2004, df.2005, df.2006, df.2007,
                df.2008, df.2009, df.2010, df.2011, df.2012, df.2012, df.2013,
                df.2014, df.2015, df.2015, df.2016, df.2017, df.2018, df.2019,
                df.2020, df.2021)

#merge all data frames

df.geral <- Reduce(function(x, y) merge(x, y, all=TRUE), df_list) 

readr::write_csv(df.geral, "df_geral_VCI_Fire.csv")


df.geral.cqueima <- read.csv('C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/planilhas/df_geral_VCI_Fire_comqueima.csv',
                             header = T, sep = ',', dec = '.')
View(df.geral.cqueima)

df.geral.squeima <- read.csv('C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/planilhas/df_geral_VCI_Fire_semqueima.csv',
                             header = T, sep = ',', dec = '.')
View(df.geral.squeima)

df.geral.squeima$Seca <- as.factor(df.geral.squeima$Seca)
df.geral.squeima$Seca = factor(df.geral.squeima$Seca, levels = c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema'))

library(ggplot2)
b3  <-  ggplot(df.geral.squeima, aes(x=as.factor(Year), y= as.numeric(km2), fill=Seca)) + 
  geom_bar(position = position_dodge(), 
           stat="identity", width = 0.85, show.legend = NA, na.rm = T) +
  facet_grid(Queima ~. ) +
  ylab('Área Total (km²)') +  xlab('Ano') +
  scale_y_continuous(expand = c(0,0), breaks = seq(0,1600,200)) + 
  theme(panel.background = element_rect(fill = "white")) +
  theme(axis.line = element_line(colour = 'black', size = NULL, linetype = 'solid',
                                 lineend = NULL, color = NULL, arrow = NULL, inherit.blank = FALSE)) +
  theme(axis.title.x = element_text(colour="black", size=15, face="bold")) +
  theme(axis.title.y = element_text(colour="black", size=15, face="bold")) +
  theme(axis.text = element_text(colour = "black", size = 13))+
  #ggtitle("PNCM e Buffer (1990-2017)") +
  theme(plot.title = element_text(colour="black", size=25, face="bold"))


b3

df.geral.cqueima$Seca <- as.factor(df.geral.cqueima$Seca)
df.geral.cqueima$Seca = factor(df.geral.cqueima$Seca, levels = c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa', 'Seca Extrema'))

b4  <-  ggplot(df.geral.cqueima, aes(x=as.factor(Year), y= as.numeric(km2), fill=Seca)) + 
  geom_bar(position = position_dodge(), 
           stat="identity", width = 0.85, show.legend = NA, na.rm = T) +
  facet_grid(Queima ~. ) +
  ylab('Área Total (km²)') +  xlab('Ano') +
  scale_y_continuous(expand = c(0,0), breaks = seq(0,600,100)) + 
  theme(panel.background = element_rect(fill = "white")) +
  theme(axis.line = element_line(colour = 'black', size = NULL, linetype = 'solid',
                                 lineend = NULL, color = NULL, arrow = NULL, inherit.blank = FALSE)) +
  theme(axis.title.x = element_text(colour="black", size=15, face="bold")) +
  theme(axis.title.y = element_text(colour="black", size=15, face="bold")) +
  theme(axis.text = element_text(colour = "black", size = 13))+
  #ggtitle("PNCM e Buffer (1990-2017)") +
  theme(plot.title = element_text(colour="black", size=25, face="bold"))

b4

b3 <- ggplot(data = df.geral, aes(x=as.factor(Year))) + 
  geom_bar(mapping = aes(y= km2, fill="Queima"),
           stat="identity", position = "dodge", colour="black", width = (0.75))+
  geom_bar(mapping = aes(y= km2, fill="Queima"),
           stat="identity", position = "dodge", colour="black", width = (0.75))+ 
  geom_point(mapping = aes(y= as.numeric(Precip_Tot)))+
  ylab('Precipita??o Total Anual (mm)') +  xlab('Ano') +
  scale_y_continuous(position = 'right', limits = c(0,3000),
                     sec.axis = sec_axis(~.*0.91, name = "?rea Queimada (km?)")) + 
  theme(panel.background = element_rect(fill = "white")) +
  theme(legend.position = 'top')+
  scale_color_manual(values=c("red"))+
  theme(axis.line = element_line(colour = 'black', size = NULL, linetype = 'solid',
                                 lineend = NULL, color = NULL, arrow = NULL, inherit.blank = FALSE)) +
  theme(axis.title.x = element_text(colour="black", size=18, face="bold")) +
  theme(axis.title.y = element_text(colour="black", size=18, face="bold")) +
  theme(axis.text = element_text(colour = "black", size = 15))+
  ggtitle("?rea Total Anual Queimada (km?) e Precipita??o Total Anual (1990-2017)") +
  theme(plot.title = element_text(colour="black", size=20, face="bold"))

b3
x11()