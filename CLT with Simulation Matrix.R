set.seed(220)
nosim <- 1000
n <- 40
sd(apply(matrix(rnorm(nosim * n), nosim),1,mean)) 
#The average of each row is obtained, and the SD of this sample of means is obtained with the /n - 1 denom.
# [1] 0.1625036
str(matrix(rnorm(nosim * n), nosim)) #There are 10,000 rnorm observations arranged in 1,000 rows.
#Matrix [1000,10] num [1:1000, 1:10]
str(apply(matrix(rnorm(nosim * n),nosim),1,mean))
#Vector [1000] num [1:1000] 
1/sqrt(n) #Theoretical SD
# [1] 0.1581139
#Close!
  
##Alternative approach:
  
samples_mean = NULL
for (i in 1 : 1000) samples_mean = c(samples_mean, mean(rnorm(40)))
str(samples_mean)
#Vector [1, 1000]  num [1:1000]
samples_mean
sd(samples_mean)
#[1] 0.1542957
