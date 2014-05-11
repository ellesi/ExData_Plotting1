# Read data
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE)

# Change class of Date column
data$Date <- (as.Date(data$Date,"%d/%m/%Y"))

# Subset data
data.subset <- subset(data, Date == "2007-02-01" | Date =="2007-02-02")

# Change the class of Global_active_power column
data.subset$Global_active_power <- as.numeric(as.character(data.subset$Global_active_power))

# Plot
png("plot1.png", width = 480, height = 480)

hist(data.subset$Global_active_power,col="red",xlab="Global Active Power (in kilowatts)",main="Global Active Power")

dev.off()
