plot_csv_data <- function(df, x_col, y_col, title = "Data Plot") {
  # Ensure columns exist
  stopifnot(x_col %in% names(df), y_col %in% names(df))
  
  ggplot2::ggplot(df, ggplot2::aes(x = .data[[x_col]], y = .data[[y_col]])) +
    ggplot2::geom_col(fill = "#1380A1", color = "#333333", width = 0.7) +
    ggplot2::labs(
      x = x_col,
      y = y_col,
      title = title
    ) +
    ggplot2::theme_classic()
}
