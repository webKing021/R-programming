d = read.csv("D:\\Krutarth\\SEM-5\\Data-Mining\\dataprice.csv", header = TRUE)
d

d$State = factor(d$State, levels = c("New York", "California", "Florida"), labels = c(1,2,3))
d$State

library(caTools)

set.seed(123)
split = sample.split(d$Profit, SplitRatio = 0.8)
training_set = subset(d, split == TRUE)
test_set = subset(d, split == FALSE)

regressor = lm(formula = Profit ~ ., data = training_set)

ypred = predict(regressor, newdata = test_set)
ypred

plot(d$Profit, d$Marketing.Spend, xlab = "Marketing Spend", ylab = "Profit", main = "Scatter Plot of Marketing")

plot(test_set, ypred, main = "Scatter Plot of test and Predicted dataSS")