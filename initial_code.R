setwd("/Users/Katy/Desktop/06_professional/projects/GoogleMaps_Rshiny/shiny-maps")

library(googleway)
api_key <- "AIzaSyAxVOsu2QBilGHU8WcAbJXc3Wchh8HayFQ"

data <- read.csv("airports.csv")
head(data)

# Add coloumns with information
data$COLOR <- "lavender"
data$INFO <- paste0(data$AIRPORT, " | ", data$CITY, ", ", data$STATE)

map <- google_map(
  key = api_key,
  data = data
)
map %>%
  add_markers(lat = "LATITUDE", lon = "LONGITUDE", mouse_over="IATA")