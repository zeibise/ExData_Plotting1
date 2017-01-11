plot3 <- function(){
  #Read the data into a datatable
  a<-read.table("household_power_consumption.txt",header=T,sep=";")
  #Data manipulation
  #format the time and date
  a$Date<-as.Date(a$Date, format="%d/%m/%Y")
  a$Time<-strptime(paste(a$Time,a$Date), format="%T %Y-%m-%d")
  #select the rows that have date Feb 1 - 2 2007.
  c <- subset(a,  Date > "2007-01-31" & Date < "2007-02-03")
  #force numeric values
  c$Sub_metering_1<-as.numeric(as.character(c$Sub_metering_1))
  c$Sub_metering_2<-as.numeric(as.character(c$Sub_metering_2))
  c$Sub_metering_3<-as.numeric(as.character(c$Sub_metering_3))
  png(filename="plot3.png",width = 480, height = 480,bg = "transparent")
  plot(c$Time,c$Sub_metering_1,type="l", ylim=c(0,40), yaxp=c(0,30,3), xlab=" ", ylab="Energy sub metering")
  lines(c$Time,c$Sub_metering_2,type="l", col="red")
  lines(c$Time,c$Sub_metering_3,type="l", col="blue")
  legend("topright", lty = 1, col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  dev.off()
}