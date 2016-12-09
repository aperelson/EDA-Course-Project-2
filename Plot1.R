plot1 <- function() { 
    ## Read EPA data:
    NEI <- readRDS("summarySCC_PM25.rds")
    
    ## Convert to data.table for easier manipulation:
    library(data.table)

    dtNEI <- data.table(NEI)
    sumNEI <- dtNEI[,list(sum=sum(Emissions)),by=year]
    
    ## Set option to display Y axis better:
    opt <- options()
    opt$scipen = 20
    options(opt)
    
    ## Create histogram:
    barplot((sumNEI$sum)/10^6, 
            names.arg=sumNEI$year, 
            col="wheat", 
            main="Total pm2.5 emission from all sources",
            xlab="Year", 
            ylab="Total pm2.5 (10^6 tons)")
    
    dev.copy(png, file="plot1.png")
    dev.off()
}
