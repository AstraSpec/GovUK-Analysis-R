\name{clean_csv_data}
\alias{clean_csv_data}
\title{Cleans CSV data}
\description{Cleans tibble such as trimming whitespace, null rows and empty strings.}
\usage{
clean_csv_data(df)
}
\arguments{
\item{df}{The data being plotted}
}
\value{
Returns a cleaned tibble.
}
\examples{
education_results <- get_csv_data("education")
csvs <- get_csv_data(packages)
csv <- csvs$csv_url[1]
data <- load_csv_data(csv)
clean_data <- clean_csv_data(data)
print(clean_data)
}