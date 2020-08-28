# Question 1 & 2
# The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv
# and load the data into R. The code book, describing the variable names is here:
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
# How many properties are worth $1,000,000 or more?
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "housing-data.csv", method = "curl")
list.files()

housingData <- read.table("./housing-data.csv", sep=",", header = TRUE)
head(housingData)

library("dplyr")

hData <- tbl_df(housingData)

hData2 <- select(hData, VAL)
arrange(hData2, desc(hData2))

hData3 <- filter(hData2, VAL == "24")
summarize(hData3, count=count(hData3)); # 53.

# Question 3
# Download the Excel spreadsheet on Natural Gas Aquisition Program here:
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx
# Read rows 18-23 and columns 7-15 into R and assign the result to a variable called:
#   dat
# What is the value of:
#   sum(dat$Zip*dat$Ext,na.rm=T)
# (original data source: http://catalog.data.gov/dataset/natural-gas-acquisition-program)


# Question 4
# Read the XML data on Baltimore restaurants from here:
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml
# 
# How many restaurants have zipcode 21231?


# Question 5
# The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv
# using the fread() command load the data into an R object
# DT
# The following are ways to calculate the average value of the variable
# pwgtp15
# broken down by sex. Using the data.table package, which will deliver the fastest user time?
# 
# DT[,mean(pwgtp15),by=SEX]
# mean(DT$pwgtp15,by=DT$SEX)
# sapply(split(DT$pwgtp15,DT$SEX),mean)
# mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
# tapply(DT$pwgtp15,DT$SEX,mean)
# rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]#