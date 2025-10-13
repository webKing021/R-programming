library(ggplot2)
library(S7)

x = c(151,174,138,186,128,136,179,163,152,131)
y = c(63,81,56,91,47,57,76,72,62,48)

# lm = linear model
relation <- lm(y~x)
print(relation)
print(summary(relation))

# predict
a = data.frame(x = 170)
result = predict(relation,a)
print(result)

plot(y,x,col="blue", main="Height & Weight Regression", 
     abline(lm(x~y)), cex=1.3, pch=16, xlab="Weight in KG", ylab = "Height in CM")

f = -38.4551 + 0.6746(170)
f