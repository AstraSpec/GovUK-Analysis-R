\name{load_csv_data}
\alias{load_csv_data}
\title{Loads CSV data}
\description{Downloads CSV file from given URL.}
\usage{
load_csv_data(csv_url)
}
\value{
Returns a tibble of the package name, URL and format.
}
\examples{
education_results <- get_csv_data("education")
csvs <- get_csv_data(packages)
csv <- csvs$csv_url[1]
data <- load_csv_data(csv)
print(data)
}