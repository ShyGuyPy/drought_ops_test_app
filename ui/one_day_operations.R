# tabPanel("One Day Operations",
#          dashboardPage(
#            dashboardHeader(title = "one day"
#                            ),
#            dashboardSidebar(),
#            dashboardBody(
#              
#              tags$img(alt="Drought Status Map:2019-05-31",
#              src= "https://mde.maryland.gov/programs/Water/droughtinformation/Currentconditions/PublishingImages/DroughtGraphsStarting2019jan31/Drought2019-05-31.png",
#              style="width:200px;height:200px;border:0;")
# 
# 
#                
# 
#            ) #dashboardBody end
# 
#          ) #dash end
# ) #tabPanel end


tabPanel("One-Day Operations",
         dashboardPage(
           dashboardHeader(title = "one day"
           ), #end of dashboardHeader
           dashboardSidebar(),
           dashboardBody(
             align = "center",
             plotOutput("odo", height = plot.height, width = plot.width),
             br(),
             ###added from zach 2018
             source("ui/wellpanel_ui.R", local = TRUE)$value
           )
           
         ) # end of dashboardPage
) # End tabPanel


