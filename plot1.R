##-------------------------------##
# Code to create plot No. 1
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
png("plot1.png")

# set margins
par(mar = c(5.1,4.1,3.1,2))
# plot histogram of variable "Global_active_power"
hist(table$Global_active_power,col='red',main = "", xlab="", ylab="")
# set title and axes labels
title(main="Global Active Power",
      xlab = "Global Active Power (kilowatts)",ylab = "Frequency",cex.main = 1)

# close the graphics device
dev.off()

