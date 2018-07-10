#' lotto crawling use by html_nodes
#'
#' @param NONE
#' @return data
#' @examples
#' package('XML')
#' package('stringr')
#' package('rvest')
#' a='https://search.naver.com/search.naver?sm=tab_drt&where=nexearch&query='
#' b='%ED%9A%8C%EB%A1%9C%EB%98%90'
#' t<-html_all(a,j=789,b)
#' q<-use_text(t,css='.num_box',j=789)
#' qq=list()
#' for(i in 1:length(q))
#' {qq[[i]]<-strsplit(str_trim(q),split=" ")[[i]][1:6]}
#' qq
#'
#' package('XML')
#' package('stringr')
#' package('rvest')
#'  css_text(a,b,j=789,css='.num_box')
#' for(i in 1:length(q))
#' {qq[[i]]<-strsplit(str_trim(q),split=" ")[[i]][1:6]}
#' qq
#' @export

html_all<-function(a,b,j,url=list(),lines=list(),encoding='UTF-8'){
   package('XML')
   package('stringr')
   package('rvest')

  for(i in 1:j){
url[[i]]<-paste0(a,i,b)
lines[[i]]<-read_html(url[[i]],encoding=encoding)}
return(list(url,lines))}

use_text<-function(t,css,j,num=list())
{
  for(i in 1:j){ num[[i]]<-html_nodes(t[[2]][[i]],css=css)%>% html_text()}
  return(num)}

css_text<-function(a,b,j,css,encoding='UTF-8',num=list())
{   package('XML')
  package('stringr')
  package('rvest')

  for(i in 1:j){
    url<-paste0(a,i,b)
    lines<-read_html(url,encoding=encoding)
    num[[i]]<-html_nodes(lines,css=css)%>% html_text()}
  return(num)}

