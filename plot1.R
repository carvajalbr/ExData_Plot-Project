##Extdata_Plotting1
##This is plotting example 1 which creates a histogram of extdata

## Read the data from the given file
extdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

##Convert datatype from factor to date for Date
extdata$Date <- as.Date(extdata$Date, "%d/%m/%Y")

##Subset the data based on date
subextdata <- extdata[extdata$Date ==" 2007-02-01" | extdata$Date == "2007-02-01"]

##Create histogram plots
hist(subextdata$Global_active_power, col = "red", xlab =" Global Activity Power (kilowatts)", main ="Global Activity Power")

##Print to png file
dev.copy(png, file="./Coursera/plot1.png")
dev.off()
