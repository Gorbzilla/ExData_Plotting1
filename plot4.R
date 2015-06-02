plot4 <- function () {
    
    if (!exists("fl")) {
        fl <<- read.table("household_power_consumption.txt",
                          na.strings="?", header=TRUE, sep=";")
    }
    
    s1 <- fl[fl$Date == "1/2/2007" | fl$Date == "2/2/2007",]
    s1$dt <- strptime(paste(s1$Date, s1$Time), "%d/%m/%Y %H:%M:%S")
    
    png(file = "plot4.png", width=480, height=480)
    par(mfcol=c(2,2))
    # plot 1 - top left
    plot(x=s1$dt, y=s1$Global_active_power,
         xlab="",
         ylab="Global Active Power (kilowatts)",
         type="n")
    lines(x=s1$dt, y=s1$Global_active_power, type="l")
    
    # plot 2 - bottom left
    plot(x=s1$dt, y=s1$Sub_metering_1, type="n",
         xlab="",
         ylab="Energy sub metering")
    lines(x=s1$dt, y=s1$Sub_metering_1, type="l", col="black")
    lines(x=s1$dt, y=s1$Sub_metering_2, type="l", col="red")
    lines(x=s1$dt, y=s1$Sub_metering_3, type="l", col="blue")
    legend("topright", col=c("black","red","blue"), 
           legend=c("Sub_metering_1","Sub_metering_2",
                    "Sub_metering_3"), bty="n",
           lty=c(1,1,1), lwd=c(2.5,2.5,2.5))
    
    # plot 3 - top right
    plot(x=s1$dt, y=s1$Voltage,
         xlab="datetime",
         ylab="Voltage",
         type="n")
    lines(x=s1$dt, y=s1$Voltage, type="l")    
    
    # plot 4 - bottom right
    plot(x=s1$dt, y=s1$Global_reactive_power,
         xlab="datetime",
         ylab="Global_reactive_power",
         type="n")
    lines(x=s1$dt, y=s1$Global_reactive_power, type="l") 
    
    dev.off()
}