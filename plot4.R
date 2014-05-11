library(data.table)
library(sqldf)
filename<-"household_power_consumption.txt"
mySql<-"SELECT * from file WHERE Date='1/2/2007' OR Date='2/2/2007'"
hpc<-read.csv.sql(filename,sql=mySql, sep=";")
attach(hpc)
hpc["datetime"]<-NA
datetime <- paste(Date, Time)
hpc["datetime"]<-datetime
datetime<-strptime(datetime, "%d/%m/%Y %H:%M:%S")
par(mfrow=c(2,2))
plot(datetime, Global_active_power, xlab = "",ylab = "Glboal Active Power", 
     type = "n", cex.axis=.8, cex.lab=.8)
lines(datetime, Global_active_power)
plot(datetime, Voltage, cex.axis=.8, cex.lab=.8, type = "n")
lines(datetime, Voltage) 
plot(datetime, Sub_metering_1, xlab = "",ylab = "Energy sub metering",
     cex.axis=.8, cex.lab=.8, type ="n")
lines(datetime, Sub_metering_1)
lines(datetime, Sub_metering_2, col="red")
lines(datetime, Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black", "red", "blue"), cex=.7, box.lwd=0)
plot(datetime, cex.axis=.8, cex.lab=.8,Global_reactive_power, type = "n")
lines(datetime, Global_reactive_power)
myWidth <- 480
myHeight <- 480
myPlotFileType <- png
myPlotFileName <- "plot4.png"
dev.copy(myPlotFileType, file = myPlotFileName, width = myWidth , height = myHeight)
dev.off() 
