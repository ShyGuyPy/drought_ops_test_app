dashboardPage(
  dashboardHeader(title="drop_test"),
  dashboardSidebar(),
  dashboardBody(
    tabsetPanel(
      tabPanel("Situational Awareness", plotOutput("plot")),
      tabPanel("1-day ops", verbatimTextOutput("summary")),
      tabPanel("10-day ops", tableOutput("table")),
      tabPanel("Long-term ops", tableOutput("table")),
      tabPanel("Download and Visualize", tableOutput("table"))
    )
  )
  )