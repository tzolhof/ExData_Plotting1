data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data$datetime <- as.POSIXct(paste(data$Date, data$Time), 
                            format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
energy_use <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]
par(mfrow = c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
plot(energy_use$datetime, as.numeric(as.character(energy_use$Global_active_power)),  
     xlab = "", ylab = "Global Active Power", type = "l")
plot(energy_use$datetime, as.numeric(as.character(energy_use$Voltage)),  
     xlab = "datetime", ylab = "Voltage", type = "l")
plot(energy_use$datetime, as.numeric(as.character(energy_use$Sub_metering_1)),  
     xlab = "", ylab = "", type = "l")
points(energy_use$datetime, as.numeric(as.character(energy_use$Sub_metering_2)),  
       xlab = "", ylab = "", col = "red", type = "l")
points(energy_use$datetime, as.numeric(as.character(energy_use$Sub_metering_3)),  
       xlab = "", ylab = "", col = "blue", type = "l")
title(ylab = "Energy sub metering")
legend("topright", legend = c("Sub_metering_1       ",
                              "Sub_metering_2       ", "Sub_metering_3       "),
       col = c("black", "red", "blue"), cex = 0.9, bty = "n", lty = 1)
plot(energy_use$datetime, as.numeric(as.character(energy_use$Global_reactive_power)),  
     xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
