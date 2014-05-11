library(data.table)
library(sqldf)
filename<-"household_power_consumption.txt"
mySql<-"SELECT * from file WHERE Date='1/2/2007' OR Date='2/2/2007'"
hpc<-read.csv.sql(filename,sql=mySql, sep=";")
dat<-as.numeric(as.character(hpc$Global_active_power))
dat<-dat[!is.na(dat)]
hist(dat, col="red", xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", main= "Global Active Power")
myWidth <- 480
myHeight <- 480
myPlotFileType <- png
myPlotFileName <- "plot1.png"
dev.copy(myPlotFileType, file = myPlotFileName, width = myWidth , height = myHeight)
dev.off() 