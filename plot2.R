## Load the NEI & SCC data frames

NEI <- readRDS("E:/Projects/Exploratory-Data-Analysis-Project-2/Exploratory-Data-Analysis-Project-2/exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("E:/Projects/Exploratory-Data-Analysis-Project-2/Exploratory-Data-Analysis-Project-2/exdata-data-NEI_data/Source_Classification_Code.rds")

## Subset NEI data by Baltimore's fip.
baltimoreNEI <- NEI[NEI$fips=="24510",]

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.


## Aggregate using sum the Baltimore emissions data by year
aggTotalsBaltimore <- aggregate(Emissions ~ year, baltimoreNEI,sum)

png("plot2.png",width=480,height=480,units="px")

barplot(height =aggTotalsBaltimore$Emissions,
  names.arg=aggTotalsBaltimore$year,
  xlab="Year",
  ylab=expression ('PM'[2.5]*' Emissions (Tons)'),
  main=expression ('Total PM'[2.5]*' Emission in the Baltimore City,MD'))

## Saving to file 
dev.off()
