# 1) Imports the raster and point layers.
# 2) Creates a raster stack
# 3) Checks the point data for inconsistency problems and removes blanks
#
# Args
# rasters            A string of raster file names
# points             The name of a .csv file
#
# Output
# predictors               A raster stack
# plots                    A data.table
if(!require(data.table)){
	install.packages("data.table",repos = "https://cloud.r-project.org")
	library(data.table)}
data_import <- function(rasters, points){
	predictors <- stack(paste0(rasters))
	plots <- na.omit(fread(paste0(points)))
list(predictors,plots)
}
