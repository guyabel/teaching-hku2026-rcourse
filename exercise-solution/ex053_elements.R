# 0. a) Complete and run the code to create load the tidyverse package (that 
#    contains ggplot2)
# install.packages("tidyverse")
library(tidyverse)
library(ggforce)
#    b) run the code below to read the data for this exercise from the GitHub repository
world_2023 <- read_csv("https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/world_2023.csv")
#    c) check the data by viewing the first few rows of each dataset
# South East Asia, 1950-2023
world_2023
#    d) View the PDF on Github of the correct solutions to the exercise
# browseURL("https://github.com/guyabel/teaching-hku2026-rcourse/blob/main/exercise-solution/ex052_facets.pdf")
##
##
##
# 1. Adapt the boxplot code below (from ex043_scales) to
#    a. use the dark theme
#    b. add a title to the plot ("Infant Mortality Rate by Region")
#    c. add a caption to the plot ("Source: UN World Population Prospects 2024")
#    d. add a label to the x-axis ("Infant mortality rate (deaths per 1,000 live births)")
#    e. remove the y-axis title (Hint: use element_blank() in theme())
#    f. change the background colour of the plot to light blue
ggplot(data = world_2023, mapping = aes(x = imr, y = region_geo, fill = region_geo)) +
  geom_boxplot(show.legend = FALSE) +
  scale_fill_brewer(palette = "Set2") +
  theme_dark() +
  labs(
    title = "Infant Mortality Rate by Region",
    x = "Infant mortality rate (deaths per 1,000 live births)",
    caption = "Source: UN World Population Prospects 2024") +
  theme(axis.title.y = element_blank(), 
        plot.background = element_rect(fill = "lightblue"))
# 2. Adapt the scatter plot code below (from ex043_scales) to
#    a. use the black and white theme
#    b. add a label to the x-axis ("Life expectancy at birth (years)")
#    c. add a label to the y-axis ("Total fertility rate (births per woman)")
#    d. add a label to the size legend ("Population (millions)")
#    e. add a label to the colour legend ("Development group")
#    f. change the font of all text in the plot to serif
ggplot(data = world_2023, 
       mapping = aes(x = e0, y = tfr, size = pop/1e6, colour = grp_develop)) +
  geom_point(shape = 1) +
  scale_size_continuous(range = c(1, 10), breaks = c(1, 10, 100, 500, 1000)) +
  scale_color_discrete(palette = "Dark2") +
  theme_bw() +
  labs(x = "Life expectancy at birth (years)",
       y = "Total fertility rate (births per woman)",
       size = "Population (millions)",
       colour = "Development group") +
  theme(text = element_text(family = "serif"))