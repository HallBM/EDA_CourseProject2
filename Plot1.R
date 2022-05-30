NEI = readRDS("./Data/summarySCC_PM25.rds")

p1 = aggregate(Emissions~year,NEI,sum,na.rm=TRUE)
  
plot(p1$year, p1$Emissions/1000000,
     xlab = "Year",
     ylab = "Total PM2.5 Emissions (in Million Tons)",
     main = "Total PM2.5 Emissions per Year",
     pch = 12)
abline(lm(Emissions/1000000 ~ year, data = p1), col = "red")

dev.copy(png,"plot1.png")
dev.off()
