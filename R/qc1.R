#' qc1_1
#'
#' @return overlab of plot
#' @export
qc1<-function(a){
  t<-NULL;k=1
  for(i in 1:(length(a)-1))
    if(a[i]!=a[i+1]){t[k]=i;k=k+1}
  (t=c(1,t))

  aa<-rep(0,length(a));i=1;n=0

  while(if(!is.na(a[i+n+1]))a[i]==a[i+n+1] else F){n=n+1
  if(i+n+1>length(a))break}
  (aa[i]<-n)
  for(i in t+1){n=0
  while(if(!is.na(a[i+n+1]))a[i]==a[i+n+1] else F){n=n+1
  if(i+n+1>length(a))break}
  aa[i]<-n}

  if(a[1]==a[2])aa[2]<-0

  for(kk in setdiff(unique(aa),0)){
    q<-sort(which(aa==kk))
    for(k in 1:length(q)){
      aa[q[k]:(q[k]+kk)]<-rep(kk,kk)
    }}
  return(aa)
}
