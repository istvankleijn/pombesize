## code to prepare `cells` dataset goes here
library(here)

cells <- readr::read_csv(
  here("data-raw", "cell_shapes.csv"),
  col_types = c("ccddddd")
)

usethis::use_data(cells, overwrite = TRUE)