# DATASETS
d=datasets::mtcars
d
dim(d)
x = prcomp(d, scale = TRUE, center = TRUE, retx = 7)
names(x)
x$rotation
x$center
x$sdev
x$scale
x$x
biplot(x, main = "BIPLOT", scale=0)


select(d,mpg)
distinct(d)
distinct(d, mpg)
#unique
