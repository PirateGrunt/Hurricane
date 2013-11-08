Gather hurricane data
=====
Data on hurricanes has been taken from the National Oceanic and Atmospheric Association, a branch of the US government.

This code chunk will fetch the data and write it to csv.

```r
url = "ftp://eclipse.ncdc.noaa.gov/pub/ibtracs/v03r04/wmo/csv/basin/Basin.NA.ibtracs_wmo.v03r04.csv"

setwd("~/GitHub/Hurricane/Data/")
filename = "Basin.NA.ibtracs_wmo.v03r04.csv"

download.file(url, destfile = filename)

setwd("~/GitHub/Hurricane/")

print(paste("Data was accessed on:", Sys.time()))
```

```
## [1] "Data was accessed on: 2013-11-08 08:53:47"
```

