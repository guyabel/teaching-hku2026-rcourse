# 0. a) Run the code to load the tidyverse package (that contains dplyr)
# install.packages("tidyverse")
library(tidyverse)
#    b) run the code below to read the data for this exercise from the GitHub repository
norway_hh2 <- read_csv(file = "https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/main/exercise-data/norway_hh2.csv")
germany_pop2 <- read_csv(file = "https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/main/exercise-data/germany_pop2.csv")
ew_pop2 <- read_csv(file = "https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/main/exercise-data/ew_pop2.csv")
world_pop2 <- read_csv(file = "https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/main/exercise-data/world_pop2.csv")
##
##
##
# 1. a) View the norway_hh2 object
norway_hh2
#    b) Display the values from Oslo in the norway_hh2 object

#    c) Display the observations in norway_hh2 using pipes (|>) 
#     - from the regional level where the code is 2 characters longs)
#       (Hint: use the nchar() function to return the number of characters in a
#       the code variable)
#     - from one person households





# 2. a) View the germany_pop2 object
germany_pop2
# .  b) Display the observations in germany_pop2 using pipes (|>) 
#     - from rows where age is "Total"
#     - from rows where citizenship is "foreign"
#     - from rows where sex is "both"
#     - the name and pop variables only






# 3. a) View the ew_pop2 object
ew_pop2
#    b) Display the observations in ew_pop2 using pipes (|>) 
#     - from the major areas only
#       (Hint: major areas are the rows where mall_area observations are missing
#       can be found using is.na() function) 
#     - the district, age and pop variables only




#     c) Display the observations in ew_pop2 using pipes (|>) 
#      - from the age group 90+
#      - the district name and pop variables only
#      - from the top 5 largest age 90+ populations





# 4. a) View the world_pop2 object
world_pop2
#    b) Display the observations in world_pop2 from Austria
#     - from Austria
#     - the year and pop variables only



#    c) Display the distinct observations in world_pop2 using pipes (|>)
#     - from areas with codes less than 900
#     - the unique code and name combinations



