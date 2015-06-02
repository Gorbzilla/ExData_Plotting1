# plots histogram of global active power
# only reads the raw file in to object fl if fl doesnt
# already exist - saves time

plot1 <- function () {
    
    if (!exists("fl")) {
        fl <<- read.table("household_power_consumption.txt",
                          na.strings="?", header=TRUE, sep=";")
    }
    
    s1 <- fl[fl$Date == "1/2/2007" | fl$Date == "2/2/2007",]
    s1$dt <- strptime(paste(s1$Date, s1$Time), "%d/%m/%Y %H:%M:%S")
    
    png(file = "plot1.png", width=480, height=480)
    hist(s1$Global_active_power, col="red", 
                    main="Global Active Power",
                    xlab="Global Active Power (kilowatts)",
                    ylab="Frequency")
    dev.off()
}