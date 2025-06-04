##
#   Plot 3 for the Coursera course on exploratory data analysis
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

# create plot: Energy Sub metering ~ Time
# submeter 1-3
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
             lty = 1)


# save as png
dev.copy(png, filename = "plot3.png")
dev.off()  
