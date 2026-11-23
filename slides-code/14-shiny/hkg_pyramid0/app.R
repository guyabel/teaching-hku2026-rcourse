library(tidyverse)
library(shiny)

hkg_age <- read_csv("hkg_age.csv") |>
  pivot_longer(cols = c("male", "female"), names_to = "sex", values_to = "pop") |>
  mutate(pop_pm = ifelse(test = sex == "male", 
                         yes = -pop, no = pop),
         age = ifelse(test = age == "100+",
                      yes = 100, no = age),
         age = as.numeric(age))

ui <- fluidPage(
  titlePanel("Population Pyramid for Hong Kong"),
  sliderInput(
    inputId = "year", label = "Year",
    min = min(hkg_age$year),
    max = max(hkg_age$year),
    value = 1950, step = 1, sep = ""
  ),
  plotOutput(outputId = "pyramid")
)

server <- function(input, output) {
  output$pyramid <- renderPlot({
    hkg_age |>
      filter(year == input$year) |>
      ggplot(aes(x = pop_pm, y = age, fill = sex)) +
      geom_col(orientation = "y") + 
      labs(x = "Population (thousands)", y = "Age", fill = "Sex")
  })
}

shinyApp(ui, server)