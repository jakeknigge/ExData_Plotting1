# Import Household Power Consumption data
powerConsumption <- read.table("household_power_consumption.txt", header = TRUE, 
                               sep = ";", na.strings = "?", stringsAsFactors = FALSE)

# Convert day-month-year format into year-month-day (POSTIXlt format)
powerConsumption$Date <- strptime(powerConsumption$Date, "%d/%m/%Y")

# Ensure date data is a "date data type"
powerConsumption$Date <- as.Date(powerConsumption$Date)

# Select appropriate days
powerCons <- powerConsumption[powerConsumption$Date == "2007-02-01" | 
                                    powerConsumption$Date == "2007-02-02", ]

# Convert data type
powerCons$DT <- as.POSIXlt(paste(powerCons$Date, powerCons$Time))

# Plot 3
# Open PNG device
png(file = "plot3.png", width = 480, height = 480, units = "px", pointsize = 12)

plot(range(powerCons$DT), range(powerCons$Sub_metering_1,
                                powerCons$Sub_metering_2,
                                powerCons$Sub_metering_3), 
     type = "n",
     ylab = "Energy sub metering", xlab = "",
     cex.axis = 1,
     cex.lab = 1)

# Add points (i.e., lines) to plot
points(powerCons$DT, powerCons$Sub_metering_1, type = "l")
points(powerCons$DT, powerCons$Sub_metering_2, type = "l", col = "red")
points(powerCons$DT, powerCons$Sub_metering_3, type = "l", col = "blue")

# Add legend
legend("topright", lty=c(1,1), col = c("black","red","blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex = 1)

# Close PNG device
dev.off()