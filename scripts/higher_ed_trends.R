# File details -----------------------------------------------------------------


# Author: Matt Saenz
# Last updated: 5/22/2020
# Description: Analysis of higher education funding trends

# Inputs:
# data-raw > SHEEO SHEF report data
# data-raw > BLS CPI-U-RS data


# Load packages ----------------------------------------------------------------


# Before moving on to this script, introduce these basic concepts:
# - using R as a calculator
# - objects
# - functions and their arguments

# Take opportunity to introduce idea of packages
# Plug R for Data Science

library(tidyverse)
library(readxl)


# Retrieve data ----------------------------------------------------------------


# Take opportunity to discuss data retrieval (ask people to share experiences)

sheeo_url <- "https://shef.sheeo.org/wp-content/uploads/2020/04/SHEEO_SHEF_FY19_Report_Data.xlsx"
download.file(url = sheeo_url, destfile = "data-raw/sheeo_shef_fy19_data.xlsx")

bls_url <- "https://www.bls.gov/cpi/research-series/allitems.xlsx"
download.file(url = bls_url, destfile = "data-raw/bls_cpi_u_rs.xlsx")


# Import data ------------------------------------------------------------------


# Work slowly through this, jumping back and forth from Excel file to R
# Also, introduce idea of coding style (plug tidyverse style guide)

sheeo_raw <- read_excel(
  path = "data-raw/sheeo_shef_fy19_data.xlsx",
  sheet = 2,
  col_names = TRUE # This is a default argument
)


# Introduce idea of default/positional arguments

bls_raw <- read_excel("data-raw/bls_cpi_u_rs.xlsx", skip = 5)


# Clean data -------------------------------------------------------------------


# Introduce select function

names(sheeo_raw)

sheeo_clean <- select(
  sheeo_raw,
  state = State,
  year = FY,
  support = `Total State Support`,
  fte = `Net FTE Enrollment`
)

bls_clean <- select(bls_raw, year = YEAR, cpi_u_rs = AVG)

# Take opportunity to dabble in base R
# Motivation, how do we get the value of the CPI-U-RS for 2019?
# Expect people to ask questions about how inflation adjustment works

bls_clean$cpi_u_rs
length(bls_clean$cpi_u_rs)
bls_clean$cpi_u_rs[43] # This is a good first try, but not very safe

bls_clean$year
bls_clean$year == 2019 # Introduce idea of logical vector
bls_clean$cpi_u_rs[bls_clean$year == 2019] # Subset with logical vector

cpi_u_rs_2019 <- bls_clean$cpi_u_rs[bls_clean$year == 2019] # Much better

# Plug Hands-On Programming with R

# Introduce mutate function and replacing value of object

bls_clean <- mutate(bls_clean, cpi_u_rs_2019_adj = cpi_u_rs_2019 / cpi_u_rs)


# Merge data -------------------------------------------------------------------


# Introduce idea of merging (allude to merging on more than one var, for another day)

clean_data <- left_join(sheeo_clean, bls_clean, by = "year")


# Now, browse data and check totals

state_obs <- count(clean_data, state)

print(state_obs, n = Inf)


# Analyze data -----------------------------------------------------------------


# Work slowly through this more complicated mutate (use Excel comparisons)

analysis_data <- mutate(
  clean_data, real_support_fte = (support * cpi_u_rs_2019_adj) / fte
)


# End of script ----------------------------------------------------------------

