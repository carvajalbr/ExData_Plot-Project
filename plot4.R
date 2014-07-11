#This is plotting example 4 which creates a histogram of extdata

data<-read.table("household_power_consumption.txt",dec=".",sep=";",na.strings="?",header=T)

#Converting dates
data$Date<-as.Date(data$Date,"%d/%m/%Y")

##add date/time variable
data1<-data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]
data1$datetime <- as.POSIXct(paste(data1$Date, data1$Time))

#Set the pars for the four charts
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

#Creat chart 1
plot(data1$datetime,data1$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",lwd=1,type="l")

#Create chart2
plot(data1$datetime,data1$Voltage,ylab="Voltage",xlab="datetime",lwd=1,type="l")

#Create chart3
plot(data1$datetime,data1$Sub_metering_1,ylab="Energy sub metering",xlab="",lwd=1,type="l")
lines(data1$datetime,data1$Sub_metering_2,col="red")
lines(data1$datetime,data1$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, col=c("black", "red", "blue"))

#Create chart 4
plot(data1$datetime,data1$Global_reactive_power,ylab="Global Rective Power",xlab="datetime",lwd=1,type="l")


#Create png file
dev.copy(png,file="./Coursera/plot4.png")
dev.off()