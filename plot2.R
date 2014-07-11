#Extdata_Plotting1
##This is plotting example 2 which creates a histogram of extdata

## Read the data from the given file
extdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

##Convert datatype from factor to date for Date
extdata$Date <- as.Date(extdata$Date, "%d/%m/%Y")

##Subset the data based on date
subextdata <- extdata[extdata$Date ==" 2007-02-01" | extdata$Date == "2007-02-01"]

##add date/time variable
subextdata$date1<- as.POSIXct(paste(subextdata$Date, subextdata$Time))

##Create line chart
plot(subextdata$date1,subextdata$Global_active_power, type="l", ylab="Global Activity Power (kilowatts)", xlab="Thursday")

##Print to png
dev.copy(png, file="./Coursera/plot2.png")
dev.off()

