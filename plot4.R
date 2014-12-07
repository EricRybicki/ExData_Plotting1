## Create new text file with only designated dates included
system("head -n 1 household_power_consumption.txt >hpc.txt")
system("grep '^[1]/2/2007' household_power_consumption.txt >>hpc.txt") 
system("grep '^[2]/2/2007' household_power_consumption.txt >>hpc.txt") 

## Load data
hpc<- read.csv("hpc.txt", header=TRUE, sep=";", quote ="", na.strings="?",
    stringsAsFactors=FALSE, colClasses = c("character","character",rep("numeric",1,7)))

## Create new 'DateTime' column to display date and time in one figure
hpc$DateTime <- strptime( apply( hpc[ , c("Date","Time") ], 1, paste, collapse=" "),
                          "%d/%m/%Y %H:%M:%S")
## Create plot4
png(file="plot4.png")
par(mfrow=c(2,2))
plot(hpc$DateTime, hpc$Global_active_power, type="n",xlab="",
     ylab="Global Active Power")
    lines(hpc$DateTime, hpc$Global_active_power)
plot(hpc$DateTime, hpc$Voltage, type="n",xlab="datetime",
     ylab="Voltage")
    lines(hpc$DateTime, hpc$Voltage)
plot(hpc$DateTime, hpc$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
    lines(hpc$DateTime, hpc$Sub_metering_1)
    lines(hpc$DateTime, hpc$Sub_metering_2, col= "red" )
    lines(hpc$DateTime, hpc$Sub_metering_3, col= "blue" )
    legend("topright", lty=c(1,1), col=c("black", "red", "blue"),cex=0.7, bty="n", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(hpc$DateTime, hpc$Global_reactive_power, type="n",xlab="datetime",
     ylab="Global_reactive_power")
    lines(hpc$DateTime, hpc$Global_reactive_power)

dev.off()