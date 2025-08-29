d = datasets::mtcars

head(d)

d1 = cut(d$mpg, breaks=c(0,10,20,30), labels = c("first","second","third"))
d1

bin = cut(d$mpg, breaks = 3)
bin
bin1 = ntile(d$mpg, n = 3)
bin1