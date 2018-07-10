#chartr
a<-'특정 값 치환하기 특정'

chartr('특정','어떤',a)
#문자 길이가 같아야 함
chartr('특정','값',a)

b<-' A B C  D E'
e<-chartr('A-C','e-g',b)

c<-'1 2 3 4'
(d<-chartr('1-3','4-6',c))
(d<-strsplit(d,split=' '))

sum(as.numeric(unlist((d))))
4+5+6+4

#casefold
e
casefold(e,upper=T)
casefold(e,upper=F)
#sub, gsub, grep,grepl,regexpr,gregexpr 생략

