#####################################################
## title: social data science week 2
## author: Blue
## purpose: Soc
## date: 7/6/2023
#####################################################
install.packages("dpylr")
library(dplyr)
mat <- matrix(c(1,2,3,1,2,3,1,2,3),nrow = 3)

print(mat)
df <- as.data.frame(mat)
print(df)

df$V4 <- c("one", "two", "three")

df2<- data.frame(year = 2000:2020, temp = 40:60, month = "July")
print(df2)

df%>% mutate(month = "July")

convertToDeg <- function(Celsius){
  return((Celsius*9/5)+32)
}

df %>%
  mutate(temp = convertToDeg(temp))%>%
  head()


install.packages("gutenbergr")
library(gutenbergr)

gutenberg_download(59306)
#install.packages("gtrendsR")
library(gtrendsR)
search_terms <- c("Glory to Hong Kong", "願榮光歸香港")
gtrends(keyword = search_terms,
        geo = "HK",
        time = "today 12-m") -> output_results

gu_api_key()

install.packages("guardianapi")
library(guardianapi)

ca_wf <- gu_content('"canada" AND "wildfire" AND "smoke" AND "air quality"',
                    from_date = "2023-06-01")