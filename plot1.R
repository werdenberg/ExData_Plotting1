##
#   Plot 1 for the Coursera course on exploratory data analysis
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

# create plot: histogram of global active power
hist(as.numeric(data$Global_active_power), col="red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     ylim = c(0,1200),
     )

# save as png
dev.copy(png, filename = "plot1.png")
dev.off()
