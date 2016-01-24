csv <- read.csv("household_power_consumption.txt", sep=';', na.strings = "?", stringsAsFactors = FALSE)
df <- subset(csv, csv$Date == '1/2/2007' | csv$Date == '2/2/2007')
df$DateTime <- as.Date(strptime(paste(df$Date, df$Time, sep = " "), "%d/%m/%Y %H:%M:%S"))
png(filename='plot1.png')
hist(df$Global_active_power, xlab="Global Active Power (kilowats)", ylab="Frequency", main="Global Active Power", col="red")
dev.off()

