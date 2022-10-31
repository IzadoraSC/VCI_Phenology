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

library(tidyverse)

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
  ylab('Total de Área Queimada (km²)') +  xlab("Ano") +
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

list_table <- readxl::read_xlsx('C:/Users/Administrador/Documents/GitHub/VCI_Phenology/data/VCI_year/2001_VCI_reclass.xlsx')

as.data.frame(list_table)

df.2001 <- list_table
df.2001$Fire <- c('Sem fogo', 'Fogo')
df.2001$Year <- c('2001')
as.data.frame(df.2001)


df.2002 <- list_table
df.2002
df.2002$km2 <- df.2002$m2 * 0.000001
df.2002$Fire <- c('Risco de incêndio acima da média', 'Risco de incêndio alto',
                  'Risco de incêndio muito alto', 'Risco de incêndio extremo', 'Risco de incêndio extremamente alto')
df.2002$Seca <- c('Sem Seca', 'Seca Leve', 'Seca Moderada', 'Seca Severa')
df.2002$Year <- c('2002')
as.data.frame(df.2002)

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