#setwd("C://Users//dnolan//Documents//Coursera Data Science//Exploratory Data Analysis")

data <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)

data$Time <- paste(data$Date, data$Time, sep=" ")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data$Time <- as.posixct(strptime(data$Time, format="%d/%m/%Y %H:%M:%S"))

library(dplyr)

data <- data
        %>% filter(Date == "2007-02-01" | Date == "2007-02-02")
        %>% select(Global_active_power)

data$Global_active_power <- as.numeric(data$Global_active_power)

hist(data$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.copy(png, "plot1.png", width=480, height=480)

dev.off()

