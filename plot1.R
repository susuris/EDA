# data upload
data<-read.table("D:/R/household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)
data$Date <-as.Date(data$Date, "%d/%m/%Y")
data<-subset(data, Date == "2007-02-01" | Date == "2007-02-02")

getwd()
setwd("C:/Users/Liga/Exploratory_Data_Analysis")

Sys.setlocale("LC_TIME","C")

# plot 1
png('plot1.png', width = 480, height = 480)
hist(as.numeric(data$Global_active_power), breaks = 15, col="red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()