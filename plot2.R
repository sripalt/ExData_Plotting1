downloadandextract <- function() {
  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
  unzip (temp)
}


plot2 <- function() {
  downloadandextract()
  png("plot2.png", width=480, height=480)
  power_consumption <- read.table("household_power_consumption.txt", header = TRUE, 
                                  sep = ";", na.strings = "?")
  subsetdata <- subset(power_consumption, Date %in% c("1/2/2007","2/2/2007"))
  
  subsetdata$DateTime <- as.POSIXct(paste(subsetdata$Date, subsetdata$Time), format = "%d/%m/%Y %H:%M:%S")
  
  with(subsetdata, plot(Global_active_power~DateTime, type="l", 
                        ylab="Global Active Power (kilowatts)", xlab=""))
  dev.off()
}




