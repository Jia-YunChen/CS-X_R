#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library('shiny')
library('rsconnect')
library('shinythemes')
library('stringr')
library('png')

novel.tag <- c("1", "2", "3", "4", "5", "6", "7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40")


ui <- navbarPage(
  theme = shinythemes::shinytheme("superhero"),
  #shinytheme
  "射鵰英雄傳章節分析",
  
  tabPanel(
    "分析緣起",
    
    tags$h2("分析緣起"),br(),
    tags$h3("B05611001陳佳筠"),br(),br(),
    tags$h4("金庸是我最喜歡的作家，我自小是個典型的金庸迷，他的每本武俠小說都至少讀過五遍有餘，
            前陣子金庸逝世，我與同學因此以小說的腳色、內容為題聊了許久，使我萌生出要做這個分析的念頭，
            其中射鵰英雄傳是我閱讀的第一本金庸武俠，也是我覺得最經典的作品，因此選了這本作為報告內容，
            亦希望藉此小小的致敬金庸先生。"),br(),
    tags$h5("資料來源：龍騰世紀書庫, http://www.millionbook.net/wx/j/jingyong/sdyxz/index.html"),
    tags$h5("github:")
    ),
  
  tabPanel(
    "章節詞頻分析",
    tags$h4("選擇章節以觀看章節之文字雲，可以觀察各章節的鮮明變化，加以討論。"),br(),
    sidebarPanel(
      selectInput("wc", "章節選擇：",
                  choices = novel.tag),
      hr(),
      helpText("顯示不同章節之文字雲")
    ),
    mainPanel(
      imageOutput("image1")
    )
    ),
  
  

  
  tabPanel(
    "結論",
    tags$h4("射鵰英雄傳是金庸的第三部武俠小說，亦是他的第一部長篇小說(相對長篇)，
            雖然內容精彩，也是金庸小說中的經典，但分析後仍看得出以整書的情節編排而言，
            仍稍顯稚嫩，並沒有使用像後面長篇小說那樣較高難度的方法，而是很單一的
            以主角為軸，像\"打怪\"一般，一直筆直朝前，隨著腳色成長，才去碰到更多的
            人事物，見識武功更高的那一個世界，之後的目標是做完金庸的十四部小說，
            並認真研究金庸在情節編排的變化及成長。"),br(),
            
    mainPanel(
      imageOutput("image2")
    ),
    tags$h5("圖為溫瑞安先生在金庸逝世後寫下之悼詞")
    )
    )

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$image1 <- renderImage({
    if (is.null(input$wc))
      return(NULL)
    
    if (input$wc == novel.tag[1]) {
      return(list(
        src = paste("wordcloud", 1, ".png", sep = ""),
        height = 500,
        contentType = "image/png",
        alt = novel.tag[1]
      ))} else if (input$wc == novel.tag[2]) {
        return(list(
          src = paste("wordcloud",2, ".png", sep = ""),
          height = 500,
          contentType = "image/png",
          alt = novel.tag[2]
        ))} else if (input$wc == novel.tag[3]) {
          return(list(
            src = paste("wordcloud", 3, ".png", sep = ""),
            height = 500,
            contentType = "image/png",
            alt = novel.tag[3]
          ))} else if (input$wc == novel.tag[4]) {
            return(list(
              src = paste("wordcloud", 4, ".png", sep = ""),
              height = 500,
              contentType = "image/png",
              alt = novel.tag[4]
            ))} else if (input$wc == novel.tag[5]) {
              return(list(
                src = paste("wordcloud", 5, ".png", sep = ""),
                height = 500,
                contentType = "image/png",
                alt = novel.tag[5]
              ))} else if (input$wc == novel.tag[6]) {
                return(list(
                  src = paste("wordcloud", 6, ".png", sep = ""),
                  height = 500,
                  contentType = "image/png",
                  alt = novel.tag[6]
                ))} else if (input$wc == novel.tag[7]) {
                  return(list(
                    src = paste("wordcloud", 7, ".png", sep = ""),
                    height = 500,
                    contentType = "image/png",
                    alt = novel.tag[7]
                  ))} else if (input$wc == novel.tag[8]) {
                    return(list(
                      src = paste("wordcloud", 8, ".png", sep = ""),
                      height = 500,
                      contentType = "image/png",
                      alt = novel.tag[8]
                    ))} else if (input$wc == novel.tag[9]) {
                      return(list(
                        src = paste("wordcloud", 9, ".png", sep = ""),
                        height = 500,
                        contentType = "image/png",
                        alt = novel.tag[9]
                      ))} else if (input$wc == novel.tag[10]) {
                        return(list(
                          src = paste("wordcloud", 10, ".png", sep = ""),
                          height = 500,
                          contentType = "image/png",
                          alt = novel.tag[10]
                        ))} else if (input$wc == novel.tag[11]) {
                          return(list(
                            src = paste("wordcloud", 11, ".png", sep = ""),
                            height = 500,
                            contentType = "image/png",
                            alt = novel.tag[11]
                          ))} else if (input$wc == novel.tag[12]) {
                            return(list(
                              src = paste("wordcloud", 12, ".png", sep = ""),
                              height = 500,
                              contentType = "image/png",
                              alt = novel.tag[12]
                            ))} else if (input$wc == novel.tag[13]) {
                              return(list(
                                src = paste("wordcloud", 13, ".png", sep = ""),
                                height = 500,
                                contentType = "image/png",
                                alt = novel.tag[13]
                              ))} else if (input$wc == novel.tag[14]) {
                                return(list(
                                  src = paste("wordcloud", 14, ".png", sep = ""),
                                  height = 500,
                                  contentType = "image/png",
                                  alt = novel.tag[14]
                                ))} else if (input$wc == novel.tag[15]) {
                                  return(list(
                                    src = paste("wordcloud", 15, ".png", sep = ""),
                                    height = 500,
                                    contentType = "image/png",
                                    alt = novel.tag[15]
                                  ))} else if (input$wc == novel.tag[16]) {
                                    return(list(
                                      src = paste("wordcloud", 16, ".png", sep = ""),
                                      height = 500,
                                      contentType = "image/png",
                                      alt = novel.tag[16]
                                    ))} else if (input$wc == novel.tag[17]) {
                                      return(list(
                                        src = paste("wordcloud", 17, ".png", sep = ""),
                                        height = 500,
                                        contentType = "image/png",
                                        alt = novel.tag[17]
                                      ))} else if (input$wc == novel.tag[18]) {
                                        return(list(
                                          src = paste("wordcloud", 18, ".png", sep = ""),
                                          height = 500,
                                          contentType = "image/png",
                                          alt = novel.tag[18]
                                        ))} else if (input$wc == novel.tag[19]) {
                                          return(list(
                                            src = paste("wordcloud", 19, ".png", sep = ""),
                                            height = 500,
                                            contentType = "image/png",
                                            alt = novel.tag[19]
                                          ))} else if (input$wc == novel.tag[20]) {
                                            return(list(
                                              src = paste("wordcloud", 20, ".png", sep = ""),
                                              height = 500,
                                              contentType = "image/png",
                                              alt = novel.tag[20]
                                            ))} else if (input$wc == novel.tag[21]) {
                                              return(list(
                                                src = paste("wordcloud", 21, ".png", sep = ""),
                                                height = 500,
                                                contentType = "image/png",
                                                alt = novel.tag[21]
                                              ))} else if (input$wc == novel.tag[22]) {
                                                return(list(
                                                  src = paste("wordcloud", 22, ".png", sep = ""),
                                                  height = 500,
                                                  contentType = "image/png",
                                                  alt = novel.tag[22]
                                                ))} else if (input$wc == novel.tag[23]) {
                                                  return(list(
                                                    src = paste("wordcloud", 23, ".png", sep = ""),
                                                    height = 500,
                                                    contentType = "image/png",
                                                    alt = novel.tag[23]
                                                  ))} else if (input$wc == novel.tag[24]) {
                                                    return(list(
                                                      src = paste("wordcloud", 24, ".png", sep = ""),
                                                      height = 500,
                                                      contentType = "image/png",
                                                      alt = novel.tag[24]
                                                    ))} else if (input$wc == novel.tag[25]) {
                                                      return(list(
                                                        src = paste("wordcloud", 25, ".png", sep = ""),
                                                        height = 500,
                                                        contentType = "image/png",
                                                        alt = novel.tag[25]
                                                      ))} else if (input$wc == novel.tag[26]) {
                                                        return(list(
                                                          src = paste("wordcloud", 26, ".png", sep = ""),
                                                          height = 500,
                                                          contentType = "image/png",
                                                          alt = novel.tag[26]
                                                        ))} else if (input$wc == novel.tag[27]) {
                                                          return(list(
                                                            src = paste("wordcloud", 27, ".png", sep = ""),
                                                            height = 500,
                                                            contentType = "image/png",
                                                            alt = novel.tag[27]
                                                          ))} else if (input$wc == novel.tag[28]) {
                                                            return(list(
                                                              src = paste("wordcloud", 28, ".png", sep = ""),
                                                              height = 500,
                                                              contentType = "image/png",
                                                              alt = novel.tag[28]
                                                            ))} else if (input$wc == novel.tag[29]) {
                                                              return(list(
                                                                src = paste("wordcloud", 29, ".png", sep = ""),
                                                                height = 500,
                                                                contentType = "image/png",
                                                                alt = novel.tag[29]
                                                              ))} else if (input$wc == novel.tag[30]) {
                                                                return(list(
                                                                  src = paste("wordcloud", 30, ".png", sep = ""),
                                                                  height = 500,
                                                                  contentType = "image/png",
                                                                  alt = novel.tag[30]
                                                                ))} else if (input$wc == novel.tag[31]) {
                                                                  return(list(
                                                                    src = paste("wordcloud", 31, ".png", sep = ""),
                                                                    height = 500,
                                                                    contentType = "image/png",
                                                                    alt = novel.tag[31]
                                                                  ))} else if (input$wc == novel.tag[32]) {
                                                                    return(list(
                                                                      src = paste("wordcloud", 32, ".png", sep = ""),
                                                                      height = 500,
                                                                      contentType = "image/png",
                                                                      alt = novel.tag[32]
                                                                    ))} else if (input$wc == novel.tag[33]) {
                                                                      return(list(
                                                                        src = paste("wordcloud", 33, ".png", sep = ""),
                                                                        height = 500,
                                                                        contentType = "image/png",
                                                                        alt = novel.tag[33]
                                                                      ))} else if (input$wc == novel.tag[34]) {
                                                                        return(list(
                                                                          src = paste("wordcloud", 34, ".png", sep = ""),
                                                                          height = 500,
                                                                          contentType = "image/png",
                                                                          alt = novel.tag[34]
                                                                        ))} else if (input$wc == novel.tag[35]) {
                                                                          return(list(
                                                                            src = paste("wordcloud", 35, ".png", sep = ""),
                                                                            height = 500,
                                                                            contentType = "image/png",
                                                                            alt = novel.tag[35]
                                                                          ))} else if (input$wc == novel.tag[36]) {
                                                                            return(list(
                                                                              src = paste("wordcloud", 36, ".png", sep = ""),
                                                                              height = 500,
                                                                              contentType = "image/png",
                                                                              alt = novel.tag[36]
                                                                            ))} else if (input$wc == novel.tag[37]) {
                                                                              return(list(
                                                                                src = paste("wordcloud", 37, ".png", sep = ""),
                                                                                height = 500,
                                                                                contentType = "image/png",
                                                                                alt = novel.tag[37]
                                                                              ))} else if (input$wc == novel.tag[38]) {
                                                                                return(list(
                                                                                  src = paste("wordcloud", 38, ".png", sep = ""),
                                                                                  height = 500,
                                                                                  contentType = "image/png",
                                                                                  alt = novel.tag[38]
                                                                                ))} else if (input$wc == novel.tag[39]) {
                                                                                  return(list(
                                                                                    src = paste("wordcloud", 39, ".png", sep = ""),
                                                                                    height = 500,
                                                                                    contentType = "image/png",
                                                                                    alt = novel.tag[39]
                                                                                  ))} else if (input$wc == novel.tag[40]) {
                                                                                    return(list(
                                                                                      src = paste("wordcloud", 40, ".png", sep = ""),
                                                                                      height = 500,
                                                                                      contentType = "image/png",
                                                                                      alt = novel.tag[40]
                                                                                    ))} 
  
    
  }, deleteFile = FALSE)
  
  output$image2 <- renderImage({
    return(list(
      src = "QAQ.png",
      height = 300,
      contentType = "image/png",
      alt = "icon"
    ))
  }, deleteFile = FALSE)
  
}

# Run the application
shinyApp(ui = ui, server = server)
