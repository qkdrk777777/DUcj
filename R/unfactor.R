#' change 'factor type data' to 'character type data'
#'
#' @param x a factor type data.
#' @return character type data.
#' @examples
#' unfactor(iris[,4])
#' unfactor(iris[,5])
#' @export
unfactor <- function(x){
  if (is.factor(x)){
    return(levels(x)[x])
  }else{
    stop("'input data' is not foctor type")
    return(x)
  }}





#a
