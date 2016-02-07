LoadData <- function() {

  # read the file
  df <- read.csv("household_power_consumption.txt", sep = ";")
  
  # convert to date and time
  df$Date <- as.Date(df$Date, "%d/%m/%Y")
  
  # convert to numeric
  df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
  df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
  df$Voltage <- as.numeric(as.character(df$Voltage))
  df$Global_intensity <- as.numeric(as.character(df$Global_intensity))
  df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
  df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
  df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
  
  # Add new column DateTime
  df$DateTime <- paste(df$Date, df$Time)
  df$DateTime <- strptime(df$DateTime, format = "%Y-%m-%d %H:%M:%S")
  
  # subsetting just two days
  twodays <- subset(df, Date >= as.Date("2007-02-01", "%Y-%m-%d") & Date <= as.Date("2007-02-02", "%Y-%m-%d"))
  
  twodays
}