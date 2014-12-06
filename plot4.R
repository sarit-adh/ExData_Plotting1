plot4<-function(){
  require(sqldf)
  HP<-read.csv.sql("household_power_consumption.txt", header=TRUE, sep=";", sql="select * from file where Date='1/2/2007' or Date='2/2/2007'")
  time <- paste(HP$Date, HP$Time)
  HP$Time <- strptime(time, "%d/%m/%Y %H:%M:%S")
  png(filename="plot4.png",width=480,height=480,units="px")
  
  par(mfrow=c(2,2))  
  plot(HP$Time, HP$Global_active_power,type="l",ylab="Global Active Power(kilowatts)")
  
  plot(HP$Time, HP$Voltage,type="l",ylab="Voltage",xlab="datetime")
  
  plot(HP$Time, HP$Sub_metering_1,type="l",col="black",ylab="Energy Sub Metering")
  points(HP$Time, HP$Sub_metering_2,type="l",col="red")
  points(HP$Time, HP$Sub_metering_3,type="l",col="blue")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),fill=c("black","red","blue"))
  
  plot(HP$Time, HP$Global_reactive_power,type="l",ylab="Global Reactive Power",xlab="datetime")
  
  dev.off()
  
}