#intake.pre <-c(5260, 5470, 5640, 6180, 6390, 6515, 6805, 7515, 7515, 8230, 8770)
#intake.post<-c(3910, 4220, 3885, 5160, 5645, 4680, 5265, 5975, 6790, 6900, 7335)

#mylist.1 <- list(before=intake.pre, after=intake.post)
#print(class(mylist.1))
#print(mylist.1)
#print(mylist.1$before); print(class(mylist.l$before))
#is.list(mylist.1); names(mylist.1)
#print(cat(mylist.1$before)); cat(mylist.1$before) # ? why null at the end of the position??
#print(cat(mylist.1))   # errors!! 

#mylist.2 <- list(intake.pre, intake.post)
#print(mylist.2)
#print(names(mylist.2)) # NULL!  

#rownames(mylist.2)<-LETTERS[1:2]
#colnames(mylist.2)<-letters[1:2]




##########DATA Frame
#intake.pre <-c(5260, 5470, 5640, 6180, 6390, 6515, 6805, 7515, 7515, 8230, 8770)
#intake.post<-c(3910, 4220, 3885, 5160, 5645, 4680, 5265, 5975, 6790, 6900, 7335)

#d.1 <-data.frame(intake.pre, intake.post)
#print(d.1); print(class(data.frame));  print(names(d.1))

#d.1 <-data.frame(before =intake.pre, after =intake.post); print(d.1); 
#colnames(d.1)<-LETTERS[1:2]; print(d.1)
#rownames(d.1)<-letters[1:11]; print(d.1)

#mylist.1 <- list(before=intake.pre, after=intake.post)
#d.2<-as.data.frame(mylist.1); print(d.2)
#d.3<-data.frame(mylist.1); print(d.3)    #seems d.2 and d.3 are identical
#print(d.2$before); print(class(d.2$before)); print(names(d.2)); print(class(names(d.2)))
#print(cat(d.2$after)); 
#print(cat(d.2)) ## !!!! errors!!!!!




########################## index   ###############
intake.pre <-c(5260, 5470, 5640, 6180, 6390, 6515, 6805, 7515, 7515, 8230, 8770)
intake.post<-c(3910, 4220, 3885, 5160, 5645, 4680, 5265, 5975, 6790, 6900, 7335)

print(intake.pre[5])
print(intake.post[c(1,2,3)])
print(intake.post[seq(1,10,2)])
print(intake.post[c(seq(1,10,2))])
print(cat(intake.post[seq(4)]));    #### End place why Null ????
cat(intake.post[seq(4)])            #### no Null here... Why?
print(class(intake.post[c(seq(1,10,2))]))
print(class(cat(intake.post[seq(4)])));   class(cat(intake.post[seq(4)]))   #### NULL ??????

v <- c(1,4,5); print(class(v)); print(names(v))
print(intake.post[v]); print(cat(intake.post[v])); cat(intake.post[v])

d.1<-data.frame(intake.post,intake.pre)
print(d.1[1][1])
print(d.1$intake.post[1]); print(d.1$intake.post[2])
print(d.1[1,1]); print(d.1[1,2]); print(d.1[1,])
print(d.1[,1]); print(d.1[1])
print(d.1[c(1,2,3),])

print(d.1[,1]+d.1[,2]); print(d.1[1]+d.1[2])
L <- as.list(d.1[1]+d.1[2]); print(L); print(class(L)); print(names(L))
cat(L$intake.post);print(""); print(class(L$intake.post)) # cat(L) would causes error, since it is a list



############## logical marks ###########
##   ==, !=, <=, >=, &, |, !

intake.pre <-c(5260, 5470, 5640, 6180, 6390, 6515, 6805, 7515, 7515, 8230, 8770)
intake.post<-c(3910, 4220, 3885, 5160, 5645, 4680, 5265, 5975, 6790, 6900, 7335)

print(intake.post>7000)
print(intake.pre>7000)
print(intake.post[intake.pre>7000])   ####  this!!!!!!
print(intake.post[intake.post>7000])   ####  this!!!!!!
print(intake.post[intake.post>4500 & intake.post<5500])
cat(intake.post[intake.post>4500 & intake.post<5500])
L <- as.list(intake.post)
print(L[L>4500 & L<5500])
print(L);head(L,2)

d<-data.frame(intake.pre, intake.post); print(d)
d[5,1]
d[d$intake.pre>7000,];
#d[,d$intake.post>7000] #errors

d[1:2,]
print(d)
head(d,2)
tail(d,2)



############### the practice
expend <- c(9.21, 7.53, 7.48, 8.08, 8.09, 10.15, 8.40, 10.88, 6.12, 7.90, 11.51, 12.79, 7.05, 11.85, 9.97, 7.48, 8.79, 9.69, 
            9.68, 7.58, 9.19, 8.11)
stature <- c(1,0,0,0,0,0,0,0,0,0,1,1,0,1,1,0,1,1,1,0,1,0); print(class(stature))
length(expend);length(stature)
expend <-as.factor(expend); print(expend); length(expend)
#fstature<-as.factor(stature); print(fstature); length(fstature); print(class(fstature)); print(class(stature))
fstature<-factor(stature, levels=c(0,1), labels=c("lean","obese")); print(class(fstature))
print(fstature)

energy <- data.frame(expend, fstature); #print(class(energy));
exp.lean <-expend[fstature=="lean"]; print(exp.lean) ; length(exp.lean)
exp.obese <- expend[fstature=="obese"]; print(exp.obese); length(exp.obese)

#### from teacher
#exp.lean <- energy$expend[energy$fstature=="lean"]
#exp.obese <- energy$expend[energy$fstature=="obese"] 

#exp.lean0 <-expend[fstature==0]; print(exp.lean0)

energy.split <-split(energy$expend,energy$fstature); 
print(energy.split)
print(as.numeric(energy.split$lean)); print(as.numeric(energy.split$obese))
energy.split$lean = as.numeric(energy.split$lean)
energy.split$obese = as.numeric(energy.split$obese)
print(as.numeric(energy.split$lean)); print(as.numeric(energy.split$obese))
print(energy.split)

print(exp.lean)
exp.lean <- data.frame(energy.split$lean); print(exp.lean)

############################
intake<-data.frame(intake.pre, intake.post)
colnames(intake)<-c("pre","post")
print(intake$post); print(class(intake$pre))
print(sort(intake$pre))
print(sort(intake$pre,  decreasing = TRUE))
ord <- order(intake.post); print(ord)      # outputs the ordered location of the data
print(intake)
intake$post[ord]  
intake$pre[ord]

intake.sorted <- intake[ord,]; print(intake.sorted);









