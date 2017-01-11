plot1 <- function(){
  #Read the data into a data table a
  a<-read.table("household_power_consumption.txt",header=T,sep=";")
  #Data manipulation
  a$Date<-as.Date(a$Date, format="%d/%m/%Y")
  #select the desired rows from the data table
  c <- subset(a,  Date > "2007-01-31" & Date < "2007-02-03")
  #force numeric values
  c$Global_active_power<-as.numeric(as.character(c$Global_active_power))
  #The first plot
  png(filename="plot1.png",width = 480, height = 480,bg = "transparent")
  hist(c$Global_active_power, col = "Red", xlab = "Global Active Power (kilowatts)", ylab="Frequency", main = "Global Active Power")  
  dev.off()
}