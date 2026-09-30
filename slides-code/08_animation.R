library(tidyverse)
s_asia <- read_csv("../slides-data/s_asia.csv")

ggplot(data = s_asia, mapping = aes(x = year, y = tfr, color = name)) +
  geom_line() 

# library(gganimate)
# # `transition_reveal()` to reveal data along the `year` dimension:
# ggplot(data = s_asia, mapping = aes(x = year, y = tfr, color = name)) +
#   geom_line() +
#   transition_reveal(along = year)

# 1. Ensure output folder exists (fixes missing folder error)
dir.create("./frames/", showWarnings = FALSE, recursive = TRUE)


library(gganimate)
animate(
  plot = eval(parse(text = knitr::knit_code$get("plot-01"))),
  renderer = file_renderer("./frames/", prefix = "01_plot_", overwrite = TRUE),
  width = 6, 
  height = 3, 
  res = 300,
  units = "in",
  device = "png"
)

# ggplot(s_asia, aes(x = year, y = tfr, colour = name)) +
#   geom_line() +
#   transition_reveal(year) +
#   labs(title = 'Year: {round(frame_along)}', colour = "Country")

library(gganimate)
animate(
  plot = eval(parse(text = knitr::knit_code$get("plot-02"))),
  renderer = file_renderer("./frames/", prefix = "02_plot_", overwrite = TRUE),
  width = 6, 
  height = 3, 
  res = 300,
  units = "in",
  device = "png"
)

# ggplot(data = s_asia,
#        mapping = aes(x = tfr, y = imr, color = name, size = pop/1e6)) +
#   geom_point(alpha = 0.5) +
#   transition_time(time = year) +
#   theme(legend.box= "horizontal") +
#   labs(title = 'Year: {round(frame_time)}', colour = "Country")

animate(
  plot = eval(parse(text = knitr::knit_code$get("plot-03"))),
  renderer = file_renderer("./frames/", prefix = "03_plot_", overwrite = TRUE),
  width = 6, 
  height = 3, 
  res = 300,
  units = "in",
  device = "png"
)

# ggplot(data = s_asia, mapping = aes(x = tfr, y = name, fill = name)) +
#   geom_col(show.legend = FALSE) +
#   transition_states(states = year,
#     transition_length = 2,
#     state_length = 1
#   ) +
#   labs(title = 'Year: {closest_state}', y = "")

animate(
  plot = eval(parse(text = knitr::knit_code$get("plot-04"))),
  renderer = file_renderer("./frames/", prefix = "04_plot_", overwrite = TRUE),
  width = 6, 
  height = 3, 
  res = 300,
  units = "in",
  device = "png"
)

# p <- ggplot(data = s_asia, mapping = aes(x = year, y = tfr, color = name)) +
#   geom_line() +
#   transition_reveal(along = year) +
#   labs(title = 'Year: {closest_state}', y = "")
# 
# # Render GIF animation
# anim <- animate(plot = p, nframes = 100, fps = 10,
#                 width = 6, height = 4, units = "in", res = 300)
# 
# # Save to exercise folder using relative path
# anim_save(filename = "exercise/s_asia_tfr.gif", animation = anim)

# NA
