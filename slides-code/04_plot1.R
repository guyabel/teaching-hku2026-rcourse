library(tidyverse)
world_2023 <- read_csv("../slides-data/world_2023.csv")
world_2023 <- world_2023 %>%
  select(name, iso3c, region_geo, grp_income, pop, tfr, sex_ratio, imr)

library(tidyverse)
world_2023

# i dont know why but wasted a lot of time trying to get the code chunk working below... just call the pdf and be done with it
# par(mar = rep(2, 4))
par(mfrow = c(1,2))
# left 
plot(x = world_2023$tfr, y = world_2023$imr)
# right
hist(x = world_2023$tfr)

# # left
# plot(x = world_2023$tfr, y = world_2023$imr)
# # right
# hist(x = world_2023$tfr)








# library(tidyverse)
# # left
# ggplot(data = world_2023, mapping = aes(x = tfr, y = imr)) +
#   geom_point()
# # right
# ggplot(data = world_2023, mapping = aes(x = tfr)) +
#   geom_histogram()

library(patchwork)
p1 <- ggplot(data = world_2023, mapping = aes(x = tfr, y = imr)) +
  geom_point()
p2 <- ggplot(data = world_2023, mapping = aes(x = tfr)) +
  geom_histogram()
p1 + p2

ggplot(data = world_2023)

ggplot(data = world_2023, mapping = aes(x = tfr, y = imr)) 

ggplot(data = world_2023, mapping = aes(x = tfr, y = imr)) +
  geom_point()



# # left: one discrete variable
# ggplot(data = world_2023, mapping = aes(x = grp_income)) +
#   geom_bar()
# # right: one continuous variable
# ggplot(data = world_2023, mapping = aes(x = tfr)) +
#   geom_histogram()

p1 <- ggplot(data = world_2023, mapping = aes(x = grp_income)) +
  geom_bar()
p2 <- ggplot(data = world_2023, mapping = aes(x = tfr)) +
  geom_histogram()
p1 + p2

# # left: one continuous variable
# ggplot(data = world_2023, mapping = aes(x = tfr)) +
#   geom_density()
# # right: one continuous variable
# ggplot(data = world_2023, mapping = aes(x = tfr)) +
#   geom_freqpoly()

p1 <- ggplot(data = world_2023, mapping = aes(x = tfr)) +
  geom_density()
p2 <- ggplot(data = world_2023, mapping = aes(x = tfr)) +
  geom_freqpoly()
p1 + p2



# # left: both continuous variable
# ggplot(data = world_2023, mapping = aes(x = tfr, y = imr)) +
#   geom_point()
# # right: both continuous variable
# ggplot(data = world_2023, mapping = aes(x = tfr, y = imr)) +
#   geom_density2d()

p1 <- ggplot(data = world_2023, mapping = aes(x = tfr, y = imr)) +
  geom_point()
p2 <- ggplot(data = world_2023, mapping = aes(x = tfr, y = imr)) +
  geom_density2d()
p1 + p2

# # left: one continuous, one discrete variable
# ggplot(data = world_2023, mapping = aes(x = tfr, y = grp_income)) +
#   geom_boxplot()
# # right: one continuous, one discrete variable
# ggplot(data = world_2023, mapping = aes(x = tfr, y = grp_income)) +
#   geom_violin()

p1 <- ggplot(data = world_2023, mapping = aes(x = tfr, y = grp_income)) +
  geom_boxplot()
p2 <- ggplot(data = world_2023, mapping = aes(x = tfr, y = grp_income)) +
  geom_violin()
p1 + p2

cn <- read_csv("../slides-data/cn.csv")

cn

# # left
# ggplot(data = cn, mapping = aes(x = year, y = tfr)) +
#   geom_col()
# # right
# ggplot(data = cn, mapping = aes(x = year, y = tfr)) +
#   geom_area()

p1 <- ggplot(data = cn, mapping = aes(x = year, y = tfr))+
  geom_col()

p2 <- ggplot(data = cn, mapping = aes(x = year, y = tfr)) +
  geom_area()
p1 + p2

# # left
# ggplot(data = cn, mapping = aes(x = year, y = tfr)) +
#   geom_line()
# # right
# ggplot(data = cn, mapping = aes(x = year, y = tfr)) +
#   geom_step()

