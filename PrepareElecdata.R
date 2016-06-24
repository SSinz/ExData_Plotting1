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

