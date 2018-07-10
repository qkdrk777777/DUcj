#Regression Analysis
names(cars)
fit<-lm(dist~speed,cars)

#회귀식
coef(fit)
#신뢰구간
confint(fit)
#요약
summary(fit)
#speed 값이 5, 10, 15일 때 신뢰구간
predict(fit,data.frame(speed=c(5,10,15)),interval='confidence')
#예측구간
predict(fit,data.frame(speed=c(5,10,15)),interval='prediction')
#회귀 직선 plot
plot(cars$speed,cars$dist,pch=16)
abline(fit,col=2,lwd=2)

#잔차
residuals(fit)
plot(predict(fit),residuals(fit))
#외적 표준화 잔차
rstudent(fit)
plot(predict(fit),rstudent(fit))
#아웃라이어 test
package(car)
outlierTest(fit)
#leverage value->hatvalues
plot(hatvalues(fit))
which.max(hatvalues(fit))

#다변량회귀
names(Orange)
fit2<-lm(age~Tree+circumference,Orange)
summary(fit2)

#분산팽창지수 (10보다 작아야 됨 아니면 다중공선성)
fit3<-lm(Sepal.Length~.,iris[,-5])
vif(fit3)
vif(fit2)

names(iris)
package(rgl)
plot3d(iris$Sepal.Length,iris$Sepal.Width,iris$Petal.Length,colors=iris$Species,col=1:3)

#비선형회귀
fit4<-lm(dist~speed+I(speed^2),cars)
fit5<-lm(dist~poly(speed,5),cars)
#분산분석
anova(fit,fit4,fit5)

#가변수 만드는 함수
contrasts(iris[,5])

#단계적 방법
#생략step()
#최적모델 제안
names(iris)
package(leaps)
package(mlbench)#data set 때문에 인스톨
BH<-BostonHousing
head(BH)
#rsq, rss,adjr2, cp, bic 출력 가능
summary(regsubsets(medv~.,data=BH))$c
summary(regsubsets(Sepal.Length~.,iris))$adjr2

