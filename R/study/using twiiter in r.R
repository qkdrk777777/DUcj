
library(twitteR)
#keyword <- enc2utf8(keyword)
#install.packages('twitteR')

api_key<-"tIHi4OgXo7rmWMLtQPnxtLisS"
api_secret<-"a2RnhXkpeeKPPTKKhYqv1MdCDL5cz8L6DCtlcnZyYR0pMkf0bu"
access_token<-"918738742587699200-J4xSSA9u7ujmd9l37qsNK57QsDTD88E"
access_token_secret<- "JDKI53Po9kLE9bI0EIWfK3d6EbkaCr3R906H9eYyVLtKJ"
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)
1
keyword<-'미투';n=5000
keyword<-enc2utf8(keyword)
daegu.tw<-searchTwitter(keyword,since="2017-10-01",n=n,lang=ip_length)
daegu.tw[1:3]
#tweet<-daegu.tw[[1]]
#tweet$getScreenName()
#tweet$getText()

daegu.df<-twListToDF(daegu.tw)
daegu.text<-daegu.df$text
head(daegu.text,3)
#install.packages("tm")
library(tm)
txt<-system.file('texts','txt',package="tm")
ovid<-Corpus(DirSource(txt),readerControl=list(language='kor'))
#getReaders()

my.corpus<-Corpus(VectorSource(daegu.text))
my.corpus[[1]]
inspect(my.corpus[1:3])

#getTransformations()
#빈공간 제거
my.corpus<-tm_map(my.corpus,stripWhitespace)
my.corpus<-tm_map(my.corpus,content_transformer(tolower))
#my.corpus<-tm_map(my.corpus,stripWhitespace)
#my.corpus<-tm_map(my.corpus,tolower)
#my.corpus<-tm_map(my.corpus,PlainTextDocument)
#inspect(my.corpus[1:3])
#@로 시작되는 리트윗 아이디제거
mycorpus<-tm_map(my.corpus,content_transformer(gsub),pattern="@[[:graph:]]*:",replacement="")
inspect(my.corpus[1:3])
#url제거
my.corpus<-tm_map(my.corpus,content_transformer(gsub),pattern="http\\S*",replacement="")
inspect(my.corpus[1:3])
#문장 부호 및 구두점 제거
my.corpus<-tm_map(my.corpus,removePunctuation)
inspect(my.corpus[1:3])
#소문자 변경
my.corpus<-tm_map(my.corpus,content_transformer(tolower))
inspect(my.corpus[1:3])
#특정 단어 제거
my.corpus<-tm_map(my.corpus,removeWords,stopwords('en'))
inspect(my.corpus[1:3])
mystopword<-c(stopwords('en'),'rt','via','even')
my.corpus<-tm_map(my.corpus,removeWords,mystopword)
inspect(my.corpus[1:3])

dict.corpus<-my.corpus
#install.packages("SnowballC")
library(SnowballC)
removeTwit <- function(x) {gsub("@[[:graph:]]*", "", x)}
my.corpus<-lapply(my.corpus,removeTwit)
my.corpus<-Corpus(VectorSource(my.corpus))
my.corpus<-tm_map(my.corpus,stemDocument)
inspect(my.corpus[1:3])

stemCompletion_mod<-function(x,dict)
{PlainTextDocument(stripWhitespace(paste(stemCompletion(unlist(strsplit(as.character(x)," ")),dictionary=dict, type='first'),sep="",collapse=" ")))}
my.corpus<-lapply(my.corpus,stemCompletion_mod,dict=dict.corpus)
my.corpus<-Corpus(VectorSource(my.corpus))
inspect(my.corpus[1:2])
#install.packages(c('KoNLP','rJava'))
library(rJava);library(KoNLP)
my.TDM<-TermDocumentMatrix(my.corpus)
#install.packages('wordcloud')
library(wordcloud)
my.TDM.m<-as.matrix(my.TDM)
term.freq<-sort(rowSums(my.TDM.m),decreasing=T)
n<-unlist(str_extract_all(names(term.freq),'\\p{Hangul}+'))
n<-n[nchar(n)>2]
nn<-as.numeric(sort(table(n),decreasing = T))
wordcloud(words=n,freq=nn,min.freq=15,random.order=F,colors=brewer.pal(8,'Dark2'),bg='transparent')



