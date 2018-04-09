library(arules)

rules.all<-apriori(titanic.raw)
rules.all
inspect(rules.all)

rules1<-apriori(titanic.raw, control = list(verbose=FALSE),
                parameter = list(minlen=2, supp=0.005, conf=0.8),
                appearance = list(rhs=c("Survived=No","Survived=Yes"),
                                  default="lhs"))
rules1
inspect(rules1)

quality(rules1)<-round(quality(rules1),digits = 3)
inspect(rules1)

rules1.sorted<-sort(rules1, by="lift")
inspect(rules1.sorted)

rules1.sorted<-sort(rules1, by="lift", decreasing = FALSE)
inspect(rules1.sorted)

subset.matrix<- is.subset(rules1.sorted, rules1.sorted, sparse=FALSE)
subset.matrix[lower.tri(subset.matrix, diag=TRUE)] <-NA

colSums(subset.matrix, na.rm = TRUE)
reduntdant<-colSums(subset.matrix, na.rm = TRUE) >=1


