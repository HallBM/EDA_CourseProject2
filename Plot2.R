NEI = readRDS("./Data/summarySCC_PM25.rds")

p1 = aggregate(Emissions ~ year, NEI[NEI$fips == "24510",c("Emissions","year")], sum, na.rm=TRUE)

plot(p1$year, p1$Emissions,
     xlab = "Year",
     ylab = "Total PM2.5 Emissions (Tons)",
     main = "Total PM2.5 Emissions per Year from \n Baltimore, MD",
     pch = 12)
abline(lm(Emissions~year, data = p1), col = "red")

dev.copy(png,"plot2.png")
dev.off()
