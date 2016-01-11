dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
globalActivePower <- as.numeric(subSetData$Global_active_power)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Sub_met_1<-as.numeric(subSetData$Sub_metering_1)
Sub_met_2<-as.numeric(subSetData$Sub_metering_2)
Sub_met_3<-as.numeric(subSetData$Sub_metering_3)


png("plot3.png", width=480, height=480)
plot(datetime, Sub_met_1, type="n", xlab="", ylab = "Energy Sub Metering")
points(datetime, Sub_met_1, type="l", col="black")
points(datetime, Sub_met_2,  type="l", col="red")
points(datetime, Sub_met_3,  type="l", col="blue")
legend("topright", lty=1, lwd=2.5, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()

