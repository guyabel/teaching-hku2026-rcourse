# 0. a) Load the tidyverse package (that loads ggplot2, and other packages). 
#       Install it on your computer first if you have not done so already. 
# install.packages("tidyverse")
library(tidyverse)a
#    b) Load additional packages that we will use in this exercise
# install.packages("gganimate")
# install.packages("gifski")
library(gganimate)
library(gifski)
#    c) run the code below to read the data for this exercise from the GitHub repository
world_2023 <- read_csv("https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/world_2023.csv")
se_asia <- read_csv("https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/se_asia.csv")
#    d) check the data by viewing the first few rows of each dataset
# all areas, 2023 only
world_2023
# South East Asia, 1950-2023
se_asia
# 1. Uncomment the code below and adapt to 
#    a. add transitions based on region_geo with transition length of 3 and state length of 1
#       (Hint: use transition_states() function)
#    b. add a fade in effect when points enter 
#       (Hint: use enter_fade() function)
#    c. add a fade out effect when points exit
#    d. add a title that shows the region in each frame
#       (Hint: use labs() function with title argument set to "Continent: {closest_state}")
a1 <- 
  ggplot(data = world_2023, mapping = aes(x = e0, y = tfr, colour = region_geo, size = pop/1e6)) +
  geom_point() +
  scale_colour_brewer(palette = "Set1") +
  scale_size_continuous(breaks = c(50, 250, 500, 750, 1000)) +
  labs(x = "Life Expectancy (years)",
       y = "Total Fertility Rate (children per woman)",
       colour = "Continent",
       size = "Population (m)") +
  transition_states(states = #####, transition_length = #####, state_length = #####) +
  enter_#####() + 
  exit_#####() +
  labs(title = "Continent: {#####}")
a1
# 2. Save the animation from the question above 
#    a. as a GIF file with name "figure1.gif" 
#    b. with width of 15 cm, height of 10 cm and resolution of 300

# 3. View the GIF file to check the results.
file.show("./exercise/figure1.gif")
# system2("open", args = "./exercise/figure1.gif")
# 4. Create a new animated plot based on the code below with 
#    a. add a transition based on year
#       (Hint: use transition_time() function)
#    b. add a title that shows the year in each frame
#       (Hint: use labs() function with title argument set to 
#             "Year: {as.integer(frame_time)}")
#    c. add a shadow to show the points from previous years with an alpha of 0.3
#       (Hint: use shadow_mark() function with past argument set to TRUE, 
#              future argument set to FALSE and alpha argument set to 0.2)
a2 <- 
  ggplot(data = se_asia, mapping = aes(x = e0, y = tfr, size = pop/1e3, colour = name)) +
  geom_point(alpha = 0.8) +
  scale_size_continuous(range = c(1, 15), breaks = c(1, 5, 10, 50, 100, 200)) +
  labs(x = "Life Expectancy (years)", 
       y = "Total Fertility Rate (children per woman)", 
       colour = "Country", 
       size = "Population (m)") +
  theme(legend.box= "horizontal") +
  #####(time = year) +
  labs(title = "Year: {#####}") +
  shadow_mark(past = #####, future = #####, alpha = #####)
a2
# 5. Save the animation from the question above
#    a. as a GIF file with name "figure2.gif"
#    b. with width of 18 cm, height of 12cm and resolution of 300

              
# 6. View the GIF file to check the results.
file.show("./exercise/figure2.gif")
# system2("open", args = "./exercise/figure2.gif")

