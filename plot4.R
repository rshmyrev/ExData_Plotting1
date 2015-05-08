# file "household_power_consumption.txt" must be in working directory
df <- read.csv(file = "household_power_consumption.txt", sep = ";", quote = "",
               dec = ".", na.strings = "?", as.is = TRUE)

# select dates 2007-02-01 and 2007-02-02
data <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007", ]

# convert the Date and Time variables to Date/Time classes
DT <- paste(data$Date, data$Time)
data$DT <- strptime(DT, format = '%d/%m/%Y %T')

## Open PNG device and create 'plot4.png' in working directory
png(filename = "plot4.png", width = 480, height = 480, bg = "transparent")

# This shamanic spell allows the correct displaying days of the week
# in non-English speaking countries
Sys.setlocale("LC_TIME","C")

## Splitting the scene into 4 pieces
par(mfcol = c(2, 2))

# figure 1
plot(x = data$DT, y = data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power")

# figure 2
plot(x = data$DT, y = data$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(x = data$DT, y = data$Sub_metering_2, col = "red")
lines(x = data$DT, y = data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# figure 3
plot(x = data$DT, y = data$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")

# figure 4
plot(x = data$DT, y = data$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off() ## Close the PNG file device
