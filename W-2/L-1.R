W <- read.csv("data/wine.csv")

str(W)

# Q-1
m1 <- lm(Price ~ WinterRain + HarvestRain, data= W)

# Q-3
cor(W$HarvestRain, W$WinterRain)

#Q-4
WT <- read.csv("data/wine_test.csv")
predictTest = predict (m1, data=WT)
predictTest
