data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data$datetime <- as.POSIXct(paste(data$Date, data$Time), 
                            format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
energy_use <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]
plot(energy_use$datetime, as.numeric(as.character(energy_use$Sub_metering_1)),  
     xlab = "", ylab = "", type = "l")
points(energy_use$datetime, as.numeric(as.character(energy_use$Sub_metering_2)),  
     xlab = "", ylab = "", col = "red", type = "l")
points(energy_use$datetime, as.numeric(as.character(energy_use$Sub_metering_3)),  
     xlab = "", ylab = "", col = "blue", type = "l")
title(ylab = "Energy sub metering")
legend("topright", legend = c("Sub_metering_1       ",
      "Sub_metering_2       ", "Sub_metering_3       "),
       col = c("black", "red", "blue"), cex = 0.9, lty = 1)
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
