#This script reads the dataset on electric powerconsumption and creates
#the first plot of the assignment on Exploratory Data Analysis

#reading the file
powertable <- read.csv("household_power_consumption.txt",
                       sep = ";", 
                       na.strings = "?", 
                       header = TRUE)

#get time 2007/02/01 and 2007/02/02 !
powertable$Date <- as.Date(powertable$Date, "%d/%m/%Y")
impTable <- subset(powertable, 
                   powertable$Date=="2007-02-01"|powertable$Date=="2007-02-02")

#open png device and create the histogram as required
png("plot1.png")

#create the hist as in the assignment 
hist(impTable$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
#close the device
dev.off()