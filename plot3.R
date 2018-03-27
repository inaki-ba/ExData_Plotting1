plot3 <- function() {
  setwd("~/R_functions");
  data<-read.csv("household_power_consumption.txt", sep = ";");
  
  date_time<-paste(data$Date, data$Time);
  date_times_p<-strptime(date_time, "%d/%m/%Y %H:%M:%S");
  data<-cbind( data, date_times_p);
  
  with( subset(data, date_times_p <="2007-02-03" & date_times_p >="2007-02-01"), plot(date_times_p, as.numeric(as.character(Sub_metering_1)), 
                                                  type="l", xlab = "", ylab = "Energy sub metering"))

  with( subset(data, date_times_p <="2007-02-03" & date_times_p >="2007-02-01"), lines(date_times_p, as.numeric(as.character(Sub_metering_2)), 
                                                                                      type="l", xlab = "", ylab = "Energy sub metering", col="red"))
  
  with( subset(data, date_times_p <="2007-02-03" & date_times_p >="2007-02-01"), lines(date_times_p, as.numeric(as.character(Sub_metering_3)), 
                                                                                      type="l", xlab = "", ylab = "Energy sub metering", col="blue"))
  
  legend("topright", pch="_", col=c("black", "red", "blue"), legend=c("sub_metering_1", "sub_metering_2","sub_metering_3"));
  
  dev.copy(png, file="plot3.png");
  dev.off();
}
