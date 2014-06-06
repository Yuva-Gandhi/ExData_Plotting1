data <- read.table("household_power_consumption.txt",sep=";", header=TRUE)
data$Time<-as.character(data$Time)
data$Date<-as.character(data$Date)
x <- data[(data$Date == "1/2/2007"|data$Date == "2/2/2007"), ]
x$Date <- as.Date(x$Date,"%d/%m/%Y")
temp <- paste(x$Date,x$Time)
x$Datetime <- strptime(temp, format="%Y-%m-%d %H:%M:%S")

png("Plot1.png")

hist((as.numeric(x$Global_active_power))/500,col = "red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power",cex.lab=.75, cex.axis=.75, cex.main=.75, cex.sub=.75)
par(mar = c(3,2,3,3))

dev.off()