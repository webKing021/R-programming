data = datasets::airquality
data

x <- is.na(data1)
t = (data1[!x])
t

# remove na values with rows
print(na.exclude(data))

dim(data)
names(data)
