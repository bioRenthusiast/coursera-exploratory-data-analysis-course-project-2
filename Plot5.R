
###Please make sure you have files downloaded to the working directory!


SCC <- readRDS("~/Dropbox/coursera/ExploratoryDataAnalysis/Source_Classification_Code.rds")
NEI <- readRDS("~/Dropbox/coursera/ExploratoryDataAnalysis/summarySCC_PM25.rds")

NEISCC <- merge(NEI, SCC, by="SCC")

library(ggplot2)

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# 24510 is Baltimore, see plot2.R
# Searching for ON-ROAD type in NEI
# Don't actually know it this is the intention, but searching for 'motor' in SCC only gave a subset (non-cars)
subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)



ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))+ geom_bar(stat="identity") +
    xlab("year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, Maryland (fips = "24510") from 1999 to 2008')+
    theme_classic()
