plot2 <- function() {
  setwd("~/R_functions");
  data<-read.csv("household_power_consumption.txt", sep = ";");
  
  date_time<-paste(data$Date, data$Time);
  date_times_p<-strptime(date_time, "%d/%m/%Y %H:%M:%S");
  data<-cbind( data, date_times_p);
  
  with( subset(data, date_times_p <="2007-02-03" & date_times_p >="2007-02-01"), plot(date_times_p, as.numeric(as.character(Global_active_power)), 
                                                  type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))

  dev.copy(png, file="plot2.png");
  dev.off();
}
