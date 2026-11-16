# 0. a) Run the code to load the tidyverse package (that contains dplyr)
# install.packages("tidyverse")
library(tidyverse)
#    b) run the code below to read the data for this exercise from the GitHub repository
norway_hh2 <- read_csv(file = "https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/main/exercise-data/norway_hh2.csv")
world_2023 <- read_csv(file = "https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/main/exercise-data/world_2023.csv")
ew_pop2 <- read_csv(file = "https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/main/exercise-data/ew_pop2.csv")
##
##
##
# 1. a) View the norway_hh2 object
norway_hh2
#    b) Display the summary of the norway_hh2 
#     - filter to the smallest regional level locations (where the code is 4 
#       characters long)
#     - group by area name
#     - add a new summary variable called pop_area counting the population by 
#       summing over the household populations in each area





# 2. a) View the world_2023 object
world_2023
#    b) Display the summary of the world_2023 
#     - grouped by region_geo variable
#     - with a new variable called n_nations summarising the number of countries
#       in each region using the n_distinct() function 



#    c) Display the summary of the world_2023
#     - update the grp_income variable to be a factor with levels in the order 
#       they appear in the data
#     - grouped by grp_income variable
#     - three new summary variables:
#       n_nations = the number of countries in each income group
#       pop_m = the total population in each income group in millions
#       ave_imr = the average infant mortality rate in each income group







# 3. a) View the ew_pop2 object
ew_pop2
#    b) Run the code below to create a new object ew_pop3 from ew_pop2 that 
#     - is based on the major areas only
#     - adds a variable working_age that is 1 for rows in working age groups 
#       over (between 15 and 65) and 0 elsewhere
#     - adds a variable old_age that is 1 for rows in old age groups over (over 
#       65) and 0 elsewhere
ew_pop3 <- ew_pop2 |>
  filter(is.na(small_area)) |>
  mutate(working_age = ifelse(test = first >= 15 & last < 65, yes = 1, no = 0),
         old_age = ifelse(test = last >= 65, yes = 1, no = 0))
ew_pop3 
#    c) Create a new object ew_pop4 from ew_pop3 that
#     - is grouped by district
#     - summarise for each area 
#       i.  the total working age population with a variable called working_pop
#           by multiplying the population by the working_age indicator column
#       ii. the total old age pop column with a variable called old_pop
#           by multiplying the pop column by the old_age indicator column
#       iii. the old age dependency ratio with a variable called odr
#       (Hint: odr = old_pop / working_pop * 100)
ew_pop4 <- 
  
  
  
  
ew_pop4
# d)  Display the districts with the 20 lowest old age dependency ratios using a 
#     slice_ function

# e)  Display the districts with the 20 highest old age dependency ratios using a 
#     slice_ function

