# data upload
data<-read.table("D:/R/household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)
data$Date <-as.Date(data$Date, "%d/%m/%Y")
data<-subset(data, Date == "2007-02-01" | Date == "2007-02-02")

getwd()
setwd("C:/Users/Liga/Exploratory_Data_Analysis")

Sys.setlocale("LC_TIME","C")

# plot3

x<-seq(as.POSIXct("2007-02-01 00:00:00"),by="min",length.out=24*2*60)
y1<-as.numeric(data$Sub_metering_1)
y2<-as.numeric(data$Sub_metering_2)
y3<-as.numeric(data$Sub_metering_3)

png('plot3.png', width = 480, height = 480)
plot(x,y1,type = "l", ylab="Energy sub metering", xlab="")
lines(x,y2,type = "l", col = "red")
lines(x,y3,type = "l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue"))
dev.off()