#' continus duplicate change of text
#'
#' @param text is select duplicate text
#' @param b is matrix form data.
#' @param input is change text.
#' @return overlab of plot
#' @examples
#' b<-NULL
#' for(i in 1:5){
#'   (a<-sample(c(0,100),10,replace=T))
#'     b<-rbind(b,a)}
#'
#'         cont_duplicate(b,3,NA,text=0)
#' @export
cont_duplicate<-function(b,colnum,input,text,t=NULL,j=0){
  while(j!=(nrow(b))){
    j=j+1
    if(j==1){if(b[j,colnum]==b[j+1,colnum])if(
      b[j,colnum]==text)t=c(t,j)}else if(j==nrow(b)){
        if(b[j,colnum]==b[j-1,colnum])if(b[j,colnum]==text)t=c(t,j)}else if(
          (b[j,colnum]==b[j-1,colnum])|b[j,colnum]==b[j+1,colnum])if(b[j,colnum]==text)t=c(t,j)
  }
  b[t,colnum]<-input
  return(b)
}

