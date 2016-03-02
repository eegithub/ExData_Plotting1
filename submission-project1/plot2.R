#Pre-requisite : create_data.R has been executed => project-data.csv exists in RWork directory

#Language settings
local_origin <- Sys.getlocale( category = "LC_TIME" )
Sys.setlocale("LC_TIME", "C")


#Getting & parsing data
read.csv("project-data.csv",header=TRUE, stringsAsFactors = FALSE)->pdata
as.Date(pdata$Date)->pdata$Date
strptime(pdata$Time, format="%Y-%m-%d %H:%M:%S")->pdata$Time

#Creating 2nd plot
with(pdata, plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (in kilowatts)"))
dev.copy(png,'plot2.png',width = 504, height = 504)
dev.off()

#Language settings
Sys.setlocale("LC_TIME",local_origin)
