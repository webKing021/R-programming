d = datasets::mtcars

# shows the first 6 rows
head(d)

# Manual binning with cut()
d1 = cut(d$mpg, breaks=c(0,10,20,30), labels = c("first","second","third"))
d1

# Equal-width bins
bin = cut(d$mpg, breaks = 3)
bin

# Quantile-based bins with ntile()
bin1 = ntile(d$mpg, n = 3)
bin1