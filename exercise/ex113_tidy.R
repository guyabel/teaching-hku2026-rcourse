# 0. a) Complete and run the code to create load the tidyverse package (that tidyr)
# install.packages("tidyverse")
library(tidyverse)
#    b) run the code below to read the data for this exercise from the GitHub repository
germany_pop1 <- read_csv("https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/germany_pop1.csv")
norway_hh1 <- read_csv("https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/norway_hh1.csv")
ew_pop1 <- read_csv("https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/ew_pop1.csv")
mig_policy1 <- read_csv("https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/mig_policy1.csv")
euro_pop1 <- read_csv("https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/euro_pop1.csv")
##
##
##
# 1. a) View the germany_pop1 object
germany_pop1
#    b) Create an object called germany_pop2 by separating the citizenship_sex 
#       column in germany_pop1 into two columns (called "citizenship" and "sex")
germany_pop2 <- 

germany_pop2

# 2. a) View the norway_hh1 object
norway_hh1
#    b) Create an norway_hh2 using the code template below to separate the area 
#       column of norway_hh1 so that two new columns for the code and name in 
#       each group are created
#       (Hint: set the too_many argument to "merge")
norway_hh2 <- 
  
norway_hh2

# 3.  a) View the mig_policy object
mig_policy1
#     b) Create an object called mig_policy2 by dropping the NA values in the 
#        immigration column to leave 197 rows
mig_policy2 <- 
mig_policy2
#     c) Modify the mig_policy2 object by splitting the immigration_rationale 
#        column so that each rationale code occupies its own row, resulting 
#        in an updated mig_policy2 data frame with 285 rows.
mig_policy2 <- 
mig_policy2
#     d) Modify the mig_policy2 object by splitting the integration 
#        column so that each integration code occupies its own row, resulting 
#        in an updated mig_policy2 data frame with 466 rows
mig_policy2 <- 
mig_policy2

# 4.  a) View the euro_pop1 object
euro_pop1
#    b) Create an object called euro_pop2 that updates euro_pop1 by separating 
#       first column into three new columns called "unit", "age" and "geo" 
euro_pop2 <- 
  
#    c) View the data for geo UKC1, the Tees Valley and Durham region in the 
#       United Kingdom - note that the flag (or footnote) used for the 2014 data
subset(euro_pop2, geo == "UKC1")
#    d) Update euro_pop2 by separating the pop column into two new columns called
#       "pop" and "flag". Ensure that the new pop column is numeric and the new 
#       flag column is character
#       (Hint: set the too_few argument to "align_start")
euro_pop2 <- 
  

#    e) View the data for geo UKC1, the Tees Valley and Durham region in the 
#       United Kingdom - note that the flag (or footnote) used for the 2014 data
subset(euro_pop2, geo == "UKC1")
