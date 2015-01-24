head(mtcars)
                   mpg cyl disp  hp drat    wt  qsec vs am gear carb
Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1

#SELECTING A COLUMN:
-------------------

YES:
> mtcars[,"mpg"]
 [1] 21.0 21.0 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 17.8 16.4
[13] 17.3 15.2 10.4 10.4 14.7 32.4 30.4 33.9 21.5 15.5 15.2 13.3
[25] 19.2 27.3 26.0 30.4 15.8 19.7 15.0 21.4

NO:
> mtcars[mtcars$mpg]
Error in `[.data.frame`(mtcars, mtcars$mpg) : undefined columns selected
> mtcars[,mtcars$mpg]
Error in `[.data.frame`(mtcars, , mtcars$mpg) : 
  undefined columns selected
> mtcars[,mpg]
Error in `[.data.frame`(mtcars, , mpg) : object 'mpg' not found

#SELECTING TWO COLUMNS:
-----------------------

YES:
> mtcars[,c("mpg","cyl")]
                     mpg cyl
Mazda RX4           21.0   6
Mazda RX4 Wag       21.0   6
Datsun 710          22.8   4
Hornet 4 Drive      21.4   6

NO:
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

#SELECT THE VALUES OF TWO COLUMNS FOR A PARTICULAR ROW:
------------------------------------------------------

YES:
> mtcars["Mazda RX4",c("mpg","cyl")]
          mpg cyl
Mazda RX4  21   6

#RETURN ONLY THE VALUES OF A COLUMN CONDITIONAL ON THE VALUES ON A DIFFERENT COLUMN:
-----------------------------------------------------------------------------------

#Select the values of a column corresponding to specific values in a separate column: 
#We want the miles per gallon of 6 cylinder cars:

USING THE $ SIGN BEFORE THE []:

YES

data <- mtcars$mpg[mtcars$cyl==6]
data
[1] 21.0 21.0 21.4 18.1 19.2 17.8 19.7

NOT USING THE $ SIGN BEFORE []:

YES

mtcars[mtcars$cyl=="6","mpg"]
[1] 21.0 21.0 21.4 18.1 19.2 17.8 19.7

and...

YES:
For numerical variables, no need for " ":

mtcars[mtcars$cyl==6,"mpg"]
[1] 21.0 21.0 21.4 18.1 19.2 17.8 19.7

#DEALING WITH NA'S AFTER SUBSETTING:
-----------------------------------

mean(wideCW14[wideCW14$time0==41,"gain"])
[1] NA
mean(wideCW14[wideCW14$time0==41,"gain"],na.rm=T)
[1] 155.1818

but...

NO: 
mtcars["cyl"==6,"mpg"]
numeric(0)

Even after attaching...

attach(mtcars)
mtcars["cyl"==6,"mpg"]
numeric(0)

NO:
mtcars["cyl"==6,mpg]
Error in `[.data.frame`(mtcars, "cyl" == 6, mpg) : 
  undefined columns selected

NO:
mtcars[mtcars$cyl==6,mtcars$mpg]
Error in `[.data.frame`(mtcars, mtcars$cyl == 6, mtcars$mpg) : 
  undefined columns selected


