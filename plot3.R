## load required libraries
library(dplyr)

## read the data. The file is assumed to be in the current working directory
colTypes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
allData = read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses=colTypes, na.strings="?")

## extract data for the required date range
startDate <- as.Date("01/02/2007", "%d/%m/%Y")
endDate <- as.Date("02/02/2007", "%d/%m/%Y" )
data <- subset(allData, as.Date(allData$Date, "%d/%m/%Y") >= startDate & as.Date(allData$Date, "%d/%m/%Y") <= endDate)

## create new column containing the combined date and time
data <- mutate(data, DateTime = as.POSIXct(paste(data$Date, data$Time), format= "%d/%m/%Y %H:%M:%S"))

## create a png device, create the plot and close the device
png("plot3.png", width=480, height=480)
plot(data$DateTime, data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
points(data$DateTime, data$Sub_metering_1, type="l", col = "black")
points(data$DateTime, data$Sub_metering_2, type="l", col = "red")
points(data$DateTime, data$Sub_metering_3, type="l", col = "blue")
legend("topright", lty = 1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
