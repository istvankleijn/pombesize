## code to prepare `cells` dataset
library(here)
library(dplyr)

load(here("data", "cultures.rda"))

cells <- readr::read_csv(
    here("data-raw", "cell_shapes.csv"),
    col_types = c("ccddddd")
  ) %>%
  select(-growth_rate) %>%
  left_join(cultures, by = c("modulation", "mod_value")) %>%
  select(
    culture_id, width, length, surface, volume
  )


cells %>%
  readr::write_csv(
    here("data-raw", "cells.csv")
  )
usethis::use_data(cells, overwrite = TRUE)
