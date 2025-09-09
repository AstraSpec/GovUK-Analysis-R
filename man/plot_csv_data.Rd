\name{plot_csv_data}
\alias{plot_csv_data}
\title{Plots CSV data}
\description{Plots CSV data as a bar chart.}
\usage{
plot_csv_data(df, x_col, y_col, title = "Data Plot")
}
\value{
Returns a ggplot of a bar chart.
}
\examples{
education_results <- get_csv_data("education")
csvs <- get_csv_data(packages)
csv <- csvs$csv_url[1]
data <- load_csv_data(csv)
clean_data <- clean_csv_data(data)
plot <- plot_csv_data(clean_data, "InvoiceMonth", "MeatIndustry", "Education plot")
print(plot)
}