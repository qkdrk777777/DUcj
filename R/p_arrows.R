#' arrows is overlay in plot
#'
#' @param non parameters.
#' @return overlab of plot
#' @examples
#' plot(1)
#' p_arrows()
#' @export
p_arrows<-function(length=.25,angle=30,code=2,col=par('fg'),lty=par("lty"),lwd=par("lwd")){
l<-locator(2)
arrows(l$x[1],l$y[1],l$x[2],l$y[2],length=length,angle=angle,code=code,col=col,lty=lty,lwd=lwd)}
#setwd('C:\\Users\\changje\\Documents\\jcj\\DUcj')
#devtools::document()

