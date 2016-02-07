source("load_data.R")

# setting locale to en_US for proper day in a week labels
localeDef <- Sys.getlocale( category = "LC_TIME" )

df <- LoadData()

Sys.setlocale("LC_TIME", "C")

par(mfrow=c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

# plot 1
plot(df$DateTime, 
     df$Global_active_power, type = "l", 
     xlab = "", 
     ylab = "Global Active Power")

# plot 2
plot(df$DateTime, 
     df$Voltage, type = "l", 
     xlab = "datetime", 
     ylab = "Voltage")

# plot 3
plot(df$DateTime, df$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(df$DateTime, df$Sub_metering_2, type = "l", col = "red")
lines(df$DateTime, df$Sub_metering_3, type = "l", col = "blue")
legend("topright",col=c("black", "red", "blue"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, xjust = 1)

# plot 4
with(df, plot(DateTime, 
     Global_reactive_power, type = "l", 
     xlab = "datetime"))

dev.print(png, file = "plot4.png", width = 480, height = 480)
dev.off()

# Restore locale settings
Sys.setlocale( category = "LC_TIME", locale = localeDef)