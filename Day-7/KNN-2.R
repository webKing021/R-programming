library(caTools)
library(class)
library(e1071)

d = read.csv("D:\\cancer_data.csv", header = TRUE)
dim(d)

# sampling
s=sample(569,450)

# training set
training_set = d[s,]
training_set
dim(training_set)

# testing set
testing_set = d[-s,]
testing_set
dim(testing_set)


# normalization - z-scale : 1st method
train_scale = scale(training_set[-c(1,2)])
test_scale = scale(testing_set[-c(1,2)])

# 2nd method : subset
subset(testing_set, select = -c(1,2))

# 3rd method : 
View(d)
train_scale = scale(training_set[,3:32])
test_scale = scale(testing_set[,3:32])

# knn
cl_knn = knn(train = train_scale, test = test_scale, cl = training_set$diagnosis, k = 3)
cl_knn

# confusion matrix
cm = table(testing_set$diagnosis, cl_knn)
cm

# accuracy
t = mean(testing_set[,2] == cl_knn)
t

# % of errors
p = mean(testing_set[,2] != cl_knn)
p