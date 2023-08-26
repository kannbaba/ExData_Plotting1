setwd("X:/R Cache/ex_data_plotting1")

library(lubridate) # required to convert char data into date class
library(dplyr)     #required to filter data for assigned dates

my_data <- read.csv("household_power_consumption.txt",sep=";",header=TRUE)

# The assignment requires to filter data according to dates
# therefore, date column (which read as character data initially)
# is converted into date class
my_data$Date <- dmy(my_data$Date)
my_data <- filter(my_data, Date >="2007-02-01" & Date <="2007-02-02")

#in order to plot, data columns are also converted into number 
for (i in 3:9){my_data[,i] <- as.numeric(my_data[,i])}

# creating a .png plot file.
png("plot2.png", width = 480, height =480)
plot(my_data$Global_active_power, type="l", xlab="", xaxt = "n", ylab="Global Active Power (kilowatts)")
axis(side=1, at=c(1, 1442, 2881), labels=c("Thu","Fri","Sat")) #labelling x-axis accordingly took 95% of the total assignment time :)
dev.off()
# THANKS FOR READING MY CODE