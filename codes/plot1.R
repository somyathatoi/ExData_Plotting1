# set your working directory (change according to your need)
setwd('C:/Users/Compaq/Desktop/Courseera/datasciencecoursera/ExData_Plotting1')


#  Check whether plots directory exist or not. If not , then create one
if (!file.exists('plots')) {
  dir.create('plots')
}

# load the cleansed data
source('codes/Getting_And_Cleaning_Data.R')

# open the device
png(filename='plots/plot1.png',width=480,height=480,units='px')

# plot data
hist(household.power.consumption$GlobalActivePower,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')

# Turn off device
x<-dev.off()

