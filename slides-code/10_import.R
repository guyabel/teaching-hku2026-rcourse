set.seed(1)

d0 <- data.frame(x = 1:26, y = letters, z = runif(n = 26))
d0

library(tidyverse)
d1 <- tibble(w = rep(month.abb, 2), 
             x = rbinom(n = 24, size = 1, p = 0.7), 
             y = 1:24, z = rnorm(n = 24, sd = 5))
d1



# convert a data.frame to a tibble using as_tibble()
as_tibble(d0)

# name,iso3c,year,pop,growth,births,tfr,sex_ratio,deaths,e0,imr,net
# China,CHN,1950,544044.358,1.785,22293.375,5.813,106.1,12564.024,43.829,127.119,-20.646
# China,CHN,1951,553758.247,1.755,22144.814,5.699,106.1,12411.699,44.557,124.695,-14.036
# China,CHN,1952,565131.438,2.305,25496.318,6.472,106.1,12459.842,45.342,122.187,-9.17
# China,CHN,1953,577557.138,2.047,24139.415,6.042,106.1,12309.528,45.909,119.746,-5.792
# China,CHN,1954,590113.858,2.252,25438.543,6.278,106.1,12145.57,46.763,117.757,-3.632
# China,CHN,1955,603547.007,2.25,25727.524,6.263,106.1,12148.175,47.237,114.942,-2.402
# China,CHN,1956,616558.583,2.019,24364.154,5.854,106.1,11916.102,47.807,112.601,-1.85
# China,CHN,1957,630356.208,2.403,27068.471,6.425,106.1,11917.715,48.378,110.232,-1.699
# China,CHN,1958,644219.479,1.952,24284.912,5.698,106.1,11704.871,48.834,107.886,-2.545
# China,CHN,1959,652708.217,0.674,20310.612,4.718,106.1,15902.353,40.17,153.478,-8.276
# China,CHN,1960,654802.069,-0.032,19310.83,4.451,106.1,19506.188,33.419,196.106,-16.927
# China,CHN,1961,655773.486,0.329,16879.455,3.863,106.1,14698.762,40.158,154.337,-25.578
# China,CHN,1962,665073.691,2.473,26826.299,6.085,106.2,10349.702,50.959,98.595,-31.305
# China,CHN,1963,684552.645,3.289,33461.05,7.513,106.2,10917.053,51.67,96.202,-31.383
# China,CHN,1964,704798.265,2.551,30071.914,6.672,106.2,10842.874,52.343,93.762,-1250.441
# China,CHN,1965,723415.733,2.662,30064.192,6.605,106.2,10676.969,53.001,91.276,-130.9
# China,CHN,1966,742402.213,2.521,29208.554,6.307,106.2,10496.09,53.662,88.749,4.165
# China,CHN,1967,761026.026,2.435,27472.169,5.806,106.3,10187.821,54.401,86.132,1246.654
# China,CHN,1968,781011.025,2.745,31649.577,6.508,106.3,10173.291,55.191,83.382,-37.29

# file.show("../slides-data/cn.csv")
# system2(command = "open", args = "../slides-data/cn.csv")

cn <- read_csv(file = "../slides-data/cn.csv")
cn

glimpse(x = cn)

cn_limited <- read_csv(file = "../slides-data/cn.csv", n_max = 5)
cn_limited

cn_skipped <- read_csv(file = "../slides-data/cn.csv", skip = 10)
cn_skipped

cn_fertility <- read_csv(
  file = "../slides-data/cn.csv", 
  col_select = c("year", "tfr", "births", "sex_ratio", "imr")
)
cn_fertility

cn_mortality <- read_csv(file = "../slides-data/cn.csv", 
                         col_select = c("year", 9, 10, 11))
cn_mortality

n2 <- c("country", "country_code", "time", "population", "pop_growth", 
        "total_births", "fertility_rate", "sex_ratio_at_birth", "total_deaths", 
        "life_expectancy", "infant_mortality", "net_migration")
n2

cn2 <- read_csv(file = "../slides-data/cn.csv", col_names = n2)
cn2

n2 <- c("country", "country_code", "time", "population", "pop_growth", 
        "total_births", "fertility_rate", "sex_ratio_at_birth", "total_deaths", 
        "life_expectancy", "infant_mortality", "net_migration")
n2

cn2 <- read_csv(file = "../slides-data/cn.csv", col_names = n2, skip = 1)
cn2

# we create a vector of long complicated column names to demonstrate
n3 <- c("Country", "Country Code", "Year", 
        "Population at beginning of year", "Population Growth")

cn3 <- read_csv(file = "../slides-data/cn.csv", col_names = n3, 
                col_select = 1:5, skip = 1)
cn3

ggplot(data = cn3, 
       mapping = aes(x = Year, y = `Population at beginning of year`/1e6)) +
  geom_line()

library(janitor)
cn4 <- clean_names(cn3)
cn4



cn5 <- read_delim(file = "../slides-data/cn.csv", delim = ",", n_max = 8)
cn5



# write_csv(x = cn_fertility, file = "../slides-data/cn_fertility.csv")

as_tibble(quakes)

# write_csv(x = quakes, file = "../slides-data/quakes.csv")
# 
# library(arrow)
# write_parquet(x = quakes, sink = "../slides-data/quakes.parquet")

library(arrow)

file.size("../slides-data/quakes.csv")
file.size("../slides-data/quakes.parquet")

qq <- read_parquet(file = "../slides-data/quakes.parquet", 
                   col_select = c("lat", "long", "mag"))
qq

# file.show("../slides-data/SAPE18DT14.xls")

library(readxl)
ew_pop <- read_excel(path = "../slides-data/SAPE18DT14.xls", sheet = 2, skip = 3)
ew_pop

# library(openxlsx)
# # create a empty workbook to fill
# w <- createWorkbook(creator = "Guy")
# 
# # create a empty sheet in the workbook
# addWorksheet(wb = w, sheetName = "months")
# addWorksheet(wb = w, sheetName = "small area population")
# 
# # add your data
# writeData(wb = w, sheet = 1, x = d1)
# writeData(wb = w, sheet = 2, x = ew_pop)
# 
# # add a filter and freeze the top row
# addFilter(wb = w, sheet = 2, rows = 1, cols = colnames(ew_pop))
# freezePane(wb = w, sheet = 2, firstRow = TRUE)
# 
# ## save workbook to working directory
# saveWorkbook(w, file = "../slides-data/test.xlsx", overwrite = TRUE)
# file.show("../slides-data/test.xlsx")

library(haven)
pan1960 <- read_dta(file = "../slides-data/pan1960.dta.gz")
pan1960

pan1960 <- read_dta(file = "https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/slides-data/pan1960.dta.gz", 
                    col_select = c("serial", "pernum", "perwt", "age", 
                                   "sex", "toilet"))
pan1960

print_labels(pan1960$toilet)

table(pan1960$toilet)

as_factor(pan1960$toilet)[1:50]

table(as_factor(pan1960$toilet))

# NA



library(jsonlite)
cn_pop <- fromJSON(
  txt = "https://api.worldbank.org/v2/country/CHN/indicator/SP.POP.TOTL?format=json", 
  flatten = TRUE
)
str(cn_pop)

cn_pop[[1]]

cn_pop[[2]]

library(wbstats)
wb_data(indicator = "SP.POP.TOTL", country = "CHN")

wb_data(indicator = "SP.POP.TOTL", country = "HKG", 
        start_date = 2000, end_date = 2020)

# NA
