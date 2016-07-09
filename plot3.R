#Read the data for dates 1/2/2007 ans 2/2/2007 into variable named reqData
reqData <- read.table("household_power_consumption.txt", header = TRUE, 
                      sep =  ";",skip = 66636, nrows = 2880, stringsAsFactors = FALSE, 
                      col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Convert Date and Time fields into R datatypes date and time
reqData$datetime <- strptime(paste(reqData$Date, reqData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
finalData <- reqData[,-(1:2)]

#Opening png file device
png("plot3.png", width = 480, height = 480)
#Actual Plot
plot(finalData$datetime, as.numeric(finalData$Sub_metering_1), type = "l", xlab = "", ylab = "Energy sub metering")
lines(finalData$datetime, as.numeric(finalData$Sub_metering_2), type = "l", col = "red")
lines(finalData$datetime, as.numeric(finalData$Sub_metering_3), type = "l", col = "blue")
#Adding legends to the plot
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, lwd  = 2, col = c("black","red","blue"))
dev.off()