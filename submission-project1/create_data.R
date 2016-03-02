#Script to create a csv file containing the data for the project

#1st-Step : Getting the data (assuming data file is named household_power_comsuption.txt & is in R workdirectory)
read.csv("household_power_consumption.txt",header=TRUE,sep=";", colClasses="character", na.strings="?")->data_frame

##subsetting the data beteween 1st & 2nd of Feb. 2007 in pdata for project data
data_frame[(data_frame$Date =="1/2/2007" | data_frame$Date =="2/2/2007") ,] -> pdata


##parsing column format
as.Date(pdata$Date,"%d/%m/%Y")->pdata$Date
strptime(paste(pdata$Date, pdata$Time), format="%Y-%m-%d %H:%M:%S")->pdata$Time
lapply(pdata[3:9],as.numeric)->pdata[3:9]

#2nd-Step : Writing the data for the project to project-data.csv
write.csv(x=pdata,file="project-data.csv",row.names=FALSE)
