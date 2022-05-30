library(ggplot2)

NEI = readRDS("./Data/summarySCC_PM25.rds")

p1 = aggregate(Emissions ~ year + type, NEI[NEI$fips == "24510",c("Emissions","year","type")], sum, na.rm=TRUE)

ggplot(p1, aes(year, Emissions)) +  
    geom_point() +  
    facet_grid(.~type) +
    labs(x = "Year") +
    labs(y = "Total PM2.5 Emissions (Tons)") +
    labs(title = "Total PM2.5 Emissions per Year from \n Baltimore City, MD by Source Type") +
    geom_smooth(method = "lm", se = FALSE, col = "red")
    
    
dev.copy(png,"plot3.png")
dev.off()
