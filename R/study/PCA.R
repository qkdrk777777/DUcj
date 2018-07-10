methods('princomp')
#특이치분해
edit(stats:::prcomp.default)


sqrt(eigen(cov(iris[,-5]))$values)
prcomp(iris[,-5])

#고유값분해
edit(stats:::princomp.default)

a<-eigen(cov.wt(iris[,-5])$cov*(1-1/cov.wt(iris[,-5])$n.obs))
sqrt(a$values)
princomp(iris[,-5])




#2d, 3d, method 2개 통합해서 만들 것
