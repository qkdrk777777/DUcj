#' Cross Validation
#'
#' @examples data<-cv(iris,0.2,0.8,print=TRUE)
#' a<-NULL
#' for(i in 1:length(data))
#' a[i]<-nrow(data[[i]])
#' @export
cv<-function(data,test=0.3,train=0.7,valid=0,print=F){
  if(test+train+valid!=1)
    stop('The proportions train, test, and valid data are not correct.')
  n=nrow(data)
  test_data<-data[sample(1:n,n*test),]
  train_data<-data[sample(1:n,n*train),]
  valid_data<-data[sample(1:n,n*valid),]
  nrow<-c(nrow(test_data),nrow(train_data),nrow(valid_data))
  if(print==T) list(test_data,train_data,valid_data)
  else l<-list(test_data,train_data,valid_data)
}


