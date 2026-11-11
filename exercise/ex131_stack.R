# 0. a) Open your R session in the course folder on your computer.
#    b) Confirm your R session is currently in you expected course folder using getwd():
getwd()
#    c) Check that the following folders exist in your course folder:
dir.exists("exercise-data")
#    d) If the "exercise-data" folder does not exist, uncomment and run the code
#       below to create it:
# dir.create("exercise-data")
#    e) Run the following code to download the excel files from GitHub to your computer:
download.file(url = "https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/WPP2024_POP_F02_1_POPULATION_5-YEAR_AGE_GROUPS_BOTH_SEXES.xlsx", 
              destfile = "./exercise-data/WPP2024_POP_F02_1_POPULATION_5-YEAR_AGE_GROUPS_BOTH_SEXES.xlsx", mode = "wb")
#    f) Run the code to load the tidyverse package (that contains dplyr) and 
#       readxl package
# install.packages("tidyverse")
# install.packages("readxl")
library(tidyverse)
library(readxl)
##
##
##
# 1. a. Open the "WPP2024_POP_F02_1_POPULATION_5-YEAR_AGE_GROUPS_BOTH_SEXES.xlsx" 
#       file using the file.show() or system2 function. 
file.show("./exercise-data/WPP2024_POP_F02_1_POPULATION_5-YEAR_AGE_GROUPS_BOTH_SEXES.xlsx")
# system2(command = 'open', args = "./exercise-data/WPP2024_POP_F02_1_POPULATION_5-YEAR_AGE_GROUPS_BOTH_SEXES.xlsx")
#    b. Use the excel_sheets() function to view the names of the sheets in the
#       "WPP2024_POP_F02_1_POPULATION_5-YEAR_BOTH_SEXES.xlsx" file.
excel_sheets("./exercise-data/WPP2024_POP_F02_1_POPULATION_5-YEAR_AGE_GROUPS_BOTH_SEXES.xlsx")

# 2. Read into R
#    a) the 1st sheet and save as r1
#    b) the 2nd sheet and save as r2
#    c) print r1
#    d) print r2
r1 <- #####("./exercise-data/WPP2024_POP_F02_1_POPULATION_5-YEAR_AGE_GROUPS_BOTH_SEXES.xlsx", 
                 sheet = ####, skip = 16, na = "...") |>
  select(-1,-4,-(6:10))
r1

r2 <- #####("./exercise-data/WPP2024_POP_F02_1_POPULATION_5-YEAR_AGE_GROUPS_BOTH_SEXES.xlsx", 
                 sheet = #####, skip = 16, na = "...") |>
  select(-1,-4,-(6:10))
r2
# 2. Bind the rows of r1 and r2 and call the result r3

# 3. a) Confirm the number of rows in r1, r2, and r3
nrow(r1)
nrow(r2)
nrow(r3)
# 4. Complete the following for loop to read the first 14 sheets of the
#    WPP2024_POP_F02_1_POPULATION_5-YEAR_AGE_GROUPS_BOTH_SEXES.xlsx
#    spreadsheet and bind the rows into one data frame called rr
rr <- NULL
for(i in 1:#####){
  r0 <- #####(path = "./exercise-data/WPP2024_POP_F02_1_POPULATION_5-YEAR_AGE_GROUPS_BOTH_SEXES.xlsx", 
                   skip = #####, sheet = i, na = "...") |>
    select(-1,-4,-(6:10)) |>
    rename(variant = 1, 
           name = 2,
           code = 3,
           year = 4)
  rr <- #####(rr, r0)
  message("binding sheet ", i, " to rr, rr now has ", nrow(rr), " rows")
}
rr
# 5. Confirm the number of rows in rr is 319,345

# 6. Display the observations in rr using pipes
#    a) from China in 2100
#    b) the variant and `0-4` column only


