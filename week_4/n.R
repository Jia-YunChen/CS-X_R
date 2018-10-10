knitr::opts_chunk$set(echo = TRUE)
library(xml2)
library(rvest)
library("NLP")
library("tm")
library("SnowballC")
library("RColorBrewer")
library("wordcloud")
URL <- "https://www.bilibili.com/read/cv145602/"
title <- read_html(URL) %>% html_nodes(".artical-holder") %>% html_text()
docs <- Corpus(VectorSource(title))
inspect(docs)
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing = TRUE)
d <- data.frame(word = names(v),freq = v)

head(d, 10)
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, removeNumbers)

docs <- tm_map(docs, removePunctuation)

#docs <- tm_map(docs, toSpace, 'Uncategorized')

new.dtm <- TermDocumentMatrix(docs)
new.m <- as.matrix(new.dtm)
new.v <- sort(rowSums(new.m),decreasing = TRUE)
new.d <- data.frame(word = names(new.v),freq = new.v)
head(new.d, 10)
set.seed(1111)
wordcloud(words = new.d$word, freq = new.d$freq, min.freq = 1, 
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))

