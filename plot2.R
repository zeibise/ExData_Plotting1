plot2 <- function(){
  #Read the data into a datatable
  a<-read.table("household_power_consumption.txt",header=T,sep=";")
  #Data manipulation
  #format the time and date
  a$Date<-as.Date(a$Date, format="%d/%m/%Y")
  a$Time<-strptime(paste(a$Time,a$Date), format="%T %Y-%m-%d")
  #select the rows that have date Feb 1 - 2 2007.
  c <- subset(a,  Date > "2007-01-31" & Date < "2007-02-03")
  #force numeric values
  c$Global_active_power<-as.numeric(as.character(c$Global_active_power))
  png(filename="plot2.png",width = 480, height = 480,bg = "transparent")
  plot(c$Time,c$Global_active_power, type="l", xlab=" ", ylab="Global Active Power (kilowatts)")
  dev.off()
  