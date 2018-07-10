#package('pracma');package('Matrix')
package('installr')
updateR()
#비동차연립방정식(nonhomogeneous system of linear equations) 해 구하기
  #b=O인경우 동차연립방정식 아닌경우를 비동차연립방정식이라 함.
A<-matrix(c(2,-6,-8,3,-8,-14,4,-11,-17),ncol=3,byrow=T)
b<-matrix(c(10,8,15),nrow=3)
solve(A,b)

#해가 없는 경우
A<-matrix(c(2,1,1,1,-2,-7,4,3,5),nrow=3,byrow=T)
b<-matrix(c(7,-4,22),nrow=3)
solve(A,b)
#해가 무수히 많은 경우
A<-matrix(c(2,1,1,1,-2,-7,4,3,5),nrow=3,byrow=T)
b<-matrix(c(7,-4,17),nrow=3)
solve(A,b)

#동차연립방정식
  #비자명해는 구할 수 없다.
A<-matrix(c(2,3,8,1,1,2,5,1,-6),nrow=3,byrow=T)
b=matrix(0,nrow=3,ncol=1)
det(A)
solve(A,b)
  #자명해
A<-matrix(c(3,-6,9,2,3,-4,4,-1,-2),nrow=3,byrow=T)
b=matrix(0,nrow=3,ncol=1)
det(A)
solve(A,b)
#역행렬(inverse matrix)구하기
solve(A)

#연립 일차방정식의 계수행렬 A가 가역이고 정방행렬이면 B는 오직 한개의 해를 갖는다.
#AX=B이고 가역이므로
#X=t(A)%*%B

#행렬식 구하기
A<-matrix(c(3,2,4,-2,0,-1,1,-2,5),nrow=3,byrow=T)
det(A)

#n*n행렬식의 두 행(열)을 서로 바꾼 행렬식은 원래 행렬식에 -1을 곱한것과 같다.
B<-rbind(A[2,],A[1,],A[3,])
det(B)

#i행(열)을 제외한 나머지 성분은 모두 같고 C의 i행(열)의 성분은 A와 B의 i행의 선분을 차례로 더한 것이라 하면
#det(C)=det(A)+det(B)
A<-matrix(c(3,-2,5,1,2,4,2,-3,0),nrow=3,byrow=T)
B<-rbind(A[1,],A[2,],c(1,2,3))
C<-rbind(A[1,],A[2,],A[3,]+B[3,])
det(C)==det(A)+det(B)

#정방행렬 A가 가역이기 위한 필요충분조건은 det(A)!=0이다.#example
A<-matrix(c(1,2,3),nrow=3,ncol=3,byrow=T)
det(A)
solve(A)

det(tri(A))
solve(tri(A))

#정방행렬 A,B에 대하여 det(A%*%B)==det(A)*det(B)이다.
(A<-matrix(sample(9,9),nrow=3,ncol=3))
(B<-matrix(sample(9,9),nrow=3,ncol=3))
det(A%*%B)
det(A)*det(B)

#정방행렬 A가 가역이면 그 역행렬은 cofactor(A,adj=T)/det(A)이다.
A<-matrix(c(2,-1,1,1,2,0,-3,-2,4),nrow=3,ncol=3)
det(A)
#det(A)!=0이므로 A는 가역
solve(A)
cofactor(A,adj=T)/det(A)

#고유값(eigenvalue) 고유벡터(eigenvector)
#A is m by n matrix , x는 영벡터가 아닌 벡터.
#스칼라 lambda에 대해 A%*%x=lambda*x를 만족할 때
#lambda를 고유값 x를 고유벡터 라고 한다.

#따라서 (A-lambda*I)%*%X=O이므로
#30번째 줄#연립 일차방정식의 계수행렬 A가 가역이고 정방행렬이면 B는 오직 한개의 해를 갖는다.
#det(A-lambda*I)!=0이면 가역이므로 오직 한개의 자명해를 갖는다. 따라서 위 가정에 만족하지 못함.(70줄의 x)
#det(A-lambda*I)=0이면 비가역이므로 비자명해를 갖지 않는다.

#가역
A<-matrix(c(3,2,4,-5,-4,-7,5,6,9),nrow=3)
det(A)
b<-matrix(0,nrow=3,ncol=1)
solve(A,b)
#비가역
A<-matrix(c(2,1,5,3,1,1,8,2,-6),nrow=3)
det(A)
solve(A,b)

#det(A-lambda*I)=(A[1,1]-lambda)*(A[2,2]-lambda)-A[1,2]*A[2,1]=lambda^2-(A[1,1]+A[2,2])*lambda+(A[1,1]*A[2,2]-A[1,2]*A[2,1])
#lambda^2-(A[1,1]+A[2,2])*lambda+(A[1,1]*A[2,2]-A[1,2]*A[2,1])이를 특성방정식이라 한다.

A<-matrix(c(1,1,3,1,1,-3,2,-1,0),nrow=3)
eigen(A)

#서로 다른 고유값에 대응하는 고유벡터들은 서로 일차 독립이다.

A=matrix(c(4,3,2,5),nrow=2)
eigen<-eigen(A)
A

eigen$vectors%*%diag(eigen[[1]]^2)%*%solve(eigen$vectors)
A<-matrix(c(1,2,3),nrow=3,ncol=3)


A<-matrix(c(0,1,0,1,0,0,0,0,1),nrow=3)
(eigen<-eigen(A))
eigen$vectors%*%diag(eigen[[1]])%*%solve(eigen$vectors)


#마르코프 연쇄
package('markovchain')
statesNames=c('a','b')
mcA<-new("markovchain",transitionMatrix=matrix(c(0.9,0.1,0.2,0.8),byrow=T,nrow=2,dimnames = list(statesNames,statesNames)))
mcA^2

statesNames=c("a","b","c","d")
matrice<-matrix(c(0.25,0.75,0,0,0.4,0.6,0,0,0,0,0.1,0.9,0,0,0.7,0.3),
                nrow=4, byrow=TRUE)
mcC<-new("markovchain", states=statesNames, transitionMatrix=matrice)
mcD<-new("markovchain", transitionMatrix=matrix(c(0,1,0,1), nrow=2,byrow=TRUE))


package('MonteCarlo')
#example(MonteCarlo)
test_func<-function(n,loc,scale){
  sample<-rnorm(n, loc, scale)
  stat<-sqrt(n)*mean(sample)/sd(sample)
  decision<-abs(stat)>1.96
  return(list("decision"=decision))
}

# Example without parallization
n_grid<-c(50,100,250,500)
loc_grid<-seq(0,1,0.2)
scale_grid<-c(1,2)

param_list=list("n"=n_grid, "loc"=loc_grid, "scale"=scale_grid)
erg<-MonteCarlo(func=test_func, nrep=250, param_list=param_list, ncpus=1)
summary(erg)

rows<-c("n")
cols<-c("loc","scale")
MakeTable(output=erg, rows=rows, cols=cols, digits=2)

