d = datasets::mtcars
d

x = (d$mpg - min(d$mpg)) / max(d$mpg) - min(d$mpg)
x

y = (d$mpg - mean(d$mpg)) / sd(d$mpg)
y

