
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyServer(function(input, output,session) {
        data <- reactive({
                dist <- switch(input$dist,
                               norm = rnorm,
                               exp = rexp,
                )
                dist(input$n)
        })
        output$scatterPlot <- renderPlot({     
                # generate and plot an rnorm distribution with the requested
                # number of observations
                dist <- input$dist
                x<-data()
                m<-input$n
                plot(x,main=paste('r', dist, '(', m, ')', sep=''),col="blue")
        })
        
        output$currentTime<-renderText(
{invalidateLater(1000,session)
 paste("Current time:", Sys.time())
})
})
