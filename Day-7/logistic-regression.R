library(ROCR)
library(caTools)

# Load dataset
d = datasets::mtcars

# Split dataset correctly
split = sample.split(d$vs, SplitRatio = 0.8)
tr = subset(d, split == TRUE)
ts = subset(d, split == FALSE)

# Logistic regression model
logm = glm(vs ~ wt + disp, data = tr, family = "binomial")
summary(logm)

# Predict probabilities
predreg = predict(logm, ts, type = "response")

# Convert probabilities to 0/1
pred_class = ifelse(predreg > 0.5, 1, 0)

# Confusion matrix
table(Actual = ts$vs, Predicted = pred_class)
