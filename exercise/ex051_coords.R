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
# browseURL("https://github.com/guyabel/teaching-hku2026-rcourse/blob/main/exercise-solution/ex051_coords.pdf")
##
##
##
# 1. Create a density plot of infant mortality rate in all countries


# 2. Adapt the plot above so that 
#    a. each grp_develop variable has its own fill colour
#    b. the density curves are semi-transparent (alpha = 0.5)


# 3. Adapt the plot above so that each density curve is stacked on top of 
#    each other and the y-axis is scaled to 1
#    (Hint: use position = "fill")


# 4. Adapt the plot above so that each density curve is stacked on top of 
#    each other, but the y-axis is not scaled to 1
#    (Hint: use position = "stack")


# 5. Adapt the plot above so that it is plotted in coordinate system where the
#    x-axis is on the log scale







