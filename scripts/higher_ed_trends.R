

library(tidyverse)
library(readxl)
library(writexl)


# Import data ------------------------------------------------------------------


# Specify function arguments based on spreadsheet

sheeo_raw <- read_excel(
  path = "data-raw/sheeo_shef_report_fy19.xlsx",
  sheet = 2,
  col_names = TRUE # This is a default argument
)


# Use positional and default arguments

bls_raw <- read_excel("data-raw/bls_cpi_u_rs.xlsx", skip = 5)


# Clean data -------------------------------------------------------------------


# Give SHEEO data R-friendly names

names(sheeo_raw)

sheeo <- select(
  sheeo_raw,
  state = State,
  year = FY,
  support = `Total State Support`,
  fte = `Net FTE Enrollment`
)


# Clean BLS data and specify base year

bls <- select(bls_raw, year = YEAR, cpi_u_rs = AVG)

bls <- mutate(bls, cpi_u_rs_2019 = cpi_u_rs[year == 2019])


# Merge data -------------------------------------------------------------------


clean_data <- left_join(sheeo, bls, by = "year")


# Verify data ------------------------------------------------------------------


# How many years of data for each state?

count(clean_data, state)
print(count(clean_data, state), n = Inf) # Consistent with SHEEO README


# Can US totals be replicated?

us <- filter(clean_data, state == "U.S.")
us_support <- select(us, year, support)
us_support

clean_data %>%
  filter(state == "U.S.") %>% # With pipes `%>%`
  select(year, support)

clean_data %>%
  filter(
    state != "U.S." & state != "District of Columbia" # See SHEEO README
  ) %>%
  group_by(year) %>%
  summarize(support = sum(support)) %>%
  arrange(-year)


# Analyze data -----------------------------------------------------------------


analysis_data <- mutate(
  clean_data,
  infl_adj_2019 = cpi_u_rs_2019 / cpi_u_rs, # Inflation adjustment factor
  real_support = support * infl_adj_2019,   # Real support
  real_support_fte = real_support / fte     # Real support per FTE
)


# Make table -------------------------------------------------------------------


real_support_fte_table <- analysis_data %>%
  arrange(year) %>%
  # Data for DC start in 2011
  filter(year %in% 2008:2019 & state != "District of Columbia") %>%
  select(state, year, real_support_fte) %>%
  pivot_wider(names_from = year, values_from = real_support_fte) %>%
  mutate(change = `2019` - `2008`)

print(real_support_fte_table, n = Inf)


# Export data ------------------------------------------------------------------


write_csv(clean_data, "data/higher_ed_funding.csv")
write_xlsx(real_support_fte_table, "results/real_support_fte.xlsx")

