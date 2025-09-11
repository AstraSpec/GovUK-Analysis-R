test_that("load_csv_data errors on missing or invalid url", {
  expect_error(govuk::load_csv_data(), "Please provide a valid CSV URL")
  expect_error(govuk::load_csv_data(NA), "Please provide a valid CSV URL")
  expect_error(govuk::load_csv_data(""), "Please provide a valid CSV URL")
})
