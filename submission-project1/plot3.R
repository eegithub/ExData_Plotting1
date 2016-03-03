#Pre-requisite : create_data.R has been executed => project-data.csv exists in RWork directory

#Language settings
local_origin <- Sys.getlocale( category = "LC_TIME" )
Sys.setlocale("LC_TIME", "C")


#Getting & parsing data
read.csv("project-data.csv",header=TRUE, stringsAsFactors = FALSE)->pdata
as.Date(pdata$Date)->pdata$Date
strptime(pdata$Time, format="%Y-%m-%d %H:%M:%S")->pdata$Time

#Creating 3rd plot : graph will be written directly to the file, no display in RStudio
png('plot3.png',width = 480, height = 480)
plot(pdata$Time,pdata$Sub_metering_1,type="l", ylab="Energy sub metering", xlab="")
lines(pdata$Time, pdata$Sub_metering_2, col="red")
lines(pdata$Time, pdata$Sub_metering_3, col="blue")

#Adding legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1), col=c("black","red", "blue"))

#Writing to png file
dev.off()

#Language settings
Sys.setlocale("LC_TIME",local_origin)
