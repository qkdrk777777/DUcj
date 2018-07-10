#기술통계
summary(cars)

package(pastecs)
stat.desc(cars)

package(psych)
describe(cars)

#분할표 만들기#범주형자료분석 예제
sex<-factor(c(rep(1,435+147),rep(2,375+134)),labels=c('female','male'))
t<-factor(c(rep(1,375),rep(2,147),rep(1,435),rep(2,134)),labels=c("Y","N"))
data<-data.frame(sex,t)
t2<-table(data)

#http://rfriend.tistory.com/129?category=605867
#F test
var.test(Price~Origin,data=Cars93)
# one sample t test
t.test(sleep$extra)
# two sample t test
t.test(extra~group,data=sleep)
# paired t test
t.test(extra~group,data=sleep,paired=T)

#prop.test
smokers<-c(83,90,129,70);patients<-c(86,93,136,82)
prop.test(smokers,patients)


#독립성검정
t2
chisq.test(t2)
#정확검정
diag(2,2)+1
#보기 2.6
fisher.test(diag(2,2)+1)
#정규성검정
shapiro.test(rnorm(1000))
#komogrov-smirnov test# 분포동일 검정
ks.test(rnorm(10),rnorm(20))
package('lawstat')
package(car)
#독립성검정
durbinWatsonTest(fit)
#등분산성검정
leveneTest(fit3)

ncvTest(fit)
#이상치 검정
outlierTest(fit)
#cooks의 거리
cooks.distance(fit)
#지래값
leveragePlots(fit)

#표준화잔차 플롯
spreadLevelPlot(fit)
#https://rstudio-pubs-static.s3.amazonaws.com/190997_40fa09db8e344b19b14a687ea5de914b.html
names(iris)

