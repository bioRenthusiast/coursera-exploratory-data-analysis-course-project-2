
###Please make sure you have files downloaded to the working directory!


SCC <- readRDS("~/Dropbox/coursera/ExploratoryDataAnalysis/Source_Classification_Code.rds")
NEI <- readRDS("~/Dropbox/coursera/ExploratoryDataAnalysis/summarySCC_PM25.rds")

NEISCC <- merge(NEI, SCC, by="SCC")

library(ggplot2)

# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
# vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

# 24510 is Baltimore, see plot2.R, 06037 is LA CA
# Searching for ON-ROAD type in NEI
# Don't actually know it this is the intention, but searching for 'motor' in SCC only gave a subset (non-cars)
subsetNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

aggregatedTotalByYearAndFips <- aggregate(Emissions ~ year + fips, subsetNEI, sum)
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="24510"] <- "Baltimore, MD"
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="06037"] <- "Los Angeles, CA"

ggplot(aggregatedTotalByYearAndFips, aes(factor(year), Emissions))+ facet_grid(. ~ fips)+ geom_bar(stat="identity")  +
    xlab("year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total Emissions from motor vehicle (type=ON-ROAD) in Baltimore City, MD (fips = "24510") vs Los Angeles, CA (fips = "06037")  1999-2008')+
    theme_classic()
