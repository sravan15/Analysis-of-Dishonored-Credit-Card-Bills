library(tidyverse)               #Loading library
d<-read.csv("Final_credit_card_dataset.csv",header=T, na.strings = c(".")) # Loading Dataset
X<-as.numeric(d$Income)            #independent variable
Y<-as.numeric(d$Dishonour.of.Bill) #dependent variable
cor.test(X, Y, method="spearman")  #analysis
