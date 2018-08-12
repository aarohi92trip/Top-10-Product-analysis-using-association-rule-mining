# Association Rules
install.packages("arulesViz") 
library(arulesViz)
getwd()
setwd("C:\\Users\\aaroh\\Documents\\BA with R")
#read the transaction dataset
assocs = read.transactions("transactions.csv", format="single",sep = ",", cols = c("Transaction","Product"), rm.duplicates = FALSE)
#predict top 20 selling products
itemFrequencyPlot(assocs,topN=20,type="absolute")
#predict the association rules on the basis of support and confidence
rules <- apriori(assocs, parameter = list(supp = 0.03, conf = 0.20, minlen = 2, maxlen = 4))
rules <- sort(rules, by="lift", decreasing=TRUE)
options(digits = 2)
inspect(rules[1:9])
summary(rules)
plot(rules)
#check for redundant rules
redundant_index <- is.redundant(rules)
pruned_rules <- rules[!redundant_index]
inspect(pruned_rules[1:9])
summary(pruned_rules)

