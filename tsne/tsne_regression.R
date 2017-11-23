setwd("~/Desktop/dl_project_1/tsne")
x_2d <- read.table(file = "x_2d_regression.csv", header = FALSE, sep = ";")
y <- read.table(file = "y_regression.csv", header = FALSE, sep = ";")
patients <- read.table(file = "patients_regression.csv", header = FALSE, sep = ";")
y <- as.numeric(unlist(y))
patients <- as.numeric(unlist(patients))

y_factor <- round(y / 10) + 1


library(viridis)
color = viridis(n = 10)

plot(x = x_2d$V1, y = x_2d$V2, pch = 16, cex = 1,  col = color[y_factor],
     xlim = c(49.5, 70), ylim = c(-10, 24))

#identify(x = x_2d$V1, y = x_2d$V2, labels = rownames(x_2d))

plot(x = x_2d$V1, y = x_2d$V2, pch = 16, cex = .5,  col = color[y_factor])

rect(xleft = 49.5, ybottom = -10, xright = 70, ytop = 24, border = "red")

outlier <- rep(FALSE, length(x_2d$V1))
for (i in 1:length(x_2d$V1)) {
  if (x_2d$V1[i] <= 70 && x_2d$V1[i] >= 49.5 &&
      x_2d$V2[i] <= 24 && x_2d$V2[i] >= -10 &&
      y[i] < 20) {
    outlier[i] <- TRUE
  }
}

ids <- which(x = outlier)

plot(x = x_2d$V1, y = x_2d$V2, pch = 16, cex = 1,  col = color[y_factor],
     xlim = c(49.5, 70), ylim = c(-10, 24))
points(x = x_2d$V1[outlier], y = x_2d$V2[outlier], pch = 16, cex = .5, col = "red")

length(patients[ids])

length(unique(patients[ids]))

m <- list()

for (i in 1:length(unique(patients[ids]))) {
  m[[i]] <- y[which(patients == unique(patients[ids])[i])]
  names(m)[[i]] <- unique(patients[ids])[i]
}

boxplot(m, xlab = "Patient ID", ylab = "Score")

x_1 <- NULL
y_1 <- NULL

for (i in ids) {
  x_1[i] <- which(unique(patients[ids]) == patients[i])
  y_1[i] <- y[i]
}


points(x_1, y_1, col = "red")

