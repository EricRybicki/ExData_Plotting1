## Create new text file with only designated dates included
system("head -n 1 household_power_consumption.txt >hpc.txt")
system("grep '^[1]/2/2007' household_power_consumption.txt >>hpc.txt") 
system("grep '^[2]/2/2007' household_power_consumption.txt >>hpc.txt") 

## Load data
hpc<- read.csv("hpc.txt", header=TRUE, sep=";", quote ="", na.strings="?",
    stringsAsFactors=FALSE, colClasses = c("character","character",rep("numeric",1,7)))

## Create Plot 1
png(file="plot1.png")
hist(hpc$Global_active_power, xlab="Global Active Power (kilowatts)",
     main="Global Active Power", col="red")

dev.off()