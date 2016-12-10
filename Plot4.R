plot4 <- function() { 
    ## Read EPA data:
    dfPM25 <- readRDS("summarySCC_PM25.rds")
    dfSCC <- readRDS("Source_Classification_Code.rds")
    
    # Get coal combustion related data
    combustionData <- grepl("comb", dfSCC$SCC.Level.One, ignore.case=TRUE)
    coalData <- grepl("coal", dfSCC$SCC.Level.Four, ignore.case=TRUE) 
    coalcomb <- (combustionData & coalData)
    coalcombSCC <- dfSCC[coalcomb,]$SCC
    coalcombPM25 <- dfPM25[dfPM25$SCC %in% coalcombSCC,]

    library(ggplot2)
    
    ## Set option to display Y axis better:
    opt <- options()
    opt$scipen = 20
    options(opt)
    
    black.8.text <- element_text(size = 8)
    
    pm25plot <- ggplot(coalcombPM25, aes(x=factor(year), y=Emissions, fill=type))
    pm25plot <- pm25plot + geom_bar(stat="identity")    
    pm25plot <- pm25plot + labs(x="Year", y="Total PM2.5 Emission (Tons)")
    pm25plot <- pm25plot + labs(title="PM2.5 Emissions from coal combustion sources from 1999–2008")
    pm25plot <- pm25plot + theme(title = black.8.text) 
    pm25plot <- pm25plot + theme(legend.position="none")
    
    print(pm25plot)
    
    dev.copy(png, file="plot4.png")
    dev.off()
}