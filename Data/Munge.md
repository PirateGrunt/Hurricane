Exploratory analysis and munging
====
This file will open the hurricane data gathered previously and make some minor changes. First, we'll open up the file and take a look at the contents.

```r
setwd("~/GitHub/Hurricane/Data/")
filename = "Basin.NA.ibtracs_wmo.v03r04.csv"

df = read.csv(filename, skip = 1)

head(df)
```

```
##      Serial_Num Season Num Basin Sub_basin      Name            ISO_time
## 1           N/A   Year   #    BB        BB       N/A YYYY-MM-DD HH:MM:SS
## 2 1851176N28265   1851  01    NA        MM NOT NAMED 1851-06-25 00:00:00
## 3 1851176N28265   1851  01    NA        MM NOT NAMED 1851-06-25 06:00:00
## 4 1851176N28265   1851  01    NA        MM NOT NAMED 1851-06-25 12:00:00
## 5 1851176N28265   1851  01    NA        MM NOT NAMED 1851-06-25 18:00:00
## 6 1851176N28265   1851  01    NA        MM NOT NAMED 1851-06-25 21:00:00
##   Nature  Latitude Longitude Wind.WMO. Pres.WMO. Center
## 1    N/A deg_north  deg_east        kt        mb    N/A
## 2     TS     28.00    -94.80      80.0       0.0   atcf
## 3     TS     28.00    -95.40      80.0       0.0   atcf
## 4     TS     28.00    -96.00      80.0       0.0   atcf
## 5     TS     28.10    -96.50      80.0       0.0   atcf
## 6     TS     28.20    -96.80      80.0       0.0   atcf
##   Wind.WMO..Percentile Pres.WMO..Percentile Track_type
## 1                    %                    %        N/A
## 2               84.517             -100.000       main
## 3               84.517             -100.000       main
## 4               84.517             -100.000       main
## 5               84.517             -100.000       main
## 6               84.517             -100.000       main
```

```r

names(df)
```

```
##  [1] "Serial_Num"           "Season"               "Num"                 
##  [4] "Basin"                "Sub_basin"            "Name"                
##  [7] "ISO_time"             "Nature"               "Latitude"            
## [10] "Longitude"            "Wind.WMO."            "Pres.WMO."           
## [13] "Center"               "Wind.WMO..Percentile" "Pres.WMO..Percentile"
## [16] "Track_type"
```


Next, we'll remove the first row and change the name of the column "season" to "year".

```r
df = df[-1, ]

head(df)
```

```
##      Serial_Num Season Num Basin Sub_basin      Name            ISO_time
## 2 1851176N28265   1851  01    NA        MM NOT NAMED 1851-06-25 00:00:00
## 3 1851176N28265   1851  01    NA        MM NOT NAMED 1851-06-25 06:00:00
## 4 1851176N28265   1851  01    NA        MM NOT NAMED 1851-06-25 12:00:00
## 5 1851176N28265   1851  01    NA        MM NOT NAMED 1851-06-25 18:00:00
## 6 1851176N28265   1851  01    NA        MM NOT NAMED 1851-06-25 21:00:00
## 7 1851176N28265   1851  01    NA        MM NOT NAMED 1851-06-26 00:00:00
##   Nature Latitude Longitude Wind.WMO. Pres.WMO. Center
## 2     TS    28.00    -94.80      80.0       0.0   atcf
## 3     TS    28.00    -95.40      80.0       0.0   atcf
## 4     TS    28.00    -96.00      80.0       0.0   atcf
## 5     TS    28.10    -96.50      80.0       0.0   atcf
## 6     TS    28.20    -96.80      80.0       0.0   atcf
## 7     TS    28.20    -97.00      70.0       0.0   atcf
##   Wind.WMO..Percentile Pres.WMO..Percentile Track_type
## 2               84.517             -100.000       main
## 3               84.517             -100.000       main
## 4               84.517             -100.000       main
## 5               84.517             -100.000       main
## 6               84.517             -100.000       main
## 7               78.144             -100.000       main
```

```r

summary(df)
```

