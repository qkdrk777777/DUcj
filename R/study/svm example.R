package(kernlab)
svm <- ksvm(Species~.,data=iris,type="C-bsvc",kernel="rbfdot",kpar=list(sigma=0.1),C=10,prob.model=TRUE)

predict(svm, iris[c(3, 10, 56, 68, 107, 120),-5], type = "probabilities")
predict(svm, iris[c(3, 10, 56, 68, 107, 120),-5], type = "decision")
predict(svm, iris[c(3, 10, 56, 68, 107, 120),-5])

k <- function(x, y) {
(sum(x * y) + 1) * exp(0.001 * sum((x - y)^2))
}
class(k) <- "kernel"
data("promotergene")
gene <- ksvm(Class ~ ., data = promotergene, kernel = k, C = 10, cross = 5)

package(e1071)
model <- svm(Species~., data=iris)
model

methods('svm')
pred <- predict(model, iris[, -5])
table(pred,iris$Species)

p <- predict(model, iris[c(3,10),-5], type = "response")
plot(cmdscale(dist(iris[,-5])), col = as.integer(iris[,5]),pch = c("o","+")[1:150 %in% model$index + 1])

