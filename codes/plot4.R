# set your working directory (change according to your need)
setwd('C:/Users/Compaq/Desktop/Courseera/datasciencecoursera/ExData_Plotting1')


#  Check whether plots directory exist or not. If not , then create one
if (!file.exists('plots')) {
  dir.create('plots')
}

# load the cleansed data
source('codes/Getting_And_Cleaning_Data.R')

# open device
png(filename='plots/plot4.png',width=480,height=480,units='px')


# make 4 plots
par(mfrow=c(2,2))

# plot data on top left (1,1)
plot(household.power.consumption$DateTime,household.power.consumption$GlobalActivePower,ylab='Global Active Power',xlab='',type='l')

# plot data on top right (1,2)
plot(household.power.consumption$DateTime,household.power.consumption$Voltage,xlab='datetime',ylab='Voltage',type='l')

# plot data on bottom left (2,1)
lncol<-c('black','red','blue')
lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(household.power.consumption$DateTime,household.power.consumption$SubMetering1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering')
lines(household.power.consumption$DateTime,household.power.consumption$SubMetering2,col=lncol[2])
lines(household.power.consumption$DateTime,household.power.consumption$SubMetering3,col=lncol[3])

# plot data on bottom right (2,2)
plot(household.power.consumption$DateTime,household.power.consumption$GlobalReactivePower,xlab='datetime',ylab='Global_reactive_power',type='l')



# Turn off device
x<-dev.off()

