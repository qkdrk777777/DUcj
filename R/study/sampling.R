#임의추출
  #비복원추출
  sample(1:10,5)
  #복원추출
  sample(4:10,replace=T)
  #가중치 부여 0은 안나옴
  sample(1:8,7,prob=0:7)

#층화추출
package(sampling)
names(iris)
x<-strata(c("Species"),size=c(3,1,2),method='srswor',data=iris)
getdata(iris,x)

data(iris)
iris[,ncol(iris)+1]<-c(1,2)
x<-strata(c("Species",'V6'),size=c(1,1,1,1,1,1),method='srswor',data=iris)
getdata(iris,x)

#층화추출 2
package(doBy)
sampleBy(~Species,frac=0.1,data=iris)
#frac는 총데이터중 추출할 비율
#계통추출
sampleBy(~Species,frac=0.2,data=iris,systematic = T)


#분할표
a<-sample(letters,5)
table(a)
#분할표2
xtabs(a,b,c)
b<-getdata(iris,x)
t<-xtabs(ID_unit~Species,data=b)
t<-rbind(t,c(1,2,3))
#분할표의 합 구하기
margin.table(t,1)
margin.table(t,2)
margin.table(t)
