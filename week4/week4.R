#### Q1 ####
url1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url1, destfile = "housing.csv")
d1 <- data.frame(read.csv("housing.csv", stringsAsFactors = F))
l1 <- strsplit(names(d1), "wgtp")
l1[[123]]



#### Q2 ####
url2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url2, destfile = "gdp.csv")
d2 <- data.frame(read.csv("gdp.csv", stringsAsFactors = F))
sd2 <- d2[5:235, c(1,2,4,5)]
colnames(sd2) <- c('code', 'rank', 'name', 'gdp')

# cleaning
sd2 <- sd2[sd2$gdp != '' & sd2$rank !='', ]
sd2$gdp <- sapply(sd2$gdp, function(x) gsub(',','', x))

mean(as.numeric(sd2$gdp), na.rm = T)


#### Q3 ####
length(grep('^United', sd2$name))


#### Q4 ####
url4 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(url4, destfile = "edu.csv")
d4 <- data.frame(read.csv("edu.csv", stringsAsFactors = F))

names(d4) <- tolower(names(d4))
l4 <- grep('?Fiscal year end: June',d4$special.notes) #regular expression
length(l4)


#### Q5 ####
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
length(grep('^2012',sampleTimes))