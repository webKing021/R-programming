# d = datasets::mtcars
# d
# x = (d$mpg - min(d$mpg)) / (max(d$mpg) - min(d$mpg))
# x

# y = (d$mpg - mean(d$mpg)) / sd(d$mpg)
# y

# min-max
x<-c(2,4,6,8,19)
x_norm<-(x - min(x)) / (max(x) - min(x))
x_norm



# Z-SCORE
x_std<-scale(x)
x_std

# Decimal-scaling
