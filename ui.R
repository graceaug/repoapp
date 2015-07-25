
library(shiny)
library(ggplot2)

# Define UI for dataset viewer application
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Top 10 Crime Rates in US states from 1991 to 2010"),
    
    sidebarPanel(
      radioButtons("Decadechosen", "Choose Decade: ",
                   c("1991-2000" = "1991",
                     "2001-2010" = "2001"))
    ),
    mainPanel(
       h3('Results'),
       h4('You chose: '),
       verbatimTextOutput("decadeout"),
       h4('which resulted in the following output chart: '),
       plotOutput("ouputchart")
        
    )
  )
)
