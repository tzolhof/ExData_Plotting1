data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data$datetime <- as.POSIXct(paste(data$Date, data$Time), 
                 format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
energy_use <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]
plot(energy_use$datetime, as.numeric(as.character(energy_use$Global_active_power)),  
     xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()

