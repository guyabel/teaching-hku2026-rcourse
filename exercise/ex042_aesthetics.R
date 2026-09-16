# 0. a) Complete and run the code to create load the tidyverse package (that 
#    contains ggplot2)
# install.packages("tidyverse")
library(tidyverse)
#    b) run the code below to read the data for this exercise from the GitHub repository
se_asia <- read_csv("https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/se_asia.csv")
#    c) check the data by viewing the first few rows of each dataset
# South East Asia, 1950-2023
se_asia
#    d) View the PDF on Github of the correct solutions to the exercise
browseURL("https://github.com/guyabel/teaching-hku2026-rcourse/blob/main/exercise-solution/ex042_aesthetics.pdf")
##
##
##
# 1. Create a scatter line plot of the time series of life expectancy at birth 
#    (e0) for South East Asian countries in se_asia using
#    a) line and point colours matching the country names
#    b) linetypes matching the country names
#    c) point transparency (alpha) of 0.5




# 2. Adapt the plot above to add 
#    a) vertical line during the Khmer Rouge period (1975-1979) with colour 
#       darkgrey in the background of the plot (plotted first)
#    b) point sizes matching the population size in millions (divide pop by 1,000,000))
#    c) point transparency of 0.25





# 3. Create a boxplot of the life expectancy at birth (e0) for different 
#    countries in se_asia
#    a) boxplot fill colours varying by country name
#    b) add points for each observation behind of the boxplot
#    c) set the boxplot transparency to 0.5



# 4. Adapt the plot above to add
#    a) both geoms (points and boxplot) border colours by country name
#    b) jittered points rather than normal points  (Hint: use geom_jitter())


