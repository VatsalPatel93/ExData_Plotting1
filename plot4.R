#Read the data for dates 1/2/2007 ans 2/2/2007 into variable named reqData
reqData <- read.table("household_power_consumption.txt", header = TRUE, 
                      sep =  ";",skip = 66636, nrows = 2880, stringsAsFactors = FALSE, 
                      col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Convert Date and Time fields into R datatypes date and time
reqData$datetime <- strptime(paste(reqData$Date, reqData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
finalData <- reqData[,-(1:2)]

#Opening the png file device
png("plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))

#Plot-1
plot(finalData$datetime, as.numeric(finalData$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#Plot-2
plot(finalData$datetime, as.numeric(finalData$Sub_metering_1), type = "l", xlab = "", ylab = "Energy sub metering")
lines(finalData$datetime, as.numeric(finalData$Sub_metering_2), type = "l", col = "red")
lines(finalData$datetime, as.numeric(finalData$Sub_metering_3), type = "l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, lwd  = 2, col = c("black","red","blue"), bty = 0)

#Plot-3
plot(finalData$datetime, as.numeric(finalData$Voltage), type="l", xlab="datetime", ylab="Voltage")

#Plot-4
plot(finalData$datetime, as.numeric(finalData$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
