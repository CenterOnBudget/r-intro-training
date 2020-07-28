

library(tidycensus)
library(tidyverse)


# If this is your first time accessing the Census API:
# - Sign up for a Census API key here: https://api.census.gov/data/key_signup.html
# - Store for future use with `tidycensus::census_api_key()`


# Determine tables/vars:
# - B19013_001: Median household income
# - B17001_001: Poverty universe
# - B17001_002: In poverty

acs_vars <- c(
  "med_hh_income" = "B19013_001",
  "pov_univ" = "B17001_001",
  "in_pov" = "B17001_002"
)

acs_vars


# Pull data (1-year estimates for 2018)

acs_data <- get_acs(
  geography = "state",
  variables = acs_vars,
  year = 2018,
  survey = "acs1",
  show_call = TRUE
)

acs_data # You can cross-check by searching b19013 and b17001 on data.census.gov

# If you want standard (wide) data, see `output` argument


# Check reliability with CVs

acs_data %>%
  mutate(
    se = moe / 1.645,
    cv = se / estimate,
    reliable = cv < 0.1
  )

# count(reliable) # All are reliable


# For more, see: https://walker-data.com/tidycensus/

