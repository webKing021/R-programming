library(caTools)

# Load data
d = read.csv("D:\\Krutarth\\SEM-5\\Data-Mining\\dataprice.csv")
print(dim(d))
print(names(d))
head(d)

# Scatter plot
plot(d$R.D.Spend, d$Profit,
     xlab = "R&D Spend",
     ylab = "Profit",
     main = "R&D Spend vs Profit",
     pch = 19)

# Split dataset (use Profit)
set.seed(123)
split = sample.split(d$Profit, SplitRatio = 0.7)
training_set = subset(d, split == TRUE)
testing_set = subset(d, split == FALSE)

# Train linear regression model
lm.r = lm(Profit ~ R.D.Spend + Administration + Marketing.Spend,
          data = training_set)

summary(lm.r)   # Full model details

# Predict on testing set
pred = predict(lm.r, newdata = testing_set)
pred

# Evaluate performance
actual = testing_set$Profit
rmse = sqrt(mean((actual - pred)^2))
correlation = cor(actual, pred)

rmse
correlation
