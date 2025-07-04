% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/laborCostsEndo.R
\name{laborCostsEndo}
\alias{laborCostsEndo}
\title{laborCostsEndo}
\usage{
laborCostsEndo(gdx, products = "kcr", file = NULL, level = "grid", dir = ".")
}
\arguments{
\item{gdx}{GDX file}

\item{products}{products for which labor costs should be reported ("kcr" or "kli",
for other products use factorCosts())}

\item{file}{a file name the output should be written to using write.magpie}

\item{level}{Level of regional aggregation ("grid" or "iso", for regional/global
use factorCosts())}

\item{dir}{for gridded outputs: magpie output directory which contains
a mapping file (rds) for disaggregation}
}
\value{
MAgPIE object containing labor costs [million US$17]
}
\description{
reads MAgPIE endogenous labor costs for crop and livestock production from gdx file
}
\examples{
\dontrun{
x <- laborCostsEndo(gdx)
}

}
\author{
Debbora Leip
}
