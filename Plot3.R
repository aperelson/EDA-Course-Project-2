plot3 <- function() { 
    ## Read EPA data:
    dfNEI <- readRDS("summarySCC_PM25.rds")
    
    library(ggplot2)

    dfNEIBaltimore <- dfNEI[which(NEI$fips=='24510'),]

    black.7.text <- element_text(size = 7)
    black.8.text <- element_text(size = 8)
    
    neiplot <- ggplot(dfNEIBaltimore, aes(x=factor(year), y=Emissions, fill=type))
    neiplot <- neiplot + geom_bar(stat="identity") + facet_grid(. ~ type, scales="free", space="free")    
    neiplot <- neiplot + labs(x="Year", y="Total PM2.5 Emission (Tons)")
    neiplot <- neiplot + labs(title="PM2.5 Emissions for Baltimore City 1999-2008 by Source Type")
    neiplot <- neiplot + theme(axis.text.x = black.7.text) + theme(title = black.8.text) 
    neiplot <- neiplot + theme(legend.position="none")
    
    print(neiplot)
    
    dev.copy(png, file="plot3.png")
    dev.off()
}