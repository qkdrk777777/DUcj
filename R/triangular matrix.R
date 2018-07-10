#' matrix to a triangular matrix
#'
#' @param x is numerix matrix form
#' @return upper(lower) triangular matrix
#' @examples
#' x<-matrix(1,nrow=4,ncol=3)
#' tri(x)
#' @export
tri<-function (x, diag =TRUE,upper=T) {
  x <- as.matrix(x)
  if(upper==T)
  {if (diag) x[row(x) > col(x)]<-0
  else x[row(x) >= col(x)]<-0}
  else {
    if(diag) x[row(x)<col(x)]<-0
    else x[row(x)<=col(x)]<-0
  }
  return(x)
}

