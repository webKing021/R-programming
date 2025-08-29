# VECTOR - GROUP OF SAME TYPE OF DATATYPE
data = c(1,2,3,4,5)
data
s = c("a","b","c")
s


# MATRIX
a = matrix(1:12, nrow=3, ncol=4)
a

b = c(1,2,3,4,5)
matrix(b,nrow=3)

matrix(b, ncol=3)


# LIST - IT CONTAINS MIXTURE OF DATATYPE AND VALUES
l = list(rno=1,name="abs", class="first")
l
l[2]


# FACTOR - IT STORES THE NOMINAL VALUES AS A VECTOR OF INTEGERS IN THE RANGE(NUMBER OF UNIQUE VALUES)
# AND AN INTERNAL VECTOR OF CHARACTER STRING MAPPED TO THIS ITEMS.
a = c('a','b','c','a','a','b','c')
f = factor(a)
f
t = table(f)
t

# DATA FRAME - HERE THE FRAME WILL BE CREATED WHICH WILL STORE DATA IN TABULAR FORMAT
df = data.frame("rno" = 1:3, "name" = c("a","b","c"), "color"=c("red","blue","green"))
df


# LOOPS : 
for (i in c(1:5))
{
  print(i)
}

i=1
while(i<=3)
{
  print(i)
  i = i+1
}


# IF ELSE
n=2
if (n>0) print("positive") else print("-ve")

# USER DEFINE FUNCTION
factorial<-function(n)
{
  fact = 1
  for (i in 1:n)
  {
    fact = fact*i
  }
  return (fact)
}

# DATASETS
d=datasets::Titanic
d
class(d)
dim(d)
nrow(d)
ncol(d)
names(d)
