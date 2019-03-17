#This script reads the dataset on electric powerconsumption and creates
#the third plot of the assignment on Exploratory Data Analysis

#reading the file
powertable <- read.csv("household_power_consumption.txt",
                       sep = ";", 
                       na.strings = "?", 
                       header = TRUE)

#get time 2007/02/01 and 2007/02/02 !
powertable$Date <- as.Date(powertable$Date, "%d/%m/%Y")
impTable <- subset(powertable, 
                   powertable$Date=="2007-02-01"|powertable$Date=="2007-02-02")

#open the png device
png("plot3.png")
#get the postion of the first datapoint on friday
friplace <- min(which(impTable$Date == "2007-02-02"))
#create plot with first data line
plot(impTable$Sub_metering_1, type = "l",xlab ="", ylab = "Energy sub metering", xaxt = "n")
axis(1, at = c(1,friplace, length(impTable$Date)), labels = c("Thu","Fri", "Sat"))
#add other lines
lines(impTable$Sub_metering_2,col = "red")
lines(impTable$Sub_metering_3,col = "blue")
# add legend
legend("topright", legend = names(impTable)[7:9],lty = 1, col =c("black", "red", "blue"))
#close device
dev.off()