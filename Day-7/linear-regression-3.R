library(ggplot2)
library(caTools)

# sample data
d <- data.frame(
  exp = c(1.1, 1.3, 1.5, 2.0, 2.2, 2.9, 3.0, 3.2, 3.2, 3.7),
  sal = c(39343.00, 46205.00, 37731.00, 43525.00, 39891.00, 56642.00, 60150.00, 54445.00, 64445.00, 57189.00)
)

# scatter plot
plot(d$exp, d$sal, 
     xlab = "Years of Experience", 
     ylab = "Salary", 
     main = "Scatter Plot of Years Experienced vs Salary")

# Split data into training and test sets
set.seed(123)
split <- sample.split(d$sal, SplitRatio = 0.7)
trainingset <- subset(d, split == TRUE)
testset <- subset(d, split == FALSE)

# Fit simple linear regression
result <- lm(formula = sal ~ exp, data = trainingset)
summary(result)

# Predict on test set
ypred <- predict(result, newdata = testset)
print(ypred)

# Plot training set results
ggplot() +
  geom_point(aes(x = trainingset$exp, y = trainingset$sal), colour = "red") +
  geom_line(aes(x = trainingset$exp, y = predict(result, newdata = trainingset)), colour = "blue") +
  ggtitle("Salary vs Experience (Training Set)") +
  xlab("Years of Experience") +
  ylab("Salary")

# Plot testset set results
ggplot() +
  geom_point(aes(x = testset$exp, y = testset$sal), colour = "red") +
  geom_line(aes(x = trainingset$exp, y = predict(result, newdata = trainingset)), colour = "blue") +
  ggtitle("Salary vs Experience (testset Set)") +
  xlab("Years of Experience") +
  ylab("Salary")
