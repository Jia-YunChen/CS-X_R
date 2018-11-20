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

novel.tag <- c("第一至五章", "第六至十章", "第十一至十五章", "第十六至廿章", "第廿一至廿五章", "第廿六至卅章", "第卅一至卅五章","第卅六至四十章")


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
            其中射鵰英雄傳是我閱讀的第一本金庸武俠，也是我覺得最經典的作品，也因為這本的情節推進明顯，
            主角成長的色彩鮮明，因此選了這本作為報告內容，亦希望藉此小小的致敬金庸先生。"),br(),
    tags$h5("資料來源：龍騰世紀書庫, http://www.millionbook.net/wx/j/jingyong/sdyxz/index.html"),
    tags$h5("github:")
    ),
  
  tabPanel(
    "章節詞頻分析",
    tags$h4("因為章數過多，選單太長會難以使用，因此將五章為一個單位，也方便大家比對，
            明顯看出小說的情節進程。"),br(),
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
    "tfidf分析",
    tags$h4("射鵰英雄傳是一本情節發展前進的很明顯的書，光是看詞頻分析做出的人物
            名稱就可以知道，主角在成長過程中，眼界跟環境都是在長大、改變的，
            幾乎是看一看文字雲，就可以大概回憶起那張大概的情節，這是他特殊的地方，
            "),br(),
    mainPanel(
      imageOutput("image3")
    )
    ),
  
  tabPanel(
    "PCA文本分析",
    tags$h4("這裡也是先做好圖才丟上來的，是將tfidf的資料將成二維之後顯示在圖上，
            而這裡可以看出雖然大部分的小說開頭集中在同一個區域，但是像是
            鹿鼎記、倚天屠龍記，這兩個就是跟其他的開頭相差甚遠的，
            PCA的PC1和PC2可以代表說最能分開tfidf矩陣各個資料點的向量投影，
            我想這些離開較遠的點一定有它的意義存在，
            也許再詳細閱讀之後就能豁然開朗呢！"),br(),
    mainPanel(
      imageOutput("image4")
    )
    ),
  
  tabPanel(
    "小結",
    tags$h4("金庸爺爺享耆壽94歲，一生的成就其實真的不可限量，
            要透過這個簡單的文本分析要了解小說的本質其實真的過於簡單，
            以其他的面向來觀賞小說其實真的有趣，當結合數學的時候，
            文學不再那麼文學，當我們幫他們安上數字時，
            我想最能帶給我們的改變是能將它們都打上一個分數，
            這個分數高低不一定代表他的好壞，但卻是只屬於他們的獨特數字，
            希望以後能有機會可以用更強的工具達成更好的分析效果，
            不然這個報告實在是太對不起金庸這位讓我們可以有機會可以藉由小說
            馳騁於武俠世界的稀世文學巨匠呢"),br(),
    mainPanel(
      imageOutput("image5")
    ),
    tags$h5("圖片來源：香港經濟日報,
            https://topick.hket.com/article/1662016/香港首個「金庸館」%E3%80%803月沙田文化博物館亮相")
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
        
        src = paste("wordcloud", 3, ".png", sep = ""),
        height = 500,
        contentType = "image/png",
        src = paste("wordcloud", 4, ".png", sep = ""),
        height = 500,
        contentType = "image/png",
        src = paste("wordcloud", 5, ".png", sep = ""),
        height = 500,
        contentType = "image/png",
        alt = novel.tag[1]
      ))
      return(list(
        src = paste("wordcloud", 2, ".png", sep = ""),
        height = 500,
        contentType = "image/png",
      ))} else if (input$wc == novel.tag[2]) {
        return(list(
          src = paste("wordcloud", 6, ".png", sep = ""),
          height = 500,
          contentType = "image/png",
          src = paste("wordcloud", 7, ".png", sep = ""),
          height = 500,
          contentType = "image/png",
          src = paste("wordcloud", 8, ".png", sep = ""),
          height = 500,
          contentType = "image/png",
          src = paste("wordcloud", 9, ".png", sep = ""),
          height = 500,
          contentType = "image/png",
          src = paste("wordcloud", 10, ".png", sep = ""),
          height = 500,
          contentType = "image/png",
          alt = novel.tag[2]
        ))} else if (input$wc == novel.tag[3]) {
          return(list(
            src = paste("wordcloud", 11, ".png", sep = ""),
            height = 500,
            contentType = "image/png",
            src = paste("wordcloud", 12, ".png", sep = ""),
            height = 500,
            contentType = "image/png",
            src = paste("wordcloud", 13, ".png", sep = ""),
            height = 500,
            contentType = "image/png",
            src = paste("wordcloud", 14, ".png", sep = ""),
            height = 500,
            contentType = "image/png",
            src = paste("wordcloud", 15, ".png", sep = ""),
            height = 500,
            contentType = "image/png",
            alt = novel.tag[3]
          ))} else if (input$wc == novel.tag[4]) {
            return(list(
              src = paste("wordcloud", 16, ".png", sep = ""),
              height = 500,
              contentType = "image/png",
              src = paste("wordcloud", 17, ".png", sep = ""),
              height = 500,
              contentType = "image/png",
              src = paste("wordcloud", 18, ".png", sep = ""),
              height = 500,
              contentType = "image/png",
              src = paste("wordcloud", 19, ".png", sep = ""),
              height = 500,
              contentType = "image/png",
              src = paste("wordcloud", 20, ".png", sep = ""),
              height = 500,
              contentType = "image/png",
              alt = novel.tag[4]
            ))} else if (input$wc == novel.tag[5]) {
              return(list(
                src = paste("wordcloud", 21, ".png", sep = ""),
                height = 500,
                contentType = "image/png",
                src = paste("wordcloud", 22, ".png", sep = ""),
                height = 500,
                contentType = "image/png",
                src = paste("wordcloud", 23, ".png", sep = ""),
                height = 500,
                contentType = "image/png",
                src = paste("wordcloud", 24, ".png", sep = ""),
                height = 500,
                contentType = "image/png",
                src = paste("wordcloud", 25, ".png", sep = ""),
                height = 500,
                contentType = "image/png",
                alt = novel.tag[5]
              ))} else if (input$wc == novel.tag[6]) {
                return(list(
                  src = paste("wordcloud", 26, ".png", sep = ""),
                  height = 500,
                  contentType = "image/png",
                  src = paste("wordcloud", 27, ".png", sep = ""),
                  height = 500,
                  contentType = "image/png",
                  src = paste("wordcloud", 28, ".png", sep = ""),
                  height = 500,
                  contentType = "image/png",
                  src = paste("wordcloud", 29, ".png", sep = ""),
                  height = 500,
                  contentType = "image/png",
                  src = paste("wordcloud", 30, ".png", sep = ""),
                  height = 500,
                  contentType = "image/png",
                  alt = novel.tag[6]
                ))} else if (input$wc == novel.tag[7]) {
                  return(list(
                    src = paste("wordcloud", 31, ".png", sep = ""),
                    height = 500,
                    contentType = "image/png",
                    src = paste("wordcloud", 32, ".png", sep = ""),
                    height = 500,
                    contentType = "image/png",
                    src = paste("wordcloud", 33, ".png", sep = ""),
                    height = 500,
                    contentType = "image/png",
                    src = paste("wordcloud", 34, ".png", sep = ""),
                    height = 500,
                    contentType = "image/png",
                    src = paste("wordcloud", 35, ".png", sep = ""),
                    height = 500,
                    contentType = "image/png",
                    alt = novel.tag[7]
                  ))} else if (input$wc == novel.tag[8]) {
                    return(list(
                      src = paste("wordcloud", 36, ".png", sep = ""),
                      height = 500,
                      contentType = "image/png",
                      src = paste("wordcloud", 37, ".png", sep = ""),
                      height = 500,
                      contentType = "image/png",
                      src = paste("wordcloud", 38, ".png", sep = ""),
                      height = 500,
                      contentType = "image/png",
                      src = paste("wordcloud", 39, ".png", sep = ""),
                      height = 500,
                      contentType = "image/png",
                      src = paste("wordcloud", 40, ".png", sep = ""),
                      height = 500,
                      contentType = "image/png",
                      alt = novel.tag[8]
                    ))}
  }, deleteFile = FALSE)
  
  

}

# Run the application
shinyApp(ui = ui, server = server)
