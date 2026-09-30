# 0. a) Load the tidyverse package (that loads ggplot2, and other packages). 
#       Install it on your computer first if you have not done so already. 
# install.packages("tidyverse")
library(tidyverse)
#    b) Load additional packages that we will use in this exercise
# install.packages("gganimate")
# install.packages("gifski")
library(gganimate)
library(gifski)
#    c) run the code below to read the data for this exercise from the GitHub repository
world_2023 <- read_csv("https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/world_2023.csv")
se_asia <- read_csv("https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/se_asia.csv")
#    d) check the data by viewing the first few rows of each dataset
# South East Asia, 1950-2023
world_2023
# 1. Uncomment the code below and adapt to 
#    a. add transitions based on region_geo with transition length of 3 and state length of 1
#    b. add a fade in effect when points enter 
#    c. add a fade out effect when points exit
a1 <- 
  ggplot(data = world_2023, mapping = aes(x = imr, y = tfr, colour = region_geo, size = pop)) +
  geom_point() +
  coord_trans(x = "log10") +
  scale_colour_brewer(palette = "Set1") +
  scale_size_continuous(breaks = c(50, 250, 500, 750, 1000)) +
  labs(x = "Infant Mortality Rate", y = "Total Fertility Rate", 
       colour = "Continent", size = "Population (m)") +
  transition_states(states = #####, transition_length = #####, state_length = #####) +
  enter_#####() + 
  exit_#####()
a1
# 2. Save the animation from the question above 
#    a. as a GIF file with name "myplot1.gif" 
#    b. with width of 15 cm, height of 10 cm and resolution of 100
anim_save(filename = "./exercise/#####", animation = #####,
          width = #####, height = #####, units = "cm", res = #####)
# 3. View the GIF file to check the results.
file.show("./exercise/figure1.gif")
# system2("open", args = "./exercise/figure1.gif")
# 4. Create a new animated plot based on the code below with 
#    a. add a transition based on year
#    b. add a title that shows the year in each frame
#    c. add a shadow to show the points from previous years with an alpha of 0.3
a2 <- 
  ggplot(data = se_asia, mapping = aes(x = imr, y = tfr, size = pop/1e6, colour = name)) +
  geom_point() +
  scale_size_continuous(breaks = c(10, 50, 100, 200)) +
  labs(x = "Infant Mortality Rate", y = "Total Fertility Rate", 
       colour = "Country", size = "Population (m)") +
  transition_time(time = #####) +
  labs(title = "Year: {#####}") +
  shadow_mark(past = #####, future = #####, alpha = #####)
a2
# 5. Save the animation from the question above
#    a. as a GIF file with name "myplot2.gif"
#    b. with width of 15 cm, height of 15 cm and resolution of 200
anim_save(filename = "./exercise/#####", animation = #####,
          width = #####, height = #####, units = "cm", res = #####)
# 6. View the GIF file to check the results.
file.show("./exercise/figure2.gif")
# system2("open", args = "./exercise/figure2.gif")
