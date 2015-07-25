library(shiny)
library(ggplot2)

load("decade1991_2000.rda")
load("decade2001_2010.rda")

shinyServer(
  function(input, output) {
  
  # decade output
  output$decadeout=renderPrint({paste("Decade of",input$Decadechosen,"through",as.numeric(input$Decadechosen)+9)})

  output$ouputchart = renderPlot(function() {
   
   
switch(input$Decadechosen,
  "1991" = 
    print(ggplot(data = decade1991_2000, aes(x = State, y=Average_crime_rate, fill=Average_crime_rate)) + 
      geom_bar(stat = "identity") + theme(axis.text.x=element_text(angle=90, hjust=1)) +
      ylab("Average Crime Rate") + 
      ggtitle(paste("Top 10 average crime rate from ", paste(input$Decadechosen, "to ", as.numeric(input$Decadechosen)+9)))
      ), #end of print
       
  "2001" = 
    print(ggplot(data = decade2001_2010, aes(x = State, y=Average_crime_rate, fill=Average_crime_rate)) + 
      geom_bar(stat = "identity") + theme(axis.text.x=element_text(angle=90, hjust=1)) +
      ylab("Average Crime Rate") + 
      ggtitle(paste("Top 10 average crime rate from ", paste(input$Decadechosen, "to ", as.numeric(input$Decadechosen)+9))) +
      scale_fill_gradient(low="yellow", high="orange")
      ) #end of print
   ) #end of switch
   
  }) #end of renderplot
}) #end of shiny server


  

