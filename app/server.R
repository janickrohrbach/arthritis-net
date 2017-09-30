#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(keras)
library(magick)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  model = load_model_hdf5("/Users/janickrohrbach/Desktop/dl_project_1/test/models/base_model.h5")


    # predict
    observeEvent(input$img_upload, {

      img_name <- input$img_upload$name
      file.copy(input$img_upload$datapath, paste0("./upload/", img_name))

      output$image <- renderImage({
        outfile <- tempfile(fileext = ".png")

        png(filename = outfile, width = 350, height = 350)
        tmp <- image_read(path = paste0("./upload/", img_name))
        plot(tmp)
        dev.off()

        list(src = outfile,
             contentType = "image/png",
             width = 350,
             height = 350)
      }, deleteFile = TRUE)

    img <- image_load(paste0("./upload/", img_name), target_size = c(28, 28), grayscale = TRUE)

    x <- image_to_array(img)
    x <- x / 255
    dim(x) <- c(1, 28, 28, 1)

    pred <- predict_proba(object = model, x = x)
    pred <- as.matrix(pred)
    colnames(pred) <- 0:9

    output$probs <- renderPlot({
      barplot(height = pred, ylab = "probability", horiz = TRUE)
    })
  })

})
