test_that("clean_csv_data trims whitespace from character columns", {
  df <- data.frame(
    a = c("  x  ", " y", "z "),
    b = c(1, 2, 3),
    stringsAsFactors = FALSE
  )
  
  result <- clean_csv_data(df)
  expect_equal(result$a, c("x", "y", "z"))
})

test_that("clean_csv_data removes rows where all values are NA", {
  df <- data.frame(
    a = c("a", ""),
    b = c(NA, NA),
    stringsAsFactors = FALSE
  )
  
  result <- clean_csv_data(df)
  expect_equal(nrow(result), 1)
})