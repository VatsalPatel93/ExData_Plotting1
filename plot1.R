#Read the data for dates 1/2/2007 ans 2/2/2007 into variable named reqData
reqData <- read.table("household_power_consumption.txt", header = TRUE, 
                     sep =  ";",skip = 66636, nrows = 2880, stringsAsFactors = FALSE, 
                     col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Convert Date and Time fields into R datatypes date and time
reqData$datetime <- strptime(paste(reqData$Date, reqData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
finalData <- reqData[,-(1:2)]

#Opening the png file device
png("plot1.png", width = 480, height = 480)
#Actual Plot
hist(as.numeric(finalData$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()


