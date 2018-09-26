library(rvest)

URL <- ("http://jy29811354.pixnet.net/blog")


title <- c(1: 9)
for (x in c(1: 8)) {
  title.temp <- read_html(URL[x])
  
  title.temp <- html_nodes(title.temp, ".title")
  title.temp <- html_text(title.temp)
  title.temp <- title.temp[c(1: 9)]
  title <- rbind(title, title.temp)
  
}

title <- as.data.frame(title)
rownames(title) <- title.name
save(title, file='website_title.RData')
