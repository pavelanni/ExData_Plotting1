temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
data <- read.csv2(unz(temp, "household_power_consumption.txt"), na.strings = c("?"), stringsAsFactors = FALSE)
feb2007 <- subset(data, Date == "2/2/2007" | Date == "1/2/2007")
# We use the two first columns to produce POSIX data 
stdtime <- strptime(paste(feb2007$Date, feb2007$Time), format = "%d/%m/%Y %H:%M:%S")
# and combine it with the original data frame
feb2007 <- cbind(stdtime, feb2007)
png(file = "plot2.png")
plot(feb2007$stdtime, feb2007$Global_active_power, 
     type = "l", # on the example picture they use lines, not points
     main = "", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts")
dev.off()