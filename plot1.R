# file "household_power_consumption.txt" must be in working directory
df <- read.csv(file = "household_power_consumption.txt", sep = ";", quote = "",
               dec = ".", na.strings = "?", as.is = TRUE)

# select dates 2007-02-01 and 2007-02-02
data <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007", ]

# convert the Date and Time variables to Date/Time classes
DT <- paste(data$Date, data$Time)
data$DT <- strptime(DT, format = '%d/%m/%Y %T')

## Open PNG device and create 'plot1.png' in working directory
png(filename = "plot1.png", width = 480, height = 480, bg = "transparent")

## Create plot and send to a file
hist(data$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col = 'red')

dev.off() ## Close the PNG file device
