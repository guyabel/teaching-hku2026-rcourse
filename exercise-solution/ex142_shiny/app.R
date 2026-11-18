library(shiny)
library(tidyverse)
library(arrow)

# 1. Load the data
world_age <- read_parquet("https://github.com/guyabel/teaching-hku2026-rcourse/raw/refs/heads/main/exercise-data/world_age.parquet")
region <- read_csv("https://github.com/guyabel/teaching-hku2026-rcourse/raw/refs/heads/main/exercise-data/world_2023.csv",
                   col_select = c(name, region_geo))

# 2. Create Grouped Choices
country_choices <- split(x = region$name, f = region$region_geo)

# 3. Define the User Interface (UI)
ui <- fluidPage(
  titlePanel("Global Population Pyramids"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "country",
        label = "Select Country/Territory:",
        choices = country_choices
      ),
      sliderInput(
        inputId = "year",
        label = "Select Year:",
        min = min(world_age$year),
        max = max(world_age$year),
        value = 2023,
        step = 1,
        sep = ""
      )
    ),
    mainPanel(
      plotOutput(outputId = "pyramid")
    )
  )
)

# 4. Define the Server Logic
server <- function(input, output, session) {
  
  # a) Find the maximum population value for the selected country across ALL years.
  country_max_pop <- reactive({
    world_age |>
      filter(name == input$country) |>
      select(male, female) |>
      max(na.rm = TRUE)
  })
  
  # b) Create a reactive expression to filter and format the data for plotting.
  pyramid_data <- reactive({
    world_age |>
      filter(name == input$country, year == input$year) |>
      pivot_longer(cols = c("male", "female"),
                   names_to = "sex",
                   values_to = "pop") |>
      mutate(
        pop_pm = ifelse(test = sex == "male", yes = -pop, no = pop),
        age = ifelse(test = age == "100+", yes = "100", no = age),
        age = as.numeric(age)
      )
  })
  
  # c) Create the plot output.
  output$pyramid <- renderPlot({
    ggplot(data = pyramid_data(), mapping = aes(x = pop_pm, y = age, fill = sex)) +
      geom_col(orientation = "y") +
      scale_x_continuous(
        labels = abs,
        limits = c(-country_max_pop(), country_max_pop())
      ) +
      labs(x = "Population (thousands)", y = "Age", fill = "Sex") +
      theme_bw()
  })
}

# 5. Run the Application
shinyApp(ui = ui, server = server)