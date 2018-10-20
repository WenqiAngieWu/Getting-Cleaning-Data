# 1
url1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url1, destfile = ".\\week1\\data1.csv")
dt <- read.csv(".\\week1\\data1.csv")
nrow(dt[which(dt$VAL == 24),])  # "which" deals wiz NA correctly(return true/false for "==")

# 3
library(readxl)
url2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(url2, destfile=".\\week1\\data2.xlsx")
dat <- read_xlsx(".\\week1\\data2.xlsx", sheet = 1, range = cell_limits(c(18, 7), c(23, 15))
                ,col_names = TRUE)
sum(dat$Zip*dat$Ext, na.rm=T)

# 4
library(XML)
url3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(url3, destfile = ".\\week1\\task.html")
doc <- xmlTreeParse(file = ".\\week1\\task.html", useInternal = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
list <- as.numeric(xpathSApply(rootNode,"//zipcode" ,xmlValue))
sum(list == 21231)

# 5
library(data.table)
url4 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(url4, destfile = ".\\week1\\data5.csv")
#dt5 <- read.csv(".\\week1\\data5.csv", stringsAsFactors = FALSE, header = TRUE)
dt5 <- fread(".\\week1\\data5.csv")