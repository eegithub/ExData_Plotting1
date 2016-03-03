#Pre-requisite : create_data.R has been executed => project-data.csv exists in RWork directory

#Getting & parsing data
read.csv("project-data.csv",header=TRUE, stringsAsFactors = FALSE)->pdata
as.Date(pdata$Date)->pdata$Date
strptime(pdata$Time, format="%Y-%m-%d %H:%M:%S")->pdata$Time

#Creating 1st plot
hist(pdata$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png,'plot1.png',width = 480, height = 480)
dev.off()

