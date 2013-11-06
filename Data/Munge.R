# Exploratory analysis and munging

filename = "Hurricanes.csv"

setwd("~/GitHub/Hurricane/Data/")

df = read.csv(filename, skip=1)

head(df)

names(df)

df = df[-1, ]

head(df)

summary(df)

sapply(df, typeof)

library(plyr)

df$Season = as.integer(df$Season)

df = rename(df, replace = c("Season" = "Year"))

names(df)

write.csv(df, file = "Hurricanes.csv")

dfYear = unique(df[,c("Year", "Num")])

summary(dfYear)
sapply(dfYear, typeof)

dfYear = unique(df[,c("Year", "Name", "Num")])

table(dfYear)

dfYear = aggregate(dfYear, by = list(dfYear$Year), length)
colnames(dfYear)[1] = "Year"
dfYear = dfYear[,-2]

setwd("~/GitHub/Hurricane/Data")

write.csv(dfYear, "HurricaneByYear.csv")
