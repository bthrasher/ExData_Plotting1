# Open PNG file 
png(filename="plot1.png",width=480,height=480)

# Read in data, format date & time columns
dat <- read.table("household_power_consumption.txt",sep=";",na.strings="?",skip=66637,nrows=2880,
                  col.names=c("Date","Time","Global_active_power","Global_reactive_power",
                              "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                              "Sub_metering_3"),stringsAsFactors=FALSE)

dat$Date <- strptime(paste(dat$Date,dat$Time),format="%d/%m/%Y %H:%M:%S")

# Create plot
hist(dat$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

# Close file
dev.off()