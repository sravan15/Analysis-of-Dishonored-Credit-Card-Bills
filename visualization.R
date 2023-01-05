library(tidyverse)                                  #Loading libraray
d<-read.csv("Final_credit_card_dataset.csv")        # Loading Dataset
x<-d$Income                                         #independent variable
y<-d$Dishonour.of.Bill                              #dependent variable
z<-log(x,base=exp(1))                               #conversion of income on log10(For readable view)
z
pdf("visualization.pdf")                            #generating pdf
plot(z,y,main ="Unpaid bills VS Income",
     xlab="Income of customers in Indian Rupees(on scale of log10)",
     ylab ="Frequency of Unpaid bills",
     pch=21,
     frame=T)                                      #scatter plot
model <- lm(y ~ x, data = d)                       #Linearmodel
model                                              #coefficients
abline(model,col="green")                          #regression line

# Histogram 
h <- hist(y
          , main = "Histogram: Frequency of Unpaid Bills by Customer"
          , xlab = "Count of Unpaid Bills"
          , ylab = "Frequency"
          , col="azure"
)                                                 #Histogram
x1 <-seq(0, 10, 0.2)                              #x-axis limits
y1 <-dnorm(x1, mean=mean(y), sd=sd(y))            #mean and standard deviation
y1 <- y1 *diff(h$mids[1:2]) *length(y)
lines(x1, y1, col="blue")                         #smooth curve
dev.off()

