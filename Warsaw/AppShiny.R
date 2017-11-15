library(shiny)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
  textInput(inputId = "title", label = "Tytul wykresu:", value = "Histogram rozkladu normalnego"),
  sliderInput(inputId = "num",label = "Liczba obserwacji:",value = 2500, min = 500, max = 5000),
  sliderInput(inputId = "mean",label = "Srednia:",value = 0, min = -20, max = 20),
  sliderInput(inputId = "sd",label = "Odchylenie standardowe:",value = 25, min = 1, max = 50),
  selectInput(inputId = "colour", label = "Wybierz kolor:", choices = c("blue","red","green","yellow"))
  ),
  
  mainPanel(
  plotOutput("hist")
  )
)
)

server <- function(input, output) {
  output$hist <- renderPlot({
    hist(rnorm(input$num,input$mean, input$sd),col = input$colour, main = input$title)
  })
}

shinyApp(ui = ui, server = server)
