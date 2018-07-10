#' MAD
#' @return overlab of plot
#' @export
mad_range<-function(v,k,na.rm=T){
  mad_l<-median(v,na.rm=na.rm)-k*1.4826*mad(v,na.rm=na.rm)
  mad_u<-median(v,na.rm=na.rm)+k*1.4826*mad(v,na.rm=na.rm)
  return(c(lower=mad_l,upper=mad_u))

}

