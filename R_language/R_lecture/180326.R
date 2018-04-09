setwd("/Users/leejunho/Desktop/git/python3Env/group_study/NOT_USUALLY_VISIT/statistic_group_study/R_language/R_lecture/aliyun_0319")
getwd()

insurance <- read.csv("insurance.csv", header=T)
insurance.0 <- read.csv("insurance.csv", header=T)

print(class(insurance))
insurance <-insurance[-1]     ### delete first column !!!!!!!! 

# sample(x, size, replace = False, prob = Null)
sub1 <- sample(nrow(insurance),10, replace = T)
print(sub1); print(class(sub1))
insurance[sub1,]


library(sampling) 
#strata(data, stratanames = NULL, size , method, pik, description) 
sub4 <- strata(insurance, stratanames="District",size<-c(1,2,3,4),method="srswor" )
print(sub4)

#getdata(data, m) # m:vector of selected units or sample data frame
getdata(insurance,sub4)

Jsub1 <- sample(nrow(insurance),48, replace = F); Jsub1
Jsub2 <-insurance[Jsub1,]; 
Jsub1 <-insurance[-Jsub1,]
print(Jsub1)
print(Jsub2)

setwd("/Users/leejunho/Desktop/git/python3Env/group_study/NOT_USUALLY_VISIT/statistic_group_study/R_language/R_lecture/aliyun_0319")
getwd()
is.data.frame(titanic.raw)
tananic.raw<-as.data.frame(titanic.raw)
summary(titanic.raw)
str(titanic.raw)
head(titanic.raw)

Titanic
str(Titanic)
df<-as.data.frame(Titanic)
head(df)
titanic.raw.pre <-NULL
for(i in 1:4){
  titanic.raw.pre <-cbind(titanic.raw.pre,
                          rep(as.character(df[,i]),df$Freq))
}

print(titanic.raw.pre)
titanic.raw.pre<-as.data.frame(titanic.raw.pre)
names(titanic.raw.pre)<-names(df)[1:4]
print(titanic.raw.pre)






