library(tidyverse)
world_2023 <- read_csv("../slides-data/world_2023.csv") 
s_asia <- read_csv("../slides-data/s_asia.csv")

# creating some demonstration data frames
# eur5_tfr <- tibble(A = c("a", "b", "c"), B = c("t", "u", "v"), C = 1:3)
# d1 <- tibble(A = c("a", "b", "d"), B = c("t", "u", "w"), D = 3:1)
# d2 <- tibble(A = c("c", "d"), B = c("v", "w"), C = 3:4)
# d3 <- rename(d1, AA = A, BB = B)
# d4 <- tibble(A = c("a", "c", "c", "c"), D = 4:1)

# Group A: North American Countries
nafta_2023 <- world_2023 |> 
  filter(iso3c %in% c("USA", "CAN", "MEX"))  |>
  select(name, iso3c, pop)




# Group B: Nordic/European Countries (Disjoint from NA)
s_asia_2023 <- world_2023 |> 
  filter(iso3c %in% c("IND", "PAK", "BGD", "LKA", "NPL")) |>
  select(name, iso3c, pop) 

eur5_tfr_2023 <- world_2023 |> 
  filter(iso3c %in% c("GBR", "FRA", "DEU", "ITA", "ESP")) |>
  select(name, iso3c, tfr)

g7_2023 <- world_2023 |> 
  filter(iso3c %in% c("USA", "CAN", "GBR", "FRA", "DEU", "ITA", "JPN")) |>
  select(name, iso3c, pop)

ind_fertility <- s_asia |>
  filter(iso3c == "IND") |>
  select(name, iso3c, year, births, tfr, sex_ratio)

eu6_tfr_2023 <- world_2023 |> 
  filter(iso3c %in% c("LUX", "BEL", "NLD", "FRA", "DEU", "ITA")) |>
  select(iso3c, name, tfr)


nafta_2023

s_asia_2023

bind_rows(nafta_2023, s_asia_2023)

nafta_2023

eur5_tfr_2023

bind_rows(nafta_2023, eur5_tfr_2023)

eur5_tfr_2023

eu6_tfr_2023

bind_rows(eur5_tfr_2023, eu6_tfr_2023)

intersect(eur5_tfr_2023, eu6_tfr_2023)

union(eur5_tfr_2023, eu6_tfr_2023)

# EUR5 as the first data set (GBR, FRA, DEU, ITA, ESP) 
setdiff(eur5_tfr_2023, eu6_tfr_2023)

# EU6 as the first data set (LUX, BEL, NLD, FRA, DEU, ITA)
setdiff(eu6_tfr_2023, eur5_tfr_2023)

# NA





g7_2023

eur5_tfr_2023

left_join(x = g7_2023, y = eur5_tfr_2023)

left_join(x = g7_2023, y = eur5_tfr_2023, by = c("name", "iso3c"))

left_join(x = g7_2023, y = eur5_tfr_2023, 
          by = c("name" = "name", "iso3c" = "iso3c"))

eur5_tfr_2023 <- rename(eur5_tfr_2023, country_code = iso3c)
eur5_tfr_2023
g7_2023 <- rename(g7_2023, country = 1)
g7_2023

left_join(x = g7_2023, y = eur5_tfr_2023,
          by = c("country" = "name", "iso3c" = "country_code"))

s_asia_2023

ind_fertility

left_join(s_asia_2023, ind_fertility)



# set column names to match for demonstration purposes
eur5_tfr_2023 <- rename(eur5_tfr_2023, iso3c = 2)
g7_2023 <- rename(g7_2023, name = 1)

eur5_tfr_2023
g7_2023

left_join(x = g7_2023, y = eur5_tfr_2023)

right_join(x = g7_2023, y = eur5_tfr_2023)

inner_join(x = g7_2023, y = eur5_tfr_2023)

full_join(x = g7_2023, y = eur5_tfr_2023)

anti_join(x = g7_2023, y = eur5_tfr_2023)

# NA

world_2023 |>
  pull(name) |>
  str_detect(pattern = "Dem")

world_2023 |>
  filter(str_detect(string = name, pattern = "Dem")) |>
  select(1:2, pop)

world_2023 |>
  filter(str_detect(string = name, pattern = "^Dem")) |>
  select(1:2, pop)

world_2023 |>
  filter(str_detect(string = name, pattern = "land$")) |>
  select(1:2, pop)

world_2023 |>
  filter(str_detect(string = name, pattern = "[A]")) |>
  select(1:2, pop)


# different ways to detect multiple patterns in the same string
world_2023 |>
  filter(str_detect(string = name, pattern = "Saint|Sint")) |>
  select(name, region_geo, pop)

world_2023 |>
  pull(name) |>
  str_subset(pattern = "Dem")

world_2023 |>
  filter(str_detect(string = name, pattern = "Dem")) |>
  mutate(name_clean = str_replace(string = name, 
                                  pattern = "Democratic", 
                                  replacement = "Dem.")) |>
  select(name, name_clean)

world_2023 |>
  filter(str_detect(string = name, pattern = " ")) |>
  mutate(name_no_spaces = str_replace(string = name, 
                                      pattern = " ", 
                                      replacement = "_")) |>
  select(name, name_no_spaces)

world_2023 |>
  filter(str_detect(string = name, pattern = " ")) |>
  mutate(name_no_spaces = str_replace_all(string = name, 
                                          pattern = " ",
                                          replacement = "_")) |>
  select(name, name_no_spaces)

world_2023 |>
  filter(str_detect(string = name, pattern = "\\(")) |>
  pull(name)

world_2023 |>
  filter(str_detect(string = name, pattern = "\\(")) |>
  mutate(name_no_parens = str_remove(string = name, pattern = "\\("),
         name_no_parens = str_remove(string = name_no_parens, pattern = "\\)")) |>
  select(name, name_no_parens)

world_2023 |>
  filter(str_detect(string = name, pattern = "\\(")) |>
  mutate(name_no_parens = str_replace(string = name, 
                                      pattern = "\\s*\\(.*?\\)", 
                                      replacement = "")) |>
  select(name, name_no_parens)

world_2023 |>
  filter(str_detect(string = name, pattern = "land$")) |>
  mutate(profile_label = str_c(name, " is located in ", region_geo)) |>
  pull(profile_label)

world_2023 |>
  group_by(region_sdg) |>
  summarise(countries = str_flatten(name, collapse = ", "))

# NA
