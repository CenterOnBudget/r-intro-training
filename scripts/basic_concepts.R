

# Scripts ----------------------------------------------------------------------


# Save your work in scripts

293 + 519 # Click `Run` or use keyboard shortcut to execute
44 / 781
27 * 19


# Objects ----------------------------------------------------------------------


# Store your data in objects

in_pov <- 33 # Create an object with `<-`
pop <- 325

in_pov
pop

pov_rate <- in_pov / pop
pov_rate


# Keep track of your objects with the environment pane


# Create a sequence of integers with `:`

1:5

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


# Functions --------------------------------------------------------------------


# Manipulate your data with functions

# We use functions in R like:
# - Formulas in Excel
# - Commands in Stata

# Functions take the basic form function(argument)

vec
sum(vec)
mean(vec)


# Use the `c` function to combine values

ages <- c(20, 24, 24, 25, 26, 30, 35, 37, 44, 51)
ages


# Let's explore `ages`

length(ages)
mean(ages)
median(ages)
sd(ages)


# Store the results of a function with `<-`

mean_age <- mean(ages)
mean_age


# Use `?` to get help

?mean

