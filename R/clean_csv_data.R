clean_csv_data <- function(df) {
  df_clean <- df |>
    dplyr::mutate(dplyr::across(where(is.character), ~stringr::str_trim(.))) |>
    dplyr::mutate(dplyr::across(where(is.character), ~dplyr::na_if(., ""))) |>
    dplyr::filter(dplyr::if_any(everything(), ~!is.na(.)))
  
  df_clean
}
