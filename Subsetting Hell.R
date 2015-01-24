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

data <- mtcars$mpg[mtcars$cyl==6]
data
[1] 21.0 21.0 21.4 18.1 19.2 17.8 19.7

head(wideCW14)
  Diet Chick time0 time2 time4 time6 time8 time10 time12 time14 time16 time18 time20 time21 gain
1    1    18    39    35    NA    NA    NA     NA     NA     NA     NA     NA     NA     NA   NA
2    1    16    41    45    49    51    57     51     54     NA     NA     NA     NA     NA   NA
3    1    15    41    49    56    64    68     68     67     68     NA     NA     NA     NA   NA
4    1    13    41    48    53    60    65     67     71     70     71     81     91     96   55
5    1     9    42    51    59    68    85     96     90     92     93    100    100     98   56
6    1    20    41    47    54    58    65     73     77     89     98    107    115    117   76

str(wideCW14)
'data.frame':	30 obs. of  15 variables:
 $ Diet  : Factor w/ 4 levels "1","2","3","4": 1 1 1 1 1 1 1 1 1 1 ...
 $ Chick : Ord.factor w/ 50 levels "18"<"16"<"15"<..: 1 2 3 4 5 6 7 8 9 10 ...
 $ time0 : num  39 41 41 41 42 41 41 42 42 43 ...
 $ time2 : num  35 45 49 48 51 47 44 50 51 48 ...

YES:
wideCW14[wideCW14$Diet=="1","gain"]
 [1]  NA  NA  NA  55  56  76  83  NA 100 114 115 116 132 159 163 164 175 182 225 264

and...

YES:
For numerical variables, no need for " ":
wideCW14[wideCW14$time0==41,"gain"]
 [1]  NA  NA  55  76  83 116 164 182 225 264 155 164 223

#DEALING WITH NA'S AFTER SUBSETTING:
-----------------------------------

mean(wideCW14[wideCW14$time0==41,"gain"])
[1] NA
mean(wideCW14[wideCW14$time0==41,"gain"],na.rm=T)
[1] 155.1818

but...

NO: 
wideCW14["Diet"=="1","gain"]
numeric(0)

Even after attaching...
attach(wideCW14)
wideCW14["Diet"=="1","gain"]
numeric(0)

NO:
wideCW14[wideCW14$Diet=="1",gain]
Error in `[.data.frame`(wideCW14, wideCW14$Diet == "1", gain) : 
  object 'gain' not found

NO:
wideCW14[wideCW14$Diet=="1",wideCW14$gain]
Error in `[.data.frame`(wideCW14, wideCW14$Diet == "1", wideCW14$gain) : 
  undefined columns selected


