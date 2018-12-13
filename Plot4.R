
###Please make sure you have files downloaded to the working directory!


SCC <- readRDS("~/Dropbox/coursera/ExploratoryDataAnalysis/Source_Classification_Code.rds")
NEI <- readRDS("~/Dropbox/coursera/ExploratoryDataAnalysis/summarySCC_PM25.rds")

library(ggplot2)
NEISCC <- merge(NEI, SCC, by="SCC")


# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

# fetch all NEIxSCC records with Short.Name (SCC) Coal
coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subsetNEISCC <- NEISCC[coalMatches, ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEISCC, sum)


ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))+ geom_bar(stat="identity") +
    xlab("year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total Emissions from coal sources from 1999 to 2008')+
    theme_classic()
