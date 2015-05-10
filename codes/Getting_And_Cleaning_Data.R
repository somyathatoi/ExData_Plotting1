# set your working directory (change according to your need)
setwd('C:/Users/Compaq/Desktop/Courseera/datasciencecoursera/ExData_Plotting1')

# required packages
library(data.table)
library(lubridate)

# Check whether input directory exist or not. If not , then create one  
if (!file.exists('DataSet')) {
  dir.create('DataSet')
}

# check whether the input file exist or not; if not, make it...
if (!file.exists('DataSet/household_power_consumption_2days.txt')) {
  
  # download the zip file and unzip
  file.url<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
  download.file(file.url,destfile='DataSet/household_power_consumption.zip')
  unzip('DataSet/household_power_consumption.zip',exdir='DataSet',overwrite=TRUE)

  # read the raw table and limit to 2 days
  variable.class<-c(rep('character',2),rep('numeric',7))
  household.power.consumption<-read.table('DataSet/household_power_consumption.txt',header=TRUE,
                                sep=';',na.strings='?',colClasses=variable.class)
  household.power.consumption<-household.power.consumption[household.power.consumption$Date=='1/2/2007' | household.power.consumption$Date=='2/2/2007',]

  # clean up the variable names and convert date/time fields
  cols<-c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity',
          'SubMetering1','SubMetering2','SubMetering3')
  colnames(household.power.consumption)<-cols
  household.power.consumption$DateTime<-dmy(household.power.consumption$Date)+hms(household.power.consumption$Time)
  household.power.consumption<-household.power.consumption[,c(10,3:9)]
  
  # write a clean data set to the directory
  write.table(household.power.consumption,file='DataSet/household_power_consumption_2days.txt',sep='|',row.names=FALSE)
} else {
  
  household.power.consumption<-read.table('DataSet/household_power_consumption_2days.txt',header=TRUE,sep='|')
  household.power.consumption$DateTime<-as.POSIXlt(household.power.consumption$DateTime)

}

# remove the large raw data set 
if (file.exists('DataSet/household_power_consumption.txt')) {
  x<-file.remove('DataSet/household_power_consumption.txt')

}

