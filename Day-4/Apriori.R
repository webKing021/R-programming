d <- read.transactions("D:\\Krutarth\\SEM-5\\Data-Mining\\Day-4\\ap.csv", 
                       format = "basket", 
                       sep = ",")

rules <- apriori(d, parameter = list(supp = 0.05, conf = 0.02))
rules

inspect(rules[1:10])


I = itemFrequencyPlot(d,
                  col = brewer.pal(10, "Pastel2"),
                  main = "Relative item frequency plot",
                  type = "relative",
                  ylab = "item frequency (relative)")

I