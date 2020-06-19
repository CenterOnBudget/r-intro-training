# Load packages ----------------------------------------------------------------


# These packages include additional functions we'll use today
# For more on the tidyverse, see: https://r4ds.had.co.nz

library(tidyverse)
library(readxl)
library(writexl)


# Retrieve data ----------------------------------------------------------------


# Use `download.file` function to retrieve data

# This is especially useful when retrieving a lot of data files on a
# recurring basis. For this size project, it is not as important.

# We can check the arguments of `download.file` by running `?download.file`

download.file(
  url = "https://shef.sheeo.org/wp-content/uploads/2020/04/SHEEO_SHEF_FY19_Report_Data.xlsx",
  destfile = "data-raw/sheeo_shef_fy19_data.xlsx"
)

download.file(
  url = "https://www.bls.gov/cpi/research-series/allitems.xlsx",
  destfile = "data-raw/bls_cpi_u_rs.xlsx"
)


# Import data ------------------------------------------------------------------


# Use `read_excel` function to import SHEEO data from spreadsheet

sheeo_raw <- read_excel(
  path = "data-raw/sheeo_shef_fy19_data.xlsx",
  sheet = 2,
  col_names = TRUE # This is a default argument
)


# Use same approach to import BLS data

# Notice that we can take advantage of positional and default arguments.
# Using position to indicate the first argument of a function is pretty
# standard practice. Still, use positional arguments sparingly since they
# can make code less clear.

bls_raw <- read_excel("data-raw/bls_cpi_u_rs.xlsx", skip = 5)


# Clean data -------------------------------------------------------------------


# Use `select` function to clean SHEEO data

names(sheeo_raw)

sheeo_clean <- select(
  sheeo_raw,
  state = State,
  year = FY,
  support = `Total State Support`,
  fte = `Net FTE Enrollment`
)


# Use same function to clean BLS data

bls_clean <- select(bls_raw, year = YEAR, cpi_u_rs = AVG)


# How do we get the value of the CPI-U-RS for 2019? To do this, we will
# explore some base R syntax.

bls_clean$cpi_u_rs     # Select a column with `$`
bls_clean$cpi_u_rs[43] # Select a specific element with `[ ]`

bls_clean$year
bls_clean$year == 2019 # Apply logical test to year column

bls_clean$cpi_u_rs[bls_clean$year == 2019] # Subset with logical vector

cpi_u_rs_2019 <- bls_clean$cpi_u_rs[bls_clean$year == 2019] # Good

# For more on base R programming, see:
# https://rstudio-education.github.io/hopr/


# Use `mutate` function to create inflation adjustment for 2019

bls_clean <- mutate(bls_clean, cpi_u_rs_2019_adj = cpi_u_rs_2019 / cpi_u_rs)


# Merge data -------------------------------------------------------------------


# Use `left_join` function to merge data

clean_data <- left_join(sheeo_clean, bls_clean, by = "year")

# Another power of using R (and tidyverse functions) is the ability
# to merge on more than one ID (e.g., by year, state, and county)


# Verify data ------------------------------------------------------------------


# Use `count` function to check number of years of data per state

count(clean_data, state)
print(count(clean_data, state), n = Inf) # Consistent with SHEEO README


# Sneak-peek at more advanced tools:
# Use pipe, `filter`, `summarize`, and friends to check US totals

clean_data %>%
  filter(state == "U.S.") %>%
  select(1:3)

clean_data %>%
  filter(state != "U.S.") %>%
  # filter(!(state %in% c("U.S.", "District of Columbia"))) %>%
  group_by(year) %>%
  summarize(support = sum(support)) %>%
  arrange(-year)


# Analyze data -----------------------------------------------------------------


# Use `mutate` to calculate real state support per FTE

analysis_data <- mutate(
  clean_data, real_support_fte = (support * cpi_u_rs_2019_adj) / fte
)


# Use `filter` function to restrict results to one state

results <- filter(analysis_data, state == "Texas")


# Look at results with `ggplot2`

ggplot(data = results) +
  geom_line(aes(x = year, y = real_support_fte))


# Export data ------------------------------------------------------------------


write_csv(analysis_data, "data/higher_ed_data.csv")
write_xlsx(results, "results/higher_ed_results.xlsx")


# End of script ----------------------------------------------------------------

