plot2 <- function() {
  # read data from file
  e_power <- read.table("exdata_data_power_consumption/household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
  # extract date 
  e_power <- subset(e_power, e_power$Date == "1/2/2007" | e_power$Date == "2/2/2007")
  # get date and time in right formatting
  e_power$Date <- as.Date(e_power$Date, "%d/%m/%Y")
  help <- paste(e_power$Date, e_power$Time, sep = ' ')
  help <- strptime(help, "%Y-%m-%d %H:%M:%S")
  # save plot to plot2.png
  png("plot2.png", 480, 480)
  plot(help, e_power$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  dev.off()
}
