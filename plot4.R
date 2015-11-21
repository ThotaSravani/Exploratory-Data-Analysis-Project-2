## Load the NEI & SCC data frames

NEI <- readRDS("E:/Projects/Exploratory-Data-Analysis-Project-2/Exploratory-Data-Analysis-Project-2/exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("E:/Projects/Exploratory-Data-Analysis-Project-2/Exploratory-Data-Analysis-Project-2/exdata-data-NEI_data/Source_Classification_Code.rds")


library(ggplot2)

# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

## Subset coal combustion related NEI data
combustionRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalCombustion <- (combustionRelated & coalRelated)
combustionSCC <- SCC[coalCombustion,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]

png("plot4.png", width=640, height=480,units="px")

ggplot(combustionNEI,aes(factor(year),Emissions/10^5))+
geom_bar(stat="identity",fill="grey") +
xlab("year")+ ylab(expression('Total PM'[2.5]*" Emissions")) +
ggtitle("Total Emissions Coal Combustion Sources Across US from 1999-2008")

## Saving to file
dev.off()