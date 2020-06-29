# Basic R concepts -------------------------------------------------------------


# Using R as a calculator (at the command line)

# (Go to the command line!)


# Writing commands in scripts

29 + 56 # Click `Run` or use keyboard shortcut to send to Console
44 / 78
23 - 9


# Creating R objects (see Environment pane)

14 / 63

x <- 14 / 63 # Store results in object named `x`
x
x * 100

1:5 # We can use `:` to return integers from 1 to 5

vec <- 1:5 # Store results in object named `vec`
vec
vec / 5
vec / vec # This behavior is called element-wise execution

is.vector(vec) # `vec` is a vector (a type of object)
length(vec)    # More specifically, `vec` is a vector of length 5

# In the context of data analysis, think of a vector as a column in an
# Excel spreadsheet. `vec` is like a column with 5 rows.

c(1, 2, 3, 4, 5)
seq(from = 1, to = 5, by = 1)

vec2 <- -3:5
vec2
vec2 < 0 # This hints at a powerful feature of R, vectorized code


# Functions and arguments

# What exactly is a function?

take_mean <- function(x) {    # Name, argument(s)
  mean <- sum(x) / length(x)  # Body
  mean                        # Last line of code (what gets returned)
}

ages <- c(20, 24, 24, 25, 26, 30, 35, 37, 44, 51)
ages

sum(ages) / length(ages)
take_mean(x = ages)

take_mean(ages) # We can provide arguments by position

mean_age <- take_mean(ages) # We can store results in an object

mean(ages) # R already comes with a function for means

?mean # For help with a given R function (see Help pane)


# In closing
# - RStudio layout
# - RStudio projects (and working directories)
# - Other questions?


# End of script ----------------------------------------------------------------

