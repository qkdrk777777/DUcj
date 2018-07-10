#' sieve of Eratosthenes2
#'
#' @param n is range
#' @export
sieve2<-function(n=200,t=NULL,start=2){
  x<-start:n
  while(length(x)!=0)
  {t<-c(t,start)
  for(i in start)
  {x<-x[x%%i!=0]
  start<-x[1]
  }}
  return(t)
}
