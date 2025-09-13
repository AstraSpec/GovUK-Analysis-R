\name{get_csv_data}
\alias{get_csv_data}
\title{Get CSV data}
\description{Queries the UK Government's website with a tibble of data to obtain CSV files. Non-CSV files are disregarded.}
\usage{
get_csv_data(data)
}
\arguments{
\item{data}{Tibble of title, name and URL}
}
\value{
Returns a tibble of the read CSV.
}
\examples{
education_results <- get_csv_data("education")
csvs <- get_csv_data(packages)
print(head(csvs))
}