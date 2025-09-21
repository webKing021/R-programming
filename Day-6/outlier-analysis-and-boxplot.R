d = datasets::airquality
d
boxplot(d)
boxplot.stats(d)
dim(d)

str(d)

# FUNCTION TO REMOVE OUTLIERS
remove_outliers <- function(x) {
  q1 <- quantile(x, 0.25, na.rm = TRUE)
  q3 <- quantile(x, 0.75, na.rm = TRUE)
  iqr <- IQR(x, na.rm = TRUE)
  
  # DETERMINE THE BOUNDS FOR OUTLIERS
  lower_bound <- q1 - 1.5 * iqr
  upper_bound <- q3 + 1.5 * iqr
  
  # RETURN THE VALUES WITHIN THE BOUNDS, REPLACING OUTLIERS WITH NA.
  x[x < lower_bound | x > upper_bound] <- NA
  return(x)
}

airquality_cleaned <- d %>%
  mutate(across(where(is.numeric), remove_outliers))

print(airquality_cleaned)

airquality_cleaned <- na.omit(airquality_cleaned)

print(airquality_cleaned)

boxplot(airquality_cleaned$Ozone,main = "Boxplot",ylab = "rows",xlab="cols",col = "lightblue")
