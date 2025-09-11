test_that("get_csv_data returns a tibble with expected columns", {
  pkgs <- govuk::get_package("debt")
  result <- govuk::get_csv_data(pkgs)
  expect_s3_class(result, "tbl_df")
  expect_true(all(c("package", "csv_url", "format") %in% names(result)))
})

test_that("get_csv_data returns only CSV files", {
  pkgs <- govuk::get_package("debt")
  result <- govuk::get_csv_data(pkgs)
  expect_true(all(toupper(result$format) == "CSV"))
  expect_true(all(!is.na(result$csv_url)))
})