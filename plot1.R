plot1 <- function() { 
  # read data from file
  e_power <- read.table("exdata_data_power_consumption/household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
  # extract data from first and second february
  e_power <- subset(e_power, e_power$Date == "1/2/2007" | e_power$Date == "2/2/2007")
  # ace plot in plot1.png
  png("plot1.png", 480, 480)
  hist(as.numeric(paste(e_power$Global_active_power)), main="Global Active Power", xlab="Global Active Power (kilowatts)", plot=TRUE, col = "red")
  dev.off()
}
