filename <- "household_power_consumption_data.zip"
unzip(filename) 

power_plot <- read.table("household_power_consumption.txt", header  =  T, sep  =  ";", na.strings  =  "?")
dataSet <- power_plot[power_plot$Date %in% c("1/2/2007","2/2/2007"),]
new_time <- strptime(paste(dataSet$Date, dataSet$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
dataSet <- cbind(new_time, dataSet)

## Plot 1
hist(dataSet$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

## Plot 2
plot(dataSet$new_time, dataSet$Global_active_power, type = "l", col = "black", xlab = "", ylab = "Global Active Power (kilowatts)")

## Plot 3
col_Lines <- c("black", "red", "blue")
plot3_labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(dataSet$new_time, dataSet$Sub_metering_1, type = "l", col = col_Lines[1], xlab = "", ylab = "Energy sub metering")
lines(dataSet$new_time, dataSet$Sub_metering_2, col = col_Lines[2])
lines(dataSet$new_time, dataSet$Sub_metering_3, col = col_Lines[3])
legend("topright", legend = plot3_labels, col = col_Lines, lty = "solid")

## Plot 4

plot3_labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
col_Lines <- c("black","red","blue")
par(mfrow = c(2,2))

plot(dataSet$new_time, dataSet$Global_active_power, type = "l", col = "black", xlab = "", ylab = "Global Active Power")
plot(dataSet$new_time, dataSet$Voltage, type = "l", col = "black", xlab = "datetime", ylab = "Voltage")
plot(dataSet$new_time, dataSet$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

lines(dataSet$new_time, dataSet$Sub_metering_2, type = "l", col = "red")
lines(dataSet$new_time, dataSet$Sub_metering_3, type = "l", col = "blue")
legend("topright", bty = "n", legend  =  plot3_labels, cex = 0.8, lty = 1, col = col_Lines)

plot(dataSet$new_time, dataSet$Global_reactive_power, type = "l", col = "black", xlab = "datetime", ylab = "Global_reactive_power")
