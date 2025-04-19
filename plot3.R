

data <- read.table("household_power_consumption.txt",
                                       header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
sub_data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

# Combine Date and Time into a single POSIX datetime
datetime <- strptime(paste(sub_data$Date, sub_data$Time), format="%Y-%m-%d %H:%M:%S")







png("plot3.png", width = 480, height = 480)

# Plot the three energy sub metering values
plot(datetime, sub_data$Sub_metering_1, type = "l", col = "black", 
     xlab = "", ylab = "Energy sub metering")
lines(datetime, sub_data$Sub_metering_2, col = "red")
lines(datetime, sub_data$Sub_metering_3, col = "blue")

# Add a legend to identify the sub-metering channels
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)

# Close the PNG device
dev.off()
