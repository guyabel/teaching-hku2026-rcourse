# 0 a) Load the tidyverse package
#      Install it on your computer first if you have not done so already. 
# install.packages("tidyverse")
library(tidyverse)
#    b) Load additional packages that we will use in this exercise
# install.packages("jsonlite")
# install.packages("rjtat")
# install.packages("eurostat")
# install.packages("arrow")
library(jsonlite)
library(rjstat)
library(eurostat)
library(arrow)
##
##
##
# 1. Browse to the Eurostat API population data for the Peidmont region in Italy
browseURL("https://ec.europa.eu/eurostat/api/dissemination/statistics/1.0/data/tgs00099?lang=en&geo=ITC1")
# 2. Use fromJSON to read the JSON data into R from the URL and save as an object
#    named peidmont_pop_json 

# 3. Inspect the structure of the downloaded JSON data using str():
str(object = #####, max.level = 1)
# 4. Extract the "value" element from the JSON data. Note that it is a named 
#    vector

# 5. Eurostat uses a "JSON-stat" format for its data. This format is different 
#    from the standard JSON format, where each data point is represented as a 
#    separate object.
#    Instead, JSON-stat uses a compact representation where the data is stored 
#    in a single array, and the metadata is stored separately.
#    The {rjstat} package provides a function to convert JSON-stat data into a 
#    clean data frame.
#    Use the fromJSONstat() function from the {rjstat} package to download the 
#    Peidmont region population data from the Eurostat API and convert it into a
#    clean data frame. 
peidmont_df <- 
peidmont_df
# 6. Convert the data frame into a tibble and save it as an object named peidmont

# 7. Use the get_eurostat() function to retrieve the complete NUTS 2 population 
#    change & net migration dataset ("tgs00099") 
euro_pop <- get_eurostat(id = #####)
euro_pop
# 8. Use the filter argument of the get_eurostat() function to retrieve only the
#    Peidmont region (geo code ITC1) population data from the Eurostat API
get_eurostat(id = #####,  filters = list(geo = #####))
# 9. Use the filter argument of the get_eurostat() function to retrieve only the
#    crude net migration data (indic_de code CNMIGRATRT) in 2024 from the Eurostat
#    API.

# 10. Save the European NUTS 2 in euro_pop tibble in a CSV file called 
#    "euro_nuts_pop.csv" in the "exercise-data" folder

# 11. Save the European NUTS 2 in euro_pop tibble in a parquet file called 
#     "euro_nuts_pop.parquet" in the "exercise-data" folder
