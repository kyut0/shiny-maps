setwd("/Users/Katy/Desktop/06_professional/projects/GoogleMaps_Rshiny/shiny-maps")

library(googleway)
api_key <- "AIzaSyAxVOsu2QBilGHU8WcAbJXc3Wchh8HayFQ"

data <- read.csv("airports.csv")
head(data)