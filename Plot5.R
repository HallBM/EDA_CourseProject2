NEI = readRDS("./Data/summarySCC_PM25.rds")
SCC = readRDS("./Data/Source_Classification_Code.rds")

code = SCC$SCC[grep("veh",SCC$SCC.Level.Two, ignore.case = TRUE)]

p1 = aggregate(Emissions ~ year, NEI[NEI$fips == "24510" & NEI$SCC %in% code,c("Emissions","year")], sum, na.rm=TRUE)

plot(p1$year, p1$Emissions,
     xlab = "Year",
     ylab = "Total PM2.5 Emissions (Tons)",
     main = "Total Motor Vehicle Combustion PM2.5 Emissions \n per Year in Baltimore City, MD",
     pch = 12)
abline(lm(Emissions~year, data = p1), col = "red")

dev.copy(png,"plot5.png")
dev.off()
