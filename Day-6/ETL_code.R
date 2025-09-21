install.packages("DBI")
install.packages("RMySQL")
install.packages("dplyr")

# connect to mysql
con <- dbConnect(
  RMySQL::MySQL(),
  dbname   = "dbname",
  host     = "localhost",
  user     = "root",
  password = "",
  port     = 3306
)

# extract (E)
# EXTRACT FULL TABLE

orders <- dbReadTable(con, "orders")

# or use a query
orders_recent <- dbGetQuery(con, "SELECT order_id, cust_id, order_date, price,
                            quantity FROM orders WHERE order_date >= '2025-01-01'")

# do data cleaning
orders_clean <- orders_recent %>%
  mutate(order_date = as.Date(order_date),
         revenue = price * quantity) %>%
  group_by(cust_id, month = format(order_date, "%Y-%m")) %>%
  summarise(total_revenue = sum(revenue, na.rm = TRUE))

# LOAD THE DATA
# CREATE OR OVERWIRTE TABLE
dbWriteTable(con, "monthly_revenue", orders_clean, overwrite = TRUE)

# OR append to existing table
dbWriteTable(con, "monthly_revenue", orders_clean, append = TRUE)

# disconnect connection
dbDisconnect(con)