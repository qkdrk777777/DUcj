#' K-fold cross Validation
#'
#' @param k=number of folder
#' @return train data and test data of list form data.
#' @examples cv.k_fold(iris,4,print=TRUE)
#' @export
cv.k_fold<-function(data,k,tr=list(),te=list(),print=F)
{n=nrow(data)
fold<-split(sample(1:n),rep(1:k,length=n))
for(i in 1:k)
{te[[i]]<-data[fold[[i]],]
tr[[i]]<-data[-fold[[i]],]}
if(print)list(te=te,tr=tr)
else l<-list(te=te,tr=tr)
}
