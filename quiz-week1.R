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
summarize(hData3, count=count(hData3));
