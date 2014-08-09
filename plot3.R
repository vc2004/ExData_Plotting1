test <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
test.sub <- test[test$Date %in% c("1/2/2007", "2/2/2007"), ]

test.sub[,1] <- as.character(test.sub[,1])
cols = c(3, 4, 5, 6, 7, 8, 9)
test.sub[,cols] = apply(test.sub[,cols], 2, function(x) as.numeric(as.character(x)))

test.sub$Time <- strptime(paste(test.sub$Date, test.sub$Time), "%d/%m/%Y %H:%M:%S")
test.sub <- test.sub[,2:9]

png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(test.sub$Time, test.sub$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(test.sub$Time, test.sub$Sub_metering_2, col = "red")
lines(test.sub$Time, test.sub$Sub_metering_3, col = "blue")
legend("topright", lty=c(1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()