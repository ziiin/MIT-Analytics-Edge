var1 <- c("ele1", "ele2", "ele3")
var2 <- seq(1,3)
var3 <- c(10,11,12)

df <- data.frame (var1,var2,var3)
df.1 <- data.frame(var1 = "ele4", var2 = 4, var3 = 14)
df <- rbind(df,df.1 )
df
who <- read.csv("Who.csv")

who.reg1 <- subset (who, Region = "Africa")

plot (who$Country, who.Under15)
who.q3 <- tapply(who.q2$ChildMortality, who.q2$Region, mean, na.rm = TRUE)
which.min(who.q3)