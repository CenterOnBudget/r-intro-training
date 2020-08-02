

# Using R as a calculator (at the command line)

# (Go to the command line!)


# Writing commands in scripts

29 + 56 # Click `Run` or use keyboard shortcut to execute
44 / 78
23 - 9


# Creating R objects

14 / 63

x <- 14 / 63 # Create an object named `x` that contains the value of `14 / 63`
x
x * 100

1:5 # Use `:` to return integers from 1 to 5

vec <- 1:5
vec

# `vec` is a vector (a type of object)

# In the context of data analysis, think of a vector as a column in an
# Excel spreadsheet. `vec` is like a column with 5 values:

# | vec |
# |-----|
# |  1  |
# |  2  |
# |  3  |
# |  4  |
# |  5  |


# Using R functions

# Let's look at some simple R functions

ages <- c(20, 24, 24, 25, 26, 30, 35, 37, 44, 51)
ages

sum(ages)
length(ages)
mean(ages)
sd(ages)
hist(ages)

# We use functions in R like:
# - Formulas in Excel
# - Commands in Stata

mean_age <- mean(ages) # Store function results in an object with `<-`
mean_age

?mean # Get help with `?`


# In closing
# - RStudio layout
# - RStudio projects (and working directories)

