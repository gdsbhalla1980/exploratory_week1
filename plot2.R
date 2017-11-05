library("dplyr")
#Read data
epc<-read.table("household_power_consumption.txt",header = TRUE ,sep=";")
epc_sub<-mutate(epc_sub,Date_p = as.Date(as.character(epc$Date),"%d/%m/%Y"))
#Subset data
epc_sub_1<- epc_m [epc_m$Date_p=="2007-02-01",]
epc_sub_2<- epc_m [epc_m$Date_p=="2007-02-02",]
epc_sub<- rbind(epc_sub_1,epc_sub_2)
#Generate Date_Time column
date_time <- paste(as.character(epc_sub$Date), as.character(epc_sub$Time))
date_time_comb <- strptime(date_time, "%d/%m/%Y %H:%M:%S")
epc_sub<-mutate(epc_sub,date_time = as.POSIXct(date_time_comb))
#Plot2
png(filename = "plot2.png", width = 480, height = 480)
plot(epc_sub$date_time,as.numeric(as.character(epc_sub$Global_active_power)),type="l",ylab="Global Active Power (kilowatts)",xlab = "" )
dev.off()
