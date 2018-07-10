library(data.table)
for(i in c("ML","HL","MSMS","PEP","MqNormHM","MixHM","RawHM","AbsHM","SepAbsHM"))
{
  j<-ifelse(i %in% c("ML","HL","MSMS","PEP","MqNormHM"),paste("Rel",i,sep=""),i)
  setnames(get(j), paste(i,colnames(get(j)),sep=""))


setwd('C:/Users/qkdrk/Documents/카카오톡 받은 파일')
list<-list.files(pattern='.csv')
data<-read.csv(list[1],header=T,stringsAsFactors = F)
library(stringr)
setnames(data,colnames(get('data'))[1:2],gsub('[:punct:.A-z]','',colnames(get('data'))[1:2]))
colnames(data)
