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
png(file = "plot2.png", width = 480, height = 480)
par(mar=c(5,5,2,2)+0.1)
x$datetime <- strptime(x$Time, format="%Y-%m-%d %H:%M:%S")
x$datetime <- format(x$datetime, "%H:%M:%S")
datetime <- strptime(paste(x$Date, x$datetime, sep=" "), "%Y-%m-%d %H:%M:%S" )
plot(datetime, x$Global_active_power/1000, type= "l", ylab = 'Global Active Power (kilowatts)', xlab = "")
dev.off()
