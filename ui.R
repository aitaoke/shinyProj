
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(fluidPage(
        # Application title
        headerPanel("Scatter diagram of norm and exp."),
        # Sidebar with a slider input for number of observations
        #sidebarLayout(
        # sidebarPanel(
        column(4,wellPanel(
                
                radioButtons("dist","Distribution type:",
                             c("Norm"="norm","Exp"="exp")),
                br(),   
                sliderInput("n", 
                            "Number of sample:", 
                            min = 0, 
                            max = 1000, 
                            value = 500,step=10),
                "You can change the type of the scatter diagram",
                "and choose the sample number here."
        )),
        column(7,  
               "Mind you that the scatterplot below will not be displayed unless",
               " there are more than 100 samples. You can try it yourself.",
               conditionalPanel("input.n>=100",plotOutput("scatterPlot",height=400)),
               textOutput("currentTime")
        )
))
