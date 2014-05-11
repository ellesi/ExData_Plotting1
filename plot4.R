# Read data
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE)

# Change class of Date column
data$Date <- (as.Date(data$Date,"%d/%m/%Y"))

# Subset data
data.subset <- subset(data, Date == "2007-02-01" | Date =="2007-02-02")

# Change the classes columns
data.subset$Global_active_power <- as.numeric(as.character(data.subset$Global_active_power))
data.subset$Voltage <- as.numeric(as.character(data.subset$Voltage))
data.subset$Sub_metering_1 <- as.numeric(as.character(data.subset$Sub_metering_1))
data.subset$Sub_metering_2 <- as.numeric(as.character(data.subset$Sub_metering_2))
data.subset$Sub_metering_3 <- as.numeric(as.character(data.subset$Sub_metering_3))
data.subset$Global_reactive_power <- as.numeric(as.character(data.subset$Global_reactive_power))

# Form DateTime column
data.subset$DateTime <- strptime(paste(data.subset$Date, data.subset$Time, sep=" "),"%Y-%m-%d %T")

# Plot
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2), cex=0.65)

plot(data.subset$DateTime,data.subset$Global_active_power,type="l",xlab="",ylab="Global Active Power")

plot(data.subset$DateTime,data.subset$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(data.subset$DateTime,data.subset$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(data.subset$DateTime,data.subset$Sub_metering_2,type="l",col="red")
lines(data.subset$DateTime,data.subset$Sub_metering_3,type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n")

plot(data.subset$DateTime,data.subset$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()
