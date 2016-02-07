source("load_data.R")

df <- LoadData()

hist(df$Global_active_power, 
      col="red", main = "Global Active Power", 
      xlab = "Global Active Power (kilowatts)")

dev.print(png, file = "plot1.png", width = 480, height = 480)
dev.off()