mtcars[mtcars$cyl==4,"mpg"]


##What does NOT work:
    #mtcars[mtcars$cyl==4,mtcars$mpg] 
    #Error in `[.data.frame`(mtcars, mtcars$cyl == 4, mtcars$mpg) : 
    #undefined columns selected
    
    #mtcars[cyl==4,mtcars$mpg] #event after attach(mtcars)
    #Error in `[.data.frame`(mtcars, cyl == 4, mtcars$mpg) : 
    #undefined columns selected
    
    #mtcars["cyl"==4,"mpg"] #even after attaching
    
    #or even more surprising:
    # mtcars[mtcars$cyl==4,mtcars$mpg]
    #Error in `[.data.frame`(mtcars, mtcars$cyl == 4, mtcars$mpg) : 
    #undefined columns selected
