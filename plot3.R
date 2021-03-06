#################### Load data ############################################################
file="household_power_consumption.txt"
df <- read.csv2(file, sep=";",header=TRUE, fill=TRUE, na.strings='?')

dfd <- df[as.Date(df$Date,'%d/%m/%Y')=='2007-02-01' | as.Date(df$Date,'%d/%m/%Y')=='2007-02-02',]
dfd$DateTime <- strptime(paste(dfd$Date,dfd$Time), "%d/%m/%Y %H:%M:%S")
############################ Plot 3 ####################################################
png(filename = "plot3.png",width = 480, height = 480)
with (dfd, {
  plot(DateTime,as.numeric(as.character(Sub_metering_1))
       ,ylab="Energy sub metering",xlab="",type="n")
  
  lines(DateTime,as.numeric(as.character(Sub_metering_1)),col="black")          
  lines(DateTime,as.numeric(as.character(Sub_metering_2)),col="red")          
  lines(DateTime,as.numeric(as.character(Sub_metering_3)),col="blue")
  legend("topright",lty=1,col=c("black","red","blue")
         ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})
dev.off()