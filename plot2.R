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
plot(datetime, Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type ="n", pin = c(5, 5))
lines(datetime, Global_active_power)
myWidth <- 480
myHeight <- 480
myPlotFileType <- png
myPlotFileName <- "plot2.png"
dev.copy(myPlotFileType, file = myPlotFileName, width = myWidth , height = myHeight)
dev.off() 