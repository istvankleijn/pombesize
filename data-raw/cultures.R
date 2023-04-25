## code to prepare `cultures` dataset
library(here)
library(dplyr)

ammonium_base <- 5000
glucose_base <- 20
nitrogen_base <- "Amm"
base_medium <- tibble::tibble(
  culture_id = "base_medium",
  modulation = "base medium",
  mod_value = NA_character_,
  growth_rate = 0.273,
  ammonium_concentration = ammonium_base,
  glucose_concentration = glucose_base,
  cycloheximide_concentration = 0,
  nitrogen_source = nitrogen_base
)
ammonium <- tibble::tibble(
  culture_id = stringr::str_c("ammonium_", seq(7)),
  modulation = "ammonium",
  mod_value = as.character(c(1, 0.8, 0.6, 0.5, 0.4, 0.3, 0.2)),
  growth_rate = c(0.219, 0.192, 0.214, 0.197, 0.159, 0.097, 0.074),
  ammonium_concentration = c(50, 40, 30, 25, 20, 15, 10),
  glucose_concentration = glucose_base,
  cycloheximide_concentration = 0,
  nitrogen_source = nitrogen_base
)
glucose <- tibble::tibble(
  culture_id = stringr::str_c("glucose_", seq(5)),
  modulation = "glucose",
  mod_value = as.character(c(0.2, 0.15, 0.1, 0.0075, 0.005)),
  growth_rate = c(0.223, 0.255, 0.169, 0.148, 0.123),
  ammonium_concentration = ammonium_base,
  glucose_concentration = NA_real_,
  cycloheximide_concentration = 0,
  nitrogen_source = nitrogen_base
)
cycloheximide <- tibble::tibble(
  culture_id = stringr::str_c("cycloheximide_", seq(6)),
  modulation = "cycloheximide",
  mod_value = as.character(c(0.5, 1, 2, 3, 4, 5)),
  growth_rate = c(0.242, 0.213, 0.210, 0.181, 0.170, 0.142),
  ammonium_concentration = ammonium_base,
  glucose_concentration = glucose_base,
  cycloheximide_concentration = as.numeric(mod_value),
  nitrogen_source = nitrogen_base
)
nitrogen_sources <- tibble::tibble(
  culture_id = stringr::str_c("nitrogen_source_", seq(6)),
  modulation = "nitrogen source",
  mod_value = c("Amm", "Pro", "Ser", "Phe", "Gly", "Trp"),
  growth_rate = c(0.262, 0.187, 0.111, 0.096, 0.060, 0.051),
  ammonium_concentration = ammonium_base,
  glucose_concentration = glucose_base,
  cycloheximide_concentration = 0,
  nitrogen_source = mod_value
)

cultures <- bind_rows(
    base_medium, ammonium, glucose, cycloheximide, nitrogen_sources
  ) %>%
  mutate(
    modulation = factor(
      modulation,
      levels = c(
        "base medium",
        "ammonium",
        "glucose",
        "cycloheximide",
        "nitrogen source"
      )
    )
  )

cultures %>%
  readr::write_csv(
    here("data-raw", "cultures.csv")
  )
usethis::use_data(cultures, overwrite = TRUE)
