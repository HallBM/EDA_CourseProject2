NEI = readRDS("./Data/summarySCC_PM25.rds")
SCC = readRDS("./Data/Source_Classification_Code.rds")

code = SCC$SCC[grep("veh",SCC$SCC.Level.Two, ignore.case = TRUE)]

p1 = aggregate(Emissions ~ year, NEI[NEI$fips == "24510" & NEI$SCC %in% code,c("Emissions","year")], sum, na.rm=TRUE)
p2 = aggregate(Emissions ~ year, NEI[NEI$fips == "06037" & NEI$SCC %in% code,c("Emissions","year")], sum, na.rm=TRUE)

p1[,3] = (p1[,2]-p1[1,2])/p1[1,2]*100
p2[,3] = (p2[,2]-p2[1,2])/p2[1,2]*100
colnames(p1)[3] = "PercentEmissionsChange"
colnames(p2)[3] = "PercentEmissionsChange"


plot(p1$year, p1$PercentEmissionsChange,
     xlab = "Year",
     ylab = "Change in Total PM2.5 Emissions (%)",
     main = "% Change in Total Motor Vehicle Combustion \n PM2.5 Emissions Since 1999",
     pch = 0,
     col = "red",
     ylim = range(-80:80))      
abline(lm(PercentEmissionsChange~year, data = p1), col = "red")
points(p2$year, p2$PercentEmissionsChange,
     pch = 1,
     col = "blue")
abline(lm(PercentEmissionsChange~year, data = p2), col = "blue")
abline(h=0,col="black",lty=2)
legend("topright", legend = c("Baltimore City, MD", "Los Angeles County, CA"),
       col=c("red", "blue"), lty = 1, cex=0.8, y.intersp = 1)


dev.copy(png,"plot6.png")
dev.off()
