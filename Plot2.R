getwd()
setwd("X:/R Cache/ex_data_plotting1")

library(lubridate)
library(dplyr)
library(ggplot2)


my_data <- read.csv("household_power_consumption.txt",sep=";",header=TRUE)
my_data$Date <- dmy(my_data$Date)
my_data$Time <- hms(my_data$Time)
my_data$DateTime <- my_data$Date+my_data$Time
my_data <- filter(my_data, Date >="2007-02-01" & Date <="2007-02-02")
for (i in 3:9){my_data[,i] <- as.numeric(my_data[,i])}


png("plot2.png", width = 480, height =480)
plot(my_data$Global_active_power, type='l')
tail(wday(my_data$DateTime))
dev.off()