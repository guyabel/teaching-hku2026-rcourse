# 0. a) Load the tidyverse package (that loads ggplot2, and other packages). 
#       Install it on your computer first if you have not done so already. 
# install.packages("tidyverse")
library(tidyverse)
#    b) Load additional packages that we will use in this exercise
# install.packages("patchwork")
library(patchwork)
#    d) run the code below to read the data for this exercise from the GitHub repository
se_asia <- read_csv("https://raw.githubusercontent.com/guyabel/teaching-hku2026-rcourse/refs/heads/main/exercise-data/se_asia.csv")
#    d) check the data by viewing the first few rows of dataset(s):
# South East Asia, 1950-2023
se_asia
#    e) View the PDF on Github of the correct solutions to the exercise
# browseURL("https://github.com/guyabel/teaching-hku2026-rcourse/blob/main/exercise-solution/ex062_patchwork.pdf")
##
##
##
# 1. Save the plot below as an object named g1 and send it to the R console to 
#    show the plot in R
g1 <- ggplot(data = subset(se_asia, year == 2023), 
             mapping = aes(x = e0, y = name, fill = name)) +
  geom_col(show.legend = FALSE) +
  labs(y = "", 
       x = "Life Expectancy (years) in 2023")
g1
# 2. Save the plot below as an object named g2 and send it to the R console to 
#    show the plot in R
g2 <- ggplot(data = subset(se_asia, year == 2023), 
             mapping = aes(x = imr, y = name, fill = name)) +
  geom_col(show.legend = FALSE) +
  labs(y = "", 
       x = "Infant Mortality Rate (per 1000 live births) in 2023")
g2
# 3. Save the plot below as an object named g3 and send it to the R console to 
#    show the plot in R
g3 <- ggplot(data = se_asia, 
             mapping = aes(x = year, y = tfr, colour = name)) +
  geom_line(show.legend = FALSE) +
  labs(y = "Total Fertility Rate (children per woman)", 
       x = "Year")
g3
# 4. Use the patchwork package to combine g1, g2 and g3. Arrange the plots so 
#    that 
#    a). g3 occupies the left hand side of the combined plot 
#    b) g1 and g2 occupy are stacked on the right hand side of the combined plot
#    Send the combined plot to the R console to show it in R
g3 + (g1 / g2)
# 5. Update the combined plot to add 
#    a. title of "Demographics in South East Asian Countries"
#    b. caption of "Data: UN World Population Prospects 2024"
g3 + (g1 / g2) +
  plot_annotation(title = "Demographics in South East Asian Countries",
                caption = "Data: UN World Population Prospects 2024")
# 6. If you have not already done so, create a folder called "exercise" in your 
#    course working directory
# dir.create("./exercise")
# 7. Save the combined plot above as a PNG file with name "figure1" in a folder 
#    called "exercise" in your working directory, with height 8cm and width 12cm
#    and double the scale. 
ggsave(filename = "./exercise/figure1.png", width = 12, height = 8, units = "cm", scale = 2)
# 8. View the PNG file to check the results.
file.show("./exercise/figure1.png")
system2(command = "open", args = "./exercise/figure1.png")