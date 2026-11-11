# 0. a) Run the code to load the tidyverse package (that contains dplyr)
# install.packages("tidyverse")
library(tidyverse)
#    b) run the code below to read the data for this exercise from the GitHub repository
world_2023 <- read_csv(file = "https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/main/exercise-data/world_2023.csv", 
                       col_select = c(iso3c, name, region_geo, grp_income, pop, tfr, imr))
wb_gdp_2023 <- read_csv(file = "https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/main/exercise-data/wb_gdp_2023.csv")
wiki_names <- read_csv(file = "https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/main/exercise-data/wiki_names.csv")
wiki_capital <- read_csv(file = "https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/main/exercise-data/wiki_capital.csv")
wiki_language <- read_csv(file = "https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/main/exercise-data/wiki_language.csv")
##
##
##
# 1. View world_2023 and wb_gdp_2023
world_2023
wb_gdp_2023
# 2. Create a new data set d0 that joins wb_gdp_2023 to world_2023
d0 <- 
d0
# 3. View wiki_names, wiki_capital, and wiki_language
wiki_names
wiki_capital
wiki_language
# 4. Join wiki_capital and wiki_language onto wiki_names and save as wiki
wiki <- 
  
  
wiki
# 5. Join wiki onto d0 and save as d1
d1 <- 
d1