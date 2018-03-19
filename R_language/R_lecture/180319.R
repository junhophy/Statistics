#big_data_2018@aliyun.com
#passwd : big_data_2018

for(i in 1:10) print("Hello!")

i=10
while(i>0) {print("hello1!"); i <- i-1}

y <- 12345
x <- y/2
while(abs(x*x-y)>1e-10) { x= (x+y/x)/2; print(x); print(x^2); print(x*x)}

y <- 12345
x <- y/2
repeat   # !!!!!repeat!!!!!!
{
  x= (x+y/x)/2; print(x);  
  if(abs(x*x-y)< 1e-10) 
    {break}
}

#library(survival)
#detach("package:survival")  # detach a library!!!!!!

library(ISwR)
data("thuesen"); head(thuesen)
print(head(data(thuesen)))
plot(thuesen$blood.glucose, thuesen$short.velocity)

attach(thuesen)  # after attaching, thusen$blood.glucose --> blood.glucose
blood.glucose
short.velocity
plot(blood.glucose,short.velocity)
search()   # showing all attached data !!!!!!!!
class(thuesen)
detach(thuesen)    # detaching 
search()  

######### "with" function !!!!!  # it is sth about data processing
with(thuesen,plot(blood.glucose,short.velocity))

######### "subset" "transform" "within" function #####################
thue2 <- subset(thuesen,blood.glucose<7) ;print(thue2)
thue3 <- transform(thuesen,log.gluc =log(blood.glucose)); print(thue3)
print(dim(thue3))   #

thue4 <- within(thuesen, {
  log.gluc =log(blood.glucose)
  m <- mean(log.gluc)
  centered.log.gluc <- log.gluc -m
  rm(m)
}
)
print(thue4); print(dim(thue4))

thue5 <- with(thuesen, {
  log.gluc =log(blood.glucose)
  m <- mean(log.gluc)
  centered.log.gluc <- log.gluc -m
  rm(m)
}
)
print(thue5)  ### NULL ..... ?!?!?!?. with doesn't save data while within does


#####################  external dataset ################## (excel, spss data)
setwd("/Users/leejunho/Desktop/aliyun_0319")
getwd()
txt<-read.table("thuesen.txt", header = T)   # read in a txt file data, include the title in the fisrt row on data format with header=T
txt0<-read.table("thuesen.txt", header = F)  # read in a txt file data, the titile will contains in data itself
print(txt)
print(mode(txt)); print(class(txt))

txt1<-scan("thuesen.txt", skip = 1, 
           what = list(blood.glucose=0, short.velocity=0))  # scan to read in data
print(txt1)


#### read in excel file !!!!!!
data.excel <- read.delim("clipboard")  # !!!!!!after copy the data from excel document, you execute this command!!!!!!
data.excel

library("RODBC")
#channel <- odbcConnect("concrete.csv") ### I don't know how does it work....
#sqlTables(channel)
#data.excel2 <-sqlFetch(channel , "concrete")
#data.excel2 <-sqlQuery(channel, "selected*from[concrete$]")  # selecting from every page
#data.excel3 <-sqlQuery(channel, "select age, ash, water from[concrete$]")
#print(data.excel2)
#close(channel)

csv <-read.csv("concrete.csv", header = T)
print(head(csv))

library(foreign)
data.spss <- read.spss("salary.sav", to.data.frame = T)
print(head(data.spss))

library(Hmisc)
data.spss2 <- spss.get("salary.sav")   # !!!!!! I think this is better way !!!!!1
print(data.spss2)

#









