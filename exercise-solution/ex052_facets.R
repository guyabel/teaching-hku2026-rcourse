# 0. a) Complete and run the code to create load the tidyverse package (that 
#    contains ggplot2)
# install.packages("tidyverse")
library(tidyverse)
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
# 1. Create a histogram of the infant mortality rate (imr) in all countries 
#    using geom_histogram()
ggplot(data = world_2023, mapping = aes(x = imr)) +
  geom_histogram()
# 2. Adapt the histogram above so that 
#    a. each region_geo variable has its own fill colour
#    b. the legend is removed
#    c. the histogram is facetted by region_geo
ggplot(data = world_2023, mapping = aes(x = imr, fill = region_geo)) +
  geom_histogram(show.legend = FALSE) +
  facet_wrap(facets = "region_geo") 
# 3. Adapt the histogram above so that 
#    a. the facets are arranged in a single row
#    b. the number of bins in the histogram is set to 10
ggplot(data = world_2023, mapping = aes(x = imr, fill = region_geo)) +
  geom_histogram(show.legend = FALSE, bins = 10) +
  facet_wrap(facets = "region_geo", nrow = 1) 
# 4. Adapt the histogram above so that the facet labels are wrapped to a width 
#    of 15 characters
ggplot(data = world_2023, mapping = aes(x = imr, fill = region_geo)) +
  geom_histogram(show.legend = FALSE, bins = 10) +
  facet_wrap(facets = "region_geo", nrow = 1, 
             labeller = label_wrap_gen(width = 15)) 
