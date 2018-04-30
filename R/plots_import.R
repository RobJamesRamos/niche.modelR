#' Imports the raster and point layers. Creates a raster stack. Checks the point data for inconsistency problems and removes blanks.
#' @param rasters A string of raster file names.
#' @param points The name of a .csv file.
#' @return A list of objecgs predictors (a raster stack) and plots (a data.table).
#' @export
#' @import data.table
#' @examples
#' plots_import(input_rasters,input_points)

plots_import <- function(predictors, plots_data){
	plots <- na.omit(
		data.table::fread(
			paste0(plots_data)))
	xy <- plots[, .(p.lon, p.lat)]
	dt <- plots[, !c("V1","p.lat","p.lon"), with=FALSE]
	spdt <- sp::SpatialPointsDataFrame(
		coords = xy,
		data = dt,
		proj4string = sp::CRS("+proj=longlat +datum=WGS84"))
	plots <- as.data.table(
		raster::extract(predictors,
			spdt,
			method='simple',
			sp=TRUE))
	plots
}
