#' sieve of Eratosthenes
#'
#' @param n is range
#' @export
sieve<-function(n=200,l=NULL,p=NULL){
  t<-2:n
  for(i in 1:n)
  {p=min(t)
  t<-t[t%%p!=0]
  l=c(l,p)
  if(p^2>n)break
  }
  c(l,t)
}

