svm
knn
타깃변수 있을 때 분류모델

#margin
plot(1,type='n')
abline(a=0.1,b=1,lty=2)
abline(a=0,b=1)
abline(a=-0.1,b=1,lty=2)


library(e1071)

m1<-svm(Species~.,data=iris,type='C-classification')
summary(m1)

#gamma =1/dim

x<-iris[,-5]

pred<-predict(m1,x)
y<-iris[,5]
table(pred,y)
iris$Sepal.Width
plot(m1,iris,Petal.Width~Petal.Length,slice=list(Sepal.Width=3,Sepal.Length=4))

#커널함수
#x의 기저함수
#input Space-> Feature Space
#radial , polynomial, sigmoid
#install.packages('caret')
#library(caret)
set.seed(1000)
t<-sample(1:nrow(iris),size=nrow(iris)*2/3,replace = F)
train=iris[t,]
test=iris[-t,]

m1<-svm(Species~., data=train,type='C-class')
m2<-svm(Species~.,data=train,kernel='polynomial',type='C-class')
m3<-svm(Species~.,data=train,kernel='sigmoid',type='C-class')
summary(m1)
summary(m2)
pred1<-predict(m1,test)
pred2<-predict(m2,test)
pred3<-predict(m3,test)
confusionMatrix(pred1,test$Species)
confusionMatrix(pred2,test$Species)
confusionMatrix(pred3,test$Species)

