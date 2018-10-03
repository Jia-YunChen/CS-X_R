knitr::opts_chunk$set(echo = TRUE)
library(ggplot2)
iris
ggplot(data = iris, aes(x = Sepal.Width),(y = 'Num')) +  geom_bar(fill = 'lightblue', colour = 'black')
ggplot(data = iris, aes(Sepal.Width, Sepal.Length)) +  labs(x = 'Sepal Width', y = 'Sepal Length', title = 'Iris')+geom_jitter(width = 2, size = .25)

kind <- iris[iris$Species %in% c("setosa", "versicolor", "virginica"), ]
xx <- ggplot(iris, aes(Sepal.Width, Sepal.Length)) + labs(title = 'IrisData')
xx + geom_jitter(aes(col = Species))

kind <- iris[iris$Species %in% c('setosa', 'versicolor', 'virginica'), ]
xx <- ggplot(iris, aes(Sepal.Width, Sepal.Length)) + 
  labs(title = 'Iris')
xx+geom_jitter(aes(col = Species, size = Petal.Width*Petal.Width))

