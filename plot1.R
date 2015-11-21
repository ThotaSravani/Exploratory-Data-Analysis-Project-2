## Load the NEI & SCC data frames

  NEI <- readRDS("E:/Projects/Exploratory-Data-Analysis-Project-2/Exploratory-Data-Analysis-Project-2/exdata-data-NEI_data/summarySCC_PM25.rds")
  SCC <- readRDS("E:/Projects/Exploratory-Data-Analysis-Project-2/Exploratory-Data-Analysis-Project-2/exdata-data-NEI_data/Source_Classification_Code.rds")

## Aggregate by sum of the total emissions by year 
  aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI, sum)
  
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.


png("plot1.png",width=480,height = 480,units="px")

barplot(
  (aggregatedTotalByYear$Emissions)/10^6,
  names.arg=aggregatedTotalByYear$year,
  xlab="years", 
  ylab=expression('PM'[2.5]*' Emission'),main=expression('Total PM'[2.5]*' Emission From All US Sources'))

## Saving to file
dev.off()
