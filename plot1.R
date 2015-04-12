#plot1.R - generates plot 1 of EDA course project 1
#by Felipe Marin

#read data
elec_cons <- read.csv('household_power_consumption.txt',sep=';')

#select relevant dates
dates_used = (elec_cons$Date=='1/2/2007') | (elec_cons$Date=='2/2/2007')

#open device
png(file='plot1.png')

#draw plot
#axis.Date(1,x)
hist(as.numeric(as.character(elec_cons$Global_active_power[dates_used])),xlab='Global Active Power (kilowatts)',main='Global Active Power',col='red',xlim=c(0,6))

#close device
dev.off()



