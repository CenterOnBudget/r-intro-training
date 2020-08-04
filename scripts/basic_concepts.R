

# Using R as a calculator (at the command line)

# (Go to the command line!)


# Writing commands in scripts

# Use scripts to save your work

29 + 56 # Click `Run` or use keyboard shortcut to execute
44 / 78
23 - 9


# Creating R objects

# Use objects to store data

14 / 63

share <- 14 / 63 # Create an object with `<-`
share

share * 100

percent <- share * 100
percent

# Keep track of your objects with the environment pane

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
hist(ages)

mean_age <- mean(ages) # Use `<-` to store function results
mean_age

?mean # Use `?` to get help


# In closing
# - RStudio layout
# - RStudio projects (and working directories)

