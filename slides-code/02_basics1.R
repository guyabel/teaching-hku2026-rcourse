3 - 1

# > 3 -
#   +

# > 3 -
#   + 1
#  [1] 2

7 / (1 + 3
)
"Guy
"

7 / (1 + 3)

7 / 1 + 3

"Guy"
'Guy'

# > Guy
# Error: object 'Guy' not found

1 + 2 + 3 # some additions

3 - 1 # + 20

# # no warning or error message, just waiting for something to subtract
# > 3 - # 1
#   +

3 - 1

# same as
3   -          1

"Strings  obey  spacing."
" Strings    obey         spacing   .    "

"Guy"

# > 3 - 1   5 * 9
# Error: unexpected numeric constant in " 1 + 2   5"

 3 - 1; 5 * 9



# function_name(argument_name_1, argument_name_2)

# ?log

log(x = 10)
# same as
log(x = 10, base = exp(1))
# change the base argument...
log(x = 10, base = 10)

log(x = 10)
# same as
log(10)

# knows the order as well (i.e. second input is the `base`)
log(10, 10)
# same as
log(x = 10, base = 10)



pi

pi > 5

pi > 3 & pi > 4

pi > 5 | pi < 4




1 + 2

a <- 1 + 2

a

try({
# > # cannot name an object as a number
# > 3 <- 1 + 2
# Error in 3 <- 1 + 2 : invalid (do_set) left-hand side to assignment
# # cannot start an object name with a number
# > 3a <- 1 + 2
# Error: unexpected symbol in "3a"
})

log
log <- 1 + 3
log

log
base::log(x = 10)

# > A
# Error: object 'A' not found

try({
a
})

try({
c
e
})

a
a * 2

b <- a * sqrt(a)
b

ls()

rm(b, log)
ls()

rm(list = ls())
ls()

v1 <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
v1

v2 <- c("a", "b", "c", "d")
v2
# note, if there is at least one character string everything will convert to character strings...
v3 <- c(1, "two", 3, 4)
v3

v4 <- c(v1, v2, "Hi")
v4

1:20
# backwards
10:-5

seq(from = 0, to = 10)
# the 'by' argument lets you set the increments
seq(from = 0, to = 10, by = 2)

# the length.out argument specifies the length of the vector 
# and figures out the increments itself
seq(from = 0, to = 10, length.out = 18)

rep(x = 0, times = 10)
# as always you can drop the argument name
rep(x = "Hello", times = 3)
# repeating vector 1 twice
rep(x = v1 , times = 2)
# we can repeat each element as well
rep(x = v2 , each = 2)

v1
v1 + v1
v1 ^ 2
log(x = v1)
