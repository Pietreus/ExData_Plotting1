#This script reads the dataset on electric powerconsumption and creates
#the second plot of the assignment on Exploratory Data Analysis

#reading the file
powertable <- read.csv("household_power_consumption.txt",
                       sep = ";", 
                       na.strings = "?", 
                       header = TRUE)

#get time 2007/02/01 and 2007/02/02 !
powertable$Date <- as.Date(powertable$Date, "%d/%m/%Y")
impTable <- subset(powertable, 
                   powertable$Date=="2007-02-01"|powertable$Date=="2007-02-02")

#open png device and create the plot as required
png("plot2.png")
#get the postion of the first datapoint on friday
friplace <- min(which(impTable$Date == "2007-02-02"))

plot(impTable$Global_active_power, type = "l",xlab = "",
     ylab = "Global Active Power (kilowatts)", xaxt = "n")
#create the labels for the x axis
axis(1, at = c(1,friplace, length(impTable$Date)), labels = c("Thu","Fri", "Sat"))
#close the device
dev.off()