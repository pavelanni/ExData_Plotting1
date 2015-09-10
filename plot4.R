temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
data <- read.csv2(unz(temp, "household_power_consumption.txt"), na.strings = c("?"), stringsAsFactors = FALSE)
feb2007 <- subset(data, Date == "2/2/2007" | Date == "1/2/2007")
stdtime <- strptime(paste(feb2007$Date, feb2007$Time), format = "%d/%m/%Y %H:%M:%S")
feb2007 <- cbind(stdtime, feb2007)
png(file = "plot4.png")
par(mfcol = c(2,2))
plot(feb2007$stdtime, feb2007$Global_active_power, 
     type = "l", 
     main = "", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts")
plot(feb2007$stdtime, feb2007$Sub_metering_1, 
     type = "l", 
     main = "", 
     xlab = "", 
     ylab = "Energy sub metering" )
points(feb2007$stdtime, feb2007$Sub_metering_2, 
       type = "l", 
       main = "", 
       xlab = "", 
       ylab = "Energy sub metering", 
       col = "red" )
points(feb2007$stdtime, feb2007$Sub_metering_3, 
       type = "l", 
       main = "", 
       xlab = "", 
       ylab = "Energy sub metering", 
       col = "blue" )
legend("topright", 
       lty = c(1, 1, 1), 
       col = c("black", "red", "blue"), 
       bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(feb2007$stdtime, feb2007$Voltage,
       type = "l",
       main = "",
       xlab = "",
       ylab = "Voltage")
plot(feb2007$stdtime, feb2007$Global_reactive_power,
     type = "l",
     main = "",
     xlab = "",
     ylab = "Global_reactive_power")

dev.off()