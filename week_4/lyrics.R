knitr::opts_chunk$set(echo = TRUE)
library(xml2)
library(rvest)
library("NLP")
library("tm")
library("SnowballC")
library("RColorBrewer")
library("wordcloud")
library(jiebaR)
library(jiebaRD)
URL <- "https://www.juzimi.com/tags/26437"
title <- read_html(URL) %>% html_nodes(".xlistju") %>% html_text()
URL <- "https://www.juzimi.com/tags/26437?page=1"
title.temp <- read_html(URL) %>% html_nodes(".xlistju") %>% html_text()
title <- append(title, title.temp)
URL <- "https://www.juzimi.com/tags/26437?page=2"
title.temp <- read_html(URL) %>% html_nodes(".xlistju") %>% html_text()
title <- append(title, title.temp)
URL <- "https://www.juzimi.com/tags/26437?page=3"
title.temp <- read_html(URL) %>% html_nodes(".xlistju") %>% html_text()
title <- append(title, title.temp)
URL <- "https://www.juzimi.com/tags/26437?page=4"
title.temp <- read_html(URL) %>% html_nodes(".xlistju") %>% html_text()
title <- append(title, title.temp)
URL <- "https://www.juzimi.com/tags/26437?page=5"
title.temp <- read_html(URL) %>% html_nodes(".xlistju") %>% html_text()
title <- append(title, title.temp)
docs <- Corpus(VectorSource(title))

toSpace <- content_transformer(function (x , pattern ){
  return (gsub(pattern,'',x))
})

mixseg = worker()
jieba_tokenizer=function(d){
  unlist(segment(d[[1]],mixseg))
}
docs <- tm_map(docs, toSpace, "的")
docs <- tm_map(docs, toSpace, "你")
docs <- tm_map(docs, toSpace, "我")
docs <- tm_map(docs, toSpace, "他")
docs <- tm_map(docs, toSpace, "还")
docs <- tm_map(docs, toSpace, "有")
docs <- tm_map(docs, toSpace, "不")
docs <- tm_map(docs, toSpace, "是")
docs <- tm_map(docs, toSpace, "谁")
docs <- tm_map(docs, toSpace, "了")
docs <- tm_map(docs, toSpace, "与")
docs <- tm_map(docs, toSpace, "又")
docs <- tm_map(docs, toSpace, "却")
docs <- tm_map(docs, toSpace, "也好")
docs <- tm_map(docs, toSpace, "在")
docs <- tm_map(docs, toSpace, "之")
docs <- tm_map(docs, toSpace, "都")
docs <- tm_map(docs, toSpace, "因")
docs <- tm_map(docs, toSpace, "为")
inspect(docs)

seg = lapply(docs, jieba_tokenizer)

freqFrame = as.data.frame(table(unlist(seg)))
wordcloud(freqFrame$Var1,freqFrame$Freq,
          scale=c(5,0.5),min.freq=1,max.words=50,
          random.order=FALSE, random.color=TRUE, 
          rot.per=0, colors=brewer.pal(8, "Dark2"),
          ordered.colors=FALSE,use.r.layout=FALSE,
          fixed.asp=TRUE)

