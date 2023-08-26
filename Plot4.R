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


png("plot4.png", width = 480, height =480)

par(mfrow=c(2,2))

plot(my_data$Global_active_power, type="l", xlab="", xaxt = "n", ylab="Global Active Power (kilowatts")
axis(side=1, at=c(1, 1442, 2881), labels=c("Thu","Fri","Sat"))

plot(my_data$Voltage, type="l",xaxt = "n", xlab="datetime", ylab="Voltage")
axis(side=1, at=c(1, 1442, 2881), labels=c("Thu","Fri","Sat"))

plot(my_data$Sub_metering_1, type="l",xaxt = "n", xlab="", ylab="Energy Sub Metering")
points(my_data$Sub_metering_2, type="l", col="red")
points(my_data$Sub_metering_3, type="l", col="blue")
legend("topright","left", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red", "blue"), lty=1, cex=0.8)
axis(side=1, at=c(1, 1442, 2881), labels=c("Thu","Fri","Sat"))

plot(my_data$Global_reactive_power, type="l",xaxt = "n", xlab="datetime", ylab="Global_Reactive_Power")
axis(side=1, at=c(1, 1442, 2881), labels=c("Thu","Fri","Sat"))

dev.off()