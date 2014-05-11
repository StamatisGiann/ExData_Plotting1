library(data.table)
library(sqldf)
filename<-"household_power_consumption.txt"
mySql<-"SELECT * from file WHERE Date='1/2/2007' OR Date='2/2/2007'"
hpc<-read.csv.sql(filename,sql=mySql, sep=";")
attach(hpc)
hpc["datetime"]<-NA
datetime <- paste(Date, Time)
hpc["datetime"]<-datetime
datetime<-strptime(datetime, "%d/%m/%Y %H:%M")
plot(datetime, Sub_metering_1, xlab = "",ylab = "Energy sub metering", type ="n")
lines(datetime, Sub_metering_1)
lines(datetime, Sub_metering_2, col="red")
lines(datetime, Sub_metering_3, col="blue")
legend("topright",cex=0.7, lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
myWidth <- 480
myHeight <- 480
myPlotFileType <- png
myPlotFileName <- "plot3.png"
dev.copy(myPlotFileType, file = myPlotFileName, width = myWidth , height = myHeight)
dev.off() 
