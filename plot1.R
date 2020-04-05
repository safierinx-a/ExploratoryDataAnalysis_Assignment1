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
dates <- c("01/02/2007", "02/02/2007")
x <- df[df$Date== as.Date("01/02/2007", format = c("%d/%m/%Y"))|
          df$Date == as.Date("02/02/2007", format = c("%d/%m/%Y")),]
png(file = "plot1.png", width = 480, height = 480)
par(mar=c(5,5,2,2)+0.1)
plot(hist(x$Global_active_power/1000), 
     col = 'red', main = NULL, 
     xlab = 'Global Active Power (kilowatts)', 
     ylab = 'Frequency')
     
title(main = "Global Active Power")


dev.off()

