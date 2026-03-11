#################################################
## title: R script
## name: Blue
## date 6/29/2023
##purpose: try out R
#################################################

c(2,3,4+3,53*2,90*4/5)
as.integer(4.3)
if (5==4) 3
as.numeric(3)<as.character(4)
as.integer(3)
as.logical(-2)

matrix(c(matrix(c(2,3,4))),c(matrix(c(5,6,7))),c(matrix(c(8,9,10))) )

matrix(c(1,2,3,8),c(4,5,6,9),c(7,8,9,8))

thingy <- c(1,2,3,4)
newThingy <- sum(thingy)

sqare <- function(x){
  return (x*x)
}
sqare(newThingy)

for(i in 1:10){
  if(i<4){
    print(i)
  }
}
ten <- c(1:10)
sapply(ten, function(x) x+1)
install.packages("readr")
library(readr)
