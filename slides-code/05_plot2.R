library(tidyverse)
world_2023 <- read_csv("../slides-data/world_2023.csv")
world_2023 <- world_2023 %>%
  select(name, iso3c, region_geo, grp_income, pop, tfr, sex_ratio, imr)

library(tidyverse)
world_2023

# simple count of countries in each income group
ggplot(data = world_2023, mapping = aes(x = grp_income)) +
  geom_bar()

# stack position (default for geom_bar())
ggplot(data = world_2023, mapping = aes(x = grp_income, fill = region_geo)) +
  geom_bar()

# dodge position
ggplot(data = world_2023, mapping = aes(x = grp_income, fill = region_geo)) +
  geom_bar(position = "dodge")

# dodge position using position_dodge()
ggplot(data = world_2023, mapping = aes(x = grp_income, fill = region_geo)) +
  geom_bar(position = position_dodge())

# using postion_*() functions allows access to additional arguments
ggplot(data = world_2023, mapping = aes(x = grp_income, fill = region_geo)) +
  geom_bar(position = position_dodge(preserve = "single"))

# position_dodge2() centers the bars in each group by default
ggplot(data = world_2023, mapping = aes(x = grp_income, fill = region_geo)) +
  geom_bar(position = position_dodge2(preserve = "single"))

# fill position
ggplot(data = world_2023, mapping = aes(x = grp_income, fill = region_geo)) +
  geom_bar(position = "fill")



cn <- read_csv("../slides-data/cn.csv")
cn

try({
# how can we plot a bar for tfr in every period?... this gives an error...
ggplot(data = cn, mapping = aes(x = year, y = tfr)) +
  geom_bar()
})

try({
# only an x or y aesthetic?... lets try x = tfr ...
ggplot(data = cn, mapping = aes(x = tfr)) +
  geom_bar()
})

# need to tell geom_bar() to use the value not the count (i.e. identity stat)
ggplot(data = cn, mapping = aes(x = year, y = tfr)) +
  geom_bar(stat = "identity")

# geom_col() uses the identity stat by default
ggplot(data = cn, mapping = aes(x = year, y = tfr)) +
  geom_col()



# southern asia
ggplot(data= world_2023,mapping= aes(x = tfr, y = imr)) +
  geom_point()

# southern asia flip coordinates: x is y, y is x
ggplot(data= world_2023,mapping= aes(x = tfr, y = imr)) +
  geom_point() +
  coord_flip()

# log y axes
ggplot(data= world_2023, mapping= aes(x = tfr, y = imr)) +
  geom_point() +
  coord_trans(y = "log")

# note: the scale_y_log10() function is equivalent to coord_trans(y = "log"),
# but the will also change the y axis labels to log10 scale
ggplot(data= world_2023, mapping= aes(x = tfr, y = imr)) +
  geom_point() +
  scale_y_log10()

# coord_polar(): x is now the angle in circle and y is distance from centre
ggplot(data= world_2023, mapping= aes(x = tfr, y = imr)) +
  geom_point() +
  coord_polar()

s_asia <- read_csv("../slides-data/s_asia.csv")
s_asia

# polar coordinates: see how southern asia countries have changed over time
ggplot(data = s_asia, 
       mapping = aes(x = tfr, y = imr, colour = name, alpha = year)) +
  geom_point() +
  geom_path() + 
  coord_polar() 

# ggplot(data = world_2023, mapping = aes(x = grp_income)) +
#   geom_bar()
# 
# ggplot(data = world_2023, mapping = aes(x = "", fill = grp_income)) +
#   geom_bar(position = "fill")
# 
g1 <- ggplot(data = world_2023, mapping = aes(x = grp_income)) +
  geom_bar()

g2 <- ggplot(data = world_2023, mapping = aes(x = "", fill = grp_income)) +
  geom_bar(position = "fill")
library(patchwork)
g1 + g2 + plot_layout(nrow = 1)

# ggplot(data = world_2023, mapping = aes(x = "", fill = grp_income)) +
#   geom_bar(position = "fill")
# 
# ggplot(data = world_2023, mapping = aes(x = "", fill = grp_income)) +
#   geom_bar(position = "fill") +
#   coord_polar(theta = "y")
g2 <- ggplot(data = world_2023, mapping = aes(x = "", fill = grp_income)) +
  geom_bar(position = "fill")

g3 <- ggplot(data = world_2023, mapping = aes(x = "", fill = grp_income)) +
  geom_bar(position = "fill") +
  coord_polar(theta = "y")

library(patchwork)
g2 +g3 + plot_layout(nrow = 1)

# directly create the data to be used in the pie chart
x <- table(world_2023$grp_income)
x
world_2023_dev <- as.data.frame(x)
world_2023_dev

library(ggforce)
ggplot(data = world_2023_dev) +
  geom_arc_bar(
    mapping = aes(fill = Var1, amount = Freq, x0 = 0, y0 = 0, r0 = 0, r = 1),
    stat = "pie"
  ) 

