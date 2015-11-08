##-------------------------------##
# Code to create plot No. 2
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
png("plot2.png")

# plot the variable "Global_active_power" but do not show it
with(table,plot(Global_active_power,ylab = "Global Active Power (kilowatts)",
                xaxt="n",xlab = "",type="n"))
# plot the lines connecting data points of the same variable
with(table,lines(Global_active_power))
# create the customized x-axis
axis(1, at=c(0,1500,2900), labels=c("Thu","Fri","Sat"),
     pos=-0.075, lwd = 0.5,lty=1, col="black", las=0)

# close the graphics device
dev.off()

