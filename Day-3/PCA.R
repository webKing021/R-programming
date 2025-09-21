# DATASETS
d=datasets::mtcars
d
dim(d)
x = prcomp(d, scale. = TRUE, center = TRUE, retx = TRUE)
names(x)
x$rotation
x$center
x$sdev
x$scale
x$x
biplot(x, main = "BIPLOT", scale=0)

# dyplyr
select(d,mpg)

# distinct
distinct(d)
distinct(d, mpg)

#unique
unique(d$mpg)
unique(d)