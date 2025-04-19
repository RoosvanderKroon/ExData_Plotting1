

data <- read.table("household_power_consumption.txt",
                   header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
sub_data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

# Combine Date and Time into a single POSIX datetime
datetime <- strptime(paste(sub_data$Date, sub_data$Time), format="%Y-%m-%d %H:%M:%S")


# Open PNG device
png("plot4.png", width = 480, height = 480)

# Set up a 2x2 grid for multiple plots
par(mfrow = c(2, 2))

# Plot 1: Global Active Power over time
plot(datetime, sub_data$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power")

# Plot 2: Voltage over time
plot(datetime, sub_data$Voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage")

# Plot 3: Energy sub metering over time
plot(datetime, sub_data$Sub_metering_1, type = "l", col = "black", 
     xlab = "", ylab = "Energy sub metering")
lines(datetime, sub_data$Sub_metering_2, col = "red")
lines(datetime, sub_data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)

# Plot 4: Global Reactive Power over time
plot(datetime, sub_data$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global Reactive Power")

# Close the PNG device
dev.off()
