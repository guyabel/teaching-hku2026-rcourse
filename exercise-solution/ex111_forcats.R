# 0. a) Complete and run the code to create load the tidyverse package (that 
#       contains tibble and forcats)
# install.packages("tidyverse")
library(tidyverse)
##
##
##
# 1. Print to R a tibble version of the swiss data 
as_tibble(swiss)
# 2. Create a tibble version of the swiss data frame that
#    a. keeps the rownames in a new column called province
#       (Hint: set rownames = "province" in as_tibble()) 
#    b. save the object as d 
d <- as_tibble(swiss, rownames = "province")
# 3. Show a summary of each column of d
summary(d)
# 4. Show the last few rows of d
tail(d)
# 5. Show the first 15 rows of d
#    (Hint: Use head() function. See ?head to set the number of rows)
head(d, n = 15)
# 6. Convert the `province` column in d from a character string to a factor
d$province <- factor(d$province)
# 7. Check the order of the new levels
levels(d$province)
# 8. Reverse the order of the levels for the province column in d
d$province <- fct_rev(d$province)
# 9. Check the order of the new levels
levels(d$province)
# 10. Order the levels of the province column in d so that Lausanne 
#     is the first category. 
#     (Hint: You only need to type the first category when defining
#     the new order)
d$province <- fct_relevel(d$province, "Lausanne")
# 11. Check the order of the new levels
levels(d$province)
