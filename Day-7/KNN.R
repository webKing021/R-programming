library(caTools)
library(class)
library(e1071)

d = datasets::iris
dim(d)

# sampling
s=sample(150,120)

# training set
training_set = d[s,]
training_set
dim(training_set)

# testing set
testing_set = d[-s,]
testing_set
dim(testing_set)

# normalization - z-scale
train_scale = scale(training_set[,1:4])
test_scale = scale(testing_set[,1:4])

# knn
cl_knn = knn(train = train_scale, test = test_scale, cl = training_set$Species, k = 3)
cl_knn

# confusion matrix
cm = table(testing_set[,5], cl_knn)
cm

# accuracy
t = mean(testing_set[,5] == cl_knn)
t

# % of errors
p = mean(testing_set[,5] != cl_knn)
p