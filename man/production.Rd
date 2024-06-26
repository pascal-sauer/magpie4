% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/production.R
\name{production}
\alias{production}
\title{production}
\usage{
production(
  gdx,
  file = NULL,
  level = "reg",
  products = "kall",
  product_aggr = FALSE,
  attributes = "dm",
  water_aggr = TRUE,
  dir = ".",
  cumulative = FALSE,
  baseyear = 1995
)
}
\arguments{
\item{gdx}{GDX file}

\item{file}{a file name the output should be written to using write.magpie}

\item{level}{Level of regional aggregation; "reg" (regional), "glo" (global), "regglo" (regional and global) or any
other aggregation level defined in gdxAggregate}

\item{products}{Selection of products (either by naming products, e.g. "tece", or naming a set,e.g."kcr")}

\item{product_aggr}{aggregate over products or not (boolean)}

\item{attributes}{dry matter: Mt ("dm"), gross energy: PJ ("ge"), reactive nitrogen: Mt ("nr"), phosphor: Mt ("p"),
potash: Mt ("k"), wet matter: Mt ("wm"). Can also be a vector.}

\item{water_aggr}{aggregate irrigated and non-irriagted production or not (boolean).}

\item{dir}{for gridded outputs: magpie output directory which contains a mapping file (rds) for disaggregation}

\item{cumulative}{Logical; Determines if production is reported annually (FALSE, default) or cumulative (TRUE)}

\item{baseyear}{Baseyear used for cumulative production (default = 1995)}
}
\value{
production as MAgPIE object (unit depends on attributes and cumulative)
}
\description{
reads production out of a MAgPIE gdx file
}
\examples{
\dontrun{
x <- production(gdx)
}

}
\seealso{
\code{\link{reportProduction}}, \code{\link{demand}}
}
\author{
Benjamin Leon Bodirsky
}
