# decision tree
d = datasets::iris
d

dim(d)

cleandata<-na.exclude(d)
cleandata
dim(cleandata)

# sample
set.seed(100)
s = sample.split(d.splitRatio = 0.7)

# training data
traindata = cleandata[s, ]
traindata
dim(traindata)

# testing data
testdata = cleandata[-s, ]
testdata
dim(testdata)

# rpart
