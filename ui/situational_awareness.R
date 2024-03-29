tabPanel("Situational Awareness",
         dashboardPage(skin = "blue",
           dashboardHeader(title = "Situational Awareness",
                           .list = NULL,
                           #this space is for outputting the date to the login bar
                           #it needs to be an html list item(li) with class dropdown
                           #to output properly
                           tags$li(textOutput("date_text"),
                                   class = "dropdown")
           
                           ),
           dashboardSidebar(
             width = 250,
             dateRangeInput("plot_range",
                            "Specify plot range",
                            #               start = date_start,
                            start = "2038-07-01",
                            #               end = "1930-12-31",
                            # start = date_start,
                            end = date_end,
                            format = "yyyy-mm-dd",
                            width = NULL),
             dateInput("DREXtoday",
                       "Change last day of simulation",
                       width = "200px",
                       value = date_today0, # date_today set in parameters.R
                       #          value = "1930-02-15",
                       #          min = "1929-10-02",
                       #          max = "1931-12-31",
                       min = date_start,
                       max = date_end,
                       format = "yyyy-mm-dd"),
             
             actionButton("run_main",
                          "Re-run simulation",
                          icon = NULL,
                          width = "220px"),
             br(),
             numericInput("chunkofdays",
                          "Chunk of days",
                          value = 7,
                          min = 1,
                          max = 30,
                          width = "220px"),
             actionButton("run_add",
                          "Add chunk of days to simulation",
                          icon = NULL,
                          width = "220px"),
             br(),
             numericInput("dr_va",
                          "Demand reduction, VA-Shenandoah (%)",
                          value = dr_va0,
                          min = 0,
                          max = 20,
                          width = "220px"),
             numericInput("dr_md_cent",
                          "Demand reduction, MD-Central (%)",
                          value = dr_md_cent0,
                          min = 0,
                          max = 20,
                          width = "220px"),
             numericInput("dr_md_west",
                          "Demand reduction, MD-Western (%)",
                          value = dr_md_west0,
                          min = 0,
                          max = 20,
                          width = "220px"),
             br(),
             numericInput("mos_1day",
                          "1 day margin of safety (MGD)",
                          value = mos_1day0,
                          min = 0,
                          max = 140,
                          width = "220px"),
             numericInput("dr_wma_override",
                          "Demand reduction override, WMA (%)",
                          value = dr_wma_override0,
                          min = 0,
                          max = 20,
                          width = "220px"),
             br(), br(),
             br(), br(),
             actionButton("write_ts",
                          "Write output time series",
                          icon = NULL,
                          width = "220px")
           ),
           #--------------------------------------------------------------------------------
           #--------------------------------------------------------------------------------
           # The body - has the graphs and other output info
           #--------------------------------------------------------------------------------
           #--------------------------------------------------------------------------------
           dashboardBody(
             tags$head(
               #this links the shiny app to main.css which can be used to easily define and
               #alter styles(color,font size, alignments) across allui/server elements
               tags$link(rel = "stylesheet", type = "text/css", href = "CSS/main.css")),
             # seem to need to start with fluidrow, so define main row & col
             fluidRow( # major row that contains whole body
               column( # major column that contains whole body
                 width = 12,
                 #
                 # now add the content
                 column(  # this is the 1st main column - with the graphs
                   width = 6,
                   fluidRow( # row with Potomac flow graph
                     box(
                       title = NULL,
                       width = NULL,
                       plotOutput("potomacFlows", height = "220px")
                     )
                   ),
                   fluidRow( # row with 2 reservoir graphs
                     h3("Reservoir storage (million gallons)"),
                     column(
                       width = 6,
                       box(
                         title = NULL,
                         width = NULL,
                         plotOutput("jrrStorageReleases", height = "190px")
                       )
                     ),
                     column(
                       width = 6,
                       box(
                         title = NULL,
                         width = NULL,
                         plotOutput("occStorageReleases", height = "190px")
                       )
                     )
                   ), # end row with jrr and occ graphs
                   fluidRow(
                     column(
                       width = 6,
                       box(
                         #                    title = "Little Seneca storage",
                         title = NULL,
                         width = NULL,
                         plotOutput("senStorageReleases", height = "190px")
                       )
                     ),
                     column(
                       width = 6,
                       box(
                         title = NULL,
                         width = NULL,
                         plotOutput("patStorageReleases", height = "190px")
                       )
                     )
                   ) # end row with sen and pat graphs
                   #                ) # end of row with all 4 reservoir graphs
                 ), # end of 1st main column - with graphs
                 column( # this is the 2nd main column - with values & triggers
                   width = 6,
                   valueBoxOutput("por_flow", width = NULL),
                   valueBoxOutput("lfalls_obs", width = NULL),
                   # infoBoxOutput("coop_ops", width = NULL),
                   # infoBoxOutput("lfaa_alert", width = NULL),
                   # infoBoxOutput("mwcog_stage", width = NULL),
                   
                   ##these three boxes were custom built replace the three infoboxes
                   # that are commented out above
                   box(
                     title=NULL,
                     width=NULL,
                     height=50,
                     htmlOutput(outputId = "coop_ops")
                   ),
                   box(
                     title=NULL,
                     width=NULL,
                     height=50,
                     htmlOutput(outputId = "lfaa_alert")
                   ),
                   box(
                     title=NULL,
                     width=NULL,
                     height=50,
                     htmlOutput(outputId = "mwcog_stage")
                   ),
                   
                   #these two boxes are for outputting the Maryland drought map
                   #and Virginia drought squares
                   box(
                     title = NULL,#"MARYLAND DROUGHT STATUS",
                     width = NULL,#6,
                     height = 220,
                     htmlOutput(outputId="MD_title"),
                     box(
                       tags$img(alt="Drought Status Map:2019-05-31",
                                src= "https://mde.maryland.gov/programs/Water/droughtinformation/Currentconditions/PublishingImages/DroughtGraphsStarting2019jan31/Drought2019-05-31.png",
                                style="width:250px;height:200px;border:0;")
                       #leafletOutput("mymap", height =140, width =300)
                     ),
                     box(
                       htmlOutput(outputId = "boxes")
                     )
                   ),
                   #tags$p("Western region: Drought Watch; Central region: Drought Warning")),
                   box(
                     title = NULL,#"VIRGINIA DROUGHT STATUS",
                     width = NULL,#6,
                     height = 220,
                    
                     #virginia map linked to url...needs to be fitted and ui elements need to 
                     #be pared down...need Cherie's input so it's commented out for now
                     
                     # box(
                     #   tags$img(alt="Drought Status Map:2019-05-31",
                     #            src= "https://deq1.bse.vt.edu/drought/state/images/maps/imageMapFile15627929031512.png",  
                     #            style="width:200px;height:200px;border:0;")
                     # ),
                     
                     
                     htmlOutput(outputId = "boxes2")
                   )
                   #"NoVa: Drought Watch; Shenandoah: Drought Emergency")
                 ) # end of 2nd main column
               ) # end of major column that contains whole body
             ), # end of major row that contains whole body
             fluidRow( # Temporary row to display some output for QAing
               valueBoxOutput("QA_out", width = NULL)
             ) # end fluidRow for QAing purposes
           ) # end dashboardBody
         ) # end dashboardPage
) #tabPanel end




