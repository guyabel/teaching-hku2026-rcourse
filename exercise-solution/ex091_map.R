# 0. a) Load the tidyverse package (that loads ggplot2, and other packages). 
#       Install it on your computer first if you have not done so already. 
# install.packages("tidyverse")
library(tidyverse)
#    b) Load additional packages that we will use in this exercise
# install.packages("sf")
library(sf)
#    c) run the code below to read the data for this exercise from the GitHub repository
pan <- read_csv("https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/panama_ipumsi.csv")
pan_sf <- read_sf("https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/panama_geolev2.geojson")
#    d) Run the code below to join the pan dataset into the pan_sf shape file
#       We wil cover the code below in the next part of the course, 
#       but for now just run it and check the output
panama <- pan_sf %>%
  mutate(GEOLEVEL2 = as.integer(GEOLEVEL2),
         ADMIN_NAME =iconv(ADMIN_NAME, from = "latin1", to = "UTF-8"), 
         ADMIN_NAME = str_wrap(ADMIN_NAME, width = 10)) |>
  left_join(pan, by = c("GEOLEVEL2" = "GEOLEV2")) |>
  subset(!is.na(YEAR))
panama_2010 <- panama |>
  subset(YEAR == 2010)
#    e) Check the resulting dataset
# panama shape file and data from the 2010 IPUMS census sample
panama_2010
# panama shape file and data from 6 IPUMS census sample
panama
# 1. Create a basic map of Panama using the panama_2010 dataset and geom_sf()
ggplot(data = panama_2010) +
  geom_sf()
# 2. Create a map of Panama using the panama_2010 dataset and geom_sf() where 
#    the fill colour of each region corresponds to the proportion of households 
#    with flush toilets (flush_toilet)
ggplot(data = panama_2010, mapping = aes(fill = flush_toilet)) +
  geom_sf()
# 4. Adapt the plot above to zoom in on the Canal Zone of Panama. 
#    Hint: Set the xlim to c(-80.5, -79) and ylim to c(8.5, 9.5) 
ggplot(data = panama_2010, mapping = aes(fill = flush_toilet)) +
  geom_sf() +
  coord_sf(xlim = c(-80.5, -79), ylim = c(8.5, 9.5)) 
# 5. Adapt the plot above to show the name of each region in the Canal Zone of Panama.
#    Set the size of the labels to 2 and the colour to white.
ggplot(data = panama_2010, mapping = aes(fill = flush_toilet)) +
  geom_sf() +
  coord_sf(xlim = c(-80.5, -79), ylim = c(8.5, 9.5)) +
  geom_sf_label(mapping = aes(label = ADMIN_NAME), size = 2, colour = "white")
# 6. Create a series of maps of Panama using the panama dataset and geom_sf() 
#    where 
#    a. the fill colour of each region corresponds to the average age (age_ave)
#    b. the colour of the polygon borders is transparent
#    c. the maps are faceted by year (YEAR) with 3 rows
#    d. the fill colour uses the viridis colour palette
#    e. the background of the maps is white using a ggplot2 theme
ggplot(data = panama, mapping = aes(fill = age_ave)) +
  geom_sf(colour = "transparent") +
  facet_wrap(facets = "YEAR", nrow = 3) +
  scale_fill_viridis_c() +
  theme_bw()
# 7. Run the code below to create a new dataset called panama_v that 
#    contains the valid geometries of the polygons in the panama dataset
panama_v <- st_make_valid(x = panama)
# 8. Calculate the centroids of the polygons in the panama_v dataset and 
#    store them in a new dataset called panama_c
panama_c <- st_centroid(x = panama_v)
# 9. Create a map of Panama using the panama dataset and geom_sf() where
#    a. the fill colour of each region is white
#    b. the colour of the polygon borders is light grey
#    c. has a layer of points corresponding to the centroids of the polygons in 
#       the panama_c dataset with size corresponding to the population (pop) in 
#       thousands, alpha transparency of 0.5, and blue colour
#    d. the size of the points is scaled to a range of 0 to 10
#    e. the maps are faceted by year (YEAR) with 3 rows
#    f. the background of the maps is white using a ggplot2 theme
ggplot(data = panama) +
  geom_sf(fill = "white", colour = "lightgrey") +
  geom_sf(data = panama_c, mapping = aes(size = pop/1e3), alpha = 0.5, colour = "blue") +
  scale_size_continuous(range = c(0, 10)) +
  facet_wrap(facets = "YEAR", nrow = 3) +
  theme_bw()