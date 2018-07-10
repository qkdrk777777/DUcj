#' Ganerate matrix of cofactor from A.(or adjont of a matrix A)
#'
#' @param A is numerix matrix
#' @return cofactor
#' @examples A<-matrix(c(2,-1,1,1,2,0,-3,-2,4),nrow=3,ncol=3)
#' cofactor(A)
#' cofactor(A,adj=TRUE)
#' @export
cofactor<-function(A,adj=F){
  dim<-dim(A)
  if(setequal(dim,c(2,2))){
    if(adj)
    {B<-matrix(c(A[2,2],-A[2,1],-A[1,2],A[1,1]),nrow=2)}
    else B<-matrix(c(A[2,2],-A[1,2],-A[2,1],A[1,1]),nrow=2)
  }
  else{
    B=matrix(NA,nrow=dim[1],ncol=dim[2])
    if(adj){
      for(i in 1:dim[1])
      {for(j in 1:dim[2]){B[j,i]<-(-1)^(i+j)*det(A[-i,][,-j])}}
    }
    else{
      for(i in 1:dim[1])
      {for(j in 1:dim[2]){B[i,j]<-(-1)^(i+j)*det(A[-i,][,-j])}}
    }}
  return(B)}



