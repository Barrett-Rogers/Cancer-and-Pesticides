
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



shinyUI(
  dashboardPage(skin = "green",
    dashboardHeader(title = 'A Roundup of Disease In America', titleWidth = 350),
    ## Sidebar content
    dashboardSidebar(
      sidebarMenu(
        menuItem("Welcome", tabName = "Welcome", icon = icon("home")),
        menuItem("Maps", tabName = "Maps", icon = icon("th")),
        menuItem('Plots', tabName = 'Plots', icon = icon('dashboard')),
        menuItem('Closing', tabName = 'Closing', icon = icon('fdashboard')))),
    ## Body content
    dashboardBody(
      tabItems(
        tabItem(tabName = "Welcome", status = "primary", title = "Welcome", h1("The Glyphosate Debate"), 
                fluidRow(
                  box(
                    title = "", status = "primary", solidHeader = FALSE, height = 0, width = 0,
                    imageOutput("picture")
                  )),
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
                br(),
                h2("more words go here")),
        tabItem(tabName = "Maps", title = "Maps", 
                fluidRow(
                  tabBox(id = "tabset1", height = "400px", width = 10,
                         tabPanel("Cancers", plotlyOutput("NeoMap")),
                         tabPanel("Pesticides", plotlyOutput("LymMap")))
                )), 
        tabItem(tabName = "Plots", title = "Plots", h2("Put some plots here")), 
        tabItem(tabName = "Closing", title = "Closing", h2("Related Articles"), h4("
                                                           https://www.ncbi.nlm.nih.gov/pubmed/31829784"), h4("

[Plurality of opinion, scientific discourse and pseudoscience: an in depth analysis of the Séralini et al. study claiming that Roundup™ Ready corn or the herbicide Roundup™ cause cancer in rats | SpringerLink]"), h4("(https://link.springer.com/article/10.1007/s11248-013-9692-9)"), 

h4("https://pubs.acs.org/doi/abs/10.1021/tx800218n"),

h4("https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5044953/#!po=28.6885"),

h4("https://www.ncbi.nlm.nih.gov/pubmed/?term=Exposure+to+Glyphosate-Based+Herbicides+and+Risk+for+Non-Hodgkin+Lymphoma%3A+A+Meta-Analysis+and+Supporting+Evidence"))
        )
    )        
  )
)    
      
      
      
      
      
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
