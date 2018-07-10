#특정문자 합치기
(a<-paste(1:5,'a',sep=''))
#edit(toString.default)

#하나로 만들기
(b<-paste(a,collapse=', '))
toString(a,width=8)

#구분자를 기준으로 나누기
(c<-strsplit(b,split=','))
unlist(c)
