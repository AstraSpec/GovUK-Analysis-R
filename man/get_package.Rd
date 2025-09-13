\name{get_package}
\alias{get_package}
\title{Get Package}
\description{Queries the UK Government's website to find datasets.}
\usage{
get_package(query = "debt")
}
\arguments{
\item{query}{Query being searched on the website}
}
\value{
Returns a tibble of the title, name and URL.
}
\examples{
education_results <- get_package("education")
print(head(education_results))
}