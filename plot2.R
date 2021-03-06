##plot2

Full_Data<- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

subData <- subset(Full_Data,Full_Data$Date=="1/2/2007" |Full_Data$Date =="2/2/2007")

subData$Date <- as.Date(subData$Date, format="%d/%m/%Y")
subData$Time <- strptime(subData$Time, format="%H:%M:%S")
subData[1:1440,"Time"] <- format(subData[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subData[1441:2880,"Time"] <- format(subData[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

plot(subData$Time,as.numeric(as.character(subData$Global_active_power)),type="l",
     xlab="",ylab="Global Active Power (kilowatts)") 
