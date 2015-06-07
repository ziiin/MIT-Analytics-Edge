crime = read.csv("mvtWeek1.csv")
head (crime)
str(crime)

# getting true from Arrest variable
crime.v1 <- subset(crime, Arrest == TRUE)

# observations have a LocationDescription value of ALLEY
crime.v2 <- subset (crime, LocationDescription == "ALLEY")

# Converting date variables into date objects.
DateConvert = as.Date(strptime(crime$Date, "%m/%d/%y %H:%M"))

#Using months(), to get month of a date object
crime$Month <- months(DateConvert)

#using weekdays(), to get the day of the date object
crime$Wd <- weekdays(DateConvert)

# month has the largest number of motor vehicle thefts for which an arrest was made
crime.v4 <- table(crime$Month, crime$Arrest)
which.max(crime.v4[,2])

##exercise 3
hist(crime$Date, breaks=100)

#proportion of motor vehicle thefts in 2012 was an arrest made
nrow (subset(crime, Year == 2012 & Arrest == TRUE)) / nrow (subset(crime, Year == 2012))

# Getting Top5
Top0 <- subset (crime, LocationDescription == "STREET")
Top3 <- subset (crime, LocationDescription == "GAS STATION")
Top1 <- subset (crime, LocationDescription == "PARKING")
Top2 <- subset (crime, LocationDescription == "ALLEY")
Top4 <- subset (crime, LocationDescription == "DRIVEWAY - RESIDENTIAL")
Top5 <- rbind(Top0,Top1, Top2, Top3, Top4)

# Top5$LocationDescription still has all 78 factors
Top5$LocationDescription <- factor(Top5$LocationDescription)
# now they are only 5

# getting arrest rates
Top5.ar = table(Top5$LocationDescription , Top5$Arrest)
Top5.ar[1,2]/(Top5.ar[1,1] + Top5.ar[1,2])
Top5.ar[2,2]/(Top5.ar[2,1] + Top5.ar[2,2])
Top5.ar[3,2]/(Top5.ar[3,1] + Top5.ar[3,2])
Top5.ar[4,2]/(Top5.ar[4,1] + Top5.ar[4,2])
Top5.ar[5,2]/(Top5.ar[5,1] + Top5.ar[5,2])

# day of the week do the most motor vehicle thefts at gas stations

Top3 <- subset (Top5, LocationDescription == "GAS STATION")
table(Top3$Wd)

Top4 <- subset (Top5, LocationDescription == "DRIVEWAY - RESIDENTIAL")
table(Top4$Wd)
