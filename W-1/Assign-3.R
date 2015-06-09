CPS <- read.csv("data/CPSData.csv")
CC <- read.csv ("data/CountryCodes.csv")
MAC <- read.csv("data/MetroAreaCodes.csv")

summary (CPS)

sort(table(CPS$Region)) 
nrow(subset(CPS, CountryOfBirthCode == 57))

# races are there at least 250 interviewees in the CPS dataset of Hispanic ethnicity
summary(subset(CPS, Hispanic == 1))

table(CPS$Region, is.na(CPS$Married))
table(CPS$Sex, is.na(CPS$Married))
table(CPS$Age, is.na(CPS$Married))
table(CPS$Citizenship, is.na(CPS$Married))

table(CPS$State, is.na(CPS$MetroAreaCode))


table(CPS$Region, is.na(CPS$MetroAreaCode))

# state has a proportion of interviewees living in a non-metropolitan area closest to 30%
sort( tapply(is.na(CPS$MetroAreaCode), CPS$State, mean))

# The first two arguments determine the data frames to be merged (they are called "x" and "y",
# respectively, in the subsequent parameters to the merge function). by.x="MetroAreaCode" means
# we're matching on the MetroAreaCode variable from the "x" data frame (CPS), while by.y="Code"
# means we're matching on the Code variable from the "y" data frame (MetroAreaMap). 
# Finally, all.x=TRUE means we want to keep all rows from the "x" data frame (CPS),
# even if some of the rows' MetroAreaCode doesn't match any codes in MetroAreaMap 
# (for those familiar with database terminology, this parameter makes the operation a left outer join
# instead of an inner join).

CPS = merge(CPS, MAC, by.x="MetroAreaCode", by.y="Code", all.x=TRUE)

nrow(subset(CPS, MetroArea == "Atlanta-Sandy Springs-Marietta, GA"))

tail(sort(tapply(CPS$Hispanic, CPS$MetroArea, mean)))

# number of metropolitan areas in the United States from which at least 20% of interviewees are Asian
tmp <- data.frame(sort(with(CPS, tapply(Race=="Asian", MetroArea, mean))))
sum(tmp >0.2)

#  which metropolitan area has the smallest proportion of interviewees who have received no high school diploma
tmp <- sort(tapply(CPS$Education == "No high school diploma", CPS$MetroArea, mean, na.rm = T))
head(tmp)


CPS = merge(CPS, CC, by.x="CountryOfBirthCode", by.y="Code", all.x=TRUE)
sum(is.na(CPS$Country))

# proportion of the interviewees from the "New York-Northern New Jersey-Long Island, NY-NJ-PA" metropolitan area have a country of birth that is not the United States
x <- sum(CPS$MetroArea == "New York-Northern New Jersey-Long Island, NY-NJ-PA", na.rm = TRUE)
y <- sum(CPS$MetroArea == "New York-Northern New Jersey-Long Island, NY-NJ-PA" & CPS$Country == "United States", na.rm = TRUE)
1- y/x


tail(sort(tapply(CPS$Country == "India", CPS$MetroArea, sum, na.rm = TRUE)))
tail(sort(tapply(CPS$Country == "Brazil", CPS$MetroArea, sum, na.rm = TRUE)))
tail(sort(tapply(CPS$Country == "Somalia", CPS$MetroArea, sum, na.rm = TRUE)))
