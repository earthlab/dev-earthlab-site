## ----plot-data, eval=F---------------------------------------------------
## 
## # download data from figshare
## download.file(url = "https://ndownloader.figshare.com/files/7010681",
##               destfile = "boulder-precip.csv")
## 
## # import data
## boulder.precip <- read.csv(file="boulder-precip.csv")
## 
## # view first few rows of the data
## head(boulder.precip)
## 
## # when we download the data we create a dataframe
## # view each column of the data frame using it's name (or header)
## boulder.precip$DATE
## 
## # view the precip column
## boulder.precip$PRECIP
## 
## # q plot stands for quick plot. Let's use it to plot our data
## qplot(x=boulder.precip$DATE,
##       y=boulder.precip$PRECIP)
## 

## ----render-plot, echo=F-------------------------------------------------

# download data from figshare
download.file(url = "https://ndownloader.figshare.com/files/7010681", 
              destfile = "boulder-precip.csv")

# import data
boulder.precip <- read.csv(file="boulder-precip.csv")

# q plot stands for quick plot. Let's use it to plot our data
qplot(x=boulder.precip$DATE, 
      y=boulder.precip$PRECIP)


