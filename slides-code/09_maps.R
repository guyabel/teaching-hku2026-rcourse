list.files("../slides-data/south_asia_shp/")

library(tidyverse)
library(sf)
s_asia_sf <- read_sf(dsn = "../slides-data/south_asia_shp")
# same as
# s_asia_sf <- read_sf(dsn = "../slides-data/south_asia_shp/south_asia.shp")
s_asia_sf

s_asia_sf0 <- read_sf(dsn = "../slides-data/south_asia.geojson")
s_asia_sf0

s_asia_sf$geometry

# basic plot with zero margins (make map larger on slide)
par(mar = rep(x = 0, times = 4))

plot(s_asia_sf)

ggplot(data = s_asia_sf) +
  geom_sf()

ggplot(data = s_asia_sf, mapping = aes(fill = name)) +
  geom_sf()

# use geom_sf_label() to add labels to the map
ggplot(data = s_asia_sf, mapping = aes(label = name)) +
  geom_sf() +
  geom_sf_label()

subset(s_asia_sf, iso_a3 == "LKA")
st_bbox(subset(s_asia_sf, iso_a3 == "LKA"))

# zoom in to sri lanka with coord_sf limits
ggplot(data = s_asia_sf, mapping = aes(fill = name)) +
  geom_sf(show.legend = FALSE) +
  coord_sf(xlim = c(79, 82), ylim = c(5,10))

s_asia_sf$cap_lat <-c(34.5553, 23.8103, 27.4712, 28.6139, 35.6892, 4.1755, 27.7172, 33.6844, 6.8906)
s_asia_sf$cap_lon <- c(69.2075, 90.4125, 89.6339, 77.2090, 51.3890, 73.5093, 85.3240, 73.0479, 79.9018)
s_asia_sf

ggplot(data = s_asia_sf) +
  geom_sf() +
  geom_point(aes(x = cap_lon, y = cap_lat), color = "red", size = 2)

# the area of each country in the shape file
st_area(s_asia_sf)

# perimeter of each country in the shape file
st_perimeter(s_asia_sf)

# sharpness of each country in the shape file
st_touches(s_asia_sf)

# distance between each country in the shape file
st_distance(x = s_asia_sf)

# the centroid of each country in the shape file
# - creates a new geometry column with the centroid coordinates
st_centroid(s_asia_sf)

s_asia_sf$pop <- c(41455, 171467, 786, 1438070, 90609, 526, 29695, 247504, 22972)/1e3
s_asia_sf$tfr <- c(4.84, 2.16, 1.46, 1.98, 1.70, 1.58, 1.98, 3.60, 1.97)
s_asia_sf

ggplot(data = s_asia_sf) +
  geom_sf() +
  geom_sf(data = st_centroid(s_asia_sf), mapping = aes(size = pop), 
          shape = 1, color = "red") +
  scale_size_continuous(range = c(1, 25), breaks = c(1, 10, 100, 500, 1000))

ggplot(data = s_asia_sf, mapping = aes(fill = tfr)) +
  geom_sf() +
  scale_fill_continuous(palette = "YlGnBu") 

ggplot(data = s_asia_sf, mapping = aes(fill = tfr)) +
  geom_sf() +
  scale_fill_continuous(palette = "YlGnBu") +
  theme_void()

ggplot(data = s_asia_sf, mapping = aes(fill = tfr)) +
  geom_sf() +
  scale_fill_continuous(palette = "YlGnBu") +
  theme_bw()

# NA

st_crs(s_asia_sf)

library(sf)
library(ggplot2)
library(rnaturalearth)
library(geosphere)
library(dplyr)

# 1. Define city coordinates
lon_hk <- 114.1694; lat_hk <- 22.3193
lon_ldn <- -0.1276; lat_ldn <- 51.5074

pts_sf <- data.frame(
  city = c("London", "Hong Kong"),
  lon = c(lon_ldn, lon_hk),
  lat = c(lat_ldn, lat_hk)
) %>% 
  st_as_sf(coords = c("lon", "lat"), crs = 4326)

# 2. Great Circle line (Geodesic path)
gc_pts <- gcIntermediate(c(lon_ldn, lat_ldn), c(lon_hk, lat_hk), n = 100, addStartEnd = TRUE)
gc_sf  <- st_linestring(gc_pts) %>% st_sfc(crs = 4326) %>% st_sf()

# Calculate Great Circle Distance in km
gc_dist_km <- round(as.numeric(st_length(gc_sf)) / 1000)
gc_label <- paste0("Great Circle: ", format(gc_dist_km, big.mark = ","), " km")

# 3. Straight line (Cartesian in WGS84)
cart_sf <- st_linestring(rbind(c(lon_ldn, lat_ldn), c(lon_hk, lat_hk))) %>% 
  st_sfc(crs = 4326) %>% 
  st_sf()

# Define Orthographic CRS centered between London and Hong Kong
ortho_crs <- st_crs("+proj=ortho +lat_0=45 +lon_0=57")

