# 1. Create a vector a6 that is a sequence from 1 to 25 of length 8
a6 <- seq(from = 1, to = 25, length.out = 8)
a6
# 2. What is the mean of a6
mean(x = a6)
# 3. What is the standard deviation of a6
sd(x = a6)
# 4. Create a vector a7 that is a random sample of size 8 from 
#    sequence of integers between 1 to 100
a7 <- sample(x = 1:100, size = 8)
a7
# 5. What is the correlation of a6 and a7
cor(a6, a7)
# 6. Create a vector a8 of length 8 of random numbers from a normal 
#    distribution with mean 10 and standard deviation 2
a8 <- rnorm(n = 8, mean = 10, sd = 2)
a8
# 7. What is Inter Quartile Range of a8
IQR(a8)
# 8. Create a summary of a8
summary(a8)
# 9. Create a vector a9 of length 1002, from 1000 random numbers from a uniform 
#    distribution between 0 and 100 and two missing values
a9 <- c(runif(n = 1000, min = 0, max = 100), NA, NA)
a9
# 10. What is the variance of the remaining numbers in a9
var(a9, na.rm = TRUE)
