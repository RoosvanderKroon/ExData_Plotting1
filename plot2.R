
data <- read.table("household_power_consumption.txt",
                   +                    header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

 data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
 sub_data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

 # Combine Date and Time into a single POSIX datetime
 datetime <- strptime(paste(sub_data$Date, sub_data$Time), format="%Y-%m-%d %H:%M:%S")

 # Get the weekdays for the data (Thursday, Friday)
 day_labels <- weekdays(sub_data$Date)

 # Manually create the labels (include Saturday even if not in the data)
 unique_day_labels <- c("Thursday", "Friday", "Saturday")
 
 # Open PNG device
 png("plot2.png", width = 480, height = 480)
 
 # Create the line plot with custom x-axis (no default x-axis)
 plot(datetime,
      sub_data$Global_active_power,
      type = "l",
      xlab = "",
      ylab = "Global Active Power (kilowatts)",
      xaxt = "n")  # Suppress default x-axis labels
 
# Manually add x-axis with the correct number of labels
 axis(1, at = seq(min(datetime), max(datetime), length.out = length(unique_day_labels)),
      labels = unique_day_labels, las = 2)
 
 # Close the PNG device
dev.off()