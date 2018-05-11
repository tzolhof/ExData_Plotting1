data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
energy_use <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]
hist(as.numeric(as.character(energy_use$Global_active_power)), col = "red", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", 
     main = "Global Active Power")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
