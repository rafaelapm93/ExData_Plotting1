setwd("C:/Users/rafae/Documents/R/Data Science Specialization/Course4/W1")

df <-read.table("household_power_consumption.txt", 
                sep = ";",
                header = TRUE,na.strings = "?")
wk_data <- df[66637:69517,]


wk_data$datetime <- strptime(paste(wk_data$Date, wk_data$Time), format = "%d/%m/%Y %H:%M:%S")

wk_data$Global_active_power <- as.numeric(as.character(wk_data$Global_active_power))
wk_data$Sub_metering_1 <- as.numeric(as.character(wk_data$Sub_metering_1))
wk_data$Sub_metering_2 <- as.numeric(as.character(wk_data$Sub_metering_2))
wk_data$Sub_metering_3 <- as.numeric(as.character(wk_data$Sub_metering_3))
wk_data$Voltage <- as.numeric(as.character(wk_data$Voltage))

#plot 4


png(filename = "plot4.png",width = 480, height = 480)

par(mfrow = c(2, 2))

plot(wk_data$datetime,wk_data$Global_active_power, 
     type = "l",
     ylab = "Global Active Power (kilowatts)" )

plot(wk_data$datetime,wk_data$Voltage, 
     type = "l",
     ylab = "Voltage",
     xlab = "datetime")

plot(wk_data$datetime, wk_data$Sub_metering_1, 
     type = "l",
     xlab = "",
     ylab = "Energy sub metering" , ylim = c(0, max(wk_data$Sub_metering_1)))
lines(wk_data$datetime, wk_data$Sub_metering_2, col = "red")
lines(wk_data$datetime,wk_data$Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1),
       col = c("black","red","blue"), bty = "n")

plot(wk_data$datetime,wk_data$Global_reactive_power, 
     type = "l",xlab = "datetime",
     ylab = "Global_reactive_power" )

dev.off() 

