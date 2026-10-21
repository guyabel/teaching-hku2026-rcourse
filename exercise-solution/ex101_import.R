# 0. a) Open your R session in the course folder on your computer.
#    b) Confirm your R session is currently in you expected course folder using getwd():
getwd()
#    c) Check that the following folders exist in your course folder:
dir.exists("exercise-data")
#    d) If the "exercise-data" folder does not exist, uncomment and run the code
#       below to create it:
# dir.create("exercise-data")
#    e) Run the following code to download the excel files from GitHub to your computer:
download.file(url = "https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/SAPE18DT14.xls", 
              destfile = "./exercise-data/SAPE18DT14.xls", mode = "wb")
download.file(url = "https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/WPP2024_GEN_F01_DEMOGRAPHIC_INDICATORS_COMPACT.xlsx", 
              destfile = "./exercise-data/WPP2024_GEN_F01_DEMOGRAPHIC_INDICATORS_COMPACT.xlsx", mode = "wb")
#    f) Load the tidyverse package (that loads readr, and other packages). 
#       Install it on your computer first if you have not done so already. 
# install.packages("tidyverse")
library(tidyverse)
#    g) Load additional packages that we will use in this exercise
# install.packages("readxl")
library(readxl)
##
##
##
# 1. a. View the "2010_Census_Populations_by_Zip_Code.csv" file on GitHub in 
#       your browser.
browseURL("https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/2010_Census_Populations_by_Zip_Code.csv")
#    b. - Read the CSV data into R from the URL. 
#       - Save as an object named los_angeles_pop 
los_angeles_pop <- read_csv(file = "https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/2010_Census_Populations_by_Zip_Code.csv")
los_angeles_pop
# 2. a. View the "unhcr_popstats_export_persons_of_concern.csv" file on GitHub in 
#       your browser.
browseURL("https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/unhcr_popstats_export_persons_of_concern.csv")
#    b. - Read the CSV data into R from the URL. 
#       - Make sure to set the appropriate argument values (skip and na) to read
#         the data correctly.   
#       - Save as an object named unhcr_pop
unhcr_pop <- read_csv(file = "https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/unhcr_popstats_export_persons_of_concern.csv", 
                      skip = 3, na = "*")
unhcr_pop
# 3. a. View the "tgs00097.tsv" file on GitHub in your browser.
browseURL("https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/tgs00097.tsv")
#    b. - Read the TSV data into R from the URL. 
#       - Make sure to set the appropriate argument values (na) to read the data
#         correctly. 
#       - Save as an object named eu_pop
eu_pop <- read_tsv(file = "https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/tgs00097.tsv", 
                   na = ":")
eu_pop
# 4. a. View the "tabell.csv" file on GitHub in your browser.
#       Note that the URL below is the GitHub page for the file, not the raw 
#       version of the file - as we have used above. The raw version of this file
#       will probably no display in your browsers, and instead the file will 
#       be downloaded to your computer when you click on the "Raw" link.
browseURL("https://github.com/guyabel/teaching-hku2026-rcourse/blob/main/exercise-data/tabell.csv")
#    b. - Read the CSV data into R from the URL: 
#       https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/tabell.csv
#       - Make sure to set the appropriate argument values (delim and skip)
#         to read the data correctly. 
#       - Save as an object named norway_hh
norway_hh <- read_delim(file = "https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/tabell.csv", 
                            delim = ";", skip = 1)
norway_hh
# 5. a. View the "12411-0013.csv" file on GitHub in your browser.
browseURL("https://github.com/guyabel/teaching-hku2026-rcourse/blob/main/exercise-data/12411-0013.csv")
#    b. Use n0 object below (uncomment) to later set the column names manually
n0 <- c("date", "name", "age",
        "german_male", "german_female", "german_both",
        "foreign_male", "foreign_female", "foreign_both",
        "both_male", "both_female", "both_both")
#    c. - Read the CSV data into R from the URL: 
#       https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/12411-0013.csv
#       - Make sure to set the appropriate argument values (skip and n_max) to 
#         read the data correctly. 
#       - Save as an object named germany_pop
germany_pop <- read_csv2(file = "https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/12411-0013.csv", 
                         col_names = n0, skip = 6, n_max = 1472)
germany_pop
# 6. a. Open the "SAPE18DT14.xls" file using the file.show() or system2 function
file.show("./exercise-data/SAPE18DT14.xls")
# system2(command = 'open', args = "./exercise-data/SAPE18DT14.xls")
#    b. - Use read_excel to read in data from the "Mid-2015 Persons" tab in 
#       SAPE18DT14.xls file in the exercise-data folder into R 
#       - Make sure to set the appropriate argument values (skip and sheet) to 
#         read the data correctly. 
#       - Save as an object named ew_pop
ew_pop <- read_excel(path = "./exercise-data/SAPE18DT14.xls", 
                     sheet = "Mid-2015 Persons", skip = 2)
# 7. a. Open the "WPP2024_GEN_F01_DEMOGRAPHIC_INDICATORS_COMPACT.xlsx" file 
#       using the file.show() or system2 function
file.show("./exercise-data/WPP2024_GEN_F01_DEMOGRAPHIC_INDICATORS_COMPACT.xlsx")
# system2(command = 'open', args = "./exercise-data/WPP2024_GEN_F01_DEMOGRAPHIC_INDICATORS_COMPACT.xlsx")
#    b. - Use read_excel to read in data from the ESTIMATES tab in 
#         WPP2024_GEN_F01_DEMOGRAPHIC_INDICATORS_COMPACT.xlsx file in the 
#         exercise-data folder
#       - Make sure to set the appropriate argument values (skip, na) to read 
#         the data correctly.
world <- read_excel(path = "./exercise-data/WPP2024_GEN_F01_DEMOGRAPHIC_INDICATORS_COMPACT.xlsx", 
                    skip = 16, na = "...")
world