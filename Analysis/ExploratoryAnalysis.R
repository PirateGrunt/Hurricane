# Exploratory analysis

filename = "Hurricanes.csv"

setwd("~/GitHub/Hurricane/Data/")

df = read.csv(filename, skip=1)

setwd("~/GitHub/Hurricane/Analysis")

head(df)

names(df)

df = df[-1, ]

head(df)

df$Season = as.numeric(as.character(df$Season))
barplot(df$Season)

unique(df$Nature)

summary(df$Wind.WMO..Percentile)
summary(df$Wind.WMO.)

summary(df$Center)
