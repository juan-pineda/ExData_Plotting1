##-------------------------------##
# Code to create plot No. 4
# Use data from household_power_consumption.txt
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# File has to be in the same folder
##-------------------------------##

# Download dataset
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download(url, dest="dataset.zip", mode="wb")
# unzip the file
unzip("dataset.zip", exdir = "./")

# read full dataset
table <- read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?")
# keep only data from 1st and 2nd of february, 2007
table <- subset(table,Date=="1/2/2007" | Date=="2/2/2007")

# open the graphics device
png("plot4.png")

# create an array of four subplots
par(mfrow=c(2,2))

##-------------------------------##
## --> topleft plot (basically the same as plot 2)
##-------------------------------##
# plot the variable "Global_active_power" but do not show it
with(table,plot(Global_active_power,ylab = "Global Active Power",
                xaxt="n",xlab = "",type="n"))
# plot the lines connecting data points of the same variable
with(table,lines(Global_active_power))
# create the customized x-axis
axis(1, at=c(0,1500,2900), labels=c("Thu","Fri","Sat"),
     pos=-0.075, lwd = 0.5,lty=1, col="black", las=0)

##-------------------------------##
## --> topright plot
##-------------------------------##
# plot the variable "Voltage" but do not show it
with(table,plot(Voltage,ylab = "Voltage",xaxt="n",xlab = "datetime",type="n"))
# plot the lines connecting data points of the same variable
with(table,lines(Voltage))
# create the customized x-axis
axis(1, at=c(0,1500,2900), labels=c("Thu","Fri","Sat"),
     pos=232.5, lwd = 0.5,lty=1, col="black", las=0)

##-------------------------------##
## --> bottomleft plot (basically the same as plot 3)
##-------------------------------##
# plot the variable "Energy sub metering" but do not show it
with(table,plot(Sub_metering_1,ylab = "Energy sub metering",xaxt="n",xlab = "",type="n"))
# plot with lines the different sub-metering quantities
with(table,lines(Sub_metering_1,col="black"))
with(table,lines(Sub_metering_2,col="red"))
with(table,lines(Sub_metering_3,col="blue"))
# create customized x-label
axis(1, at=c(0,1500,2900), labels=c("Thu","Fri","Sat"),
     pos=-1.5, lwd = 0.5,lty=1, col="black", las=0)
# place legend box
legend("topright",lty=c(1,1,1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),bty="n")

##-------------------------------##
## --> bottomright plot
##-------------------------------##
# plot the variable "Global_reactive_power" but do not show it
with(table,plot(Global_reactive_power,xaxt="n",xlab = "datetime",type="n"))
# plot the lines connecting data points of the same variable
with(table,lines(Global_reactive_power))
# create customized x-label
axis(1, at=c(0,1500,2900), labels=c("Thu","Fri","Sat"),
     pos=-0.02, lwd = 0.5,lty=1, col="black", las=0)

# close the graphics device
dev.off()

