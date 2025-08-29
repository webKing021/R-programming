# DATASETS
d=datasets::mtcars
d
class(d)
dim(d)
nrow(d)
ncol(d)
names(d)
head(d,4)
tail(d,3)
View(d)
d[1,3]

# RBIND : is used to bind the set of rows from the datasets.
rbind(d[1:2,], d[6:7,])

# CBIND : 
cbind(d[,3],d[,6])

select(d,mpg)
distinct(d)
