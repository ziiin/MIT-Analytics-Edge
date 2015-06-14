CL <- read.csv("data/climate_change.csv")
CL <- subset(CL, Year <= 2006)
#CL1 <- subset(CL, Year > 2006)
#write.csv(CL1,"data/climate_change_test.csv")

# build a linear regression model to predict the dependent variable Temp, 
# using MEI, CO2, CH4, N2O, CFC.11, CFC.12, TSI, and Aerosols as independent variables
m1 <- lm (Temp ~ MEI + CO2 + CH4 + N2O + CFC.11 + CFC.12 + TSI + Aerosols, data = CL)
summary(m1)
cor(CL)


#build a model with only MEI, TSI, Aerosols and N2O as independent variables
m2 <- lm (Temp ~ MEI + N2O + TSI + Aerosols, data = CL)
summary(m2)

# Use step to minimize the model with appropriate compromise of R-squared
# m3 <- lm (Temp ~ ., data=CL)
m3 <- step (m1)
summary(m3)

# Fitting in test data
CL_TEST <- read.csv ("data/climate_change_test.csv")
CL_TEST <- subset (CL_TEST, select =  - c(X)) # Cleaning some X variable on load


predictData <- predict (m3, newdata = CL_TEST)
SSE <- sum((predictData - CL_TEST$Temp)^2)
SSE
SST <- sum((mean(CL$Temp) - CL_TEST$Temp) ^2 ) # for SST the mean is from training set not the test set.
R2 <- 1 - (SSE/SST)
R2
