set.seed(2)
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
sd <- 1000
CentralLimit(1000)
head(samples_means)
x   <- seq(-(5*sd),(5*sd),length=1000)
y   <- dnorm(x,mean, sd)
par(mfrow=c(1,2))
plot(x,y, type="l",ylab="pdf",xlab="population",col="purple",lwd=4,yaxt="n")
hist(samples_means,freq = F,yaxt="n",main = "",
     xlim=c(-(5*sd(samples_means)),(5*sd(samples_means))))
x <- seq(-(5*sd(samples_means)),(5*sd(samples_means)),
         length=1000)
curve(dnorm(x,mean=mean(samples_means),
    sd=sd(samples_means)),col="purple",lwd=4,add=T,yaxt="n")