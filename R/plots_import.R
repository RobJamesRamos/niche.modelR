#' Imports the raster and point layers. Creates a raster stack. Checks the point data for inconsistency problems and removes blanks.
#' @param rasters A string of raster file names.
#' @param points The name of a .csv file.
#' @param extents_raster A raster of the desired study extent.
#' @return A list of objecgs predictors (a raster stack) and plots (a data.table).
#' @export
#' @import data.table
#' @import bit64
#' @examples
#' plots_import(input_rasters,input_points, extents_raster)

plots_import <- function(predictors, plots, extents_raster){
	xy <- plots[, .(p.lon, p.lat)]
	dt <- plots[, !c("V1","p.lat","p.lon"), with=FALSE]
	spdt <- sp::SpatialPointsDataFrame(
		coords = xy,
		data = dt,
		proj4string = sp::CRS(
			"+proj=longlat +datum=WGS84"))
	spdt <- raster::crop(
		spdt,
		extents_raster)
	plots_raster <- raster::rasterize(
		x = spdt,
		y = predictors,
		field = 'treecount',
		fun=sum,
		background = 0)
	spdt <- rasterToPoints(plots_raster,
				fun=NULL,
				spatial=TRUE)
	plots <- as.data.table(
		raster::extract(predictors,
			spdt,
			method='simple',
			sp=TRUE))
	plots
}

# TDL## examples need data import step or use default data
