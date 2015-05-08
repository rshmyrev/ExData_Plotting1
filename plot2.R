# file "household_power_consumption.txt" must be in working directory
df <- read.csv(file = "household_power_consumption.txt", sep = ";", quote = "",
               dec = ".", na.strings = "?", as.is = TRUE)

# select dates 2007-02-01 and 2007-02-02
data <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007", ]

# convert the Date and Time variables to Date/Time classes
DT <- paste(data$Date, data$Time)
data$DT <- strptime(DT, format = '%d/%m/%Y %T')

## Open PNG device and create 'plot2.png' in working directory
png(filename = "plot2.png", width = 480, height = 480, bg = "transparent")

# This shamanic spell allows the correct displaying days of the week
# in non-English speaking countries
Sys.setlocale("LC_TIME","C")

## Create plot and send to a file
plot(x = data$DT, y = data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off() ## Close the PNG file device
