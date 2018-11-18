library(httr)
library(httpuv)
library(jsonlite)
library(XML)


#### Q1 ####

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at 
#    https://github.com/settings/developers. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Input your key and secret below.
mykey <- ""
mysecret <- ""
myapp <- oauth_app("github",
                   key = mykey,
                   secret = mysecret)

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)

json1 <- content(req)
json2 <- jsonlite::fromJSON(toJSON(json1))





#### Q4 ####
con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlcode <- readLines(con)
close(con)
nchar(htmlcode[[10]])
nchar(htmlcode[[20]])
nchar(htmlcode[[30]])
nchar(htmlcode[[100]])






#### Q5 ####
Q5 <- read.fwf("Q5.for",
               skip = 4,
               widths = c(12,7,4,9,4,9,4,9,4))
sum(Q5[,4])