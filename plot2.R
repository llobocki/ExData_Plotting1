Sys.setlocale("LC_TIME", "en_US.UTF-8")

csv <- read.csv("household_power_consumption.txt", sep=';', na.strings = "?", stringsAsFactors = FALSE)
df <- subset(csv, csv$Date == '1/2/2007' | csv$Date == '2/2/2007')
df$DateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y%H:%M:%S")

png(filename='plot2.png')

plot(df$DateTime, df$Global_active_power, xlab="",
     ylab="Global Active Power (kilowats)", type="n")
lines(df$DateTime, df$Global_active_power)

dev.off()
