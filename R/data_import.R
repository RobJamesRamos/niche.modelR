#' Imports the raster and point layers.
#' Creates a raster stack.
#' Checks the point data for inconsistency problems and removes blanks.
#' @param rasters A string of raster file names.
#' @param points The name of a .csv file.
#' @return A list of objecgs predictors (a raster stack) and plots (a data.table).
#' @examples
#' data_import(input_rasters,input_points)

# if(!require(data.table)){
# 	install.packages("data.table",repos = "https://cloud.r-project.org")
# 	library(data.table)}
data_import <- function(rasters, points){
	predictors <- stack(paste0(rasters))
	plots <- na.omit(fread(paste0(points)))
list(predictors,plots)
}
