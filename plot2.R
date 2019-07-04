setwd("C:/Users/rafae/Documents/R/Data Science Specialization/Course4/W1")

df <-read.table("household_power_consumption.txt", 
                sep = ";",
                header = TRUE,na.strings = "?")
wk_data <- df[66637:69517,]


wk_data$datetime <- strptime(paste(wk_data$Date, wk_data$Time), format = "%d/%m/%Y %H:%M:%S")

wk_data$Global_active_power <- as.numeric(as.character(wk_data$Global_active_power))


png(filename = "plot2.png",width = 480, height = 480)

plot(wk_data$datetime,wk_data$Global_active_power, 
     type = "l",
     ylab = "Global Active Power (kilowatts)" )

dev.off() 
