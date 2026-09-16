# 0. a) Complete and run the code to create load the tidyverse package (that 
#    contains ggplot2)
# install.packages("tidyverse")
library(tidyverse)
#    b) run the code below to read the data for this exercise from the GitHub repository
world_2023 <- read_csv("https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/world_2023.csv")
uk <- read_csv("https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/uk.csv")
#    c) check the data by viewing the first few rows of each dataset
# all areas, 2023 only
world_2023
# United Kingdom, 1950-2023
uk
#    d) View the PDF on Github of the correct solutions to the exercise
browseURL("https://github.com/guyabel/teaching-hku2026-rcourse/blob/main/exercise-solution/ex041_geoms.pdf")
##
##
##
# 1. Using ggplot2 create a scatter plot of infant mortality rates (x) against 
#    total fertility rate (y) in all countries in 2023
#    (Hint: a) see above to help select the correct data b) use imr and tfr columns)


# 2. Create a bar plot of the UN development categories of different countries from world_2023
#    (Hint: development categories in the grp_develop variable)


# 3. Create a boxplot chart of infant mortality rates for different continents from world_2023
#    (Hint: continents in the region_geo variable)


# 4. Create a line chart of net migration during in the UK over time
#    (Hint: data for net migration in the net variable, use for y)


# 5. Adapt line chart in question above to 
#    a) add points for each observation
#    b) add a horizontal line at zero net migration



