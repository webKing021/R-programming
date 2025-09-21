d=datasets::iris
d
dim(d)

# take random samples
s=sample(150,120)
s

# training data
training_set=d[s,]
training_set
dim(training_set)
training_set

# testing data
testing_set=d[-s,]
testing_set
dim(testing_set)
testing_set

# make decision tree
dt <- rpart(Species ~ Petal.Length + Petal.Width + Sepal.Length + Sepal.Width,
            data = training_set,
            method = "class")
dt

# draw plot
rpart.plot(dt)

# predict for prediction
predict1 = predict(dt, testing_set, type = "class")
predict1

# make tabluar format for confusion matrix
table(testing_set[,5], predict1)

# accurry
mean(testing_set[,5] == predict1)

# create data
newdata <- data.frame(Petal.Length = 4.7, Petal.Width = 3.8,
                      Sepal.Length = 4.9, Sepal.Width = 4.0)

# apply into modal
new_predict <- predict(dt, newdata, type = "class")
new_predict