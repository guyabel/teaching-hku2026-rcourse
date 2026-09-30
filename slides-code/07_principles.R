library(tidyverse)
world_2023 <- read_csv("../slides-data/world_2023.csv")
ggplot(data = world_2023, mapping = aes(y = region_geo, x = pop/1e6)) +
  geom_col() +
  labs(y = "", x= "Population (millions)")

ggplot(data = world_2023, mapping = aes(y = region_geo, x = pop/1e6, colour = region_geo)) +
  geom_jitter(alpha = 0.5, show.legend = FALSE) + 
  labs(y = "", x= "Population (millions)")

ggplot(data = world_2023, mapping = aes(y = region_geo, x = pop/1e6, colour = region_geo)) +
  geom_jitter(alpha = 0.5, show.legend = FALSE) + 
  coord_transform(x = "log10") +
  scale_x_continuous(breaks = c(1, 5, 10, 25, 100, 1000)) +
  labs(y = "", x= "Population (millions)")

# Highlight Asia against baseline regions
ggplot(data = world_2023, mapping = aes(y = region_geo, x = pop / 1e6)) +
  geom_col() +
  geom_col(
    data = subset(world_2023, region_geo == "Asia"), fill = "#00a2f3") +
  labs(y = "", x = "Population (millions)") 



library(RColorBrewer)
subset(brewer.pal.info, colorblind == TRUE)

# Discrete mapping using `scale_fill_viridis_d()`:
ggplot(data = world_2023, 
       mapping = aes(y = region_geo, x = pop / 1e6, fill = region_geo)) +
  geom_col(show.legend = FALSE) +
  scale_fill_viridis_d() +
  labs(y = "", x = "Population (millions)") 

# direction = -1:
ggplot(data = world_2023, 
       mapping = aes(y = region_geo, x = pop / 1e6, fill = region_geo)) +
  geom_col(show.legend = FALSE) +
  scale_fill_viridis_d(direction = -1) +
  labs(y = "", x = "Population (millions)") 
