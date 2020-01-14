
#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(shinythemes)



shinyUI(
  fluidPage(theme = shinytheme("darkly"),
    titlePanel(h2("A Roundup of Disease In America")), 
    sidebarLayout(
      # Sidebar with a slider input
      sidebarPanel(
        selectInput("year", "Year:", Lym_Abb %>% arrange(Year) %>% select(Year), selected = "1999"),
        selectInput("state", "State:", Lym_Abb %>% arrange(State) %>% select(State), selected = "Alabama"), width = 2 # It still isn't selecting Alabama 
        #selectInput("crop", "Crop:", Gly %>% arrange(Crop) %>% select(Crop), selected = "Corn"), 
      
    ),
      mainPanel(
        tabsetPanel(
              tabPanel("Welcome", h1("The Glyphosate Debate"),
                      fluidRow(imageOutput("picture")), 
                      br(), 
                      br(),
                      br(),
                      br(),
                      br(),
                      br(),
                      br(),
                      br(),
                      br(),
                      br(),
                      br(),
                      br(),
                      h3("The great issue of herbicides is that we don't yet understand how they will affect our DNA in the generations to come."), 
                      h2("But there are already manefestations of the widespread use of Roundup in the health of Americans.")), 
 
              tabPanel("Lymphoma Map", plotlyOutput("LymMap")), 
              tabPanel("Glyphosate Map", plotlyOutput("GlyMap")),  # What's wrong with this map? ....................................!!!!!!!!!
              tabPanel("Scatter Plots", plotOutput("LymPlot"))
        
          )
        )
      )
    )
  )




























# if (interactive()) 

# if (interactive()) {
#   ui <- fluidPage(
#     sidebarPanel(
#       selectInput("plotType", "Plot Type",
#                   c(Scatter = "scatter", Histogram = "hist")
#       ),
#       # Only show this panel if the plot type is a histogram
#       conditionalPanel(
#         condition = "input.plotType == 'hist'",
#         selectInput(
#           "breaks", "Breaks",
#           c("Sturges", "Scott", "Freedman-Diaconis", "[Custom]" = "custom")
#         ),
#         # Only show this panel if Custom is selected
#         conditionalPanel(
#           condition = "input.breaks == 'custom'",
#           sliderInput("breakCount", "Break Count", min = 1, max = 50, value = 10)
#         )
#       )
#     ),
#     mainPanel(
#       plotOutput("plot")
#     )
#   )}

    # ## Sidebar content
    # sidebarLayout(
    #   # Sidebar with a slider input
    #     sidebarPanel(
    #       sliderInput("obs",
    #                   "Number of observations:",
    #                   min = 0,
    #                   max = 1000,
    #                   value = 500)),
    #     )),
    # ## Body content
    # mainPanel(
    #   tabsetPanel(
    #     tabPanel("Welcome", h1("The Glyphosate Debate"), 
    #             fluidRow(imageOutput("picture")
    #             )))))
#                   )),
#                 br(),
#                 br(), 
#                 br(), 
#                 br(), 
#                 br(), 
#                 br(), 
#                 br(), 
#                 br(), 
#                 br(), 
#                 br(), 
#                 br(),
#                 br(), 
#                 br(), 
#                 br(), 
#                 br(), 
#                 br(), 
#                 br(), 
#                 br(), 
#                 br(), 
#                 br(), 
#                 br(), 
#                 br(), 
#                 br(), 
#                 br(), 
#                 br(), 
#                 br(), 
#                 br(), 
#                 br(),
#                 br(), 
#                 br(), 
#                 br(), 
#                 br(), 
#                 br(), 
#                 br(), 
#                 br(), 
#                 br(), 
#                 br(),
#                 h2("more words go here")),
#         tabPanel("Maps", 
#                 fluidRow(
#                   tabBox(id = "tabset1", height = "650px", width = 12,
#                          tabPanel("Cancers", plotlyOutput("NeoMap")), # ConditionalPanel here too
#                          tabPanel("Pesticides", plotlyOutput("LymMap")))  #Need to put a conditional panel here I think. 
#                 )), 
#         tabPanel("Plots", h2("Put some plots here")), 
#         tabPanel("Closing", h2("Related Articles"), a("
#                                                            https://www.ncbi.nlm.nih.gov/pubmed/31829784"), br(), a("
# 
# [Plurality of opinion, scientific discourse and pseudoscience: an in depth analysis of the Séralini et al. study claiming that Roundup™ Ready corn or the herbicide Roundup™ cause cancer in rats | SpringerLink]"), br(), a("(https://link.springer.com/article/10.1007/s11248-013-9692-9)"), 
# 
# br(), a("https://pubs.acs.org/doi/abs/10.1021/tx800218n"),
# 
# br(), a("https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5044953/#!po=28.6885"),
# 
# br(), a("https://www.ncbi.nlm.nih.gov/pubmed/?term=Exposure+to+Glyphosate-Based+Herbicides+and+Risk+for+Non-Hodgkin+Lymphoma%3A+A+Meta-Analysis+and+Supporting+Evidence"))
#         )
#     )        
  

    
      
      
      
      
      #  fluidRow(plotOutput('NeoMap'))
        # ,
        # tabBox(
        #   side = "right", height = "250px",
        #   selected = "Tab3",
        #   tabPanel("Tab1", "Tab content 1"),
        #   tabPanel("Tab2", "Tab content 2"),
        #   tabPanel("Tab3", "Note that when side=right, the tab order is reversed.")
        # )
      
      # ,
      # fluidRow(
      #   tabBox(
      #     # Title can include an icon
      #     title = tagList(shiny::icon("gear"), "tabBox status"),
      #     tabPanel("Tab1",
      #              "Currently selected tab from first box:",
      #              verbatimTextOutput("tabset1Selected")
      #     ),
      #     tabPanel("Tab2", "Tab content 2")
      #  )
     
 # )
#)



# shinyUI(
#   dashboardPage(
#     dashboardHeader(title = 'Deaths by State'),
#     dashboardSidebar(
#       selectInput("Year", label = "Year:", choices = Year)
#     ),
#     dashboardBody(
#       fluidRow(
#         plotOutput("distPlot", width = 800)
#       )
#     )
#   )
# )






#   ###this adds tabs inside each menuItem
#   conditionalPanel(condition = "input.menu == 'League_Table'",
#                    selectInput("year", label = "Select Season:", choices = years,
#                                selected = 2010))
# ),

# TABS FOR USA AND STATES 
# tabBox(
#   title = "Maps",
#   # The id lets us use input$tabset1 on the server to find the current tab
#   id = "Maps", height = "600px", width = "100px",
#   tabPanel("USA", plotlyOutput('NeoMap')),
#   tabPanel("States", leafletOutput('map2'))
# ))




# menuItem("Welcome", tabName = "Welcome", icon = icon("home")),
# menuItem("Maps", tabName = "Maps", icon = icon("th")),
# menuItem('Plots', tabName = 'Plots', icon = icon('dashboard')),
# menuItem('Closing', tabName = 'Closing', icon = icon('fdashboard'))