#Extract dataset of interest
power <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")
power$Date <- as.Date(as.character(power$Date),"%d/%m/%Y")
power$Time <- format(strptime(as.character(power$Time),"%H:%M:%S"),"%H:%M:%S")
power <- subset(power,(power$Date=="2007-02-01"|power$Date=="2007-02-02"))
power$DateTime <- strptime(as.character(paste(power$Date,power$Time)),format="%Y-%m-%d %H:%M:%S")

#plot line chart - Global Active Power vs Time
png("plot2.png", width=480, height=480)
with(power,plot(DateTime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()