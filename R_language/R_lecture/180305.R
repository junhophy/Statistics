#install.packages("installr")
#require(installr)
#updateR()

# 1.1 R previes
#install.packages("ISwR")
#library(ISwR)

c(42,35,23,53,52)
x<-c(1,2,3)
y<-c(10,20)
z<-c(x,y,5)
z

x = c(1,2,3,4)
x.1 <- c(1.1, 2.2, 3.3, 4,4)
x1<-c(1,2,3,4)
X<-c(1,2,3,4)

#x;X;x1
class(x)
class(x.1)
is.numeric(x)
is.factor(x)
is.integer(x)
is.character(x)

x1 <- c(1.1, 2.2, 3.3, 4.4, 5.5, 6.6)
x2 <- as.integer(x1)
x1; class(x1)
#x2; class(x2)
is.integer(x2); is.numeric(x2); is.character(x2)
is.logical(x2)

y <- c(T,T,F,F); y; is.logical(y)
y<-c(TRUE, FALSE); y; is.logical(y)
y1<-c(0,1,1,0); y1; is.logical(y1)
y1=as.logical(y1); y1; is.logical(y1)
y2<-c(0,1,2,3); y2; y2=as.logical(y2); y2
y3<-c(0.0,0.1,0.2,0.4,0.5,0.7, 0.8, 0.999999, 1); y3; y3=as.logical(y3); y3

x<-c(T,T,F,F); y<-c(0,2,3,4)
x=as.character(x); x; is.character(x)
#y=as.character(y); y; is.character(y)

 z <- c("I","you")
# z
 class(z)
# length(z)
nchar(z)
z=="I"

sex = factor(c(1,1,0,0,1), level=c(0,1), labels=c("male","female")); 
print(sex)
sex = factor(c(1,1,0,0,1), level=c(0,1)); 
print(sex)

#exp(-2)
#rnorm(16)

############ 2018/03/05

x <- c(1,2,3)
y <-c(10,20)
z <- x*c(3,2,1)
print(z)
z.1 <- c(x,5,y); print(z.1); length(z.1)

z.2 <- as.character(z.1); class(z.2); print(z.2)

x.1 <-c("Harry","Dewey","Louie"); class(x.1)
x.2 <- c("a","B",'C'); class(x.2)
x.3 <- c(T,T,F,T,F); class(x.3)

c("Harry","Dewey","Louie")         # output : "Harry" "Dewey" "Louie"
cat(c("Harry","Dewey","Louie"))    # output : Harry Dewey Louie  
cat("Harry","Dewey","Louie","\n")  # output : Harry Dewey Louie 
c("what is \"R\"?\n")              # cat to remove double quote
cat("what is \"R\"?\n")
cat("what is R ?\n")

x<-c(red="huey",blue="dewey",green="louie");  # adding tags : tag name : "red" "blue" "green"
x.1<-c("Harry","Dewey","Louie")
names(x); class(names(x)); class(x)
names(x.1); class(names(x.1)); class(x.1)
print(x); print(x.1)        
        
y.1<-c("1"=1, "2"=2, "3"=3); 
print(y.1)
names(y.1); 
class(names(y.1));
class(y.1);  # adding tags : tag name : "1", "2","3"
# so the tag has to be in format of string, the type of the data store inside is flexible.

z.0 <- c(F,3); print(z.0);
z.1 <- c(3.14,"abc"); print(z.1); class(z.1); names(z.1);  # so the vector inside has to be same type, the 3.14 would be change into string
z.3 <- c(FALSE,"abc"); print(z.3)
z.4 <- c("1",3.14); class(z.4); print(z.4);
z.4 <- as.double(z.4); class(z.4); print(z.4)
z.5 <- c(3.14,"abc") ; print(z.5); cat(z.5); 
class(cat(z.5)) ### Null.. needless

A=seq(from=4, to=9.1); print(A); class(A)   # you can see, seq always produces integer format 
Ac = c(seq(from=4, to=9.1)); print(Ac)
class(Ac)
A.1 = seq(4,9); print(A.1); class(A.1)
A.2<- seq(4,12,by=3); print(A.2)
A.3 <- 4:9; print(A.3); cat(A.3);
class(A.3)
print(cat(A.3))

oops <- c(7,9,13)
t = rep(oops,4); print(t); 
rep(oops,c(4,4,4))
1:3
rep(oops,1:3)
rep(oops, c(1,1,2))
rep(1:2, c(10,15))
rep(1:2, each=5); 
rep(1:2, 5)
rep(1:3, seq(1,3)) 
cat(rep(1:3, seq(1,3)))   # cat to remove output of "[]"

xx <-c(1,12)
print(xx)

x <- 1:12; print(x); 
#cat(x)
xd1 <- (dim(x) <- c(4,3)); 
print(xd1)  # dimension
xd2 <- (dim(x)<-c(2,2,3));
print(xd2)

y <- seq(1,12)

z.0 <-matrix(1:12, nrow=3); print(z.0)              # fill the matrix column first
z.1 <-matrix(1:12, nrow=3, byrow = T); print(z.1)   # fill in row first
print(z.1[1])
print(z.1[2]); 
print(z.1[2,])

x <- matrix(1:12, nrow=3, byrow=T); 
print(x)
rownames(x)<-LETTERS[4:6] # it is different fuction "LETTERS" and "letters"
colnames(x)<-letters[1:4]
print(x)
print(x[1]); 
print(x[1,]);
print(x[,1])

x.1 <- cbind(A=1:4, B=5:8, C=9:12); 
print(x.1)   # column bind
print(class(x.1))
x.2 <- rbind(A=1:4, B=5:8, C=9:12); 
print(x.2)   # row bind

rownames(x.1)<-LETTERS[1:4]; print(x.1)
colnames(x.1)<-letters[1:3]; print(x.1)
length(col(x.1)) ## ??? self test, how do I get row/col num????

rownames(x.1)<-c("j","u","n","h"); print(x.1)   # self written rownames 
colnames(x.1)<-c(1,2,3); print(x.1)             # seems the name doesn't need to be in type of string, it is also possible in type of integer
print(class(x.1)); 
print(is.integer(x.1)); 
print(is.numeric(x.1))
print(is.double(x.1))

rownames(x.1)<-c(T,F,TRUE,FALSE); print(x.1)
colnames(x.1)<-c("1",1,"test"); print(x.1); class(colnames(x.1))



