# > getwd()
# "C:/Users/Guy/teaching"

library(tidyverse)
world_2023 <- read.csv("../slides-data/world_2023.csv")

ggplot(data = world_2023, mapping = aes(x = grp_income, fill = region_geo)) +
  geom_bar()

# saves the last plot from RStudio as a PNG
ggsave(filename = "fig1.png")

# saves the last plot from RStudio as a PDF
ggsave(filename = "fig1.pdf")

file.remove("fig1.png")
file.remove("fig1.pdf")

ggplot(data = world_2023, mapping = aes(x = grp_income, fill = region_geo)) +
  geom_bar()
ggsave(filename = "./plot/fig1.png")

# # view the saved plot. usually works on Windows
# file.show("fig1.png")
# # view the saved plot. usually works on Mac
# system2(command = 'open', args = "fig1.png")

# dir.create("plot")

ggsave(filename = "./plot/fig1.png")

# # works
# ggsave(filename = "C:/Users/Guy/teaching/plot/fig1.png")
# 
# # path copied from Windows File Explorer - will not work
# ggsave(filename = "C:\Users\Guy\teaching\plot\fig1.png")
# Error: '\U' used without hex digits in character string (<input>:1:23)

# # left
# ggsave(filename = "./plot/fig1a.pdf", width = 10, height = 5, unit = "in")
# # right
# ggsave(filename = "./plot/fig1b.pdf", width = 10, height = 5, unit = "cm")

# # left
# ggsave(filename = "./plot/fig1a.pdf", width = 10, height = 5)
# # right
# ggsave(filename = "./plot/fig1c.pdf", width = 10, height = 5, scale = 0.6)

g1 <- ggplot(data = world_2023, 
             mapping = aes(x = grp_income, fill = grp_income)) +
  geom_bar(show.legend = FALSE)
g1

g1 <- g1 + labs(x = "Income Group")
g1

g2 <- ggplot(data = world_2023, 
             mapping = aes(x = tfr, y = imr, size = pop/1e6, colour = grp_income)) +
  geom_point(alpha = 0.5) +
  labs(x = "Total Fertility Rate", y = "Infant Mortality Rate", 
       size = "Population (millions)", colour = "Income Group")
g2

library(patchwork)
g1 + g2

# add a title and caption to the combined plot
g1 + g2 + 
  plot_annotation(tag_levels = "A", 
                  caption = "Source: UN World Population Prospects 2024")

g3 <- ggplot(data = world_2023, 
             mapping = aes(x = grp_income, y = tfr, fill = grp_income)) +
  geom_boxplot(show.legend = FALSE) +
  labs(x = "Income Group", y = "Total Fertility Rate")
g3

(g1 + g3) / g2 +
  plot_annotation(tag_levels = "A", 
                  caption = "Source: UN World Population Prospects 2024")

# collect the legends of the combined plots into a single legend
(g1 + g3) / g2 +
  plot_layout(guides = "collect") +
  plot_annotation(tag_levels = "A", 
                  caption = "Source: UN World Population Prospects 2024")

# alternative relative heights of the first and second rows of the combined plot
(g1 + g3) / g2 +
  plot_layout(heights = c(1, 2)) +
  plot_annotation(tag_levels = "A", 
                  caption = "Source: UN World Population Prospects 2024")

# collect the legends of the combined plots into a single legend
(g1 + g3) / g2 +
  plot_layout(heights = c(1, 2), guides = "collect") +
  plot_annotation(tag_levels = "A", 
                  caption = "Source: UN World Population Prospects 2024")

# NA

# NA
