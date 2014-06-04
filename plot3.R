# Open PNG file
png(filename="plot3.png",width=480,height=480)

# Read in data, format date & time columns
dat <- read.table("household_power_consumption.txt",sep=";",na.strings="?",skip=66637,nrows=2880,
                  col.names=c("Date","Time","Global_active_power","Global_reactive_power",
                              "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                              "Sub_metering_3"),stringsAsFactors=FALSE)

dat$Date <- strptime(paste(dat$Date,dat$Time),format="%d/%m/%Y %H:%M:%S")

# Create plot
plot(dat$Date,dat$Sub_metering_1,main="",xlab="",ylab="Energy sub metering",type="n")
lines(dat$Date,dat$Sub_metering_1)
lines(dat$Date,dat$Sub_metering_2,col="red")
lines(dat$Date,dat$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1)

# Close file
dev.off()