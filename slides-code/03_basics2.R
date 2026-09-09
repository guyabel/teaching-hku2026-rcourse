v1 <- 1:10
v1
# logical test
v1 > 5
# display a character vector for results
ifelse(test = v1 > 8, yes = "High", no = "Low")
# can return numeric values as well
ifelse(test = v1 > 8, yes = 1, no = 0)



v1
sample(x = v1, size = 5)
sample(x = v1, size = 15, replace = TRUE)

# normal
rnorm(n = 5, mean = 1, sd = 2)
# binomial
rbinom(n = 8, size = 10, prob = 0.3)
# poisson
rpois(n = 8, lambda = 2)
# uniform
runif(n = 5, min = 5, max = 8)

v5  <- c(10, 7, NA, NA, 0, NA, -2, 8)
v5
# this won't work by default
max(v5)

# there is usually an option to allow functions to omit NA
max(v5, na.rm = TRUE)
# this works (does not have na.rm argument)
summary(v5)

is.na(v5)

!is.na(v5)



pi
LETTERS

matrix(data = 1:12, nrow = 4)

swiss

list(LETTERS, 1:10, matrix(1:6, nrow = 2))

m <- lm(formula = Fertility ~ Education + Catholic, data = swiss)
str(m)

is.vector(v5)
is.matrix(v5)
is.character(v5)

!is.vector(v5)

v4 <- c("I", "really", "like", "chocolate", "ice cream.")
# with the bracket we reference the third element
v4[3]
# we can reference a sequence of elements
v4[2:4]
# or any elements we like
v4[c(1,3,4)]
# all except the 2nd element
v4[-2]
# and we can change elements
v4[4]  <- "strawberry"
v4

# create a matrix
m0 <- matrix(data = 1:12, nrow = 3)
m0
# bottom right element
m0[3, 4]
# third column
m0[, 3]

# can use the raw row and column coordinates
swiss[38,1]
# the row and column names
swiss["Sion","Fertility"]
# the column name and row coordinates
# this is useful if there are no row names, which can often be the case.
swiss$Fertility[38]
# the whole column
swiss$Fertility

m$coefficients

m[["coefficients"]]



# function(argument_name1 = NULL, argument_name2 = 1, ...){
#   ~~actions~~
#   return(value)
# }

my_square <- function(x = NULL){
  y <- x ^ 2
  return(y)
}
my_square(x = 2)
my_square(x = 10)

# add a p argument to raise x to any power
my_power <- function(x = NULL, p = 2){
  y <- x ^ p
  return(y)
}
my_power(x = 2)
my_power(x = 2, p = 4)

# for(~~element~~ in ~~vector~~){
#   ~~action~~
# }

# print one random numbers from a normal distribution with different means
for(m in c(0, 10, 50, 100)){
  y <- rnorm(n = 1, mean = m, sd = 1)
  print(y)
}

# print n random numbers from a normal distribution
for(nn in c(1, 2, 5, 10)){
  y <- rnorm(n = nn, mean = 0, sd = 1)
  r <- round(y, digits = 3)
  print(r)
}

# create empty vector to save action
v6 <- rep(x = NA, times = 12)
v6
# fill the vector with random numbers from a normal distribution
# with increasing mean based on i value
for(i in 1:10){
  x <- rnorm(n = 1, mean = i)
  print(x)
  v6[i] <- x
}
v6

# for(i in 1:10){
#   # read in different excel sheets
#   d <- read_excel(path = "myexcelfile.xlsx", sheet = i)
#   # run regression models using data from excel sheet
#   m <- lm(formula = y ~ x1 + x2, data = d)
#   # save regression model coefficients
#   write_csv(x = m$coefficients, path = paste0("model", i, ".csv"))
# }

# initial population of 100 and growth rate of five percent per year
p <- rep(NA, times = 10)
p[1] <- 100
for(i in 1:9){
  p[i+1] <- p[i] * (1 + 0.05)
}

p

# can wrap for loops in a function
sp_rate <- function(p0 = NULL, r = NULL, n = NULL){
  p <- p0
  for(i in 1:n){
    p[i+1] <- p[i] * (1 + r)
  }
  return(p)
}

sp_rate(p0 = 100, r = 0.05, n = 5)

sp_rate(p0 = 20, r = 0.1, n = 20)
