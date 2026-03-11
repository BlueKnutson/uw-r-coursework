#####################################################
## title: first problem set!
## author: Blue Knutson
## purpose: to try out R
## date: 6/29/2023
#####################################################
#1
vec <- c(1:20)
vec2 <- c(vec*2)
print(vec2)
#2
install.packages("dplyr")
library(dplyr)
df <- bind_cols(vec, vec2)
print(df)

# plot your dataframe 
# note that you will have to define df
# in this case, df is the binded columns of vec and vec multiplied by 2
#3
names(df) <- c("x", "y")

#plot(df$x, df$y)
install.packages('ggplot2')
library(ggplot2)
ggplot(df, aes(x, y))+geom_point()


#4

library(readr)
temps<- read_csv("temps.csv")

names(temps)<- c("year", "anual average temperature")
#install.packages('ggplot2')
library(ggplot2)
plot(temps,col = 'red', main = "graph of average temperature over time")

#4 there is no plot in section 1.5 so I'm guessing that you just mean the graph in
#1.6 let me know if this assumption is incorrect. This graph is important because it shows
#that average global temperatures are increasing. I need more R and statistics experience
#to show that this trend is actually significant however given that it is, given 
#that these temperatures are getting higher, people in certian geographical areas
#will be dissproportinatly effected by this raise in temperature. It can lead to 
#more natural disasters, droughts, forest fires, famines, and the forced abbandonement of 
#areas no longer suitable for human life. These higher temperatures (in the beggining) will
#mostly effect the poor since people with moneny will be able to move and cope with the
#changing climate much better.


