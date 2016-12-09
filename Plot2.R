plot2 <- function() { 
    ## Read EPA data:
    NEI <- readRDS("summarySCC_PM25.rds")
    
    ## Convert to data.table for easier manipulation:
    library(data.table)
    
    dtNEI <- data.table(NEI)
    dtNEIBaltimore <- subset(dtNEI, fips == "24510")
    sumNEIBaltimore <- dtNEIBaltimore[,list(sum=sum(Emissions)),by=year]
    
    ## Set option to display Y axis better:
    opt <- options()
    opt$scipen = 20
    options(opt)
    
    ## Create histogram:
    barplot((sumNEIBaltimore$sum)/10^3, 
            names.arg=sumNEIBaltimore$year, 
            col="tomato", 
            main="Total pm2.5 emission for Baltimore City, Maryland",
            xlab="Year", 
            ylab="Total pm2.5 (10^3 tons)")
    
    dev.copy(png, file="plot2.png")
    dev.off()
}
