get_csv_data <- function(data) {
  # ensure no NA urls
  valid <- dplyr::filter(data, !is.na(name))
  
  purrr::map_dfr(valid$name, function(pkg_name) {
    url <- paste0("https://data.gov.uk/api/3/action/package_show?id=", pkg_name)
    res <- httr::GET(url)
    httr::stop_for_status(res)
    
    content <- httr::content(res, as = "parsed", type = "application/json")
    resources <- content$result$resources
    
    # extract CSV links
    tibble::tibble(
      package = pkg_name,
      csv_url = purrr::map_chr(resources, "url", .default = NA_character_),
      format  = purrr::map_chr(resources, "format", .default = NA_character_)
    ) |>
      dplyr::filter(!is.na(csv_url), toupper(format) == "CSV")
  })
}