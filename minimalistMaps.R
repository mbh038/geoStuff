## Cities

library(maps)
data("world.cities")
UK.cities<-world.cities[world.cities$country.etc=="UK",]
plot(UK.cities$lon,UK.cities$lat,pch=19,cex=.7,axes=FALSE,xlab="",ylab="")


## Rivers

# https://github.com/jjrom/hydre/tree/master/mapserver/geodata/rivers

library(maptools)
shape <- readShapeLines("./data/rivers/GRDC_687_rivers.shp")
plot(shape,col="blue")

## Roads

# http://www.naturalearthdata.com/

library(maptools)
shape <- readShapeLines("./data/roads/ne_10m_roads.shp")
plot(shape,lwd=.5)


# or do it like this:
    
library(ggplot2) #: has fortify function to convert data into data frame for plotting
library(rgdal)   #: reads in shape files
library(scales)  #: tells ggplot what the proper scale should be
library(ggmap)   #: comes with a nice theme_nothing() function
library(dplyr)   #: I only use the left_join() function but this is a very useful package to add to your toolbox if you haven't already
library(Cairo)   #: creates high quality vector and bitmap images
#library(maptools)
library(rgeos)

# roads
# read in shape file
roads <- readOGR(dsn = "./data/roads",layer="ne_10m_roads")
names(roads)
# convert to data frame
roads <- fortify(roads)
str(roads)

ggplot(roads, aes(x = long, y = lat, group = group,fill=id)) + 
    geom_line(color = "black")+
    theme(legend.position="none")

# rivers
# read in shape file
rivers <- readOGR(dsn = "./data/rivers",layer="GRDC_687_rivers")
names(rivers)
# convert to data frame
rivers <- fortify(rivers)
str(rivers)

ggplot(rivers, aes(x = long, y = lat, group = group,fill=id)) + 
    geom_line(color = "blue")+
    theme(legend.position="none")