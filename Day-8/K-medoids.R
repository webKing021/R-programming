library(cluster)

# Load Data
d = read.csv("D:\\Krutarth\\SEM-5\\Data-Mining\\Mall_Customers.csv", header = TRUE)

# Select columns for clustering (Age, Income)
d1 = d[, c("Age", "Annual.Income..k..")]
View(d1)

# -----------------------
#   K-MEDOIDS (PAM)
# -----------------------
set.seed(123)
km = pam(d1, k = 3)   # K-Medoids

# Output
km
summary(km)

km$cluster      # cluster labels
km$medoids      # medoids instead of centers
km$clusinfo     # cluster info
km$id.med       # index of medoid rows
km$objective    # objective function value

# Confusion Matrix (optional)
cm = table(d$Spending.Score..1.100., km$cluster)
cm

# -----------------------
#   SCATTER PLOT
# -----------------------
plot(d1, col = km$cluster, pch = 19,
     main = "K-Medoids Clustering (PAM)",
     xlab = "Age", ylab = "Annual Income (k$)")

points(d1[km$id.med, ], 
       col = 1:3, 
       pch = 8, cex = 2, lwd = 2)   # medoids (stars)

# -----------------------
#   CLUSPLOT
# -----------------------
clusplot(d1, km$cluster,
         lines = 0, shade = TRUE, color = TRUE,
         labels = 2, plotchar = FALSE, span = TRUE,
         main = "Cluster Plot - K-Medoids (PAM)",
         xlab = "Age", ylab = "Annual Income (k$)")

# -----------------------
#   PREDICT NEW DATA
# -----------------------

set.seed(123)
newdata = d1[sample(nrow(d1), 10), ]
newdata

# Distance from newdata → each medoid
distances <- sapply(1:nrow(km$medoids), function(i)
  rowSums((as.matrix(newdata) - km$medoids[i, ])^2)
)

new_cluster = apply(distances, 1, which.min)
new_cluster
