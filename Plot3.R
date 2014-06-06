# Data pre processing to extract required dates and convert to date time classes
data <- read.table("household_power_consumption.txt",sep=";", header=TRUE)
data$Time<-as.character(data$Time)
data$Date<-as.character(data$Date)
x <- data[(data$Date == "1/2/2007"|data$Date == "2/2/2007"), ]
x$Date <- as.Date(x$Date,"%d/%m/%Y")
temp <- paste(x$Date,x$Time)
x$Datetime <- strptime(temp, format="%Y-%m-%d %H:%M:%S")

png("Plot3.png")
#Draw plot
x$Sub_metering_1 <- as.numeric(as.character(x$Sub_metering_1))
x$Sub_metering_2 <- as.numeric(as.character(x$Sub_metering_2))
x$Sub_metering_3 <- as.numeric(as.character(x$Sub_metering_3))
plot(x$Datetime,x$Sub_metering_1,col='black',type='l',xlab = "",ylab = "Energy Sub Metering")

lines(x$Datetime,x$Sub_metering_2,col='red')
lines(x$Datetime,x$Sub_metering_3,col='blue')
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd=c(1.5,1.5,1.5), col=c("black","red","blue"))

dev.off()