setwd("C:/Users/rafae/Documents/R/Data Science Specialization/Course4/W1")

df <-read.table("household_power_consumption.txt", 
                sep = ";",
                header = TRUE,na.strings = "?")
wk_data <- df[66637:69517,]


wk_data$datetime <- strptime(paste(wk_data$Date, wk_data$Time), format = "%d/%m/%Y %H:%M:%S")

wk_data$Global_active_power <- as.numeric(as.character(wk_data$Global_active_power))
wk_data

png(filename = "plot1.png",width = 480, height = 480)


hist(wk_data$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     main = "Global Active Power")


dev.off() 