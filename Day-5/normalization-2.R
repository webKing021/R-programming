d = datasets::Orange
d

# min-max
x = (d$age - min(d$age)) / (max(d$age) - min(d$age))
x

# Z-SCORE
x_std<-scale(d$age)
x_std

# decimal-scaling
# x<-c(12,345,6789,45,9)
j<-ceiling(log10(max(abs(d$age))))
x_dec_scaled<-d$age/(10^j)
x_dec_scaled

# max(abs(x) - finds the largest absolute)

# 2.
x = (d$circumference - min(d$circumference)) / (max(d$circumference) - min(d$circumference))
x

x_std<-scale(d$circumference)
x_std


j<-ceiling(log10(max(abs(d$circumference))))
x_dec_scaled<-d$circumference/(10^j)
x_dec_scaled