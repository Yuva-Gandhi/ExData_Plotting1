# Data pre processing to extract required dates and convert to date time classes
data <- read.table("household_power_consumption.txt",sep=";", header=TRUE)
data$Time<-as.character(data$Time)
data$Date<-as.character(data$Date)
x <- data[(data$Date == "1/2/2007"|data$Date == "2/2/2007"), ]
x$Date <- as.Date(x$Date,"%d/%m/%Y")
temp <- paste(x$Date,x$Time)
x$Datetime <- strptime(temp, format="%Y-%m-%d %H:%M:%S")

png("Plot2.png")
# Draw plot
x$Global_active_power <- as.numeric(as.character(x$Global_active_power))
plot(x$Datetime,x$Global_active_power, type='l',xlab = "",ylab = "Global Active Power (kilowatts)")
par(mar = c(2,1,3,3))

dev.off()