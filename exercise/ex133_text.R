# 0. a) Run the code to load the tidyverse package (which includes stringr)
library(tidyverse)
#    b) Run the code below to read the data for this exercise from the GitHub repository
wiki_names <- read_csv(file = "https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/main/exercise-data/wiki_names.csv")
wiki_capital <- read_csv(file = "https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/main/exercise-data/wiki_capital.csv")
wiki_language <- read_csv(file = "https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/main/exercise-data/wiki_language.csv")
germany_pop2 <- read_csv(file = "https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/main/exercise-data/germany_pop2.csv")
se_asia <- read_csv(file = "https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/main/exercise-data/se_asia.csv")
##
##
##
# 1. a) View the observations in wiki_capital:
wiki_capital
#    b) View the observations in wiki_names:
wiki_names
#    c) Display the observations in wiki_capital
#       - Filter to keep only the countries where the capital strictly STARTS 
#         with "Port"
#       - Use the wiki_names data frame to add the country name to the filtered
#         data
#       - Keep only the name and capital columns
wiki_capital |>
  filter##### |>
  left_join##### |>
  select#####

# 2. a) View the observations in germany_pop2:
germany_pop2
#    b) View the unique values in the age column of germany_pop2:
unique(germany_pop2$age)
#    c) Create a new data frame called germany_pop3 that updates germany_pop2 by:
#      - renaming the age column to age_grp
#      - creating a new age column that removes the text " years" and " year" from
#        the age_grp column
#      - replacing the text "under 1" with "0" and "90 and over" with "90"
germany_pop3 <- germany_pop2 |>
  rename##### |>
  mutate(age = #####(string = age_grp, pattern = " years"),
         age = #####(string = age, pattern = " #####"),
         age = #####(string = age, pattern = "under 1", replacement = "0"),
         age = #####(string = age, pattern = "#####", replacement = "#####"))
germany_pop3
#    d) View the unique values in the age column of germany_pop3:
unique(germany_pop3$age)

# 3. a) View the observations in wiki_capital:
se_asia
#    b) Display an updated se_asia data that:
#     - filters to keep only the observations for the year 2023
#     - creates a new variable called country_label that combines the name and iso3c
#       columns in the format "name (iso3c)"
#     - keeps only the country_label and pop columns
se_asia |>
  #####
  mutate(##### = #####(name, " (", iso3c, ")")) |>
  select#####
