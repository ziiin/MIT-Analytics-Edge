IBM = read.csv("data/IBMStock.csv")
GE = read.csv("data/GEStock.csv")
CC = read.csv ("data/CocaColaStock.csv")
PG = read.csv ("data/ProcterGambleStock.csv")
Boeing = read.csv("data/BoeingStock.csv")

# Converting all dates to date object
IBM$Date = as.Date(IBM$Date, "%m/%d/%y")

GE$Date = as.Date(GE$Date, "%m/%d/%y")

CC$Date = as.Date(CC$Date, "%m/%d/%y")

PG$Date = as.Date(PG$Date, "%m/%d/%y")

Boeing$Date = as.Date(Boeing$Date, "%m/%d/%y")

# get lowest date
head(sort( table(IBM$Date)))

#get heighest date
tail(sort( table(CC$Date)))

#mean stock price of IBM 
summary (IBM)

#minimum stock price of General Electric
min(GE$StickPrice)

#what year did Coca-Cola has its highest stock price
plot(CC$Date, CC$StockPrice, col="red")
lines(PG$Date, PG$StockPrice, col="blue") # lty=2, argument would make the line dashed

# To draw a vertical line on the plot
abline(v=as.Date(c("2000-03-01")), lwd=2)
abline(v=as.Date(c("1983-01-01")), lwd=2)

plot(CC$Date[301:432], CC$StockPrice[301:432], type="l", col="red", ylim=c(0,210))
lines(IBM$Date[301:432], IBM$StockPrice[301:432], type="l", col="blue", ylim=c(0,210))
lines(GE$Date[301:432], GE$StockPrice[301:432], type="l", col="green", ylim=c(0,210))
lines(PG$Date[301:432], PG$StockPrice[301:432], type="l", col="purple", ylim=c(0,210))
lines(Boeing$Date[301:432], Boeing$StockPrice[301:432], type="l", col="black", ylim=c(0,210))
abline(v=as.Date(c("1997-09-01")), lwd=2)
abline(v=as.Date(c("1997-11-01")), lwd=2)

IBM$Months <- months(IBM$Date)
tapply(IBM$StockPrice, IBM$Months, mean, na.rm=TRUE)

v1 <- tapply(CC$StockPrice, months(CC$Date), mean, na.rm=TRUE)

