library('NLP')
library('tm')
library('SnowballC')
library('RColorBrewer')
library('jiebaRD')
library('jiebaR')
library('slam')
library('Matrix')
library('tidytext')
library('wordcloud2')
library('wordcloud')
#library of text mining

#for(i in c(1:40)){
#  content.temp <- read.table(paste("new",i,".txt",sep=''))
#  content <- as.matrix(content.temp)
#  text <- content[1]
#}
content <- read.table("new1.txt")
content <- as.matrix(content)

cc <- worker()
token = function(d){
  unlist(segment(d[[1]], cc))
}
toSpace <- content_transformer(function(x, pattern) {
  return (gsub(pattern, " ", x))
})
#the delimeter of chinese

docs <- Corpus(VectorSource(token(content)))
docs <- tm_map(docs, removePunctuation)
docs <- tm_map(docs, removeNumbers)
docs <- tm_map(docs, stripWhitespace)

docs <- tm_map(docs, toSpace, '的')
docs <- tm_map(docs, toSpace, '了')
docs <- tm_map(docs, toSpace, '這')
docs <- tm_map(docs, toSpace, '是')
docs <- tm_map(docs, toSpace, '你')
docs <- tm_map(docs, toSpace, '我')
docs <- tm_map(docs, toSpace, '他')
docs <- tm_map(docs, toSpace, '這')
docs <- tm_map(docs, toSpace, '那')
docs <- tm_map(docs, toSpace, '在')

tdm <- TermDocumentMatrix(docs)
m <- as.matrix(tdm)
v <- sort(rowSums(m), decreasing = TRUE)
d <- as.data.frame(word = names(v), freq = v)

freqFrame = as.data.frame(table(unlist(d)))
wordcloud(freqFrame$Var1,freqFrame$Freq,
          scale=c(5,0.5),min.freq=2,max.words=200,
          random.order=FALSE, random.color=TRUE, 
          rot.per=0, colors=brewer.pal(8, "Dark2"),
          ordered.colors=FALSE,use.r.layout=FALSE,
          fixed.asp=TRUE)

#wordcloud(d)
