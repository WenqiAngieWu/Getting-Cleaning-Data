#### Q1 ####
data1 <- read.csv("getdata_week3_1.csv", stringsAsFactors = F)
logical <- data1$ACR==3 & data1$AGS == 6
which(logical)



#### Q2 ####
library(jpeg)
jpeg1 <- jpeg::readJPEG("jpeg_week3.jpg", native = T)
quantile(jpeg1, probs = c(0.3, 0.8))




#### Q3 ####
library(dplyr)
edu <- as.data.frame(read.csv("EDU.csv", header=T, stringsAsFactors = F))
gdp <- as.data.frame(read.csv("GDP.csv", header=T, stringsAsFactors = F))

sgdp <- gdp[5:235, c(1,2,4,5)] #cleaning
colnames(sgdp) <- c("code", "rank","name", "gdp")
mer <- merge(edu, sgdp, by.x = "CountryCode", by.y = "code")
smer <- mer[c("CountryCode", "rank","name", "gdp")] #select 

r <- smer[order(as.numeric(smer$rank), decreasing = T),]
r <- r[r["rank"]!="", ] #cleaning
r[13,]


#### Q4 ####
mer$Income.Group <- as.factor(mer$Income.Group)
mer <- mer[mer["rank"]!="", ] #cleaning
mer$rank <- as.numeric(mer$rank)
new <- mer %>% group_by(Income.Group) %>% summarise(mean = mean(rank, na.rm = T))
View(new)



#### Q5 ####
library(Hmisc)
mer$rank <- cut2(mer$rank, g=5) # cut into 5 quantile groups
table(mer$rank, mer$Income.Group)
