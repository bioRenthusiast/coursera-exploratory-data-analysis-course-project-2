
###Please make sure you have files downloaded to the working directory!


SCC <- readRDS("~/Dropbox/coursera/ExploratoryDataAnalysis/Source_Classification_Code.rds")
NEI <- readRDS("~/Dropbox/coursera/ExploratoryDataAnalysis/summarySCC_PM25.rds")


aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI, sum)

barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))


