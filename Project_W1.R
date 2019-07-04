setwd("C:/Users/rafae/Documents/R/Data Science Specialization/Course4/W1")

df <-read.table("household_power_consumption.txt", 
                sep = ";",
                header = TRUE)
wk_data <- df[66637:69517,]
tail(wk_data)
names(wk_data)
head(wk_data)

wk_data$datetime <- strptime(paste(wk_data$Date, wk_data$Time), format = "%d/%m/%Y %H:%M:%S")

wk_data$Global_active_power <- as.numeric(wk_data$Global_active_power)



#Plot1

png(filename = "plot1.png",width = 480, height = 480)


hist(wk_data$Global_active_power/500, col = "red", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     main = "Global Active Power")


dev.off() 

#plot 2

png(filename = "plot2.png",width = 480, height = 480)

plot(wk_data$datetime,wk_data$Global_active_power/500, 
     type = "l",
     ylab = "Global Active Power (kilowatts)" )

dev.off() 

#plot 3

png(filename = "plot3.png",width = 480, height = 480)

plot(wk_data$datetime,as.numeric(wk_data$Sub_metering_1), 
     type = "l",
     xlab = "",
     ylab = "Energy sub metering" , ylim = c(0, max(as.numeric(wk_data$Sub_metering_1))))
lines(wk_data$datetime,as.numeric(wk_data$Sub_metering_2), col = "red")
lines(wk_data$datetime,as.numeric(wk_data$Sub_metering_3), col = "blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       pch = "-",
       col = c("black","red","blue"))
dev.off() 

#plot 4
 

png(filename = "plot4.png",width = 480, height = 480)

par(mfrow = c(2, 2))

plot(wk_data$datetime,wk_data$Global_active_power/5, 
     type = "l",
     ylab = "Global Active Power (kilowatts)" )

plot(wk_data$datetime,as.numeric(wk_data$Voltage), 
     type = "l",
     ylab = "Voltage",
     xlab = "datetime")

plot(wk_data$datetime,as.numeric(wk_data$Sub_metering_1), 
     type = "l",
     xlab = "",
     ylab = "Energy sub metering" , ylim = c(0, max(as.numeric(wk_data$Sub_metering_1))))
lines(wk_data$datetime,as.numeric(wk_data$Sub_metering_2), col = "red")
lines(wk_data$datetime,as.numeric(wk_data$Sub_metering_3), col = "blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       pch = "-",
       col = c("black","red","blue"), bty = "n")

plot(wk_data$datetime,as.numeric(wk_data$Global_reactive_power)/500, 
     type = "l",xlab = "datetime",
     ylab = "Global_reactive_power" )

dev.off() 

