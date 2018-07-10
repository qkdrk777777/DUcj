#' Missing value processing
#'
#' @param na.all Whether or not to remove at least one missing value
#' @return Data without missing values
#' @examples
#' a<-c(NA,NA,NA,NA,1);b<-c(NA,NA,NA,1,2);c<-c(NA,NA,1,2,3);d<-c(NA,1,2,3,4)
#' (data<-data.frame(a,b,c,d))
#' na_rm(data)
#' na_rm(data,na.all=TRUE)
#' @export
na_rm<-function(data,na.all=F)
{if(na.all)na.exclude(data)
  else data[as.logical(apply((is.na(data)==F),1,sum)),]}

#stats:::na.exclude.default
#methods('na.exclude')

