#' Calculates a psuedo R2 value.
#' @param model A glm model object
#' @return Object r2 The Pseudo R^2 value
#' @export
#' @examples
#' psuedo_r2(glm_model)

psuedo_r2 <- function(model){
	r2 <- 1-model$deviance/model$null.deviance
	r2
}
