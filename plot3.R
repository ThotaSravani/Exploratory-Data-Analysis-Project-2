## Load the NEI & SCC data frames

NEI <- readRDS("E:/Projects/Exploratory-Data-Analysis-Project-2/Exploratory-Data-Analysis-Project-2/exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("E:/Projects/Exploratory-Data-Analysis-Project-2/Exploratory-Data-Analysis-Project-2/exdata-data-NEI_data/Source_Classification_Code.rds")

library(ggplot2)

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999 2008 for Baltimore City? 
# Which have seen increases in emissions from 1999 2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

## subset NET data by Baltimore  fip
subsetNEI  <- NEI[NEI$fips=="24510", ]

## Aggregate using sum of the Baltimore emissions data by year
aggregatedTotalByYearAndType <- aggregate(Emissions ~ year + type, subsetNEI, sum)

png("plot3.png",width=580,height=580,units="px")


ggplot(subsetNEI,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year",
  y=expression("Total PM"[2.5]*" Emission (Tons)"))+ 
  labs(title=expression("Total Emissions in  Baltimore City,Maryland from 1999-2008 by Source Type"))

## Saving to file
dev.off()
