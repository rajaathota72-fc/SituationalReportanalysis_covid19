covidDf<-read.csv("/Users/rajaathota72/Desktop/covidreport/COVID 19 Containment measures data.csv")
View(covidDf)
str(covidDf)
summary(covidDf)
library(tm)
library(wordcloud)
corpus1<-Corpus(VectorSource(covidDf$Keywords))
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
corpus1<- tm_map(corpus1, toSpace, "\n")
corpus1<- tm_map(corpus1, toSpace, "¢")
corpus1<- tm_map(corpus1, toSpace, "\ne")
#Conversion to Lowercase
corpus1= tm_map(corpus1, PlainTextDocument)
corpus1= tm_map(corpus1, tolower)
#Removing Punctuation
corpus1= tm_map(corpus1, removePunctuation)
#Remove stopwords
corpus1= tm_map(corpus1, removeWords, stopwords("english"))
DTM1 <- TermDocumentMatrix(corpus1)
mat1 <- as.matrix(DTM1)
f1 <- sort(rowSums(mat1),decreasing=TRUE)
dat1 <- data.frame(word = names(f1),freq=f1)
dat1
wordcloud2(dat1, minRotation = -pi/3, minSize = 10,
           rotateRatio = 1)
corpus2<-Corpus(VectorSource(covidDf$Description.of.measure.implemented))
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
corpus2<- tm_map(corpus2, toSpace, "\n")
corpus2<- tm_map(corpus2, toSpace, "¢")
corpus2<- tm_map(corpus2, toSpace, "\ne")
#Conversion to Lowercase
corpus2= tm_map(corpus2, PlainTextDocument)
corpus2= tm_map(corpus2, tolower)
#Removing Punctuation
corpus2= tm_map(corpus2, removePunctuation)
#Remove stopwords
corpus2= tm_map(corpus2, removeWords, stopwords("english"))
DTM2 <- TermDocumentMatrix(corpus2)
mat2 <- as.matrix(DTM2)
f2 <- sort(rowSums(mat2),decreasing=TRUE)
dat2 <- data.frame(word = names(f2),freq=f2)
dat2
wordcloud2(dat2, minRotation = -pi/6, maxRotation = -pi/6, minSize = 10,
           rotateRatio = 1)
