install.packages("rgdal")
install.packages("leaflet")
install.packages("usmap")
install.packages("sf")

library(rgdal)
library(leaflet)
library(usmap)
library(sf)

#Read in states kml file
us_states <- readOGR(dsn = 
                       "D:/Downloads/cb_2016_us_state_500k/cb_2016_us_state_500k.kml")

#Read in population data
df1 <- read.csv("D:/Downloads/ESTACOLIVES-stateNoACO.csv")

#Deleting variables and changing types
df1$X<-NULL

df1$fips <- as.character(df1$fips)

df1$fips[1:7]=c("01","02","04","05","06","08","09")

df1$abbr <- as.factor(df1$abbr)

df1$Name <-as.factor(df1$Name)

###QUESTION IS HERE.  How come when I try to merge these two, the columns appear as a part of the spatial polygon data frame,
###but there NA's are given for all of the observations in the population column?

mergedData <- merge(us_states,df1, by="Name", all = TRUE)

str(mergedData$Name)

str(mergedData$fips)

str(mergedData$pop_2015)

