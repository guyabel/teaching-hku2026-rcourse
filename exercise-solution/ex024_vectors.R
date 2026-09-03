# 1. Create a vector called a1 for the 1, 4, 9, 16, 25
a1 <- c(1, 4, 9, 16, 25)
# 2. Create a vector called a2 from 1 to 100
a2 <- 1:100
# 3. Create a vector called a3 from -8 to 20 in steps of 4
a3 <- seq(from = -8, to = 20, by = 4)
# 4. Create a vector called a4 that combines a1 and a3
a4 <- c(a1, a3)
# 5. Create a vector called a5 that has your first and last name repeated 3 times
a5 <- rep(x = c("Guy", "Abel"), times = 3)
# 6. Find the square root of each element in a1
sqrt(x = a1)
# 7. Test to see where a3 are positive (greater than zero)
a3 > 0
# 8. Divide a2 by a1. Then divide a2 by a3. What is going on?
a2 / a1; a2 / a3