```
##          Serial_Num        Season           Num        Basin      
##  1899215N12329:  133   2005   :  934   04     : 4516    EP:  215  
##  1971249N26289:  118   1995   :  766   03     : 4446    NA:45246  
##  1969264N16313:   99   1969   :  682   02     : 4308   BB :    0  
##  1926244N14319:   95   1971   :  641   05     : 4237              
##  2004247N10332:   94   2010   :  640   06     : 3554              
##  1988285N09318:   92   1933   :  624   01     : 3550              
##  (Other)      :44830   (Other):41174   (Other):20850              
##  Sub_basin          Name                      ISO_time     Nature     
##   MM:45461   NOT NAMED:21353   1971-09-11 00:00:00:    6    DS:  811  
##  BB :    0   UNNAMED  : 3226   1971-09-11 06:00:00:    6    ET: 3975  
##              FRANCES  :  316   1971-09-11 12:00:00:    6    NR:  372  
##              ARLENE   :  281   1971-09-11 18:00:00:    6    SS:  769  
##              DENNIS   :  253   1971-09-12 00:00:00:    6    TS:39534  
##              FLORENCE :  226   1971-09-12 06:00:00:    6   N/A:    0  
##              (Other)  :19806   (Other)            :45425              
##     Latitude       Longitude       Wind.WMO.       Pres.WMO.    
##   28.00 :  279    -79.00:  175    30.0  : 4970       0.0:29580  
##   18.00 :  275    -65.00:  164    35.0  : 4531    1005.0:  773  
##   21.00 :  275    -75.00:  161    40.0  : 4175    1008.0:  707  
##   27.00 :  263    -68.00:  160    25.0  : 4045    1006.0:  692  
##   29.00 :  261    -73.50:  160    50.0  : 3717    1009.0:  667  
##   33.00 :  259    -84.00:  159    45.0  : 2997    1000.0:  658  
##  (Other):43849   (Other):44482   (Other):21026   (Other):12384  
##   Center      Wind.WMO..Percentile Pres.WMO..Percentile Track_type   
##  atcf:45461     17.062: 4970       -100.000:29580       main :45422  
##  N/A :    0     32.179: 4531         31.620:  773       merge:   33  
##                 42.219: 4175         16.249:  707       N/A  :    0  
##                  4.702: 4045         26.650:  692       split:    6  
##                 57.844: 3717          9.960:  667                    
##                 49.669: 2997         49.967:  658                    
##               (Other) :21026       (Other) :12384
```

```r

sapply(df, typeof)
```

```
##           Serial_Num               Season                  Num 
##            "integer"            "integer"            "integer" 
##                Basin            Sub_basin                 Name 
##            "integer"            "integer"            "integer" 
##             ISO_time               Nature             Latitude 
##            "integer"            "integer"            "integer" 
##            Longitude            Wind.WMO.            Pres.WMO. 
##            "integer"            "integer"            "integer" 
##               Center Wind.WMO..Percentile Pres.WMO..Percentile 
##            "integer"            "integer"            "integer" 
##           Track_type 
##            "integer"
```

```r

library(plyr)

df$Season = as.integer(df$Season)

df = rename(df, replace = c(Season = "Year"))

names(df)
```

```
##  [1] "Serial_Num"           "Year"                 "Num"                 
##  [4] "Basin"                "Sub_basin"            "Name"                
##  [7] "ISO_time"             "Nature"               "Latitude"            
## [10] "Longitude"            "Wind.WMO."            "Pres.WMO."           
## [13] "Center"               "Wind.WMO..Percentile" "Pres.WMO..Percentile"
## [16] "Track_type"
```

```r

write.csv(df, file = "Hurricanes.csv")
print(paste("File was written on:", Sys.time()))
```

```
## [1] "File was written on: 2013-11-08 08:54:47"
```


Finally, we'll create a new file which stores the number of hurricanes per year.

```r
dfYear = unique(df[, c("Year", "Num")])

summary(dfYear)
```

```
##       Year            Num     
##  Min.   :  1.0   01     :161  
##  1st Qu.: 56.0   02     :160  
##  Median :106.0   03     :160  
##  Mean   : 95.9   04     :159  
##  3rd Qu.:134.0   05     :151  
##  Max.   :161.0   06     :134  
##                  (Other):771
```

```r
sapply(dfYear, typeof)
```

```
##      Year       Num 
## "integer" "integer"
```

```r

dfYear = unique(df[, c("Year", "Name", "Num")])

dfYear = aggregate(dfYear, by = list(dfYear$Year), length)
colnames(dfYear)[1] = "Year"
dfYear = dfYear[, -2]

summary(dfYear)
```

```
##       Year          Name           Num      
##  Min.   :  1   Min.   : 1.0   Min.   : 1.0  
##  1st Qu.: 41   1st Qu.: 6.0   1st Qu.: 6.0  
##  Median : 81   Median : 9.0   Median : 9.0  
##  Mean   : 81   Mean   :10.5   Mean   :10.5  
##  3rd Qu.:121   3rd Qu.:13.0   3rd Qu.:13.0  
##  Max.   :161   Max.   :31.0   Max.   :31.0
```

```r

setwd("~/GitHub/Hurricane/Data")

write.csv(dfYear, "HurricaneByYear.csv")

setwd("~/Github/Hurricane")
```

