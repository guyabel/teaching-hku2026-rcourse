# 0. a) Run the code to load the tidyverse package (that contains dplyr)
# install.packages("tidyverse")
library(tidyverse)
#    b) run the code below to read the data for this exercise from the GitHub repository
world_pop2 <- read_csv(file = "https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/main/exercise-data/world_pop2.csv")
norway_hh2 <- read_csv(file = "https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/main/exercise-data/norway_hh2.csv")
mig_policy2 <- read_csv(file = "https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/main/exercise-data/mig_policy2.csv")
##
##
##
# 1. a) View the world_pop2 object
world_pop2
#  . b) Create an object world_pop3 that updates world_pop2 with
#     - a `location_type` variable with value "nation" if the value in the
#       code column is less 900 and "region" if the code is greater than or 
#       equal to 900
#       (Hint: use ifelse() function)
#     - change pop column from population in thousands to the number of persons
#       (Hint: pop * 1000)
world_pop3 <- 
  
  
world_pop3
#    c) Display the observations in world_pop3 
#     - from nations, in 2020
#     - sorted in descending order based on pop (largest country first)
#     - with the pop column renamed to population
#     - the name and population column only






# 2. a) View the norway_hh2 object
norway_hh2
#  . b) Create an object norway_hh3 that updates norway_hh2 with
#     - a new location_type variable based on the number of characters in the 
#       code variable (1, 2, or 4)
#     - a new hh_size factor variable that with levels in order of the household
#       size (as they are in the data)
#       (Hint: use a fct_ function from the forcats package)
norway_hh3 <- 
  
  
norway_hh3
#    c) Display the observations in norway_hh3 
#     - from one person households at the smallest regional level locations 
#       (where the code is 4 characters long)
#     - without the hh_size or house_size columns
#     - sorted in descending order based on pop (largest region first)




#    d) Display the observations in norway_hh3 
#     - from Oslo
#     - sorted by the size of the household (smallest households first)




# 3. a) View the mig_policy2 object
mig_policy2
#  . b) Create an object mig_policy3 that updates mig_policy2 with the numbers 
#       in the immigration_rationale variable to the following labels:
#    1. Counter long-term population decline
#    2. Address population aging
#    3. Meet labour demands in certain sectors of the economy
#    4. Safeguard employment opportunities for nationals
mig_policy3 <- mig_policy2 |>
  mutate(immigration_rationale = recode(
    #####,
    "1" = #####,
    "2" = #####,
    "3" = #####,
    "4" = #####
  ))
mig_policy3
#   c) Update the integration column of the mig_policy3 with the following 
#      labels:
#      1 = "Language skills training",
#      2 = "Transfer of professional credentials",
#      3 = "Protection against discrimination",







mig_policy3
