NEI = readRDS("./Data/summarySCC_PM25.rds")
SCC = readRDS("./Data/Source_Classification_Code.rds")

coal = grep("coal", SCC$Short.Name, ignore.case=TRUE)
combustion = grep("comb", SCC$Short.Name, ignore.case=TRUE)
combined_index = intersect(coal,combustion)
combined_codes = SCC$SCC[combined_index]

p1 = aggregate(Emissions ~ year, NEI[NEI$SCC %in% combined_codes,c("Emissions","year")], sum, na.rm=TRUE)

plot(p1$year, p1$Emissions/1000,
     xlab = "Year",
     ylab = "Total PM2.5 Emissions (x10^3 Tons)",
     main = "Total Coal Combusion PM2.5 Emissions \n per Year across the US",
     pch = 12)
abline(lm(Emissions/1000~year, data = p1), col = "red")

dev.copy(png,"plot4.png")
dev.off()
