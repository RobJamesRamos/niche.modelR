#' Calculates a psuedo R2 value from the output of a glm.
#' The psuedo R2 is equal to 1 - (deviance/null deviance)
#' @param model A glm model object
#' @return Object r2 The Pseudo R^2 value
#' @export
#' @examples
#' psuedo_r2(glm_model)

psuedo_r2 <- function(model){
	r2 <- 1-model$deviance/model$null.deviance
	r2
}
# TDL## vague description.  I wouldn't be able to remember the details of this function from the description.
