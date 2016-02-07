source("load_data.R")

# setting locale to en_US for proper day in a week labels
localeDef <- Sys.getlocale( category = "LC_TIME" )

df <- LoadData()

Sys.setlocale("LC_TIME", "C")

plot(df$DateTime, 
     df$Global_active_power, type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")

dev.print(png, file = "plot2.png", width = 480, height = 480)
dev.off()

# Restore locale settings
Sys.setlocale( category = "LC_TIME", locale = localeDef)