source("load_data.R")

# setting locale to en_US for proper day in a week labels
localeDef <- Sys.getlocale( category = "LC_TIME" )

df <- LoadData()

Sys.setlocale("LC_TIME", "C")

plot(df$DateTime, df$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(df$DateTime, df$Sub_metering_2, type = "l", col = "red")
lines(df$DateTime, df$Sub_metering_3, type = "l", col = "blue")
legend("topright",col=c("black", "red", "blue"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, xjust = 1)

dev.print(png, file = "plot3.png", width = 480, height = 480)
dev.off()

# Restore locale settings
Sys.setlocale( category = "LC_TIME", locale = localeDef)