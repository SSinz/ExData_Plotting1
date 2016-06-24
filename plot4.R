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



plot4 <- function() {
  par(mfrow=c(2,2))
  
  #This plots the 1st Plot - as seen in Plot1.R
  plot(TwoDayData$timestamp,TwoDayData$Global_active_power, type="l", xlab="", ylab="Global Active Power")
  ##This plots the 2nd Plot - as seen in Plot2.R
  plot(TwoDayData$timestamp,TwoDayData$Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  ##This splots the 3rd Plot - as seen in Plot3.R
  plot(TwoDayData$timestamp,TwoDayData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(TwoDayData$timestamp,TwoDayData$Sub_metering_2,col="red")
  lines(TwoDayData$timestamp,TwoDayData$Sub_metering_3,col="blue")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly
  
  #Plots the final graph where x = time (2 day period) and y = Global reactive power
  plot(TwoDayData$timestamp,TwoDayData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  ##copies content from windows() graphic device to bitmap format: PNG with dimensions 480 x 480
  dev.copy(png, file="plot4.png", width=480, height=480)
  ##Important! Turns Dev OFF!
  dev.off()
  ##Prints a statement in string form that states plot4 has been saved and published in working directory
  cat("plot4.png has been saved and published in", getwd())
}
plot4()