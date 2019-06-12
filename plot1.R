#Extract dataset of interest
power <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")
power$Date <- as.Date(as.character(power$Date),"%d/%m/%Y")
power$Time <- format(strptime(as.character(power$Time),"%H:%M:%S"),"%H:%M:%S")
power <- subset(power,(power$Date=="2007-02-01"|power$Date=="2007-02-02"))

#plot histogram - Global Active Power vs Frequency
png("plot1.png", width=480, height=480)
hist(power$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()