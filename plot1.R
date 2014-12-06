plot1<-function(){
  require(sqldf)
  HP<-read.csv.sql("household_power_consumption.txt", header=TRUE, sep=";", sql="select * from file where Date='1/2/2007' or Date='2/2/2007'")
  png(filename="plot1.png",width=480,height=480,units="px")
  hist(HP$Global_active_power,col="#FF2500",xlab="Global Active Power (Kilowatts)",main="Global Active Power")
  dev.off()
}

