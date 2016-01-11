
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
##plot 1 variable
globalActivePower <- as.numeric(subSetData$Global_active_power)

##Plot2 variable
voltage<-as.numeric(subSetData$Voltage)

##Plot3 variable
Sub_met_1<-as.numeric(subSetData$Sub_metering_1)
Sub_met_2<-as.numeric(subSetData$Sub_metering_2)
Sub_met_3<-as.numeric(subSetData$Sub_metering_3)

##Plot4 variable
globalReactivePower<- as.numeric(subSetData$Global_reactive_power)

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))
##Plot1
plot(datetime, globalActivePower,  type="l", xlab="", ylab="Global Active Power")
##hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

##Plot2
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

##Plot3
plot(datetime, Sub_met_1, type="n", xlab="", ylab = "Energy Sub Metering")
points(datetime, Sub_met_1, type="l", col="black")
points(datetime, Sub_met_2,  type="l", col="red")
points(datetime, Sub_met_3,  type="l", col="blue")
legend("topright", lty=1, lwd=2.5, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

##Plot4
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_ReActive_Power")
dev.off()

