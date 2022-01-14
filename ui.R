library(shiny)
library(shinydashboard)


ui <- dashboardPage(skin = "green",
                    dashboardHeader(title = "CryptoDash"),
                    dashboardSidebar(
                      sidebarMenu(
                        selectInput(inputId = "drop" , label = "Choose the symbol" ,list("BTC-USD","ETH-USD","BNB-USD","USDT-USD","XRP-USD","ADA-USD","MATIC-USD" , "DOT-USD")),
                        menuItem("ChartPage 1" , tabName = "dash",icon = icon("chart-bar")),
                        menuItem("ChartPage 2" , tabName = "page",icon = icon("chart-area")),
                        menuItem("Forcating",tabName = "time-series-1",icon = icon("chart-pie")),
                        sliderInput("slider" , "No. Of Days To Forecast:" , min=0 , max=360,value=100 , step = 10)
                      )
                    ),
                    dashboardBody(
                      tabItems(
                        tabItem(tabName = "dash",
                                fluidRow(
                                  box(width = 12,title = "Time Series",
                                      status = "success", solidHeader = TRUE,
                                      collapsible = TRUE,plotOutput("plot2")),
                                  box(title = "Regression line",
                                      status = "success", solidHeader = TRUE,
                                      collapsible = TRUE,plotOutput("plot1")),
                                  box(title = "Yearly Returns" , 
                                      status = "success",
                                      collapsible = TRUE,solidHeader = TRUE,
                                      plotOutput("plot5"))
                                )
                        ),
                        tabItem(tabName="page",
                                fluidRow(
                                  box(width = 12,title = "Bollinger Bands",
                                      status = "success", solidHeader = TRUE,
                                      collapsible = TRUE,plotOutput("plot3")),
                                  box(title = "Trends In Annual Returns",
                                      status = "success",solidHeader = TRUE,
                                      collapsible = TRUE,plotOutput("plot6")),
                                  box(title = "MACD" , status = "success",
                                      solidHeader = TRUE,
                                      collapsible = TRUE ,plotOutput("plot8"))
                                )),
                        tabItem(tabName = "time-series-1",
                                fluidRow(
                                  box(width = 12,title = "KNN Model" , status = "success",
                                      collapsible = TRUE,solidHeader = TRUE,
                                      plotOutput("plot14")),
                                  box(title = "Prophet Model",status = "success",
                                      collapsible = TRUE,solidHeader = TRUE,
                                      plotOutput("plot12")),
                                  box(title = "AUTO-ARIMA" , status = "success",
                                      collapsible = TRUE,solidHeader = TRUE,
                                      plotOutput("plot11")),

                                ))
                )
      )
)


