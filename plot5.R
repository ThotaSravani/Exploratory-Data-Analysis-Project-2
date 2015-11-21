## Load the NEI & SCC data frames

NEI <- readRDS("E:/Projects/Exploratory-Data-Analysis-Project-2/Exploratory-Data-Analysis-Project-2/exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("E:/Projects/Exploratory-Data-Analysis-Project-2/Exploratory-Data-Analysis-Project-2/exdata-data-NEI_data/Source_Classification_Code.rds")

library(ggplot2)

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# 24510 is Baltimore, see plot2.R
# Searching for ON-ROAD type in NEI
# Don't actually know it this is the intention, but searching for 'motor' in SCC only gave a subset (non-cars)

subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

## Aggregate
aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

png("plot5.png", width=640, height=480)
ggplot(aggregatedTotalByYear, aes(factor(year), Emissions)) +
geom_bar(stat="identity",width=0.75) + 
  xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from Motor Vehicle in Baltimore City, Maryland  from 1999 to 2008')

## Saving the file
dev.off()