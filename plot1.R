temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
data <- read.csv2(unz(temp, "household_power_consumption.txt"), na.strings = c("?"), stringsAsFactors = FALSE)
feb2007 <- subset(data, Date == "2/2/2007" | Date == "1/2/2007")
png(file = "plot1.png")
hist(as.numeric(feb2007$Global_active_power), 
     col = "#FF2500", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()

