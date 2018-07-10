data<-'No Overlap'
data<-'Translation'
#data<-'번역'
library(stringr)
library(RCurl)
library(RSelenium)
library(XML)
library(rvest)
pJS <- wdman::phantomjs(port = 4567L)
koen=T
if(length(unlist(str_extract_all(data,'\\p{Hangul}+')))==0)koen=F
remDr <- remoteDriver(port=4567L, browserName = 'chrome')
remDr$open()

if(koen==T)remDr$navigate(paste0('https://translate.google.co.kr/?hl=#ko/en/'))else remDr$navigate(paste0('https://translate.google.co.kr/?hl=#en/ko/'))
#remDr$screenshot(display = T)
tr<-remDr$findElement(using='css',value='textarea#source')
tr$sendKeysToElement(list(paste(data)))
Sys.sleep(2)
source<-remDr$getPageSource()[[1]]
a<-read_html(source)%>%html_nodes(css='.short_text#result_box')%>%html_text()
a<-paste(a,collapse='')
remDr$goBack()

remDr$close()
pJS$stop()

a
