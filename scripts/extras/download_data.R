

# Another power of using R is the ability to automate data retrieval

# For example, this project uses the `download.file` function to automatically
# download and rename raw data files:

# SHEEO data

download.file(
  url = "https://shef.sheeo.org/wp-content/uploads/2020/04/SHEEO_SHEF_FY19_Report_Data.xlsx",
  destfile = "data-raw/sheeo_shef_report_fy19.xlsx",
  mode = "wb"
)

# BLS data

download.file(
  url = "https://www.bls.gov/cpi/research-series/allitems.xlsx",
  destfile = "data-raw/bls_cpi_u_rs.xlsx",
  mode = "wb"
)

# Automation doesn't make a huge difference for small projects like this one.
# But for bigger projects, automating the retrieval of raw data can save time
# and increase reproducibility.

