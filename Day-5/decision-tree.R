# decision tree
d = datasets::iris
d

dim(d)

cleandata<-na.exclude(d)
cleandata
dim(cleandata)

# sample
library(caTools)
set.seed(100)
s = sample.split(cleandata$Species, SplitRatio = 0.7)

# training data
traindata = cleandata[s, ]
traindata
dim(traindata)

# testing data
testdata = cleandata[-s, ]
testdata
dim(testdata)

# rpart
library(rpart)

# Build decision tree
tree_model <- rpart(Species ~ ., data = traindata, method = "class")

# View tree
print(tree_model)
summary(tree_model)

# Plot tree
library(rpart.plot)
rpart.plot(tree_model, main="Decision Tree for Iris Dataset")

pred <- predict(tree_model, testdata, type="class")
table(Predicted = pred, Actual = testdata$Species)
