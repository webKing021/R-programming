library(cluster)

d = read.csv("D:\\Krutarth\\SEM-5\\Data-Mining\\Mall_Customers.csv", header = TRUE)
View(d)

# Select columns 3 and 4 (Age, Annual Income)
d1 = d[, 3:4]
View(d1)

# -----------------------
#      K-MEANS
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

# Confusion Matrix
cm = table(d$Spending.Score..1.100., km$cluster)
cm

# -----------------------
#       SCATTER PLOTS
# -----------------------
plot(d$Age, d$Annual.Income..k..,
     main = "Age vs Income")

plot(d1[, c("Age", "Annual.Income..k..")],
     col = km$cluster,
     main = "K-means Clustering",
     xlab = "Age", ylab = "Annual Income (k$)")

points(km$centers[, c("Age", "Annual.Income..k..")],
       col = 1:3,
       pch = 19,
       cex = 2)

# Cluster labels
ykm = km$cluster
ykm

# -----------------------
#        CLUSPLOT
# -----------------------
clusplot(d1[, c("Age", "Annual.Income..k..")],
         ykm,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = "Cluster Plot - K-Means",
         xlab = "Age", ylab = "Annual Income (k$)")

# -----------------------
#    PREDICT NEW DATA
# -----------------------
set.seed(123)

# FIXED: nrows() → nrow()
# FIXED: d1 has only 2 columns; removed "1:4"
newdata = d1[sample(nrow(d1), 10), ]
newdata

# Distance from new data → each cluster center
distances <- sapply(1:nrow(km$centers), function(i)
  rowSums((as.matrix(newdata) - km$centers[i, ])^2)
)

new_data_cluster = apply(distances, 1, which.min)
new_data_cluster
