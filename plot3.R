##Exploratory Data Analysis - Week 1 - Assignment 
setwd("~/Data/ExploratoryAnalysisAssign_1")
##reads in data "HouseHoldPowerCOnsumption" using read.table function into variable named elecdata (electricity_data), seperated by ; and with headers
elecdata <- read.table("household_power_consumption.txt", header = T, sep = ";")
##convert elecdata character represnetaion into the following format: %d/%m/%Y
elecdata$Date <- as.Date(elecdata$Date, format = "%d/%m/%Y")
##create a new variable where the Two Day Period is subsetted from overal data from elecdata, choosing the two requried days
TwoDayData <- elecdata[(elecdata$Date == "2007-02-01") | (elecdata$Date == "2007-02-02"),]
##variable tests if data is character, then creates numeric version of those observations under variable global active power
TwoDayData$Global_active_power <- as.numeric(as.character(TwoDayData$Global_active_power))
##repeates the above for the variable Global Reactive Power and its variables
TwoDayData$Global_reactive_power <- as.numeric(as.character(TwoDayData$Global_reactive_power))
##repreates the above for VOltage
TwoDayData$Voltage <- as.numeric(as.character(TwoDayData$Voltage))
##transforms the time format into selected format: %d/%m/%Y %H:%M:%S
TwoDayData <- transform(TwoDayData, timestamp = as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
##test for object type character then creates numeric object type for Sub Metering 1 variable
TwoDayData$Sub_metering_1 <- as.numeric(as.character(TwoDayData$Sub_metering_1))
##test for object type character then creates numeric object type for Sub Metering 2 variable
TwoDayData$Sub_metering_2<- as.numeric(as.character(TwoDayData$Sub_metering_2))
##test for object type character then creates numeric object type for Sub Metering 2 variable
TwoDayData$Sub_metering_3<- as.numeric(as.character(TwoDayData$Sub_metering_3))



plot3 <- function() {
  ##Plots Meter 1 Data -  x axis for two day period, and y axis the metering over 2 day period
  plot(TwoDayData$timestamp,TwoDayData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  ##creates line at given time stamp for meter 2 with colour red
  lines(TwoDayData$timestamp,TwoDayData$Sub_metering_2,col="red")
  ##creates line at given time stamp for meter 3 wtih colour blue
  lines(TwoDayData$timestamp,TwoDayData$Sub_metering_3,col="blue")
  ##creates a legend at the topright corner, matching the colours to the corresponding meters (1,2,3)
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
  ##Copies content from current windows() device to Bitmap format: PNG with dimension 480 x 480
  dev.copy(png, file="plot3.png", width=480, height=480)
  ##Imporant! Turning Dev Off
  dev.off()
  ##Prints that Plot 3 has been created and published in the working directory
  cat("plot3.png has been created and published in", getwd())
}
##prints plot 3
plot3()