p1 <- ggplot(data = cn, mapping = aes(x = year, y = tfr))+
  geom_line()

p2 <- ggplot(data = cn, mapping = aes(x = year, y = tfr)) +
  geom_step()
p1 + p2



# # left: follows order on x-axis (if x is not time can cause problem)
# ggplot(data = cn, mapping = aes(x = tfr, y = imr)) +
#   geom_line()
# # right: follows order in data
# ggplot(data = cn, mapping = aes(x = tfr, y = imr)) +
#   geom_path()

p1 <- ggplot(data = cn, mapping = aes(x = tfr, y = imr))+
  geom_line()

p2 <- ggplot(data = cn, mapping = aes(x = tfr, y = imr)) +
  geom_path()
p1 + p2

 ggplot(data = cn, mapping = aes(x = year, y = tfr))+
  geom_line() +
  geom_point()

ggplot(data = world_2023, mapping = aes(x = tfr, y = imr)) +
  geom_density2d() +
  geom_point()

# the ordering of the layers matters
ggplot(data = world_2023, mapping = aes(x = tfr, y = imr)) +
  geom_point() +
  geom_density2d()

world_2023$region_geo[1:70] == "Africa"

# subset the data to only include rows where region_geo is "Africa" using the subset() function
subset(world_2023, region_geo == "Africa")

# more on colour and other aesthetics later
ggplot(data = world_2023, mapping = aes(x = tfr, y = imr)) +
  geom_point() +
  geom_point(data = subset(world_2023, region_geo == "Africa"), colour = "red")

ggplot(data = world_2023, mapping = aes(x = tfr, y = imr)) +
  geom_density2d() +
  geom_point() +
  geom_vline(xintercept = 2.1) +
  # use mapping when applying a function to a column in the data
  geom_hline(mapping = aes(yintercept = mean(imr)))

# # left: linear regression
# ggplot(data = world_2023, mapping = aes(x = tfr, y = imr)) +
#   geom_point() +
#   geom_smooth(method = "lm")
# # right: loess smooth curve, no confidence interval
# ggplot(data = world_2023, mapping = aes(x = tfr, y = imr)) +
#   geom_point() +
#   geom_smooth(method = "loess", se = FALSE)

p1 <- ggplot(data = world_2023, mapping = aes(x = tfr, y = imr)) +
  geom_point() +
  geom_smooth(method = "lm")
p2 <- ggplot(data = world_2023, mapping = aes(x = tfr, y = imr)) +
  geom_point() +
  geom_smooth(method = "loess", se = FALSE)
p1 + p2

# NA

s_asia <- read_csv("../slides-data/s_asia.csv")
s_asia

# southern asia: line through all points
ggplot(data = s_asia, mapping = aes(x = year, y = tfr)) +
  geom_line()

# southern asia: line for each country (identified by name)
ggplot(data = s_asia, mapping = aes(x = year, y = tfr, group = name)) +
  geom_line()

# southern asia: set colour and linetype from discrete variable
ggplot(data = s_asia, 
       mapping = aes(x = year, y = tfr, colour = name, linetype = name)) +
  geom_line()

# southern asia: set colour from a discrete variable
ggplot(data = s_asia, mapping = aes(x = year, y = tfr, colour = name)) +
  geom_line()

# china: set colour from continuous variable
ggplot(data = cn, mapping = aes(x = year, y = tfr, colour = sex_ratio)) +
  geom_point()

# china: colour from continuous variable - override line colour
ggplot(data = cn, mapping = aes(x = year, y = tfr, colour = sex_ratio)) +
  geom_point() +
  geom_line(colour = "darkgrey") 

# china: set fill (inside of column geom) from continuous variable
ggplot(data = cn, mapping = aes(x = year, y = tfr, fill = sex_ratio)) +
  geom_col() 

# china: set border colour (outside of column geom) from continuous variable
ggplot(data = cn, mapping = aes(x = year, y = tfr, colour = sex_ratio)) +
  geom_col() 

# china: set fill to transparent in all geoms
ggplot(data = cn, mapping = aes(x = year, y = tfr, colour = sex_ratio)) +
  geom_col(fill = "transparent") 

# 2023: set shape from discrete variable
ggplot(data = world_2023, mapping = aes(x = tfr, y = imr, shape = region_geo)) +
  geom_point()

