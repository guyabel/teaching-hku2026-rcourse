# 1. Create a matrix m1, with 4 rows, 7 columns, filled with the numbers 1:28
m1 <- matrix(1:28, nrow = 4, ncol = 7)
m1
# 2. Display below the second row of the m1 matrix, where 
m1[2, ]
# 3. Display the top right value of the m1 matrix
m1[1, 7]
# 4. Display the first column of the m1 matrix
m1[, 1]
# 5. Display the whole of the Infant.Mortality column in the swiss data
swiss$Infant.Mortality
# 6. What is the maximum fertility in the swiss data
max(swiss$Fertility)
# 7. Display the Catholic value for Glane in the swiss data
swiss["Glane", "Catholic"]
