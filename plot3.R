# plots energy sub metering x3 against datetime
# only reads the raw file in to object fl if fl doesnt
# already exist - saves time

plot3 <- function () {
    
    if (!exists("fl")) {
        fl <<- read.table("household_power_consumption.txt",
                          na.strings="?", header=TRUE, sep=";")
    }
    
    s1 <- fl[fl$Date == "1/2/2007" | fl$Date == "2/2/2007",]
    s1$dt <- strptime(paste(s1$Date, s1$Time), "%d/%m/%Y %H:%M:%S")
    
    png(file="plot3.png", width=480, height=480)
    plot(x=s1$dt, y=s1$Sub_metering_1, type="n",
            xlab="",
            ylab="Energy sub metering")
    lines(x=s1$dt, y=s1$Sub_metering_1, type="l", col="black")
    lines(x=s1$dt, y=s1$Sub_metering_2, type="l", col="red")
    lines(x=s1$dt, y=s1$Sub_metering_3, type="l", col="blue")
    legend("topright", col=c("black","red","blue"), 
                legend=c("Sub_metering_1","Sub_metering_2",
                         "Sub_metering_3"),
                lty=c(1,1,1), lwd=c(2.5,2.5,2.5)
           )
    dev.off()
    
}
