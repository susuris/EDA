# data upload
data<-read.table("D:/R/household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)
data$Date <-as.Date(data$Date, "%d/%m/%Y")
data<-subset(data, Date == "2007-02-01" | Date == "2007-02-02")

getwd()
setwd("C:/Users/Liga/Exploratory_Data_Analysis")

Sys.setlocale("LC_TIME","C")

# plot 4

x<-seq(as.POSIXct("2007-02-01 00:00:00"),by="min",length.out=24*2*60)
y1<-as.numeric(data$Global_active_power)
y2<-as.numeric(data$Voltage)
y3<-as.numeric(data$Sub_metering_1)
y4<-as.numeric(data$Sub_metering_2)
y5<-as.numeric(data$Sub_metering_3)
y6<-as.numeric(data$Global_reactive_power)

png('plot4.png', width = 480, height = 480)
par(mfrow=c(2,2))

plot(x,y1,type = "l", ylab="Global Active Power", xlab="")

plot(x, y2, type = "l", ylab="Voltage", xlab="datetime")

plot(x,y3,type = "l", ylab="Energy sub metering", xlab="")
lines(x,y4,type = "l", col = "red")
lines(x,y5,type = "l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue"),bty="n")

plot(x, y6, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()