# 0. a) Load the tidyverse package (that loads ggplot2, and other packages). 
#       Install it on your computer first if you have not done so already. 
# install.packages("tidyverse")
library(tidyverse)
#    b) Load additional packages that we will use in this exercise
# install.packages("sf")
# install.packages("maps")
# install.packages("crsuggest")
library(sf)
library(maps)
library(crsuggest)
#    c) run the code below to create a shape file for East Asia, based on the 
#       world map data frame in the maps package.
e_asia <- c(
  "Brunei", "Cambodia", "Timor-Leste", "Indonesia", "Laos",
  "Malaysia", "Myanmar", "Philippines", "Singapore", "Thailand", "Vietnam",
  "China", "Japan", "South Korea", "North Korea", "Mongolia", "Taiwan"
)

e_asia_sf <- map("world", plot = FALSE, fill = TRUE) |> 
  st_as_sf() |>
  filter(ID %in% e_asia)

e_asia_cities <- world.cities |>
  mutate(country.etc = case_match(
    country.etc,
    "Korea North" ~ "North Korea",
    "Korea South" ~ "South Korea",
    "East Timor"   ~ "Timor-Leste",
    .default      = country.etc
  )) |>
  filter(country.etc %in% e_asia_sf$ID,
         pop > 1e6) |>
  st_as_sf(coords = c("long", "lat"), crs = st_crs(e_asia_sf))
#    d) view the two shape files
# east asia polygons
e_asia_sf
# east asia cities with population > 1 million in 2006
e_asia_cities

# 1. Plot the East Asia shape file using ggplot2. Include 
#    a. a layer of points for the cities in the e_asia_cities data frame,
#       with the size of the points proportional to the population (in millions)
#    b. set the point transparency to 0.5 and the color to dark green
#    c. use a theme with a white background 
ggplot(data = e_asia_sf) +
  geom_sf() +
  geom_sf(data = e_asia_cities, mapping = aes(size = pop/1e6), 
          color = "darkgreen", alpha = 0.5) +
  theme_bw()
# 2. Update the plot in the previous question to use the Robinson projection. 
#    Hint: use sf_proj_info() to find the correct projection string for the Robinson projection.
ggplot(data = e_asia_sf) +
  geom_sf() +
  geom_sf(data = e_asia_cities, mapping = aes(size = pop/1e6), 
          color = "darkgreen", alpha = 0.5) +
  theme_bw() +
  coord_sf(crs = "+proj=robin") 
# 3. Use the crsuggest package to find a suitable projection for East Asia. 
suggest_crs(e_asia_sf)
# 4. Update the plot in the previous question to use the suggested projection in your plot.
ggplot(data = e_asia_sf) +
  geom_sf() +
  geom_sf(data = e_asia_cities, mapping = aes(size = pop/1e6), 
          color = "darkgreen", alpha = 0.5) +
  theme_bw() +
  coord_sf(crs = 32649)
