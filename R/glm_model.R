#' Takes the plots data.table and runs a GLM model.
#'
#' @param data A data.table object.
#' @param inputs A string of dependent and independant variables
#'
#' @return A  glm model object.
#' @examples
#' glm_model(input_model, input_formula)
#'
glm_model <- function(inputs, formula){
	model <- glm(
		formula = paste0(formula),
		data=inputs,
		family=poisson)
	model
}
