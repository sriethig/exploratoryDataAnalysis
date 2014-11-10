plot3 <- function() {
  # read data from file
  e_power <- read.table("exdata_data_power_consumption/household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
  # extract date for the two days to be plotted
  e_power <- subset(e_power, e_power$Date == "1/2/2007" | e_power$Date == "2/2/2007")
  # get date and time into right formatting
  e_power$Date <- as.Date(e_power$Date, "%d/%m/%Y")
  help <- paste(e_power$Date, e_power$Time, sep = ' ')
  help <- strptime(help, "%Y-%m-%d %H:%M:%S")
  # save plot to plot3.png
  png("plot3.png", 480, 480)
  plot(help, e_power$Sub_metering_1, type="l", xlab = "", ylab = "Energy Sub Metering")
  lines(help, e_power$Sub_metering_3, type = "l", col = "blue")
  lines(help, e_power$Sub_metering_2, type = "l", col = "red")
  legend("topright", legend = c("Submetering 1", "Submetering 2", "Submetering 3"), lty = c(1,1), col = c("black", "red", "blue"))
  dev.off()
}
