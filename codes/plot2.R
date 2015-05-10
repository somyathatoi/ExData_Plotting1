# set your working directory (change according to your need)
setwd('C:/Users/Compaq/Desktop/Courseera/datasciencecoursera/ExData_Plotting1')


#  Check whether plots directory exist or not. If not , then create one
if (!file.exists('plots')) {
  dir.create('plots')
}

# load the cleansed data
source('codes/Getting_And_Cleaning_Data.R')

# open device
png(filename='plots/plot2.png',width=480,height=480,units='px')

# plot data
plot(household.power.consumption$DateTime,household.power.consumption$GlobalActivePower,ylab='Global Active Power (kilowatts)', xlab='', type='l')



# Turn off device
x<-dev.off()

