knitr::opts_chunk$set(echo = TRUE)
library(ggplot2)
diamonds
ggplot(data = diamonds, aes(x = cut)) +  geom_bar(fill = "lightblue", colour = "black")
ggplot(data = diamonds, aes(x = price)) +  geom_histogram()
ggplot(data = diamonds, aes(x = table, y=depth)) +  geom_point()
ggplot(diamonds, aes(x=clarity, y=depth)) +  geom_boxplot()
library(ggplot2)
library(GGally)
library(scales)
library(memisc)

# 從數據集獲取10000個樣本數據進行分析
set.seed(20022012)
diamond_samp <- diamonds[sample(1:length(diamonds$price), 10000), ]
ggpairs(diamond_samp,lower= list(continuous = wrap("points", shape = I('.'))),
        upper = list(combo = wrap("box", outlier.shape = I('.'))))

