#' Culturing conditions
#'
#' Details of growth media composition for the 25 cultures studied. The base
#' medium was modulated in one of four ways: the ammonium or glucose
#' concentration was decreased, the translational inhibitor cycloheximide was
#' added in sublethal doses, or the nitrogen source was changed from
#' 93.5 mM ammonium to 20 mM of a single amino acid.
#'
#' @format A data frame with 25 rows and 8 variables:
#' \describe{
#' \item{culture_id}{Unique culture identifier.}
#' \item{modulation}{Class of modulation applied to the base medium.}
#' \item{mod_value}{Quantification of modulation.}
#' \item{growth_rate}{Population growth rate (h^-1) as measured in turbidostat.}
#' \item{ammonium_concentration}{Ammonium concentration in mg/L.}
#' \item{glucose_concentration}{Glucose concentration in g/L.}
#' \item{cycloheximide_concentration}{Cycloheximide concentration in mg/L.}
#' \item{nitrogen_source}{Three-letter abbreviation of the sole source of nitrogen present.}
#' }
"cultures"
