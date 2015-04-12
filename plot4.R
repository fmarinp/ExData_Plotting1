#plot4.R - generates plot 4 of EDA course project 1
#by Felipe Marin

#read data
elec_cons <- read.csv2('household_power_consumption.txt')#,sep=";")

#select relevant dates
dates_used = (elec_cons$Date=='1/2/2007') | (elec_cons$Date=='2/2/2007')

#get date and time in datetime format
time_string <- paste(elec_cons$Date[dates_used], elec_cons$Time[dates_used])
time_dtformat <- strptime(time_string, format='%d/%m/%Y %H:%M:%S')


#Global Active Power in numeric form
GA_power = as.numeric(as.character(elec_cons$Global_active_power[dates_used]))


#Global Rective Power in numeric form
GR_power = as.numeric(as.character(elec_cons$Global_reactive_power[dates_used]))


#voltage
Volt_used = as.numeric(as.character(elec_cons$Voltage[dates_used]))

#sub metering readings in numeric form
SM1 = as.numeric(as.character(elec_cons$Sub_metering_1[dates_used]))
SM2 = as.numeric(as.character(elec_cons$Sub_metering_2[dates_used]))
SM3 = as.numeric(as.character(elec_cons$Sub_metering_3[dates_used]))


#open device
png(file='plot4.png')

#make plots
par(mfrow=c(2,2))
plot(time_dtformat,GA_power,type='l',ylab='Global Active Power (kilowatts)',xlab='')

plot(time_dtformat,Volt_used,type='l',ylab='Voltage',xlab='datetime')

plot(time_dtformat,SM1,type='l',xlab='',ylab='Energy sub metering')
lines(time_dtformat,SM2,col='red')
lines(time_dtformat,SM3,col='blue')
legend("topright",lty=c(1,1),col=c('black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

plot(time_dtformat,GR_power,type='l',xlab='datetime')

#close device
dev.off()






