dashboardPage(
  dashboardHeader(title = "WMA 2019 DREX"),
  dashboardSidebar(),
  dashboardBody(
    tabsetPanel(
      tabPanel("Situational Awareness", csvFileInput("datafile", "User data (.csv format)")),
      tabPanel("1-day ops", verbatimTextOutput("summary")),
      tabPanel("10-day ops", tableOutput("table")),
      tabPanel("Long-term ops", tableOutput("table")),
      tabPanel("Download and Visualize", tableOutput("table"))
    )
  )
  )
