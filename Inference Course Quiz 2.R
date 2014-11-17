data(mtcars)
x <- mtcars$wt
y <- mtcars$mpg
fit<-lm(y ~ x)
summary(fit)
newdata <- data.frame(x = mean(x))
predict(fit, newdata, interval="confidence") 