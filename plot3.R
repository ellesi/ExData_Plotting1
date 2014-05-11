# Read data
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE)

# Change class of Date column
data$Date <- (as.Date(data$Date,"%d/%m/%Y"))

# Subset data
data.subset <- subset(data, Date == "2007-02-01" | Date =="2007-02-02")

# Change the classes of Sub_metering columns
data.subset$Sub_metering_1 <- as.numeric(as.character(data.subset$Sub_metering_1))
data.subset$Sub_metering_2 <- as.numeric(as.character(data.subset$Sub_metering_2))
data.subset$Sub_metering_3 <- as.numeric(as.character(data.subset$Sub_metering_3))

# Form DateTime column
data.subset$DateTime <- strptime(paste(data.subset$Date, data.subset$Time, sep=" "),"%Y-%m-%d %T")

# Plot
png("plot3.png", width = 480, height = 480)

plot(data.subset$DateTime,data.subset$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(data.subset$DateTime,data.subset$Sub_metering_2,type="l",col="red")
lines(data.subset$DateTime,data.subset$Sub_metering_3,type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()