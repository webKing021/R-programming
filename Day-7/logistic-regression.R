library(ROCR)
library(caTools)

d = datasets::mtcars
split = sample.split(d, SplitRatio = 0.8)
training_set = subset(d, split == TRUE)
test_set = subset(d, split == FALSE)

logistic_model = glm(vs ~ wt + disp, data = training_set, family = "binomial")
logistic_model
summary(logistic_model)

predict_reg = predict(logistic_model, test_set, type = "response")
predict_reg

predict_reg = ifelse(predict_reg > 0.5, 1, 0)
table(test_set$vs, predict_reg)