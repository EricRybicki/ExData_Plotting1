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
## Create plot2
png(file="plot2.png")
plot(hpc$DateTime, hpc$Global_active_power, type="n",xlab="",
     ylab="Global Active Power (kilowatts)")
    lines(hpc$DateTime, hpc$Global_active_power)

dev.off()