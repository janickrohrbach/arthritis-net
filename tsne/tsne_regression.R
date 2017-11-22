setwd("~/Desktop/dl_project_1/tsne")
x_2d <- read.table(file = "x_2d_regression.csv", header = FALSE, sep = ";")
y <- read.table(file = "y_regression.csv", header = FALSE, sep = ";")
y <- as.numeric(unlist(y))

y_factor <- round(y / 10) + 1


library(viridis)
color = viridis(n = 10)

plot(x = x_2d$V1, y = x_2d$V2, pch = 16, cex = 1,  col = color[y_factor],
     xlim = c(45, 80), ylim = c(-10, 25))

identify(x = x_2d$V1, y = x_2d$V2, labels = rownames(x_2d))

plot(x = x_2d$V1, y = x_2d$V2, pch = 16, cex = .5,  col = color[y_factor])

rect(xleft = 49, ybottom = -10, xright = 70, ytop = 25, border = "red")

