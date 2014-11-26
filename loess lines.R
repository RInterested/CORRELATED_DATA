mtcars
attach(mtcars)
plot(disp~mpg,pch=cyl,col=cyl)
lines(lowess(disp~mpg))
  for  (i in c(4,6,8)){
    lines(lowess(disp[cyl==i]~mpg[cyl==i]),lty=1,col=i)
  }
