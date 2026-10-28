# 0. a) Complete and run the code to create load the tidyverse package (that tidyr)
# install.packages("tidyverse")
library(tidyverse)
#    b) run the code below to read the data for this exercise from the GitHub repository
world_age0 <- read_csv("https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/world_age0.csv")
world_pop0 <- read_csv("https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/world_pop0.csv")
ew_pop0 <- read_csv("https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/ew_pop0.csv")
norway_hh0 <- read_csv("https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/norway_hh0.csv")
germany_pop0 <- read_csv("https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/germany_pop0.csv")
euro_pop0 <- read_csv("https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/euro_pop0.csv")
##
##
##
# 1. a. Take a look at world_age0, data from the United Nations World Population
#       Prospects 2024 of population age groups over time
world_age0
#    b. Reshape world_age0 to a tidy format with dimensions 368,298 × 5 columns 
#       (name, code, year, age and pop)



# 2. a. Take a look at world_pop0, data from the United Nations World Population 
#       Prospects 2019 in population sizes over time
world_pop0
#    b. View the column names of world_pop0
colnames(world_pop0)
#    c. Reshape world_pop0 to a tidy format with dimensions 20,235 x 4 columns 
#       (name, code, year and pop)



# 3. a. Take a look at ew_pop0, data from the Office for National Statistics (ONS) 
#       in England and Wales of population age groups for small areas
ew_pop0
#    b. Reshape ew_pop0 to a tidy format with dimensions 143,431 x 5. columns 
#      (code, district, small_area, age and pop)


# 4. a. Take a look at norway_hh0, data from Statistics Norway of population by 
#       household size
norway_hh0
#    b. Reshape norway_hh0 to a tidy format with dimensions 2,200 x 3 columns (area, house_size and pop)



# 5. a. Take a look at germany_pop0, data from the Federal Statistical Office of
#       Germany of population by sex and nationality
germany_pop0
#    b. Reshape germany_pop0 to a tidy format with dimensions 13,248 x 5 columns (date, name, age, citizenship_sex and pop)


#    c. Reshape germany_pop0 to a tidy format with dimensions 13,248 x 6 columns (date, name, age, citizenship, sex and pop)
#       Hint: set names_sep = "_" in the pivot_longer() function


# 6. a. Take a look at euro_pop0, data from Eurostat of region population by over time 
euro_pop0
#    b. View the data for rows 250 to 260 - note that the flag (or footnote) used 
#       for the 2012 data for the regions in SK (Slovakia)
euro_pop0[250:260, ]
#    c. Reshape euro_pop0 to a tidy format with dimensions 3,924 x 3 columns (`unit,age,geo\\time, year and pop)
#       i.  Set values_transform = as.character in the pivot_longer() function to
#           convert the year column to character values
#       ii. Set cols_vary in the pivot_longer() function to ensure that the year
#           column varies slowest (i.e., the year column varies slower than the 
#           first column)

