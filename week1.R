# install_from_swirl("Getting and Cleaning Data")

# swirl()

# Part 1
mydf <- read.csv(path2csv, stringsAsFactors = FALSE)
dim(mydf)
head(mydf)

cran <- tbl_df(mydf)

rm("mydf")

cran

select(cran, ip_id, package, country)

select(cran, r_arch:country)
select(cran, country:r_arch)

cran

select(cran, -time)

select(cran, -(X:size))

filter(cran, package == "swirl")
filter(cran, r_version == "3.1.1", country == "US")
filter(cran, r_version <= "3.0.2", country == "IN")
filter(cran, country == "US" | country == "IN")
filter(cran, size > 100500, r_os == "linux-gnu")
filter(cran, !is.na(r_version))

cran2 <- select(cran, size:ip_id)
arrange(cran2, ip_id)
arrange(cran2, desc(ip_id))
arrange(cran2, package, ip_id)
arrange(cran2, country, desc(r_version), ip_id)

cran3 <- select(cran, ip_id, package, size)
mutate(cran3, size_mb = size / 2^20)
mutate(cran3, size_mb = size / 2^20, size_gb = size_mb / 2^10)
mutate(cran3, correct_size = size + 1000)

summarize(cran, avg_bytes= mean(size))

# Part 2
library(dplyr)
cran <- tbl_df(mydf)
rm("mydf")
cran
?group_by

by_package <- group_by(cran, package)
by_package
summarize(by_package, mean(size))
