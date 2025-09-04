load_csv_data <- function(csv_url) {
  if (missing(csv_url) || is.na(csv_url) || csv_url == "") {
    stop("Please provide a valid CSV URL")
  }
  
  message("Loading data from: ", csv_url)
  readr::read_csv(csv_url, show_col_types = FALSE)
}