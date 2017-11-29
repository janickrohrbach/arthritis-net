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
not_outlier <- rep(FALSE, length(x_2d$V1))
for (i in 1:length(x_2d$V1)) {
  if (x_2d$V1[i] <= 70 && x_2d$V1[i] >= 49.5 &&
      x_2d$V2[i] <= 24 && x_2d$V2[i] >= -10 &&
      y[i] <= 20) {
    outlier[i] <- TRUE
  }
  else if (x_2d$V1[i] <= 70 && x_2d$V1[i] >= 49.5 &&
           x_2d$V2[i] <= 24 && x_2d$V2[i] >= -10 &&
           y[i] > 20) {
    not_outlier[i] <- TRUE
  }
}

ids <- which(x = outlier)
not_ids <- which(x = not_outlier)

plot(x = x_2d$V1, y = x_2d$V2, pch = 16, cex = 1,  col = color[y_factor],
     xlim = c(49.5, 70), ylim = c(-10, 24))
points(x = x_2d$V1[outlier], y = x_2d$V2[outlier], pch = 16, cex = .5, col = "red")

length(patients[ids])

length(unique(patients[ids]))

# patients where a healty joint is WRONFGULLY in the area of the damaged joints

m <- list()

for (i in 1:length(unique(patients[ids]))) {
  m[[i]] <- y[which(patients == unique(patients[ids])[i])]
  names(m)[[i]] <- unique(patients[ids])[i]
}

boxplot(m, xlab = "Patient ID", ylab = "Score", varwidth = TRUE)

x_1 <- NULL
y_1 <- NULL

for (i in ids) {
  x_1[i] <- which(unique(patients[ids]) == patients[i])
  y_1[i] <- y[i]
}

points(x_1, y_1, col = "red")

# patients where a damaged joint is RIGHTFULLY in the area of the damaged joints

m_2 <- list()

for (i in 1:length(unique(patients[not_ids]))) {
  m_2[[i]] <- y[which(patients == unique(patients[not_ids])[i])]
  names(m_2)[[i]] <- unique(patients[not_ids])[i]
}

boxplot(m_2, xlab = "Patient ID", ylab = "Score", varwidth = TRUE)

x_2 <- NULL
y_2 <- NULL

for (i in not_ids) {
  x_2[i] <- which(unique(patients[not_ids]) == patients[i])
  y_2[i] <- y[i]
}

points(x_2, y_2, col = "red")

hist(x = unlist(m), breaks = 20, freq = FALSE, col = rgb(0,0,1,1/4))
hist(x = unlist(m_2), breaks = 20, freq = FALSE, col = rgb(1,0,0,1/4), add = TRUE)
abline(v = mean(y_1, na.rm = TRUE), col = "blue")
abline(v = mean(y_2, na.rm = TRUE), col = "red")

# Umgekehrt -----------------------

plot(x = x_2d$V1, y = x_2d$V2, pch = 16, cex = 1,  col = color[y_factor],
     xlim = c(-75, 20))

plot(x = x_2d$V1, y = x_2d$V2, pch = 16, cex = .5,  col = color[y_factor])

rect(xleft = -75, ybottom = min(x_2d$V2), xright = 20, ytop = max(x_2d$V2),
     border = "red")

outlier <- rep(FALSE, length(x_2d$V1))
not_outlier <- rep(FALSE, length(x_2d$V1))
for (i in 1:length(x_2d$V1)) {
  if (x_2d$V1[i] <= 20 && y[i] > 20) {
    outlier[i] <- TRUE
  }
  else if (x_2d$V1[i] <= 20 && y[i] <= 20) {
    not_outlier[i] <- TRUE
  }
}

ids <- which(x = outlier)
not_ids <- which(x = not_outlier)

plot(x = x_2d$V1, y = x_2d$V2, pch = 16, cex = .5,  col = color[y_factor],
     xlim = c(-75, 20))
points(x = x_2d$V1[outlier], y = x_2d$V2[outlier], pch = 16, cex = .5, col = "red")

length(patients[ids])

length(unique(patients[ids]))

# patients where a damaged joint is WRONFGULLY in the area of the healty joints

m <- list()

for (i in 1:length(unique(patients[ids]))) {
  m[[i]] <- y[which(patients == unique(patients[ids])[i])]
  names(m)[[i]] <- unique(patients[ids])[i]
}

boxplot(m, xlab = "Patient ID", ylab = "Score", varwidth = TRUE)

x_1 <- NULL
y_1 <- NULL

for (i in ids) {
  x_1[i] <- which(unique(patients[ids]) == patients[i])
  y_1[i] <- y[i]
}

points(x_1, y_1, col = "red")

# patients where a healty joint is RIGHTFULLY in the area of the damaged joints

m_2 <- list()

for (i in 1:length(unique(patients[not_ids]))) {
  m_2[[i]] <- y[which(patients == unique(patients[not_ids])[i])]
  names(m_2)[[i]] <- unique(patients[not_ids])[i]
}

boxplot(m_2[1:100], xlab = "Patient ID", ylab = "Score", varwidth = TRUE)

x_2 <- NULL
y_2 <- NULL

for (i in not_ids) {
  x_2[i] <- which(unique(patients[not_ids]) == patients[i])
  y_2[i] <- y[i]
}

points(x_2[1:161], y_2[1:161], col = "red")

hist(x = unlist(m), breaks = 20, freq = FALSE, col = rgb(0,0,1,1/4))
hist(x = unlist(m_2), breaks = 20, freq = FALSE, col = rgb(1,0,0,1/4), add = TRUE)
abline(v = mean(y_1, na.rm = TRUE), col = "blue")
abline(v = mean(y_2, na.rm = TRUE), col = "red")
