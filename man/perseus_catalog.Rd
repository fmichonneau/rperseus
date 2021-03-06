% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R, R/rperseus.R
\docType{data}
\name{perseus_catalog}
\alias{perseus_catalog}
\alias{perseus_catalog}
\title{Metadata for texts available via the Perseus Digital Library.}
\format{A data frame with 2291 rows and 5 variables:
\describe{
  \item{urn}{Uniform Resource Number}
  \item{group_name}{Could refer to author (e.g. "Aristotle") or corpus (e.g. "New Testament")}
  \item{label}{Text label, e.g. "Phaedrus"}
  \item{description}{Text description}
  \item{language}{Text language, e.g. "grc" = Greek, "lat" = Latin, "eng" = English}
}}
\source{
\url{http://cts.perseids.org/api/cts/?request=GetCapabilities}
}
\usage{
perseus_catalog
}
\description{
A dataset containing the texts available from the Perseus Digital Library.

Perseus Catalog
}
\keyword{datasets}
