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

# Define UI for application that draws a histogram
dashboardPage(
    dashboardHeader(title = "Prediction with Keras"),
    dashboardSidebar(disable = TRUE),
    dashboardBody(
      fluidRow(
        box(
          fileInput(inputId = "img_upload",
                    label = "Choose a file",
                    multiple = FALSE,
                    accept = "image"),
          width = 4
        ),
        box(
          imageOutput('image'),
          width = 4
        ),
        box(
          plotOutput("probs"),
          width = 4
        )
      )
    )
  )
