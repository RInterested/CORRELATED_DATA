library(quantmod)
getSymbols("VTI")
str(VTI) #We start with an xts
z = as.data.frame(VTI$VTI.Adjusted) #Subsetting VTI.Adjusted
head(z)
D2D = function (x) {
    days = nrow(x)
    delta = numeric(days)
    for(i in 2:days){
        delta[i] <- (100*((x[i,1] - x[i - 1,1])/(x[i - 1,1])))
    }
    delta
}
VTI.InterDay = D2D(z)
head(VTI.InterDay)
VTI.InterDay[1]<-mean(VTI.InterDay)#Something to fill in the 0 in row 1. 
#Why not the mean?
head(VTI.InterDay)
summary(VTI.InterDay)
vti = merge(VTI,VTI.InterDay)
str(vti) #And we end with an xts file!
head(vti)
min(vti$VTI.InterDay)
max(vti$VTI.InterDay)
time(vti[vti$VTI.InterDay==min(vti$VTI.InterDay)])
time(vti[vti$VTI.InterDay==max(vti$VTI.InterDay)])
hist(vti$VTI.InterDay,main="INTERDAY VTI % CHANGES: FAT TAILS",sub="fitted normal (in purple); pdf estimate (in blue)",xlab = "PERCENTAGE CHANGE FROM DAY TO DAY",
     ylab = "FREQUENCY",prob = TRUE, col ="yellow", ylim=c(0,0.30))
#lines(density(vti$VTI.InterDay),col="pink",lty="dotted",lwd=2)
#Add density estimate
lines(density(vti$VTI.InterDay,adjust=7),col="blue",lwd=4) #Prettier, adjusted pdf estimate
sd = sd(vti$VTI.InterDay)
m = mean(vti$VTI.InterDay)
curve(dnorm(x,mean=m,sd=sd),col="purple",lwd=4,add=T,yaxt="n")