plot2 <- function() { 
    ## Read EPA data:
    dfPM25 <- readRDS("summarySCC_PM25.rds")
    
    ## Convert to data.table for easier manipulation:
    library(data.table)
    
    dtPM25 <- data.table(dfPM25)
    dtPM25Baltimore <- subset(dtPM25, fips == "24510")
    sumPM25Baltimore <- dtPM25Baltimore[,list(sum=sum(Emissions)),by=year]
    
    ## Set option to display Y axis better:
    opt <- options()
    opt$scipen = 20
    options(opt)
    
    ## Create histogram:
    barplot((sumPM25Baltimore$sum)/10^3, 
            names.arg=sumPM25Baltimore$year, 
            col="tomato", 
            main="Total pm2.5 emission for Baltimore City, Maryland",
            xlab="Year", 
            ylab="Total pm2.5 (10^3 tons)")
    
    dev.copy(png, file="plot2.png")
    dev.off()
}
