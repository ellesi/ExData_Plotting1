# Read data
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE)

# Change class of Date column
data$Date <- (as.Date(data$Date,"%d/%m/%Y"))

# Subset data
data.subset <- subset(data, Date == "2007-02-01" | Date =="2007-02-02")

# Change the class of Global_active_power column
data.subset$Global_active_power <- as.numeric(as.character(data.subset$Global_active_power))

# Form DateTime column
data.subset$DateTime <- strptime(paste(data.subset$Date, data.subset$Time, sep=" "),"%Y-%m-%d %T")

# Plot
png("plot2.png", width = 480, height = 480)

plot(data.subset$DateTime,data.subset$Global_active_power,type="l",xlab="",ylab="Global Active Power (in kilowatts)")

dev.off()
