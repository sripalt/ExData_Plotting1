downloadandextract <- function() {
  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
  unzip (temp)
}


plot1 <- function() {
  downloadandextract()
  png("plot1.png", width=480, height=480)
  power_consumption <- read.table("household_power_consumption.txt", header = TRUE, 
                                  sep = ";", na.strings = "?")
  subsetdata <- subset(power_consumption, Date %in% c("1/2/2007","2/2/2007"))
  subsetdata$Date <- as.Date(subsetdata$Date, format="%d/%m/%Y")
  hist(subsetdata$Global_active_power, main="Global Active Power", 
       xlab="Global Active Power (kilowatts)", col="Red")
  dev.off()
}




