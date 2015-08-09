## This is the master file for Project One. The below script will import the 
#     "Individual household electric power consumption Data Set" and produce
#     exploratory plots. To run the script, be sure the following packages
#     are loaded:  datasets, graphics, grDevices, methods, stats and utils.

## Part 1: Load data
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

## Part 2: Create exploratory plots
# Plot 1 code
png(file = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12)
hist(powerCons$Global_active_power, 
      main = "Global Active Power",
      xlab = "Global Active Power (kilowatts)",
      col = "red",
      cex.main = 1, cex.axis = 1, cex.lab = 1)
dev.off()

## Plot 2 code
# Open PNG device
png(file = "plot2.png", width = 480, height = 480, units = "px", pointsize = 12)

# Create plot
plot(powerCons$DT, powerCons$Global_active_power, 
     type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "",
     cex.axis = 1, cex.lab = 1)

# Close PNG device
dev.off()

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
dev.off()

# Plot 4 (row-2, column-2)
# Open PNG device
png(file = "plot4.png", width = 480, height = 480, units = "px", pointsize = 12)

# Make a 2x2 frame
par(mfrow=c(2,2))

      # Sub-plot 1
      plot(powerCons$DT, powerCons$Global_active_power, 
           type = "l", 
           ylab = "Global Active Power (kilowatts)", xlab = "",
           cex.axis = 1, cex.lab = 1)
      
      # Sub-plot 2
      plot(powerCons$DT, powerCons$Voltage, 
           type = "l", 
           ylab = "Voltage", xlab = "datetime",
           cex.axis = 1, cex.lab = 1)
      
      # Sub-plot 3
      plot(range(powerCons$DT), range(powerCons$Sub_metering_1,
                                      powerCons$Sub_metering_2,
                                      powerCons$Sub_metering_3), 
           type = "n",
           ylab = "Energy sub metering", xlab = "",
           cex.axis = 1, cex.lab = 1)
      
      # Add points (lines in this case) to plots
      points(powerCons$DT, powerCons$Sub_metering_1, type = "l")
      points(powerCons$DT, powerCons$Sub_metering_2, type = "l", col = "red")
      points(powerCons$DT, powerCons$Sub_metering_3, type = "l", col = "blue")
      
      # Add legend to plot
      legend("topright", lty=c(1,1), col = c("black","red","blue"), 
             legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
             bty = "n",
             cex = 1)
      
      # Sub-plot 4
      plot(powerCons$DT, powerCons$Global_reactive_power, 
           type ="l",
           ylab = "Global_reactive_power", xlab = "datetime",
           cex.axis = 1, cex.lab = 1)

# Close PNG device
dev.off()