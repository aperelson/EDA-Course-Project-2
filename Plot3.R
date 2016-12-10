plot3 <- function() { 
    ## Read EPA data:
    dfPM25 <- readRDS("summarySCC_PM25.rds")
    
    library(ggplot2)

    dfPM25Baltimore <- dfPM25[which(dfPM25$fips=='24510'),]

    black.7.text <- element_text(size = 7)
    black.8.text <- element_text(size = 8)
    
    pm25plot <- ggplot(dfPM25Baltimore, aes(x=factor(year), y=Emissions, fill=type))
    pm25plot <- pm25plot + geom_bar(stat="identity") + facet_grid(. ~ type, scales="free", space="free")    
    pm25plot <- pm25plot + labs(x="Year", y="Total PM2.5 Emission (Tons)")
    pm25plot <- pm25plot + labs(title="PM2.5 Emissions for Baltimore City 1999-2008 by Source Type")
    pm25plot <- pm25plot + theme(axis.text.x = black.7.text) + theme(title = black.8.text) 
    pm25plot <- pm25plot + theme(legend.position="none")
    
    print(pm25plot)
    
    dev.copy(png, file="plot3.png")
    dev.off()
}