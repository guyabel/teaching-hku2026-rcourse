library(tidyverse)
world_2023 <- read_csv("../slides-data/world_2023.csv") 
# world_tfr0 <- read_csv("../slides-data/world_tfr.csv")
# world_tfr <- pivot_longer(data = world_tfr0, cols = 3:16,
#                           names_to = "period", values_to = "tfr")
# world_tfr <- separate_wider_delim(world_tfr, col = period, 
#                      names = c("start", "end"), delim = "-", cols_remove = FALSE)
# world_tfr

world_2023

select(world_2023, name, iso3c, region_geo, pop)

select(world_2023, name, iso3c, region_geo, pop)

relocate(world_2023, region_geo)

# these are all the same...
# select(world_tfr, 1:2, 5:7)
# select(world_2023, 1:2, contains("grp_"))
select(world_2023, 1:2, starts_with("grp_"))

mean(pull(world_2023, tfr))

pull(world_2023, tfr)



filter(world_2023, region_geo == "Europe")

# can also use `<` `>` `>=` `<=` `!=`
filter(world_2023, region_geo == "Europe", tfr < 1.2)

filter_out(world_2023, region_geo == "Africa")

filter(world_2023, region_geo != "Africa")

filter(world_2023, between(x = tfr, left = 2, right = 2.5))

filter(world_2023, 
       when_all(region_geo == "Africa", 
                between(x = tfr, left = 2, right = 2.5)))

filter(world_2023, 
       when_any(region_geo == "Africa", 
                between(x = tfr, left = 2, right = 2.5)))

filter(world_2023, 
       region_geo == "Africa", 
       between(x = tfr, left = 2, right = 2.5))

filter(world_2023, 
       region_geo == "Africa" | between(x = tfr, left = 2, right = 2.5))

filter(world_2023, iso3c %in% c("CHN", "IND", "USA"))

filter(world_2023, region_geo %notin% c("Africa", "Asia"), tfr > 3)

slice(world_2023, 100:105)

slice_max(world_2023, order_by = pop, n = 5)

slice_min(world_2023, order_by = pop, n = 5)

distinct(world_2023, region_geo)

distinct(world_2023, region_geo, grp_develop)



world_2023 |>
  filter(region_geo == "Asia") |>
  slice_max(order_by = tfr, n = 5) |>
  relocate(tfr)

relocate(slice_max(filter(world_2023, region_geo == "Asia"), order_by = tfr, n = 5), tfr)

world_2023 |>
  pull(tfr) |>
  mean()

world_2023 |>
  filter(region_geo == "Europe") |>
  pull(births) |>
  sum()

# below is the same as the previous slide 
world_2023 |>
  filter(.data = _, region_geo == "Europe") |>
  pull(.data = _, births) |>
  sum(x = _)

world_2023 |>
  filter(.data = _, region_geo == "Asia") |>
  lm(formula = tfr ~ imr + births, data = _)

world_2023 |>
  filter(.data = _, region_geo == "Asia") |>
  lm(formula = tfr ~ imr + births, data = _) |>
  residuals() |>
  sd()

world_2023 %>%
  filter(.data = ., region_geo == "Asia") %>%
  lm(formula = tfr ~ imr + births, data = .) %>%
  residuals() %>%
  sd()

# NA



world_2023 |>
  select(name, iso3c, tfr) |>
  mutate(tfr_round = round(x = tfr, digits = 1),
         tfr_replace = ifelse(test = tfr < 2.1, yes = "below", no = "above"))

world_2023 |>
  select(name, iso3c, tfr) |>
  mutate(tfr_level = case_when(
    tfr < 1.3 ~ "Lowest-Low",
    tfr < 1.5 ~ "Very Low",
    tfr < 2.1 ~ "Low",
    tfr < 3.0 ~ "Medium",
    tfr < 5.0 ~ "High",
    TRUE ~ "Very High"))

world_2023 |>
  select(name, iso3c, tfr) |>
  mutate(tfr_interval4 = cut(x = tfr, breaks = c(0, 2, 4, 6, 8)),
         tfr_interval7 = cut(x = tfr, breaks = 0:7))

world_2023 |>
  filter(region_sdg == "Eastern and South-Eastern Asia", pop > 25e6) |>
  select(name, iso3c, pop) |>
  mutate(short_name = recode(
    .x = name,
    "Dem. People's Republic of Korea" = "North Korea",
    "Republic of Korea" = "South Korea"
  ))

world_2023 |>
  select(name, iso3c, tfr) |>
  rename(fertility_rate = tfr,
         country_name = 1,
         country_code = 2)

world_2023 |>
  select(name, imr) |>
  arrange(imr)

world_2023 |>
  select(name, imr) |>
  arrange(-imr)

world_2023 |>
  select(name, imr) |>
  arrange(desc(imr))

library(readxl)
world_age <- read_excel(
    path = "../slides-data/WPP2024_POP_F02_1_POPULATION_5-YEAR_AGE_GROUPS_BOTH_SEXES.xlsx",
    skip = 16, na = "..."
  ) |>
  select(3, 11, contains("-"), contains("+")) |>
  rename(name = 1,
         year = 2,
         iso3c = 3,
         iso2c = 4) |>
  drop_na(iso3c) |>
  pivot_longer(cols = -(1:4), names_to = "age_grp", values_to = "pop")


world_age
tail(world_age, n = 4)

world_age |>
  filter(name == "China", year == 2020) |>
  arrange(age_grp)

world_age <- mutate(world_age, age_grp = fct_inorder(age_grp))

# now arrange works well...
world_age |>
  filter(name == "China", year == 2020) |>
  arrange(age_grp)

# NA





# original data
world_age
tail(world_age, n = 4)

# summarise over all age groups and all countries
world_age |>
  group_by(year) |>
  summarise(world_pop = sum(pop))

world_age |>
  summarise(world_pop = sum(pop))

# summarise over all countries in 2020
world_age |>
  filter(year == 2020) |>
  group_by(age_grp) |>
  summarise(world_pop = sum(pop) * 1000)

# summarise over all age groups for 5 european countries in 2020
world_age |>
  filter(year == 2020, iso3c %in% c("GBR", "FRA", "DEU", "ITA", "ESP"))  |>
  group_by(name) |>
  summarise(pop_m = sum(pop) / 1000,
            n_age_grps = n(),
            over100 = last(pop))

eur5_pop <- world_age |>
  filter(year %in% c(1980, 1990, 2000, 2010, 2020),
         iso3c %in% c("GBR", "FRA", "DEU", "ITA", "ESP")) |>
  group_by(name, year) |>
  summarise(pop_m = sum(pop) / 1000) |>
  ungroup()
eur5_pop

eur5_pop |>
  group_by(name) |>
  mutate(pop_1980 = first(pop_m),
         pop_prev5 = lag(pop_m),
         pop_growth5 = pop_m / pop_prev5 - 1)

# NA
