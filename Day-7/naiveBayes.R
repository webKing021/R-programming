library(e1071)
d = datasets::iris

s = sample(150,100)
training_set = d[s,]
training_set

testing_set = d[-s,]
testing_set

n = naiveBayes(Species ~ ., data = training_set)
n

p = predict(n, newdata = testing_set)
p

a = data.frame(testing_set, p)

cm = table(testing_set$Species, p)
cm

a = mean(testing_set$Species == p)
a