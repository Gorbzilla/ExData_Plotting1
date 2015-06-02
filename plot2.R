# plots global active power against datetime
# only reads the raw file in to object fl if fl doesnt
# already exist - saves time

plot2 <- function () {
    
    if (!exists("fl")) {
        fl <<- read.table("household_power_consumption.txt",
                          na.strings="?", header=TRUE, sep=";")
    }
    
    s1 <- fl[fl$Date == "1/2/2007" | fl$Date == "2/2/2007",]
    s1$dt <- strptime(paste(s1$Date, s1$Time), "%d/%m/%Y %H:%M:%S")
    
    png(file = "plot2.png", width=480, height=480)
    plot(x=s1$dt, y=s1$Global_active_power,
         xlab="",
         ylab="Global Active Power (kilowatts)",
         type="n")
    lines(x=s1$dt, y=s1$Global_active_power, type="l")
    dev.off()
}