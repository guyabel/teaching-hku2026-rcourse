d0 <- data.frame(x = 1:26, y = letters, z = runif(n = 26))
head(d0)
str(d0)
summary(d0)

# View(d0)

library(tidyverse)
d1 <- tibble(w = rep(month.abb, 2), 
             x = rbinom(n = 24, size = 1, p = 0.7), 
             y = 1:24, z = rnorm(n = 24, sd = 5))
d1$xx <- as.logical(d1$x)
d1$yy <- as.numeric(d1$y)
d1$zz <- as.integer(d1$z)

d1



d1$w
# no level information - just categories with no order
levels(d1$w)
as.numeric(d1$w)
# covert to factor
d1$w <- factor(d1$w)
d1$w
# levels of each element
as.numeric(d1$w)

# print only levels
levels(d1$w)

# data has not changed, just added an order property to w that we do not see except for fct
d1



d1$m <- rep(month.abb, 2)
d1$m <- factor(d1$m)
levels(d1$m)

d1

d1$m <- fct_inorder(d1$m)
levels(d1$m)

# no change in data appearance
d1

world_2023 <- read_csv("../slides-data/world_2023.csv") 

world_2023

# order not logical
ggplot(data = world_2023, mapping = aes(x = tfr, y = grp_income)) +
  geom_violin() 

# no order provided as character string
levels(world_2023$grp_income)

# convert to factor
world_2023$grp_income <- factor(world_2023$grp_income)

# levels follow alphabetical order
levels(world_2023$grp_income)

# manual reorder
world_2023$grp_income <- fct_relevel(world_2023$grp_income, "upper")
levels(world_2023$grp_income)
world_2023$grp_income <- fct_shift(world_2023$grp_income, n = 1)
levels(world_2023$grp_income)

ggplot(data = world_2023, mapping = aes(x = tfr, y = grp_income)) +
  geom_violin()

world_2023$grp_income <- fct_rev(world_2023$grp_income)
levels(world_2023$grp_income)

ggplot(data = world_2023, mapping = aes(x = tfr, y = grp_income)) +
  geom_violin()

# remember the appearance of categories in data is the same when, 
# using factor(), only the order of levels (the categories) changes
world_2023$region_geo <- factor(world_2023$region_geo)
world_2023$name <- factor(world_2023$name)

world_2023



# current order
levels(d1$w)
# recode levels
d1$w <- fct_recode(d1$w, "April" = "Apr", "March" = "Mar")
levels(d1$w)
# collapse levels
d1$w <- fct_collapse(d1$w, summer = c("Jun", "Jul", "Aug"), 
                           winter = c("Dec", "Jan", "Feb"))
levels(d1$w)
d1

levels(world_2023$grp_income)

# convert all to title case
levels(world_2023$grp_income) <- str_to_title(levels(world_2023$grp_income))
levels(world_2023$grp_income)

# recode some to more formal labels
world_2023$grp_income <- fct_recode(world_2023$grp_income, "Lower" = "Low")
levels(world_2023$grp_income)

# the data has now changed as w assigned new levels using 
# levels(world_2023$grp_income) <- 
# (rather than altering the level ordering as we doing previously)
world_2023

# more formal labels
ggplot(data = world_2023, mapping = aes(x = tfr, y = grp_income)) +
  geom_violin() 

# ovelapping labels on x-axis
ggplot(data = world_2023, mapping = aes(x = region_geo, y = tfr)) +
  geom_violin() 

levels(world_2023$region_geo)

# wrap labels
levels(world_2023$region_geo) <- str_wrap(levels(world_2023$region_geo), 
                                          width = 15)
levels(world_2023$region_geo)


# non-ovelapping labels on x-axis
ggplot(data = world_2023, mapping = aes(x = region_geo, y = tfr)) +
  geom_violin() 

# NA



pacman::p_unload(pacman::p_loaded(), character.only = TRUE)

library(tidyverse)







library(tidyverse)
library(readxl)
#read in the data and tidy up (more later on %>%, rename filter and select)
world_tfr0 <- read_csv("../slides-data/world_tfr.csv")

world_tfr0

library(tidyverse)
# stack data in columns 3 to 16
world_tfr <- pivot_longer(data = world_tfr0, cols = 3:16,
                          names_to = "period", values_to = "tfr")
world_tfr

# # from column `1950-1955` to column `2015-2020` (and every column in between)
# pivot_longer(data = world_tfr0, cols = "1950-1955":"2015-2020",
#              names_to = "period", values_to = "tfr")
# # columns containing "-" in their name
# pivot_longer(data = world_tfr0, cols = contains("-"),
#              names_to = "period", values_to = "tfr")
# # without first and second columns
# pivot_longer(data = world_tfr0, cols = -(1:2),
#              names_to = "period", values_to = "tfr")
# # without the columns from name to column code (and every column in between)
# pivot_longer(data = world_tfr0, cols = -("name":"code"),
#              names_to = "period", values_to = "tfr")

# NA







# # print table3 (loaded with tidyr package)
# table3
# # separate
# separate(table3, col = rate, into = c("rate", "pop"))
# 
# # print table5 (loaded with tidyr package)
# table5
# # unite
# unite(table5, century, year, col = "year", sep = "")
# 
# # separate rows
# separate_rows(table3, rate)

separate_wider_delim(world_tfr, col = period, 
                     names = c("start", "end"), delim = "-")

separate_wider_delim(world_tfr, col = period, 
                     names = c("start", "end"), delim = "-",
                     cols_remove = FALSE)

separate_wider_position(world_tfr, col = period, 
                        widths = c(start = 4, 1, end = 4))

set.seed(10)
eur5_tfr <- world_tfr %>%
  separate_wider_delim(col = period, 
                     names = c("start", "end"), delim = "-",
                     cols_remove = FALSE) %>%
  filter(code %in% c(276, 250, 826, 380, 724)) %>%
  filter(start >= 2005) %>%
  group_by(name) %>%
  sample_n(1) %>%
  ungroup() %>%
  select(name, code, start, tfr)

# subset of world_tfr
eur5_tfr

expand(eur5_tfr, name, start)

complete(eur5_tfr, name, start)

complete(eur5_tfr, name, start = c("2000", "2005", "2010", "2015", "2020"))



# NA
