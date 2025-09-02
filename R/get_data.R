get_csv_data <- function(query = "debt") {
  url <- paste0("https://data.gov.uk/api/3/action/package_search?q=", query)
  res <- httr::GET(url)
  httr::stop_for_status(res)
  
  content <- httr::content(res, as = "parsed", type = "application/json")
  datasets <- content$result$results
  
  tibble::tibble(
    title = purrr::map_chr(datasets, "title", .default = NA_character_),
    name  = purrr::map_chr(datasets, "name", .default = NA_character_),
    url   = purrr::map_chr(datasets, "url", .default = NA_character_)
  )
}
