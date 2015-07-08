## read the data. The file is assumed to be in the current working directory
colTypes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
allData = read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses=colTypes, na.strings="?")

## extract data for the required date range
startDate <- as.Date("01/02/2007", "%d/%m/%Y")
endDate <- as.Date("02/02/2007", "%d/%m/%Y" )
data <- subset(allData, as.Date(allData$Date, "%d/%m/%Y") >= startDate & as.Date(allData$Date, "%d/%m/%Y") <= endDate)

## create a png device, create the histogram and close the device
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()



