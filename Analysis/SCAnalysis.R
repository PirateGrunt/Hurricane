library(maps)
library(maptools)
map("state")
setwd("~/GitHub/Hurricane/Data")
df = read.csv("Hurricanes.csv")

dfKatrina = df[df$Name == "KATRINA", ]
dfKatrina = dfKatrina[dfKatrina$Year == max(dfKatrina$Year), ]

points(dfKatrina$Longitude, dfKatrina$Latitude, pch=19)
typeof(dfKatrina$Latitude)

dfHugo = df[df$Name == "HUGO", ]
dfHugo = dfHugo[dfHugo$Year == max(dfHugo$Year), ]
map("state")
points(dfHugo$Longitude, dfHugo$Latitude, pch = 19)

dfDonna = df[df$Name == "DONNA", ]
dfDonna = dfDonna[dfDonna$Year == max(dfDonna$Year), ]
map("state")
points(dfDonna$Longitude, dfDonna$Latitude, pch = 19)

library(ggplot2)

myMapData = map_data("state")

sc = myMapData[myMapData$region == "south carolina", ]

plot(sc$long, sc$lat, pch=19)
plot(sc$long, sc$lat, pch=19, type = "l")
plot(sc$long, sc$lat, pch=19, type = "l")
points(dfHugo$Longitude, dfHugo$Latitude, pch = 19)

library(sp)
inSC = point.in.polygon(dfHugo$Longitude, dfHugo$Latitude, sc$long, sc$lat)

map("state")
colHugo = ifelse(inSC == 1, "red", "black")
points(dfHugo$Longitude, dfHugo$Latitude, pch = 19, col = colHugo)

