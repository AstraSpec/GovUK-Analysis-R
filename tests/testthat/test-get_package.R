test_that("get_package returns a tibble", {
  result <- govuk::get_package("debt")
  expect_s3_class(result, "tbl_df")
  expect_true(all(c("title", "name", "url") %in% names(result)))
})
test_that("get_package querying works", {
  res1 <- govuk::get_package("debt")
  res2 <- govuk::get_package("energy")
  expect_false(identical(res1, res2))
})

test_that("get_package columns are of type character", {
  result <- govuk::get_package("debt")
  expect_type(result$title, "character")
  expect_type(result$name, "character")
  expect_type(result$url, "character")
})

