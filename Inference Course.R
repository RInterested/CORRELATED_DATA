##Brain volume for adult women is normally distributed with a mean of about 1,100 cc 
##for women with a standard deviation of 75 cc. 
##About what brain volume represents the 95th percentile?
qnorm(0.95,1100,75)
1100 + (1.5 * 75)

##Brain volume for adult women is about 1,100 cc for women with a standard deviation of 75 cc.
##Consider the sample mean of 100 random adult women from this population. 
##Around what is the 95th percentile of the distribution of that sample mean?
qnorm(0.95,1100,(75/(100)^(1/2)))

##You flip a fair coin 5 times, about what's the probability of getting 4 or 5 heads?
dbinom(5, size = 5, prob = 0.5) + dbinom(4, size = 5, prob = 0.5)
##Five Bernouilli trials, prob success = 1/2, and we want 5 wins. + p(4 wins)

##The respiratory disturbance index (RDI), a measure of sleep disturbance, 
##for a specific population has a 
##mean of 15 (sleep events per hour) and a standard deviation of 10. 
##They are not normally distributed. 
##Give your best estimate of the probability that a sample mean RDI of 100 people is 
##between 14 and 16 events per hour?
SD_samplemeans <- 10/(100)^(1/2)
SD_samplemeans
#Expectation mean of sample means is 15 +/- SD_samplemeans (1) = 14 - 16. +/- 1 SD comprises 68%

#Consider a standard uniform density. 
#The mean for this density is .5 and the variance is 1/12. 
#You sample 1,000 observations from this distribution and take the sample mean, 
#what value would you expect it to be near? 

.5

#The number of people showing up at a bus stop is assumed to be 
#Poisson with a mean of 5 people per hour. 
#You watch the bus stop for 3 hours. 
#About what's the probability of viewing 10 or fewer people?
ppois(10, lambda = 15)
