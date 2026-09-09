# 1. Create a function called sex_ratio with inputs
#    a) males: count of males
#    b) females: count of females
#    c) per: multiplier default set to 100
#    that calculates the sex ratio (males per 'per' females).
sex_ratio <- function(males, females, per = #####) {
  sr <- (##### / #####) * per
  return(#####)
}
# a) Run sex_ratio for a population with 120 males and 150 females
sex_ratio(males = 120, females = 150)
# b) Run sex_ratio for a population with 520,000 males and 500,000 females
sex_ratio(males = ######, females = ######)
# c) Run sex_ratio for a population with 33000 males and 35000 females, and have
#    the answer provided as males per 1000 females
sex_ratio(males = ######, females = ######, per = ######)

# 2. Create a function called tfr with inputs
#    a) asfr with NULL default
#    b) period with 5 as the default value
#    that calculates the total fertility rate (tfr) based on a vector 
#    of age specific fertility rates (asfr) over a give period. 
tfr <- function(##### = NULL, period = #####){
  x <-  period * sum(asfr)
  return(x)
}
# Run your function with the two sets of asfr values
#    a) 0.05, 0.1, 0.12, 0.09, 0.06 and 0.04
tfr(asfr = c(0.05, #####, 0.12, 0.09, 0.06, #####))
#    b) 0.1, 0.18, 0.16, 0.14, 0.12 and 0.02
#####(asfr = c(0.1, 0.18, 0.16, 0.14, #####, 0.02))

# 3. Create a function called dependency_ratio with inputs
#    a) youth: population aged 0-14
#    b) elderly: population aged 65+
#    c) working: population aged 15-64
#    d) type: character string default set to "total" (options: "total", "young", "old")
#    that calculates the specified dependency ratio per 100 working-age people using ifelse().
dependency_ratio <- function(youth, elderly, working, type = "#####") {
  # Default to total numerator
  num <- youth + #####
  
  # Adjust numerator based on type
  num <- ifelse(type == "#####", youth, num)
  num <- ifelse(type == "old", #####, num)
                
                dep <- (##### / working) * 100
                  return(dep)
}
# Run dependency_ratio for a population with 150 youth, 100 elderly, and 500 working:
# a) Total dependency ratio:
dependency_ratio(youth = 150, elderly = 100, working = 500)
# b) Old-age dependency ratio:
dependency_ratio(youth = 150, elderly = 100, working = 500, type = "#####")

# 4. Create a function called called gage with inputs
#    a) x with default of 15:55 
#    b) c with default of NULL 
#    that calculates the Gage fertility age schedule using the formula
#    y = c * (x - s) * (s + w - x)^2
#    where c is a constant value, that takes the value 12 * w^-4 if not provided by the user,
#          x are mother ages
#          s is the minimum mothers age
#          w is the width of the mothers age (Hint: max(x) - min(x))
##### <- function(x = #####:#####, ##### = NULL){
  s <- min(x)
  w <- max(x) - min(x)
  # Set default c if not provided by user
  if (is.null(c)) {
    c <- 12 * #####^-4
  }
  y <- ##### * (x - #####) * (s + ##### - x)^#####
  return(#####)
}
# Run your function and save results as
# a) y1 with all values set to default
y1 <- #####()
# b) y2 with x set to 15:60 and c to 1/400000

# Uncomment the code below for a simple plot of the results
# plot(y1)
# lines(y2)
  
# 5. Create a function called pop_proj that uses a for loop to project a population
#    over n time periods by calculating net growth from crude rates:
#      b: birth rate (decimal)
#      d: death rate (decimal)
#      m: net migration rate (decimal)
pop_proj <- function(p0 = NULL, b = NULL, d = NULL, m = 0, n = NULL) {
  # Calculate net growth rate
  r <- ##### - ##### + #####
  p <- p0
  
  for (i in 1:#####) {
    p[i + 1] <- p[#####] * (1 + #####)
  }

  return(#####)
}
# Run pop_proj with:
# p0 = 100, birth rate = 0.08, death rate = 0.04, net migration = 0.01 over 5 years:
pop_proj(p0 = 100, b = 0.08, d = 0.04, m = 0.01, n = 5)
# Run pop_proj with a declining population:
# p0 = 500, birth rate = 0.01, death rate = 0.02, net migration = -0.005 over 10 years:
pop_proj(p0 = 500, b = 0.01, d = 0.02, m = -0.005, n = 10)