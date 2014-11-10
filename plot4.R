plot4 <- function() {
  # read data from file
  e_power <- read.table("exdata_data_power_consumption/household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
  # extract data fromt the two days
  e_power <- subset(e_power, e_power$Date == "1/2/2007" | e_power$Date == "2/2/2007")
  # get date and time into the right formatting
  e_power$Date <- as.Date(e_power$Date, "%d/%m/%Y")
  help <- paste(e_power$Date, e_power$Time, sep = ' ')
  help <- strptime(help, "%Y-%m-%d %H:%M:%S")
  # save the four plots to plot4.png
  png("plot4.png", 480, 480)
  par(mfrow = c(2,2))
  plot(help, e_power$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  plot(help, e_power$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", lwd = 1)
  plot(help, e_power$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")
  lines(help, e_power$Sub_metering_2, type = "l", col = "red")
  lines(help, e_power$Sub_metering_3, type = "l", col = "blue")
  legend("topright", legend = c("Submetering 1", "Submetering 2", "Submetering 3"), lty=c(1,1), lwd = 1, col=c("black", "red", "blue"))
  plot(help, e_power$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global reactive power", lwd = 1)
  dev.off()
}