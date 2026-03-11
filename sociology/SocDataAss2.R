#install.packages('readr')
library(readr)

temps <- read_csv("temps.csv")

FtoC = function(Farenheight){
  answer <- (Farenheight-32)*5/9
  return(answer)
}

temps$celsius = NA
temps$celsius = FtoC(temps$`Annual Average Temperature (F)`)
plot(temps)



#install.packages("gtrendsR")

library(gtrendsR)

graphy <- gtrends(c("greenhouse", "carbon emissions"), 
                  geo = c("US"))
plot(graphy)

#the greenhouse searches peak every year from around the beggining/middle of year. It seems
#like the peaks line up with earth day every year which would make sense. However, these 
#spikes tend to last around a month which is surprising if a holiday were the answer to the 
#question. It could be that people start getting allergies around this time and blame
#carbon emmissions as the culrpit. This would also explain why people wouldn't search up 
#carbon emmissions seasonoally since people wouldn't blame carbon for their allergies


#install.packages("readr")
library(readr)
#install.packages("dpylr")
library(dplyr)
#install.packages("magrittr")
library(magrittr)
#install.packages('stringr')
library(stringr)
disasters <- read_csv("us_disasters_table.csv")
#print(disasters)
# function to conver "X billion" or "Y million" into numeric values
money_numeric <- function(money){
  # get numeric amount (we will use the first cost provided, although this may cause issues)
  num <- str_extract(money, "\\$([0-9,.]+)")
  # remove the dollar sign
  num %<>%
    str_remove_all("\\$")
  
  # get the million/billion value
  order <- str_extract(money, "million|billion")
  # replace these with appropriate number of zeros
  order %<>%
    str_replace("million", "1000000") %>%
    str_replace("billion", "1000000000")
  
  # create value
  val = as.numeric(num)*as.numeric(order)
  
  return(val)
}

new_cost <- (money_numeric(disasters$Damage.costUS.))
print(disasters$Damage.costUS.)
print(new_cost)

#the function was great at changing the values, in new_cost all of the values were
#changed to the corresponding number without any words in front of them. 
#The only unfortunate problem is that it uses the exponent power format which is 
#difficult to visualize.

plot(new_cost, disasters$Death.toll)

#I really can't garner much meaning from the graph, many of the values in new_cost we NA which
#throws up all sorts of errors for R and almost all the data is at 0 dollars for the cost
#(I believe because of all of the NAs). MAYBE if you were really trying to sell the graph 
# you could say there was a positive correlation between cost and death toll however there is hardly 
#enough data to offer real support to that claim.

#install.packages("httr")
#install.packages("jsonlite")
library('httr')
library('jsonlite')


base_url <- 'www.fueleconomy.gov/ws/rest/'
info_url <- "fuelprices"
full_url <- base::paste0(base_url, info_url)

api_call <- httr::GET(full_url)

api_call$status_code #response from api 200 means success
api_call$content #in heidecimal form, the data we want

api_char <- base::rawToChar(api_call$content) #raw data, not usable yet
api_JSON <- jsonlite::fromJSON(api_char, flatten = TRUE) #takes api_char and makes it usable

for(item in api_JSON){
  print(item)
}
#with this api we could compare fuel prices to see what type of car would be most cost efficient.
#I wish that this api had the prices of these fuels over time since that would be much 
#more interesting comparing the fluctuations over time and seeing if there are any trends
# going on with the prices.
