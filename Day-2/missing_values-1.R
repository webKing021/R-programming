data1 = read.csv("D:\\Krutarth\\SEM-5\\Data-Mining\\Day-2\\1.csv", header = TRUE)
data1

x <- is.na(data1)
t = (data1[!x])
t

# remove na values with rows
print(na.exclude(data1))

# input manually
a = data1$m1[is.na(data1$m1)] <- mean(data1$m1, na.rm = T)
a