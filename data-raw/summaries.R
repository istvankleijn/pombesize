## code to prepare `summaries` dataset
library(here)
library(dplyr)

load(here("data", "cells.rda"))

summaries <- cells %>%
  mutate(
    SV_ratio = surface / volume
  ) %>%
  group_by(modulation, mod_value, growth_rate) %>%
  summarise(
    n_cells = n(),
    across(
      c(width, length, surface, volume, SV_ratio),
      list(
        mean = mean,
        sd = sd
      )
    ),
    .groups = "drop"
  )

summaries %>%
  readr::write_csv(
    here("data-raw", "summaries.csv")
  )


usethis::use_data(summaries, overwrite = TRUE)
