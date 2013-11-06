setwd("~/GitHub/Hurricane/Data")

df = read.csv("HurricaneByYear.csv")

fitPoissonAll = glm(Num ~ 1, family = poisson, data = df)
summary(fitPoissonAll)

lambda = fitPoissonAll$coefficients[1]
exp(lambda)

mean(df$Num)

plot(df$Year, df$Num, pch=19)
abline(exp(lambda), 0)

ltAvg = ifelse(df$Num < exp(lambda), "blue", "red")
summary(ltAvg)
table(ltAvg)
plot(df$Year, df$Num, pch=19, col = ltAvg)
abline(exp(lambda), 0)

df$Decade = trunc(df$Year / 10)
df$Decade = df$Decade - min(df$Decade)

summary(df$Decade)

fitPoissonByDecade = glm(Num ~ 1 + Decade, family = poisson, data = df)
summary(fitPoissonByDecade)

df$DecadePredict = exp(predict(fitPoissonByDecade))

plot(df$Year, df$Num, pch = 19)
lines(df$Year, df$DecadePredict, type = "s")

ltAvg = ifelse(df$Num < df$DecadePredict, "blue", "red")
plot(df$Year, df$Num, pch=19, col = ltAvg)
lines(df$Year, df$DecadePredict, type = "s")
