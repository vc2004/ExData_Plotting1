# Loading the data into R and subset with specific date

test <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
test.sub <- test[test$Date %in% c("1/2/2007", "2/2/2007"), ]

# Convert the factor into number or character

test.sub[,1] <- as.character(test.sub[,1])
cols = c(3, 4, 5, 6, 7, 8, 9)
test.sub[,cols] = apply(test.sub[,cols], 2, function(x) as.numeric(as.character(x)))

# Combine the time column into standard time format

test.sub$Time <- strptime(paste(test.sub$Date, test.sub$Time), "%d/%m/%Y %H:%M:%S")
test.sub <- test.sub[,2:9]

# Draw the PNG

png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(test.sub$Time, test.sub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()