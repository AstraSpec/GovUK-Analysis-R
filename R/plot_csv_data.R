plot_csv_data <- function(df, x_col, y_col, title = "Data Plot") {
  # Ensure columns exist
  stopifnot(x_col %in% names(df), y_col %in% names(df))
  
  ggplot2::ggplot(df, ggplot2::aes(x = .data[[x_col]], y = .data[[y_col]])) +
    ggplot2::geom_line(color = "1380A1", linewidth = 1) +
    ggplot2::geom_point(color = "333333", size = 2) +
    ggplot2::labs(
      x = x_col,
      y = y_col,
      title = title
    ) +
    ggplot2::theme_classic()
}
