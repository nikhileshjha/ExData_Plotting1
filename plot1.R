durl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(durl,destfile = "power_consumption.zip",method = "curl")
unzip("power_consumption.zip")
electricData <- read.table("household_power_consumption.txt",sep = ";", header = TRUE,na.string = "?")
electricData$Date <- as.Date(electricData$Date,format="%d/%m/%Y")
project_data <- subset(electricData, Date == as.Date('2007-02-01') | Date == as.Date('2007-02-02'))

# Creating plot 1
hist(project_data$Global_active_power,col="red", xlab = "Global Active Power (kilowatts)",ylab = "Frequency", main = "Global Active Power")
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()
