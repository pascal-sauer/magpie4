#' @title reportYieldsCropRaw
#' @description reports potential yields before calibration
#'
#' @importFrom magpiesets reporthelper summationhelper
#' @export
#'
#' @param gdx GDX file
#' @param detail if detail=FALSE, the subcategories of groups are not reported (e.g. "soybean" within "oilcrops")
#' @return yield as MAgPIE object (Mt DM/ha)
#' @author Edna J. Molina Bacca
#' @examples
#' \dontrun{
#' x <- reportYieldsCropRaw(gdx)
#' }
#'
reportYieldsCropRaw <- function(gdx, detail = FALSE) {

  yieldWaterAgg <- function(gdx, water_aggr = TRUE, sum_sep = "+", detail = TRUE) {
    out <- YieldsCropRaw(gdx, file = NULL, level = "regglo")
    if (water_aggr == TRUE) {

      # The +0.000001 is added as a small area for crops with zero values in fm_croparea. 
      # Otherwise yields for begr and betr are zero.
      weight <- out
      area <- superAggregate(readGDX(gdx, "fm_croparea") + 0.000001, aggr_type = "sum", level = "regglo")[, 1995, ]
      weight[, , ] <- area

      mapping <- as.data.frame(getNames(out))
      colnames(mapping) <- "Crops_w"
      mapping$Crops <- gsub("\\..*", "", mapping$Crops_w)

      out <- toolAggregate(out, rel = mapping, from = "Crops_w", to = "Crops", weight = weight, dim = 3)

    } else {
      out <- out
    }

    # The +0.000001 is added as a small area for crops with zero values in fm_croparea. 
    # Otherwise yields for begr and betr are zero.
    area <- magpiesort(setYears(superAggregate(readGDX(gdx, "fm_croparea")[, 1995, ] + 0.000001, aggr_type = "sum", level = "regglo"), NULL))
    area <- if (water_aggr == TRUE) dimSums(area, dim = 3.1) else area
    production <- out * area

    dim <- if (water_aggr == TRUE) 3.1 else 3.2
    area <- reporthelper(x = area, dim = dim, level_zero_name = "Productivity|Yield (before calibration)", detail = detail)
    production <- reporthelper(x = production, dim = 3.1, level_zero_name = "Productivity|Yield (before calibration)", detail = detail)


    out <- production / area
    getNames(out) <- paste(gsub("\\.", "|", getNames(out)), "(t DM/ha)", sep = " ")
    if (length(sum_sep) != 0) {
      out <- summationhelper(out, sep = sum_sep)
    }

    return(out)
  }

  x <- mbind(yieldWaterAgg(gdx, water_aggr = TRUE, sum_sep = "+", detail = detail),
    yieldWaterAgg(gdx, water_aggr = FALSE, sum_sep = NULL, detail = detail))
  x[!is.finite(x)] <- 0


  return(x)
}
