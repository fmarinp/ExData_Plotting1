#plot2.R - generates plot 2 of EDA course project 1
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

#open device
png(file='plot2.png')

#make plot
#axis.Date(1,x)
plot(time_dtformat,GA_power,type='l',ylab='Global Active Power (kilowatts)',xlab='')


#close device
dev.off()

