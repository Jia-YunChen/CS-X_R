#pca

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

tfidfnn <- read.csv("tfidf.csv")

tfidf <- as.matrix(tfidfnn[, 2: 39])
rownames(tfidf) <- tfidfnn[, 1]

colnames(tfidf) <- c("第一章", "第二章", "第三章", "第四章", "第五章", "第六章", "第七章", "第八章", "第九章", "第十章", "第十一章", "第十二章", "第十三章", "第十四章", "第十五章", "第十六章", "第十七章", "第十八章", "第十九章", "第二十章","第二一章", "第二十二章", "第二十三章", "第二十四章", "第二十五章", "第二十六章", "第二十七章", "第二十八章", "第二十九章", "第三十章", "第三十一章", "第三十二章", "第三十三章", "第三十四章", "第三十五章", "第三十六章", "第三十七章", "第三十八章", "第三十九章", "第四十章")

pca <- prcomp(t(tfidf), scale = T)

plot <- pca$x[, 1: 2]
plot <- as.data.frame(plot)

ggplot(plot, aes(x = PC1, y = PC2)) +
  geom_point() +
  geom_text(label = rownames(plot), family = "黑體-繁 中黑", size = 6)