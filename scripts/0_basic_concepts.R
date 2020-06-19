# Basic R concepts -------------------------------------------------------------


# R as a desktop calculator

29 + 56 # Click `Run` or press `command-return` to send to console
44 / 78
23 - 9


# R objects

x <- 14 / 63 # Store results in `x` object
x

is.vector(x) # `x` is a vector
length(x) # More specifically, it is a vector of length 1

# Think of a vector as a column
# `x` is a column within only one row

vec <- c(1, 2, 3, 4, 5)
vec

is.vector(vec)
length(vec)

1:5
seq(from = 1, to = 5, by = 1)

vec2 <- -3:5
vec2 < 0 # This hints at a powerful feature of R, vectorized code


# Functions and arguments

# What exactly is a function?

take_mean <- function(x) {
  result <- sum(x) / length(x)
  result
}

take_mean(x = vec)
take_mean(x = vec2)
take_mean(x = c(20, 24, 24, 25, 26))

mean(x = c(20, 24, 24, 25, 26)) # R already comes with a function for means

?mean # for help with a given R function


# In closing
# - RStudio layout
# - RStudio projects (and working directories)


# End of script ----------------------------------------------------------------

