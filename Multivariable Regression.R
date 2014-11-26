set.seed(1)
covariate <- sample(0:1, 100, replace=TRUE)
exposure <- runif(100,0,1)+(0.3*covariate)
outcome <- 2.0+(0.5*exposure)+(0.25*covariate)

## Simple regression analysis - would be wrong!
summary(lm(outcome ~ exposure))

## Multiple regression analysis
summary(lm(outcome ~ exposure + covariate))

## Correlation between covariate and exposure
cor(covariate, exposure)

## "Partialling-out" approach
## Regress exposure on covariate
summary(lmEC <- lm(exposure ~ covariate))
## Save residuals
lmEC.resid <- residuals(lmEC)
## Regress outcome on residuals
summary(lm(outcome ~ lmEC.resid))

## Check formula
sum(lmEC.resid*outcome)/(sum(lmEC.resid^2))
