##
#   Plot 4 for the Coursera course on exploratory data analysis
#


# download files if not present
if(!file.exists("./household_power_consumption.txt")){
	URL<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
	download.file(URL, destfile = "data.zip")
	unzip("data.zip")
}

# import data
dataall <- read.csv("./household_power_consumption.txt", sep=";", na.strings="?")
# get only data between 2007-02-01 and 2007-02-02
dataall$Date<-as.Date(dataall$Date, format = "%d/%m/%Y")
data <- subset(dataall, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# create 2x2 canvas
par(mfrow = c(2,2))

# create Plot top left: Global Active Power ~ Time
plot(data$Global_active_power ~ as.POSIXct(paste(data$Date, data$Time)),
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     xaxt = "n")
# add x axis as date
axis(1, at = as.POSIXct(c("2007-02-01 00:00:00","2007-02-02 00:00:00","2007-02-03 00:00:00")),
     labels = c("Thu", "Fri", "Sat"))

# create Plot top right: Voltage ~ Time
plot(data$Voltage ~ as.POSIXct(paste(data$Date, data$Time)),
     type = "l",
     ylab = "Voltage",
     xlab = "datetime",
     xaxt = "n")
# add x axis as date
axis(1, at = as.POSIXct(c("2007-02-01 00:00:00","2007-02-02 00:00:00","2007-02-03 00:00:00")),
     labels = c("Thu", "Fri", "Sat"))

# create Plot bottom left: Energy sub metering ~ Time
plot(data$Sub_metering_1 ~ as.POSIXct(paste(data$Date, data$Time)),
     type = "l",
     xlab = "",
     xaxt = "n",
     ylab = "Energy sub metering")
lines(data$Sub_metering_2 ~ as.POSIXct(paste(data$Date, data$Time)),
      col = "red")
lines(data$Sub_metering_3 ~ as.POSIXct(paste(data$Date, data$Time)),
      col = "blue")     
# add x axis as date
axis(1, at = as.POSIXct(c("2007-02-01 00:00:00","2007-02-02 00:00:00","2007-02-03 00:00:00")),
     labels = c("Thu", "Fri", "Sat"))
# Add legend
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red", "blue"),
       lty = 1,
       bty="n")

# create plot bottom right: global reactive power ~ time
plot(data$Global_reactive_power ~ as.POSIXct(paste(data$Date, data$Time)),
     type = "l",
     ylab = "Global_reactive_power",
     xlab = "datetime",
     xaxt = "n")
# add axis
axis(1, at = as.POSIXct(c("2007-02-01 00:00:00","2007-02-02 00:00:00","2007-02-03 00:00:00")),
     labels = c("Thu", "Fri", "Sat"))

# save as png
dev.copy(png, filename = "plot4.png")
dev.off()  
