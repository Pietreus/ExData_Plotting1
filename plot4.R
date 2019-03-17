#This script reads the dataset on electric powerconsumption and creates
#the fourth plot of the assignment on Exploratory Data Analysis

powertable <- read.csv("household_power_consumption.txt",
                       sep = ";", 
                       na.strings = "?", 
                       header = TRUE)

#get time 2007/02/01 and 2007/02/02 !
powertable$Date <- as.Date(powertable$Date, "%d/%m/%Y")
impTable <- subset(powertable, 
                   powertable$Date=="2007-02-01"|powertable$Date=="2007-02-02")
#get the index of the first datapoint on friday
friplace <- min(which(impTable$Date == "2007-02-02"))

#open the png device
png("plot4.png")
#set up the device for four plots
par(mfrow = c(2,2))
#plot 1

plot(impTable$Global_active_power, type = "l",xlab = "",
     ylab = "Global Active Power", xaxt = "n")
#x axis labels
axis(1, at = c(1,friplace, length(impTable$Date)), labels = c("Thu","Fri", "Sat"))

#plot 2
plot(impTable$Voltage, type = "l",xlab = "datetime",
     ylab = "Voltage", xaxt = "n")
#x axis labels
axis(1, at = c(1,friplace, length(impTable$Date)), labels = c("Thu","Fri", "Sat"))

#plot 3
plot(impTable$Sub_metering_1, type = "l",xlab ="", ylab = "Energy sub metering", xaxt = "n")
axis(1, at = c(1,friplace, length(impTable$Date)), labels = c("Thu","Fri", "Sat"))
# add the other datalines
lines(impTable$Sub_metering_2,col = "red")
lines(impTable$Sub_metering_3,col = "blue")
# create the legend
legend("topright", legend = names(impTable)[7:9],lty = 1,
       col =c("black", "red", "blue"), bty = "n")

#plot 4
plot(impTable$Global_reactive_power, type = "l",xlab = "datetime",
     ylab = "Global_reactive_power", xaxt = "n")
#x axis labels
axis(1, at = c(1,friplace, length(impTable$Date)), labels = c("Thu","Fri", "Sat"))

#close the device
dev.off()