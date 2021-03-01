

# Scripts ----------------------------------------------------------------------


# Save your work in scripts

293 + 519 # Click `Run` or use keyboard shortcut to execute
44 / 781
27 * 19


# Objects ----------------------------------------------------------------------


# Store your data in objects

in_pov <- 33 # Create an object with the assignment operator `<-`
pop <- 325

in_pov
pop

pov_rate <- in_pov / pop
pov_rate


# Keep track of your objects with the environment pane


# Create a sequence of integers with the colon operator `:`

1:5

x <- 1:10
x

# `x` is a vector (a type of object)

# Vectors in R are like:
# - Columns in an Excel spreadsheet
# - Variables in a Stata dataset

# R data frames are made of vectors


# Functions --------------------------------------------------------------------


# Manipulate your data with functions

# We use functions in R like:
# - Formulas in Excel
# - Commands in Stata

# Functions take the basic form function(argument)

x
sum(x)  # Sum the elements of `x`
mean(x) # Average the elements of `x`


# Use the `c()` function to combine values into a vector

ages <- c(22, 26, 30, 34, 36, 41, 48, 54, 65, 71)
ages

length(ages) # Number of elements
mean(ages)   # Mean age
median(ages) # Median age


# Store the results of a function with `<-`

mean_age <- mean(ages)
mean_age


# Use `?` to get help

?mean

