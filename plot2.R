plot2<-function(){
  require(sqldf)
  HP<-read.csv.sql("household_power_consumption.txt", header=TRUE, sep=";", sql="select * from file where Date='1/2/2007' or Date='2/2/2007'")
  time <- paste(HP$Date, HP$Time)
  HP$Time <- strptime(time, "%d/%m/%Y %H:%M:%S")
  png(filename="plot2.png",width=480,height=480,units="px")
  plot(HP$Time, HP$Global_active_power,type="l",ylab="Global Active Power(kilowatts)")
  dev.off() 
}