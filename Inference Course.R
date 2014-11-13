##Brain volume for adult women is normally distributed with a mean of about 1,100 cc 
##for women with a standard deviation of 75 cc. 
##About what brain volume represents the 95th percentile?
qnorm(0.95,1100,75)
1100 + (1.5 * 75)
##Brain volume for adult women is about 1,100 cc for women with a standard deviation of 75 cc.
##Consider the sample mean of 100 random adult women from this population. 
##Around what is the 95th percentile of the distribution of that sample mean?
qnorm(0.95,1100,(75/(100)^(1/2)))