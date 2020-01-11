library(shinydashboard)
library(tidyverse)
library(DT)
library(dplyr)
library(ggplot2)
library(plotly)
library(shiny)
library(leaflet)

Lymp <- read.table("data/Underlying Cause of Death - by Year - 1999-2017-6.txt", header = TRUE, sep = '\t', nrows = 1021)

Abb <- read.csv("https://raw.githubusercontent.com/jasonong/List-of-US-States/master/states.csv")
CP <- CP <- read.table("data/CDC_data_1999-2017.txt", sep = '\t', nrows = 52)
Lym <- read.table("data/Underlying Cause of Death - by Year - 1999-2017-6.txt", header = FALSE, sep = '\t', nrows = 1022)

CP <- CP %>% select(-V1, -V3)
names(CP)[1] <- "State"
  names(CP)[2] <- "Deaths"
    names(CP)[3] <- "Population"
      names(CP)[4] <- "Crude_Rate"
        names(CP)[5] <- "Age_Adjusted_Rate"
CP <- CP[-c(1),]

Lym <- Lym %>% select(-V1, -V3)
names(Lym)[1] <- "State"
  names(Lym)[2] <- "Deaths"
    names(Lym)[3] <- "Population"
      names(Lym)[4] <- "Crude_Rate"
        names(Lym)[5] <- "Age_Adjusted_Rate"
Lym <-Lym[-c(1),]


# Change types 
CP$Deaths <- as.double(CP$Deaths)
CP$State <- as.character(CP$State)
CP$Crude_Rate <- as.double(CP$Crude_Rate)
CP$Age_Adjusted_Rate <- as.double(CP$Age_Adjusted_Rate)


CP_Abb <- merge(CP, Abb, by = 'State')


Lym$Deaths <- as.double(Lym$Deaths)
Lym$State <- as.character(Lym$State)
Lym$Crude_Rate <- as.double(Lym$Crude_Rate)
Lym$Age_Adjusted_Rate <- as.double(Lym$Age_Adjusted_Rate)


CP_Abb <- merge(CP, Abb, by = 'State')

Lym_Abb <- merge(Lym, Abb, by = 'State')



l <- list(color = toRGB("white"), width = 2)









#colnames(Lymp) <- as.character(unlist(Lymp[1,]))
#Lymp = Lymp[-1, ]
#View(Lymp)

names(state.abb) <- state.name
Lymp$Abbreviation <- state.abb[Lymp$State]


# Generate Options for dropdown menu in ui
Year <- Lymp %>%
  pull(Year) %>%
  unique()



# if (!require(devtools))
#   install.packages("devtools")
# devtools::install_github("rstudio/leaflet")
# shiny::runGitHub("rstudio/shiny-examples", subdir="063-superzip-example")









# What I need now: 
# 1) For the sidebar menuitems to actually change what the viewer sees.
# 2) For the maps to sho my data 
# 3) More ideas/creative things for my page and maybe a totally different page look
# 4) Pesticide data brought in -- will I have time? 