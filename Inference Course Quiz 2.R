##
x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
fit <-lm(y ~ x)
summary(fit)
##
e <- resid(fit)
sqe <- e*e
variance <- sum(sqe) / (length(e) - 2)
sqrt(variance)  
##
data(mtcars)
x <- mtcars$wt
y <- mtcars$mpg
fit<-lm(y ~ x)
summary(fit)
newdata <- data.frame(x = mean(x))
predict(fit, newdata, interval="confidence") 
##
newdata <- data.frame(x = 3)
predict(fit, newdata, interval="prediction")
##
w <- mtcars$wt/2
w
fit2 <-lm(y ~ w)
summary(fit2)
##
confint(fit, 'x', level=0.95)
##
mean(y)
q <- y - (mean(y))
p <- sum(q^2)
r<-sum(resid(fit)^2)
r/p
