% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SOM2.R
\name{SOM2}
\alias{SOM2}
\title{SOM2}
\usage{
SOM2(gdx, type = "stock", level = "regglo", noncropAggr = TRUE)
}
\arguments{
\item{gdx}{GDX file}

\item{type}{"stock" (default) for absoulte values,
"density" for per hectar values}

\item{level}{Level of regional aggregation;
"reg" (regional),
"glo" (global),
"regglo" (regional and global)}

\item{noncropAggr}{aggregate non cropland types to 'noncropland'
(if FALSE all land types of pools59 will be reported)}
}
\value{
A MAgPIE object containing som values
}
\description{
Calculates soil organic carbon stock size
             based on a MAgPIE gdx file (for threepool realization)
}
\examples{
\dontrun{
  x <- SOM2(gdx)
}

}
\author{
Kristine Karstens
}
