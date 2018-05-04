#' Takes the plots data.table and runs a GLM model.
#' @param inputs A data.table object.
#' @param formula A string of dependent and independant variables
#' @return A  glm model object.
#' @export
#' @examples
#' glm_model(input_model, input_formula)
#'
glm_model <- function(inputs, formula){
	model <- glm(
		formula = eval(formula),
		data=inputs,
		family=poisson)
	model
}

# TDL## your parameter names don't match your argument names
