

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

# A vector is a type of R object

# Think of a vector as a:
# - Column in an Excel spreadsheet
# - Variable in a Stata dataset

# R datasets are made of vectors


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