# fix coordinates at 1:1 height-width ratio
ggplot(data = world_2023_dev) +
  geom_arc_bar(
    mapping = aes(fill = Var1, amount = Freq, x0 = 0, y0 = 0, r0 = 0, r = 1),
    stat = "pie"
  ) +
  coord_fixed()

library(ggforce)
ggplot(data = world_2023_dev) +
    geom_arc_bar(
    mapping = aes(fill = Var1, amount = Freq, x0 = 0, y0 = 0, r0 = 0.8, r = 1),
    stat = "pie"
  ) +
  coord_fixed() +
  theme_void() # remove grid lines and axis (see theme section later)

# southern asia sex ratios at birth - ratio of height and width dictated by 
# plot size dimensions
ggplot(data = s_asia, mapping= aes(x = year, y = name, fill = sex_ratio)) +
  geom_tile() +
  scale_fill_continuous(palette = "PiYG")

# fix ratio of tile height to tile width (i.e 1:1)
ggplot(data = s_asia, mapping= aes(x = year, y = name, fill = sex_ratio)) +
  geom_tile() +
  scale_fill_continuous(palette = "PiYG") +
  coord_fixed(ratio = 1) 

# fix to 3:1 height to width ratio
ggplot(data = s_asia, mapping= aes(x = year, y = name, fill = sex_ratio)) +
  geom_tile(colour = "grey") +
  scale_fill_continuous(palette = "PiYG") +
  coord_fixed(ratio = 3)

# NA

# southern asia: facet_wrap() function for each country (name)
ggplot(data = s_asia, mapping = aes(x = year, y = tfr, colour = name)) +
  geom_line() +
  facet_wrap(facets = "name") 

# one row of facets and and remove legend
ggplot(data = s_asia, mapping = aes(x = year, y = tfr, colour = name)) +
  geom_line(show.legend = FALSE) +
  facet_wrap(facets = "name", nrow = 1)

# using ~ to specify the facet variable
ggplot(data = s_asia, mapping = aes(x = year, y = tfr, colour = name)) +
  geom_line(show.legend = FALSE) +
  facet_wrap(facets = ~name, nrow = 1)

# using vars() to specify the facet variable
ggplot(data = s_asia, mapping = aes(x = year, y = tfr, colour = name)) +
  geom_line(show.legend = FALSE) +
  facet_wrap(facets = vars(name), nrow = 1)

# different y axis limits per facet 
ggplot(data = s_asia, mapping = aes(x = year, y = tfr, colour = name)) +
  geom_line(show.legend = FALSE) +
  facet_wrap(facets = vars(name), scales = "free_y") 

# facet_grid() with only one variable (name) is equivalent to facet_wrap()
ggplot(data = s_asia, mapping = aes(x = year, y = tfr, colour = name)) +
  geom_line(show.legend = FALSE) +
  facet_grid(cols = vars(name))  

# facet_grid() function with cross classification of two grouping variables
ggplot(data = world_2023, mapping = aes(x = tfr, y = imr)) +
  geom_point() +
  facet_grid(row = vars(grp_income), col = vars(region_geo)) 

# alter facet label line width
ggplot(data = world_2023, mapping = aes(x = tfr, y = imr)) +
  geom_point() +
  facet_grid(row = vars(grp_income), col = vars(region_geo), 
             labeller = label_wrap_gen(20))

# rotate income group labels (see theme() later)
ggplot(data = world_2023, mapping = aes(x = tfr, y = imr)) +
  geom_point() +
  facet_grid(row = vars(grp_income), col = vars(region_geo), 
             labeller = label_wrap_gen(20)) +
  theme(strip.text.y = element_text(angle = 0))

# NA

ggplot(data = s_asia, mapping = aes(x = year, y = tfr, colour = name)) +
  geom_line() + 
  labs(title = "Total Fertility Rates in Southern Asia",
       subtitle = "Fertility levels have dropped to replacement level or below in 7 of 9 countries",
       caption = "Data: UN World Population Prospects 2024",
       x = "Year", 
       y = "Total Fertility Rate", 
       colour = "Country")

ggplot(data = world_2023, mapping = aes(x = tfr, y = imr)) +
  geom_point() +
  geom_label(mapping = aes(label = iso3c), size = 3, alpha = 0.5)

# still a mess when we plot the text with all points 
ggplot(data = world_2023, mapping = aes(x = tfr, y = imr, label = iso3c)) +
  geom_point() +
  geom_text(size = 3, alpha = 0.5)

# check overlap looks for overlapping text and removes some of the labels
ggplot(data = world_2023, mapping = aes(x = tfr, y = imr, label = iso3c)) +
  geom_point() +
  geom_text(size = 3, alpha = 0.5, check_overlap = TRUE)

# nudge_y moves the text labels up by 2 units so they are above the points
ggplot(data = world_2023, mapping = aes(x = tfr, y = imr, label = iso3c)) +
  geom_point(alpha = 0.5) +
  geom_text(size = 3, alpha = 0.5, check_overlap = TRUE, nudge_y = 2)

library(ggrepel)
ggplot(data = world_2023, mapping = aes(x = tfr, y = imr, label = iso3c)) +
  geom_point(alpha = 0.5) +
  geom_text_repel(size = 3, alpha = 0.5)

