library('NLP')
library('tm')
library('SnowballC')
library('RColorBrewer')
library('jiebaRD')
library('jiebaR')
library('slam')
library('Matrix')
library('tidytext')
library('NLP')
library('ggplot2')
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
d <- data.frame(word = names(v), freq = v)

plot <- d[1: 15, 1: 2]
plot$word <- factor(plot$word, levels = plot$word[order(- plot$freq)])
ggplot(plot, aes(x = word, y = freq)) + 
  geom_bar(stat="identity", width=.5, fill="tomato3") + 
  theme(text=element_text(size=16))
