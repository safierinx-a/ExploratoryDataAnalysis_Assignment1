path = "file:///F:/ML Datasets/household_power_consumption.txt"
data <- read.table(path, sep = ';', header = TRUE)
df <- data.frame("Date" = as.Date(data$Date, format = c("%d/%m/%Y")), 
                 "Time" =  strptime(data$Time, c("%H:%M:%S")),
                 "Global_active_power" = as.numeric(data$Global_active_power), 
                 'Global_reactive_power' = as.numeric(data$Global_reactive_power), 
                 'Voltage' = as.numeric(data$Voltage), 
                 'Global_intensity' = as.numeric(data$Global_intensity), 
                 'Sub_metering_1' = as.numeric(data$Sub_metering_1), 
                 'Sub_metering_2' = as.numeric(data$Sub_metering_2), 
                 'Sub_metering_3' = as.numeric(data$Sub_metering_3))

x <- df[df$Date== as.Date("01/02/2007", format = c("%d/%m/%Y"))|
          df$Date == as.Date("02/02/2007", format = c("%d/%m/%Y")),]
x$datetime <- strptime(x$Time, format="%Y-%m-%d %H:%M:%S")
x$datetime <- format(x$datetime, "%H:%M:%S")
datetime <- strptime(paste(x$Date, x$datetime, sep=" "), "%Y-%m-%d %H:%M:%S" )



png(file = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

plot(datetime, x$Global_active_power , col = 'black', type= "l", ylab = 'Energy sub metering', xlab = "")
plot(datetime, x$Voltage , col = 'black', type= "l", ylab = 'Energy sub metering', xlab = "")
plot(datetime, x$Sub_metering_1 , col = 'black', type= "l", ylab = 'Energy sub metering', xlab = "")
lines(datetime, x$Sub_metering_2 , col = 'red', type= "l", ylab = 'Energy sub metering', xlab = "")
lines(datetime, x$Sub_metering_3 , col = 'blue', type= "l", ylab = 'Energy sub metering', xlab = "")
legend(x= "topright", y=0.92, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),  lty=1:2, cex=0.4)
plot(datetime, x$Global_reactive_power , col = 'black', type= "l", ylab = 'Energy sub metering', xlab = "")

dev.off()

