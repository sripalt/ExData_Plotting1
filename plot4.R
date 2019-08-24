downloadandextract <- function() {
  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
  unzip (temp)
}


plot4 <- function() {
  downloadandextract()
  png("plot4.png", width=480, height=480)
  
  
  power_consumption <- read.table("household_power_consumption.txt", header = TRUE, 
                                  sep = ";", na.strings = "?")
  
  par(mfrow=c(2,2))
  
  subsetdata <- subset(power_consumption, Date %in% c("1/2/2007","2/2/2007"))
  
  subsetdata$DateTime <- as.POSIXct(paste(subsetdata$Date, subsetdata$Time), format = "%d/%m/%Y %H:%M:%S")
  
  #1
  with(subsetdata, plot(Global_active_power~DateTime, type="l", xlab="", ylab="Global Active Power"))
  
  #2
  with(subsetdata, plot(Voltage~DateTime, type="l", xlab="datetime", ylab="Voltage"))
  
  #3
  with(subsetdata, plot(Sub_metering_1~DateTime, type="l",
                        ylab="Energy sub metering", xlab=""))
  with(subsetdata, lines(Sub_metering_2~DateTime, type="l", col="red"))
  with(subsetdata, lines(Sub_metering_3~DateTime, type="l", col="blue"))
  
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col=c("black","red","blue"), lty=c(1,1), bty = "n")
  
  #4
  with(subsetdata, plot(Global_reactive_power~DateTime, type="l", xlab="datetime", ylab="Global_reactive_power"))

  dev.off()
}




