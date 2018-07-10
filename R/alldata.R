#' Reading is alldata
#'
#' @param dir is directory.
#' @return alldata  #Sys.setenv( JAVA_HOME = 'C:\\Program Files\\Java\\jre1.8.0_151' )
#' @export
alldata<-function(dir,pattern=NULL,header=T,sep=',',skip=0,encoding="unknown",stringsAsFactors=F,t.data=NULL,temp=NULL,
                  sheetIndex=1){
setwd(dir)
list<-list.files(pattern=pattern)
form<-unique(substr(list,nchar(list)-2,nchar(list)))
if(form=='csv'){
  for(i in 1:length(list))
  {assign('temp',read.csv(list[i],header=header,sep=sep,skip=skip,encoding=encoding,stringsAsFactors =stringsAsFactors))
  t.data<-rbind(t.data,temp)}
  }
else if(form=='xml'){if(require(XML)!=T)install.packages('XML')
  for (i in 1:length(list))
  {assign('temp',xmlToDataFrame(list[i],stringsAsFactors = stringsAsFactors))
  t.data<-rbind(t.data,temp)}}

else if(form%in%c('xls','lsx')){if(!require(xlsx)) install.packages('xlsx')
  for(i in 1:length(list))
  {assign('temp',read.xlsx(list[i],sheetIndex=jsheetIndex,header=header,encoding=encoding,startRow = skip+1))
    t.data<-rbind(t.data,temp)}}

else {
  for(i in 1:length(list))
  {assign('temp',read.table(list[i],stringsAsFactors = stringsAsFactors,encoding=encoding,skip=skip,sep=sep,header=header))
  t.data<-rbind(t.data,temp)}}
  t.data


}
#install.packages('data.table')
#library(data.table)
#example("data.table")
#data.table(list[1])
#alldata("C:\\Users\\changje\\Desktop\\병아리\\data\\pop",skip=2,pattern='+101')
#alldata("C:/Users/changje/Desktop/병아리/data/school",pattern='.xml')
#setwd('C:/Users/changje/Documents/jcj/Ducj')
#devtools::document()
