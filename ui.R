# dashboardPage(
#   dashboardHeader(title = "WMA 2019 DREX"),
#   dashboardSidebar(),
#   dashboardBody(
#     tabsetPanel(
#       tabPanel("Situational Awareness", csvFileInput("datafile", "User data (.csv format)")),
#       tabPanel("1-day ops", verbatimTextOutput("summary")),
#       tabPanel("10-day ops", tableOutput("table")),
#       tabPanel("Long-term ops", tableOutput("table")),
#       tabPanel("Download and Visualize", tableOutput("table"))
#     )
#   )
#   )


library(shiny)

# Define UI for application that draws a histogram
shinyUI(navbarPage(title = tags$a("", href = "https://docs.google.com/document/d/1fXEweHkne68ebmxzfqjKu3pikrf43WqeZwZIs2jiMxc/edit#heading=h.dehp4xdzj2vx", target = "_blank",
                                  tags$span(style="color:white", 
                                  "WMA 2019 DREX")),
                   id = "tab",
                   inverse = TRUE,
                   theme = shinythemes::shinytheme("spacelab"),
                   
                   source("ui/situational_awareness.R", local = TRUE)$value,
                   source("ui/one_day_operations.R", local = TRUE)$value,
                   source("ui/ten_day_operations.R", local = TRUE)$value,
                   source("ui/long_term_operations.R", local = TRUE)$value,
                   source("ui/download_and_visualize.R", local = TRUE)$value
                    


                               


                         

))