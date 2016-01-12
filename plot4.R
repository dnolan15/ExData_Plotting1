#setwd("C://Users//dnolan//Documents//Coursera Data Science//Exploratory Data Analysis")

data <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)

data$Time <- paste(data$Date, data$Time, sep=" ")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data$Time <- as.posixct(strptime(data$Time, format="%d/%m/%Y %H:%M:%S"))

library(dplyr)

data <- data %>% filter(Date == "2007-02-01" | Date == "2007-02-02") %>% arrange(Time)

par(mfcol=c(2,2))

plot(data$DateTime, 
     data$Global_active_power, 
     type="l",
     col="black", 
     xlab="", 
     ylab="Global Active Power (kilowatts)", 
     main="")

plot(data$DateTime, 
     data$Sub_metering_1, 
     type="l",
     col="black", 
     xlab="", 
     ylab="Energy sub metering", 
     main="")

lines(data$DateTime, data$Sub_metering_2, col="red")

lines(data$DateTime, data$Sub_metering_3, col="blue")

legend("topright", 
       lwd=1, 
       lty=1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$DateTime, 
     data$Voltage, 
     type="l",
     col="black", 
     xlab="datetime", 
     ylab="Voltage", 
     main="")

plot(data$DateTime, 
     data$Global_reactive_power, 
     type="l",
     col="black", 
     xlab="datetime", 
     ylab="Global_reactive_power", 
     main="")

dev.copy(png, "plot4.png", width=480, height=480)

dev.off()