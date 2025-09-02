get_package <- function(query = "debt") {
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

a <- get_package()
b <- get_csv_data(a)
print(b)