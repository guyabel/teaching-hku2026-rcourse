# NA

# library(shiny)
# ui <- fluidPage(
#   "Hello, world!"
# )
# server <- function(input, output, session) {
# }
# shinyApp(ui, server)



# ui <- fluidPage(
#   selectInput(inputId = "dataset", label = "Dataset",
#               choices = ls("package:datasets")),
#   verbatimTextOutput(outputId = "summary"),
#   tableOutput(outputId = "table")
# )
# shinyApp(ui, server)

ls("package:datasets")

# server <- function(input, output, session) {
#   output$summary <- renderPrint({
#     dataset <- get(input$dataset)
#     summary(dataset)
#   })
# 
#   output$table <- renderTable({
#     dataset <- get(input$dataset)
#     dataset
#   })
# }
# shinyApp(ui, server)

"swiss"
summary("swiss")
summary(get("swiss"))

# server <- function(input, output, session) {
#   # Create a reactive expression
#   dataset <- reactive({
#     get(input$dataset, "package:datasets")
#   })
# 
#   output$summary <- renderPrint({
#     # Use a reactive expression by calling it like a function
#     summary(dataset())
#   })
# 
#   output$table <- renderTable({
#     dataset()
#   })
# }
# shinyApp(ui, server)

library(tidyverse)
hkg_age0 <- read_csv("../slides-data/hkg_age.csv")
hkg_age0

hkg_age <- hkg_age0 |>
  pivot_longer(cols = c("male", "female"), names_to = "sex", values_to = "pop")
hkg_age

# basic attempt to plot the population pyramid
hkg_age |>
  filter(year == 2023) |>
  ggplot(aes(x = pop, y = age, fill = sex)) +
  geom_col()

tail(hkg_age)

hkg_age <- hkg_age |>
  mutate(pop_pm = ifelse(test = sex == "male",
                         yes = -pop, no = pop),
         age = ifelse(test = age == "100+",
                      yes = 100, no = age),
         age = as.numeric(age))
hkg_age

hkg_age |>
  filter(year == 2023) |>
  ggplot(aes(x = pop_pm, y = age, fill = sex)) +
  geom_col(orientation = "y") +
  labs(x = "Population (thousands)", y = "Age", fill = "Sex")

# ui <- fluidPage(
#   titlePanel("Population Pyramid for Hong Kong"),
#   sliderInput(
#     inputId = "year", label = "Year",
#     min = min(hkg_age$year),
#     max = max(hkg_age$year),
#     value = 1950, step = 1, sep = ""
#   ),
#   plotOutput(outputId = "pyramid")
# )

# server <- function(input, output) {
#   output$pyramid <- renderPlot({
#     hkg_age |>
#       filter(year == input$year) |>
#       ggplot(aes(x = pop_pm, y = age, fill = sex)) +
#       geom_col(orientation = "y") +
#       labs(x = "Population (thousands)", y = "Age", fill = "Sex")
#   })
# }
# 
# shinyApp(ui = ui, server = server)

# server <- function(input, output) {
#   output$pyramid <- renderPlot({
#     hkg_age |>
#       filter(year == input$year) |>
#       ggplot(aes(x = pop_pm, y = age, fill = sex)) +
#       geom_col(orientation = "y") +
#       scale_x_continuous(
#         labels = abs,
#         limits = c(-max(hkg_age$pop), max(hkg_age$pop))
#       ) +
#       labs(x = "Population (thousands)", y = "Age", fill = "Sex")
#   })
# }
# 
# shinyApp(ui = ui, server = server)

# NA



# ui <- fluidPage(
#   titlePanel(
#     # app title/description
#   ),
#   sidebarLayout(
#     sidebarPanel(
#       # inputs
#     ),
#     mainPanel(
#       # outputs
#     )
#   )
# )



# fluidPage(
#   fluidRow(
#     column(4,
#       ...
#     ),
#     column(8,
#       ...
#     )
#   ),
#   fluidRow(
#     column(6,
#       ...
#     ),
#     column(6,
#       ...
#     )
#   )
# )

# ui <- fluidPage(
#   tabsetPanel(
#     tabPanel("Import data",
#       fileInput("file", "Data", buttonLabel = "Upload..."),
#       textInput("delim", "Delimiter (leave blank to guess)", ""),
#       numericInput("skip", "Rows to skip", 0, min = 0),
#       numericInput("rows", "Rows to preview", 10, min = 1)
#     ),
#     tabPanel("Set parameters"),
#     tabPanel("Visualise results")
#   )
# )



# ui <- fluidPage(
#   theme = bs_theme(
#     bootswatch = "sketchy"
#   ),
#   titlePanel("Population Pyramid for Hong Kong"),
#   sliderInput(
#     inputId = "year", label = "Year",
#     min = min(hkg_age$year),
#     max = max(hkg_age$year),
#     value = 1950, step = 1, sep = "",
#     animate = TRUE
#   ),
#   plotOutput(outputId = "pyramid")
# )
# shinyApp(ui = ui, server = server)
