dat <- read.csv("C:/Users/Hafsa/Desktop/Confirmed.txt", header=TRUE)
# write.csv(dat,"C:/Users/Hafsa/Desktop/Confirmed.csv")
# 
# head(dat)
# 
# library(readr)
# Confirmed <- read_csv("C:/Users/Hafsa/Desktop/Confirmed.csv")
# 
# View(head(Confirmed))




library(tidyr)
datlong <- gather(dat,Date,Confirmed,X1.22.20:X3.25.20, factor_key=TRUE)
country_case <- aggregate(datlong$Confirmed, by=list(datlong$Country.Region,datlong$Date),FUN=sum)


colnames(country_case) <- c("Country","Date","Confirmed")
head(country_case)


Days <- seq(as.Date("2020/1/22"), as.Date("2020/03/25"), "days")

selected <- "China"
sub_dat <- country_case[country_case$Country %in% selected,]
sub_dat$Date <- Days
View(sub_dat)


library(ts)
library(forecast)

(sub_dat$Confirmed)

auto.arima(sub_dat$Confirmed)
