#' Imports the raster and creates a raster stack
#' @param rasters A string of raster file names
#' @param extents_raster A raster of the desired study extent.
#' @return Objedt predictors - A raster stack
#' @export
#' @examples
#' rasters <- c(
#' 'data/PRISM/PRISM_ppt_30yr_normal_800mM2_annual_asc/ppt_30yr_n.asc',
#' 'data/PRISM/PRISM_tmean_30yr_normal_800mM2_annual_asc/tmean_30yr.asc',
#' 'data/PRISM/PRISM_us_dem_800m_asc/us_dem.asc'
#' )
#' raster_import(rasters)

raster_import <- function(rasters,extents_raster){
	n <- stringr::str_replace(
		string = basename((rasters)),
		pattern = '\\.[^.]*$',
		replacement = '')
	predictors <- raster::stack(paste0(rasters))
	names(predictors) <- n
	predictors <- raster::crop(
		predictors,
		extents_raster)
	predictors
}