# Calculate Cartesian Distance in projected Orthographic meters
cart_sf_ortho <- st_transform(cart_sf, ortho_crs)
cart_dist_km  <- round(as.numeric(st_length(cart_sf_ortho)) / 1000)
cart_label    <- paste0("Cartesian: ", format(cart_dist_km, big.mark = ","), " km")

# 4. Transform lines and points to projected Orthographic coordinates
gc_sf_ortho   <- st_transform(gc_sf, ortho_crs)
pts_sf_ortho  <- st_transform(pts_sf, ortho_crs)

# Extract coordinates for midpoint positioning and angle alignment
# Great Circle Midpoint (Point 50) and neighboring point for slope
gc_coords_ortho <- st_coordinates(gc_sf_ortho)
idx_mid <- 50
x_gc_mid <- gc_coords_ortho[idx_mid, "X"]
y_gc_mid <- gc_coords_ortho[idx_mid, "Y"]

dx_gc <- gc_coords_ortho[idx_mid + 1, "X"] - gc_coords_ortho[idx_mid - 1, "X"]
dy_gc <- gc_coords_ortho[idx_mid + 1, "Y"] - gc_coords_ortho[idx_mid - 1, "Y"]
angle_gc <- atan2(dy_gc, dx_gc) * (180 / pi)

# Cartesian Line Midpoint and slope
cart_coords_ortho <- st_coordinates(cart_sf_ortho)
x_cart_mid <- mean(cart_coords_ortho[, "X"])
y_cart_mid <- mean(cart_coords_ortho[, "Y"])

dx_cart <- cart_coords_ortho[2, "X"] - cart_coords_ortho[1, "X"]
dy_cart <- cart_coords_ortho[2, "Y"] - cart_coords_ortho[1, "Y"]
angle_cart <- atan2(dy_cart, dx_cart) * (180 / pi)

# Data frames for line labels in projected space
label_gc_df <- data.frame(
  x = x_gc_mid,
  y = y_gc_mid + 300000, # Nudge perpendicular/above the line
  label = gc_label,
  angle = angle_gc
)

label_cart_df <- data.frame(
  x = x_cart_mid,
  y = y_cart_mid - 350000, # Nudge perpendicular/below the line
  label = cart_label,
  angle = angle_cart
)

# 5. Load world map and filter overseas polygons
world <- ne_countries(scale = "medium", returnclass = "sf") %>% 
  st_make_valid() %>% 
  st_cast("POLYGON", warn = FALSE) %>% 
  mutate(centroid = st_centroid(geometry)) %>% 
  filter(
    st_coordinates(centroid)[, 1] > -30,
    st_coordinates(centroid)[, 2] > -20
  )

# 6. Plot
ggplot() +
  geom_sf(data = world, colour = "lightgrey", fill = "white") +
  
  # Paths
  geom_sf(data = cart_sf, color = "red") +
  geom_sf(data = gc_sf, color = "blue", linetype = "dashed") +
  
  # City Points
  geom_sf(data = pts_sf, color = "black") +
  
  # City Labels (Positioned BELOW the dots to avoid line overlap)
  geom_sf_text(data = pts_sf, aes(label = city), nudge_y = -100000) +
  
  # Rotated Parallel Line Labels
  geom_text(
    data = label_gc_df,
    aes(x = x, y = y, label = label, angle = angle),
    color = "blue",
    size = 4
  ) +
  geom_text(
    data = label_cart_df,
    aes(x = x, y = y, label = label, angle = angle),
    color = "red",
    size = 4
  ) +
  
  # Frame Limits
  coord_sf(
    crs = ortho_crs,
    xlim = c(-4500000, 5500000),
    ylim = c(-1000000, 3000000)
  ) +
  theme_bw() +
  theme(
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    axis.title = element_blank()
  )

# view available CRS for the shape file
sf_proj_info()$name

s_asia_sf1 <- st_transform(x = s_asia_sf, crs = "+proj=laea")
s_asia_sf1

ggplot(data = s_asia_sf1) +
  geom_sf()

s_asia_sf2 <- st_transform(x = s_asia_sf, 
                            crs = "+proj=laea +lat_0=20 +lon_0=60")

ggplot(data = s_asia_sf2) +
  geom_sf()

library(crsuggest)
suggest_top_crs(input = s_asia_sf)

suggest_crs(input = s_asia_sf)

s_asia_sf3 <- st_transform(x = s_asia_sf, crs = 7755)
s_asia_sf3

ggplot(data = s_asia_sf3) +
  geom_sf()

ggplot(data = s_asia_sf) +
  geom_sf() +
  coord_sf(crs = 7755)

round(st_area(s_asia_sf)/1000)

round(st_area(s_asia_sf1)/1000)

round(st_area(s_asia_sf2)/1000)

round(st_area(s_asia_sf3)/1000)

# NA
