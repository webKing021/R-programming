library(cluster)

# Load iris dataset
d = datasets::iris

# Select Sepal.Length and Sepal.Width
d1 = d[, 1:2]
View(d1)

# -----------------------
#        K-MEANS
# -----------------------
km = kmeans(d1, centers = 3, nstart = 20)

km
summary(km)

km$cluster
km$centers
km$totss
km$withinss
km$tot.withinss
km$betweenss
km$size
km$iter
km$ifault

# Confusion matrix
cm = table(d$Species, km$cluster)
cm

# -----------------------
#       SCATTER PLOT
# -----------------------
plot(d$Sepal.Length, d$Sepal.Width,
     xlab = "Sepal Length",
     ylab = "Sepal Width",
     main = "Scatter Plot: Sepal Dimensions")

plot(d1[, c("Sepal.Length", "Sepal.Width")],
     col = km$cluster,
     main = "K-means Clustering (Sepal Length vs Sepal Width)",
     xlab = "Sepal Length", ylab = "Sepal Width")

points(km$centers[, c("Sepal.Length", "Sepal.Width")],
       col = 1:3,
       pch = 19,
       cex = 2)

# Cluster labels
ykm = km$cluster
ykm

# -----------------------
#          CLUSPLOT
# -----------------------
clusplot(d1[, c("Sepal.Length", "Sepal.Width")],
         ykm,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = "Cluster Plot - IRIS (K-means)",
         xlab = "Sepal Length", ylab = "Sepal Width")

# -----------------------
#     PREDICT NEW DATA
# -----------------------
set.seed(123)

# FIXED: nrows() → nrow()
newdata = iris[sample(nrow(iris), 10), 1:2]
newdata

# Compute distance from new points to cluster centers
distances <- sapply(1:nrow(km$centers), function(i)
  rowSums((as.matrix(newdata) - km$centers[i, ])^2)
)

new_data_cluster = apply(distances, 1, which.min)
new_data_cluster
