set.seed(1)
n <- 100
x1 <- runif(n)
x2 <- runif(n)
y <- x1 + x2 + x1*x2
plot(y~x1)
dat<-data.frame(x1,x2,x1*x2,y)
dat<-dat[order(dat$x1),]#X1 is random, unless put in order
#there won't be any non-phsycothic relationship of the form
#as x1 goes up, y does/doesn't increase, decrease, exponentially
#drops or whatever...
fit<-loess(y ~ x1,data=dat)
lines(dat$x1,predict(fit,dat))