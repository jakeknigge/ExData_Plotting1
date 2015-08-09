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

# Plot 1 code
# Open PNG device
png(file = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12)

# Create plot
hist(powerCons$Global_active_power, 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red",
     cex.main = 1, cex.axis = 1, cex.lab = 1)

# Close PNG device
dev.off()