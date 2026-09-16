# 0. a) Complete and run the code to create load the tidyverse package (that 
#    contains ggplot2)
# install.packages("tidyverse")
library(tidyverse)
#    b) run the code below to read the data for this exercise from the GitHub repository
world_2023 <- read_csv("https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/world_2023.csv")
se_asia <- read_csv("https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/se_asia.csv")
#    c) check the data by viewing the first few rows of each dataset
# all areas, 2023 only
world_2023
# South East Asia, 1950-2023
se_asia
#    d) View the PDF on Github of the correct solutions to the exercise
browseURL("https://github.com/guyabel/teaching-hku2026-rcourse/blob/main/exercise-solution/ex043_scales.pdf")
##
##
##
# 1. Create a scatter plot for all countries of life expectancy (e0) against 
#    total fertility rate (tfr) in 2023
#    a. use the population (pop) in millions as the size of the points
#    b. use the development group (grp_develop) as the colour of the points
#    c. use hollow circles for the points
#    d. scale the size of the points from 1 to 10
#    e. add breaks in the size legend at 1, 10, 100 and 1000 million
#    f. use the "Dark2" palette for the colour of the points




# 2. Create a boxplot of infant mortality rate (imr) by continent (region_geo)
#    a. use the region_geo variable for the fill colour of the boxes
#    b. remove the legend for the fill colour
#    c. use the "Set2" palette for the fill colour of the boxes
#    d. use a log10 scale for the x-axis




# 3. Create a tile plot of net migration in South-East Asian countries
#    a. use net migration in millions as the fill variable
#    b. use year as the x variable
#    c. the value in the net column as the tile fill colour
#    d. use a grey colour aesthetic for the tile borders
#    e. scale the fill gradient from red to black via white (white is at net migration of zero)



# 4. Create a line plot of life expectancy (e0) in South-East Asian countries over time
#    a. set the colour and linetype of the lines to be based on the country name
#    b. add points to the lines with an alpha of 0.25
#    c. set the x-axis breaks to be every 10 years from 1950 to 2020




