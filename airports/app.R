setwd("/Users/Katy/Desktop/06_professional/projects/GoogleMaps_Rshiny/shiny-maps")

library(shiny)
library(dplyr)
library(googleway)

api_key <- "AIzaSyAxVOsu2QBilGHU8WcAbJXc3Wchh8HayFQ"
airports <- read.csv("airports.csv")

ui <- fluidPage(
  tags$h1("US Airports"),
  fluidRow(
    column(
      width = 3,
      selectInput(inputId = "inputState", label = "Select state:", multiple = TRUE, choices = sort(airports$STATE), selected = "TX")
    ),
    column(
      width = 9,
      google_mapOutput(outputId = "map")
    )
  )
)

server <- function(input, output) {
  data <- reactive({
    airports %>%
      filter(STATE %in% input$inputState) %>%
      mutate(INFO = paste0("[", IATA, "] ", AIRPORT, " | ", CITY, ", ", STATE))
  })
  output$map <- renderGoogle_map({
    google_map(data = data(), key = api_key) %>%
      add_markers(lat = "LATITUDE", lon = "LONGITUDE", mouse_over = "INFO")
  })
}

shinyApp(ui = ui, server = server)