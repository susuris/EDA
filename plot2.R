# data upload
data<-read.table("D:/R/household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)
data$Date <-as.Date(data$Date, "%d/%m/%Y")
data<-subset(data, Date == "2007-02-01" | Date == "2007-02-02")

getwd()
setwd("C:/Users/Liga/Exploratory_Data_Analysis")

Sys.setlocale("LC_TIME","C")

# plot2
x<-seq(as.POSIXct("2007-02-01 00:00:00"),by="min",length.out=24*2*60)
y<-as.numeric(data$Global_active_power)

png('plot2.png', width = 480, height = 480)
plot(x,y,type = "l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()