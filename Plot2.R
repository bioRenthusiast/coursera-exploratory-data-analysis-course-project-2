
###Please make sure you have files downloaded to the working directory!


SCC <- readRDS("~/Dropbox/coursera/ExploratoryDataAnalysis/Source_Classification_Code.rds")
NEI <- readRDS("~/Dropbox/coursera/ExploratoryDataAnalysis/summarySCC_PM25.rds")

subsetNEI  <- NEI[NEI$fips=="24510", ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))

