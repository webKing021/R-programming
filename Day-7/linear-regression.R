library(caTools)

# Load data
d = read.csv("D:\\Krutarth\\SEM-5\\Data-Mining\\Day-7\\dataprice.csv")

# Scatter plot
plot(d$horsepower, d$price, 
     xlab = "Horsepower", 
     ylab = "Price", 
     main = "Scatter plot")

# Split dataset
set.seed(123)
split = sample.split(d$price, SplitRatio = 0.7)
training_set = subset(d, split == TRUE)
testing_set = subset(d, split == FALSE)

# Train linear regression model
lm.r = lm(price ~ horsepower, data = training_set)
coef(lm.r)

# Predict on testing set
h = predict(lm.r, newdata = testing_set)
h

# Evaluate performance
actual = testing_set$price
rmse = sqrt(mean((actual - h)^2))
correlation = cor(actual, h)

rmse
correlation
