#' Get a primary text by URN.
#'
#' @param text_urn Valid uniform resource number (URN) obtained from perseus_catalog.
#'
#' @return A seven column tbl_df with one row for each "section" (splits vary from text--could be line, chapter, etc.).
#' Columns:
#' \describe{
#'   \item{text}{character vector of text}
#'   \item{urn}{Uniform Resource Number}
#'   \item{group_name}{Could refer to author (e.g. "Aristotle") or corpus (e.g. "New Testament")}
#'   \item{label}{Text label, e.g. "Phaedrus"}
#'   \item{description}{Text description}
#'   \item{language}{Text language, e.g. "grc" = Greek, "lat" = Latin, "eng" = English}
#' }
#' @importFrom dplyr %>%
#' @export
#'
#' @examples
#' \dontrun{
#' get_perseus_text("urn:cts:greekLit:tlg0013.tlg028.perseus-eng2")
#' get_perseus_text("urn:cts:greekLit:tlg0013.tlg028.perseus-grc2")
#' get_perseus_text("urn:cts:latinLit:stoa0215b.stoa003.opp-lat1")
#' }

get_perseus_text <- function(text_urn) {

  if (!text_urn %in% internal_perseus_catalog$urn) {
    stop("invalid text_urn argument: check perseus_catalog for valid URNs")
  }

  new_urn <- reformat_urn(text_urn)
  text_index <- get_full_text_index(new_urn)
  if (grepl("NA", text_index)) stop("No text available.")
  text_url <- get_text_url(text_urn, text_index)
  df <- extract_text(text_url) %>%
    dplyr::mutate(urn = text_urn) %>%
    dplyr::left_join(internal_perseus_catalog, by = "urn") %>%
    dplyr::mutate(section = dplyr::row_number(urn))
  df
}
