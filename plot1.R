plot1 <- function() {
  setwd("~/R_functions");
  data<-read.csv("household_power_consumption.txt", sep = ";");
  
  date_time<-paste(data$Date, data$Time);
  date_times_p<-strptime(date_time, "%d/%m/%Y %H:%M:%S");
  data<-cbind( data, date_times_p);
  
  
  title("global active power")
  with( subset(data, date_times_p <="2007-02-03" & date_times_p >="2007-02-01"), hist(as.numeric(Global_active_power),
        breaks=14, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)"));

  dev.copy(png, file="plot1.png");
  dev.off();
}
