#Pre-requisite : create_data.R has been executed => project-data.csv exists in RWork directory

#Language settings
local_origin <- Sys.getlocale( category = "LC_TIME" )
Sys.setlocale("LC_TIME", "C")


#Getting & parsing data
read.csv("project-data.csv",header=TRUE, stringsAsFactors = FALSE)->pdata
as.Date(pdata$Date)->pdata$Date
strptime(pdata$Time, format="%Y-%m-%d %H:%M:%S")->pdata$Time

#Creating 4th plot : graph will be written directly to the file, no display in RStudio
png('plot4.png',width = 480, height = 480)
par(mfrow=c(2,2))
# topleft graph
with(pdata, plot(Time, Global_active_power,type="l",xlab="", ylab="Global Active Power"))

# topright graph
with(pdata, plot(Time, Voltage, type="l", xlab="datetime", ylab="Voltage"))

# bottomleft graph
with(pdata,plot(Time, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(pdata,lines(Time, Sub_metering_2, col="red"))
with(pdata, lines(Time, Sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1), col=c("black","red", "blue"), bty="n")

# bottomright graph
with(pdata,plot(Time, Global_reactive_power, type="l",lwd=0.5, xlab="datetime", ylab="Global_reactive_power"))


#Writing to png file
dev.off()

#Language settings
Sys.setlocale("LC_TIME",local_origin)