ggplot(data = world_2023, mapping = aes(x = tfr, y = imr, label = iso3c)) +
  geom_point(alpha = 0.5) +
  geom_text_repel(data = subset(s_asia, year == 2023),
                  size = 3, alpha = 0.8, colour = "red", min.segment.length = 0)



# ggplot(data = s_asia, mapping = aes(x = year, y = tfr, colour = name)) +
#   geom_line()  +
#   theme_bw()
# 
# ggplot(data = s_asia, mapping = aes(x = year, y = tfr, colour = name)) +
#   geom_line()  +
#   theme_classic()
g1 <- ggplot(data = s_asia, mapping = aes(x = year, y = tfr, colour = name)) +
  geom_line()  +
  theme_bw()

g2 <- ggplot(data = s_asia, mapping = aes(x = year, y = tfr, colour = name)) +
  geom_line()  +
  theme_classic()

library(patchwork)
g1 + plot_spacer() + g2 + plot_layout(ncol = 3, widths = c(3, 0.1, 3))

# library(ggthemes)
# ggplot(data = s_asia, mapping = aes(x = year, y = tfr, colour = name)) +
#   geom_line()  +
#   theme_economist()
# 
# ggplot(data = s_asia, mapping = aes(x = year, y = tfr, colour = name)) +
#   geom_line()  +
#   theme_wsj()
library(ggthemes)
p1 <- ggplot(data = s_asia, mapping = aes(x = year, y = tfr, colour = name)) +
  geom_line()  +
  theme_economist()

p2 <- ggplot(data = s_asia, mapping = aes(x = year, y = tfr, colour = name)) +
  geom_line()  +
  theme_wsj()

library(patchwork)
p1 + plot_spacer() + p2 + plot_layout(ncol = 3, widths = c(3, 0.1, 3))

# library(ggthemes)
# ggplot(data = s_asia, mapping = aes(x = year, y = tfr, colour = name)) +
#   geom_line()  +
#   theme_tufte()
# 
# ggplot(data = s_asia, mapping = aes(x = year, y = tfr, colour = name)) +
#   geom_line()  +
#   theme_solarized()
library(ggthemes)
p1 <- ggplot(data = s_asia, mapping = aes(x = year, y = tfr, colour = name)) +
  geom_line()  +
  theme_tufte()

p2 <- ggplot(data = s_asia, mapping = aes(x = year, y = tfr, colour = name)) +
  geom_line()  +
  theme_solarized()

library(patchwork)
p1 + plot_spacer() + p2 + plot_layout(ncol = 3, widths = c(3, 0.1, 3))

# changing axis.text updates both axis.text.x and axis.text.y
ggplot(data = s_asia, mapping = aes(x = year, y = tfr, colour = name)) +
  geom_line() +
  scale_x_continuous(breaks = seq(from = 1950, to = 2020, by = 10)) +
  theme(axis.text = element_text(angle = 45))

# can specify specific elements we want to rotate and hjust (e.g., axis.text.x)
ggplot(data = s_asia, mapping = aes(x = year, y = tfr, colour = name)) +
  geom_line() +
  scale_x_continuous(breaks = seq(from = 1950, to = 2020, by = 10)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# text applies font to all text elements
ggplot(data = s_asia, mapping = aes(x = year, y = tfr, colour = name)) +
  geom_line() +
  theme(text = element_text(family = "mono"),
        legend.title = element_text(font = "bold", size = 20))

# alter major grid lines (where there are axis ticks)
ggplot(data = s_asia, mapping = aes(x = year, y = tfr, colour = name)) +
  geom_line() +
  theme(panel.grid.major = element_line(colour = "darkgrey"))

# remove minor grid lines
ggplot(data = s_asia, mapping = aes(x = year, y = tfr, colour = name)) +
  geom_line() +
  theme(panel.grid.major = element_line(colour = "darkgrey", linetype = "dashed"), 
        panel.grid.minor = element_blank())

# border colour for entire panel
ggplot(data = s_asia, mapping = aes(x = year, y = tfr, colour = name)) +
  geom_line() +
  theme(plot.background = element_rect(colour = "darkgrey", size = 2))

# border colour for plot panel
ggplot(data = s_asia, mapping = aes(x = year, y = tfr, colour = name)) +
  geom_line() +
  theme(panel.background = element_rect(colour = "black"))

ggplot(data = s_asia, mapping = aes(x = year, y = tfr, colour = name)) +
  geom_line() +
  geom_point(mapping = aes(size = pop/1e6), alpha = 0.25)

ggplot(data = s_asia, mapping = aes(x = year, y = tfr, colour = name)) +
  geom_line() +
  geom_point(mapping = aes(size = pop/1e6), alpha = 0.25) +
  theme(legend.position = "top")

ggplot(data = s_asia, mapping = aes(x = year, y = tfr, colour = name)) +
  geom_line() +
  geom_point(mapping = aes(size = pop/1e6), alpha = 0.25) +
  theme(legend.box = "horizontal")



# NA
