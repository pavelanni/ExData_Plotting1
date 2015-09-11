# This is a script to plot a histogram of power consumption based on the data from UC Irvine
# Machine Learning Repository
#
# Here we download the ZIP file into a temporary file 
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
# and then unzip it and import into 'data' data frame
data <- read.csv2(unz(temp, "household_power_consumption.txt"), 
                  na.strings = c("?"), stringsAsFactors = FALSE)
# We will need only two days of Februrary 2007 so we subset the data
feb2007 <- subset(data, Date == "2/2/2007" | Date == "1/2/2007")
# We are going to produce a PNG file with the chart so we open a PNG graphics device
png(file = "plot1.png")
hist(as.numeric(feb2007$Global_active_power), 
     col = "#FF2500",   # Yes, I picked the actual color of the chart in the example!
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
# Don't forget to disconnect from the device. Only then it will write to the file
dev.off()

