#' MAD
#' @return overlab of plot
#' @export
mad<-function(v,na.rm=T){
  MAD=median(abs(v-median(v,na.rm=na.rm)),na.rm=na.rm)
  return(MAD)
  }

