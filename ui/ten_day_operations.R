 tabPanel("Ten Day Operations",
    dashboardPage(
      dashboardHeader(title = "10"),
      dashboardSidebar(),
      dashboardBody(
        tags$img(alt="Drought Status Map:2019-05-31",
                 src= "https://deq1.bse.vt.edu/drought/state/images/maps/imageMapFile15627929031512.png",  
                 style="width:200px;height:200px;border:0;")
        

      ) #dashboardBody end

    ) #dash end
    ) #tabPanel end