Sys.setlocale("LC_TIME", "en_US.UTF-8")

csv <- read.csv("household_power_consumption.txt", sep=';', na.strings = "?", stringsAsFactors = FALSE)
df <- subset(csv, csv$Date == '1/2/2007' | csv$Date == '2/2/2007')
df$DateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y%H:%M:%S")

png(filename='plot3.png')

plot(df$DateTime, df$Sub_metering_1, xlab="",
     ylab="Energy sub metering", type="n")
lines(df$DateTime, df$Sub_metering_1, col="black")
lines(df$DateTime, df$Sub_metering_2, col="red")
lines(df$DateTime, df$Sub_metering_3, col="blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") , 
       lty=1, col=c('black', "red", 'blue'), cex=.75)

dev.off()
