library("dplyr")
#Read data
epc<-read.table("household_power_consumption.txt",header = TRUE ,sep=";")
epc_m<-mutate(epc,Date_p = as.Date(as.character(epc$Date),"%d/%m/%Y"))
#Subset data
epc_sub_1<- epc_m [epc_m$Date_p=="2007-02-01",]
epc_sub_2<- epc_m [epc_m$Date_p=="2007-02-02",]
epc_sub<- rbind(epc_sub_1,epc_sub_2)
#Plot1
png(filename = "plot1.png", width = 480, height = 480)
hist(as.numeric(as.character(epc_sub$Global_active_power)),col="red",xlab="Global Active Power (kilowatts)",main = "Global Active Power")
dev.off()
