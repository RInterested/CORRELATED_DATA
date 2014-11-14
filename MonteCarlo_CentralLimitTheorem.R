CentralLimit <- function(n){
    means_of_samples <<-numeric()
    for (i in 1:n){
        means_of_samples <- c(means_of_samples,mean(rnorm(sampsize,mean,sd)))
    }
    samples_means <<- means_of_samples
    sd(samples_means)
}
sampsize <- 100
mean <- 0
sd <- 1
CentralLimit(1000)
head(samples_means)
x   <- seq(-5,5,length=1000)
y   <- dnorm(x,mean, sd)
par(mfrow=c(1,2))
plot(x,y, type="l",ylab="pdf",xlab="standard Norm",col="purple",lwd=4)
hist(samples_means,freq = F,yaxt="n")
x <- seq(-3,3,length=1000)
curve(dnorm(x,mean=mean(samples_means),
    sd=sd(samples_means)),col="purple",lwd=4,add=T,yaxt="n")