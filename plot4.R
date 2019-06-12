#Extract dataset of interest
power <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")
power$Date <- as.Date(as.character(power$Date),"%d/%m/%Y")
power$Time <- format(strptime(as.character(power$Time),"%H:%M:%S"),"%H:%M:%S")
power <- subset(power,(power$Date=="2007-02-01"|power$Date=="2007-02-02"))
power$DateTime <- strptime(as.character(paste(power$Date,power$Time)),format="%Y-%m-%d %H:%M:%S")


png("plot4.png", width=480, height=480)

#Set 2x2 plot window
par(mfcol=c(2,2))

#plot line chart - Global Active Power vs Time
with(power,plot(DateTime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))

#plot line chart - Energy Sub Metering vs Time
plot(power$DateTime,power$Sub_metering_1,col="black",type="l",ylab="Energy sub metering",xlab="")
lines(power$DateTime,power$Sub_metering_2,col="red",type="l",ylab="Energy sub metering",xlab="")
lines(power$DateTime,power$Sub_metering_3,col="blue",type="l",ylab="Energy sub metering",xlab="")
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"),lty=1,box.lty = 0,bg=NULL)

#plot line chart - Voltage vs Time
with(power,plot(DateTime,Voltage,type="l",ylab="Voltage",xlab="datetime"))

#plot line chart - Global Active Power vs Time
with(power,plot(DateTime,Global_reactive_power,type="l",xlab="datetime"))
dev.off()