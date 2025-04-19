data <- read.table("household_power_consumption.txt",
                     +                    header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
 
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
 
sub_data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

hist(sub_data$Global_active_power,
             +      col = "red",
             +      main = "Global Active Power",
             +      xlab = "Global Active Power (kilowatts)",
             +      ylab = "Frequency")

png("plot1.png", width = 480, height = 480)
