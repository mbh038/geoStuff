---
title: "Ukraine"
runtime: shiny
output: html_document
---

```{r, echo=FALSE, message=F, warning=F}
library(leaflet)
library(raster)

adm <- getData('GADM', country='GBR', level=2)

popup <- paste0("<strong>Name: </strong>", 
                        adm$NAME_2)

leaflet() %>% 
  addTiles() %>% 
  addPolygons(data=adm, weight = 2, fillColor = "red", popup=popup)
```