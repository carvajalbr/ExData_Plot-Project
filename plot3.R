#Extdata_Plotting1
##This is plotting example 3 which creates a histogram of extdata

## Read the data from the given file
extdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

##Convert datatype from factor to date for Date
extdata$Date <- as.Date(extdata$Date, "%d/%m/%Y")

##Subset the data based on date
subextdata <- extdata[extdata$Date ==" 2007-02-01" | extdata$Date == "2007-02-01"]

##add date/time variable
subextdata$date1<- as.POSIXct(paste(subextdata$Date, subextdata$Time))

##Create line chart with multiple lines
plot(subextdata$date1,subextdata$Sub_metering_1, type="l", ylab="Energy Sub Metering" xlab="")
line(subextdata$date1, subextdata$Sub_metering_2, col="red")
line(subextdata$date1, subextdata$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, col=c("black", "red", "blue"))

##Print to png
dev.copy(png, file="./Coursera/plot3.png")
dev.off()