#' qc3range
#'
#' @return overlab of plot
#' @export
qc3range<-function(v,k=5,na.rm=T){
 v_l=  mean(v,na.rm=na.rm)-k*sd(v,na.rm=na.rm)
 v_u=  mean(v,na.rm=na.rm)+k*sd(v,na.rm=na.rm)
 del<-c(lower=v_l,upper=v_u)

 return(del)
}
