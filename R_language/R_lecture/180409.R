setwd("C:/Users/skyblue1293/Desktop/group_study/Statistics/R_language/R_lecture")

library("devtools")
devtools::install_github("cran/mvpart")

library("TH.data")
data("bodyfat")
dim(bodyfat)
head(bodyfat,6)
tail(bodyfat,6)
attributes(bodyfat)
str(bodyfat)
print(bodyfat[1:5,3:5])

library(Hmisc)
describe(bodyfat$DEXfat)
summary(bodyfat$DEXfat)

##### CART algorithm
###1. regression tree for continuous random variable
set.seed(1234)
ind<-sample(2,nrow(bodyfat), replace=TRUE, prob=c(0.7,0.3)); ind
bodyfat.train<-bodyfat[ind==1,]
bodyfat.test<-bodyfat[ind==2,]
bodyfat.train
bodyfat.test

library(rpart)
library(rpart.plot)

formula_bodyfat<-DEXfat~age+waistcirc+hipcirc+elbowbreadth+kneebreadth
bodyfat_rpart<-rpart(formula_bodyfat, data=bodyfat.train,  control = rpart.control(minsplit = 10),  method = "anova")

attributes(bodyfat_rpart)
print(bodyfat_rpart)
printcp(bodyfat_rpart) ### complex detection print
summary(bodyfat_rpart)
rpart.plot(bodyfat_rpart, type=1)

bodyfat_pred <- predict(bodyfat_rpart, bodyfat.test)
xlim<-range(bodyfat$DEXfat)
plot(bodyfat_pred~DEXfat, data=bodyfat.test, xlab="Observed",  ylab = "Predicted", ylim = xlim, xlim=xlim)
abline(a=0, b=1)


####### 2. Classication decision tree
DEXfatcat="A"
bodyfat<-within(bodyfat, {DEXfatcat[DEXfat<22.33]     <-"A"
                          DEXfatcat[DEXfat>=22.33 & DEXfat<29.63] <-"B"
                          DEXfatcat[DEXfat>=29.63 & DEXfat<39.33] <-"C"
                          DEXfatcat[DEXfat>39.33]     <-"D"
                          }                )
# need sampling with sperated layer
a=round(1/4*sum(bodyfat$DEXfatcat=="A"))
b=round(1/4*sum(bodyfat$DEXfatcat=="B"))
c=round(1/4*sum(bodyfat$DEXfatcat=="C"))
d=round(1/4*sum(bodyfat$DEXfatcat=="D"))
a;b;c;d

library("lpSolve")
library("sampling")
sub<-strata(bodyfat, stratanames = "DEXfatcat",
            size=c(a,b,c,d), method="srswor" )
print(sub); attributes(sub)
train_bodyfat = bodyfat[-sub$ID_unit,]
test_bodyfat = bodyfat[sub$ID_unit,]
nrow(train_bodyfat)
nrow(test_bodyfat)

formula_bodyfat<-DEXfat~age+waistcirc+hipcirc+elbowbreadth+kneebreadth
bodyfat_rpart<-rpart(formula_bodyfat, data=bodyfat.train,  control = rpart.control(minsplit = 10),  method = "class")
rpart.plot(bodyfat_rpart, type=1)
bodyfat_rpart1<-rpart(formula_bodyfat, data=train_bodyfat, method = "class")
rpart.plot(bodyfat_rpart1, type=1)





