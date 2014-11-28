> mtcars[mtcars$mpg]
Error in `[.data.frame`(mtcars, mtcars$mpg) : undefined columns selected
> mtcars[,mtcars$mpg]
Error in `[.data.frame`(mtcars, , mtcars$mpg) : 
  undefined columns selected
> mtcars[,mpg]
Error in `[.data.frame`(mtcars, , mpg) : object 'mpg' not found
> mtcars[,"mpg"]
 [1] 21.0 21.0 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 17.8 16.4
[13] 17.3 15.2 10.4 10.4 14.7 32.4 30.4 33.9 21.5 15.5 15.2 13.3
[25] 19.2 27.3 26.0 30.4 15.8 19.7 15.0 21.4



> mtcars[,"mpg""cyl"]
Error: unexpected string constant in "mtcars[,"mpg""cyl""
> mtcars[,"mpg"+"cyl"]
Error in "mpg" + "cyl" : non-numeric argument to binary operator
> mtcars[,"mpg"][,"cyl"]
Error in mtcars[, "mpg"][, "cyl"] : incorrect number of dimensions
> mtcars[,"mpg + cyl"]
Error in `[.data.frame`(mtcars, , "mpg + cyl") : 
  undefined columns selected
> mtcars[,"mpg cyl"]
Error in `[.data.frame`(mtcars, , "mpg cyl") : undefined columns selected
> mtcars[,"mpg";"cyl"]
Error: unexpected ';' in "mtcars[,"mpg";"
> mtcars[,c("mpg","cyl")]
                     mpg cyl
Mazda RX4           21.0   6
Mazda RX4 Wag       21.0   6
Datsun 710          22.8   4
Hornet 4 Drive      21.4   6