# 2023: size from continuous variable
ggplot(data = world_2023, mapping = aes(x = tfr, y = imr, size = pop/1e6)) +
  geom_point()

# 2023: alpha from continuous variable
ggplot(data = world_2023, mapping = aes(x = tfr, y = imr, alpha = pop/1e6)) +
  geom_point()

# 2023: size and alpha from continuous variable
ggplot(data = world_2023, 
       mapping = aes(x = tfr, y = imr, size = pop/1e6, alpha = pop/1e6)) +
  geom_point()

# 2023: size continuous variable, alpha set to a single value
ggplot(data = world_2023, 
       mapping = aes(x = tfr, y = imr, size = pop/1e6)) +
  geom_point(alpha = 0.5)

# NA



# default ggplot2 palette with four categories
ggplot(data = world_2023, 
       mapping = aes(x = tfr, y = grp_income, fill = grp_income)) +
  geom_violin()

# using scale_*_manual
ggplot(data = world_2023, 
       mapping = aes(x = tfr, y = grp_income, fill = grp_income)) +
  geom_violin() +
  scale_fill_manual(values = c("yellow", "orange", "darkred", "red"))




# using RColorBrewer palette
ggplot(data = world_2023, 
       mapping = aes(x = tfr, y = grp_income, fill = grp_income)) +
  geom_violin() +
  scale_fill_discrete(palette = "Set1")

# scale_colour_* functions
ggplot(data = world_2023, 
       mapping = aes(x = tfr, y = grp_income, colour = grp_income)) +
  geom_violin() +
  scale_colour_discrete(palette = "Set1")

# most geoms have a show.legend argument to control whether the legend is shown or not
ggplot(data = world_2023, 
       mapping = aes(x = tfr, y = grp_income, colour = grp_income)) +
  geom_violin(show.legend = FALSE) +
  scale_colour_discrete(palette = "Set1")



# using RColorBrewer palette
ggplot(data = world_2023, mapping = aes(x = tfr, y = grp_income, fill = grp_income)) +
  geom_violin(show.legend = FALSE) +
  scale_fill_brewer(palette = "Greens")

# tile plot of south asia sex ratio at birth (males per 100 female births)
ggplot(data = s_asia, mapping = aes(x = year, y = name, fill = sex_ratio)) +
  geom_tile(colour = "grey")

ggplot(data = s_asia, mapping = aes(x = year, y = name, fill = sex_ratio)) +
  geom_tile(colour = "grey") +
    # scale_fill_distiller(palette = "PiYG") # will give the exact same as below
  scale_fill_continuous(palette = "PiYG")

ggplot(data = s_asia, mapping = aes(x = year, y = name, fill = sex_ratio)) +
  geom_tile(colour = "grey") +
  scale_fill_gradient2(low="pink", high="skyblue", mid="white", midpoint = 105) 



# 2023: shape from region
ggplot(data = world_2023, 
       mapping = aes(x = tfr, y = imr, size = pop/1e6, shape = region_geo)) +
  geom_point()

# 2023: shape from region, user set shapes
ggplot(data = world_2023, 
       mapping = aes(x = tfr, y = imr, size = pop/1e6, shape = region_geo)) +
  geom_point() +
  scale_shape_manual(values = c(21:25, 3))

# 2023: can define shape directly in geom_point(), when only one shape
# and increase size range to make differences more visible
ggplot(data = world_2023, mapping = aes(x = tfr, y = imr, size = pop/1e6)) +
  geom_point(shape = 1) +
  scale_size(range = c(1, 10)) 

# 2023: log y axis to better show differences in imr and add breaks to size scale
ggplot(data = world_2023, mapping = aes(x = tfr, y = imr, size = pop/1e6)) +
  geom_point(shape = 1) +
  scale_size(range = c(1, 10), breaks = c(1, 10, 100, 1000)) +
  scale_y_log10()

# 2023: axis breaks for tfr
ggplot(data = world_2023, mapping = aes(x = tfr, y = imr, size = pop/1e6)) +
  geom_point(shape = 1) +
  scale_size(range = c(1, 10), breaks = c(1, 10, 100, 1000)) +
  scale_x_continuous(breaks = seq(0, 8, 1))

# NA
