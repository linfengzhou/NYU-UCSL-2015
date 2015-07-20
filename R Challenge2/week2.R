

# loading data from .csv file:
<<<<<<< HEAD
<<<<<<< HEAD
setwd("E://Github Data/NYU-UCSL-2015/R Challenge2/")
=======
setwd("/Users/luke/Documents/NYU-UCSL-2015//R Challenge2/")
>>>>>>> origin/master
=======
setwd("/Users/luke/Documents/NYU-UCSL-2015//R Challenge2/")
>>>>>>> origin/master
cleandata <- read.csv("Citi+Bike+Clean+Data.csv",header=TRUE)
cleandata$tripduration<- cleandata$tripduration /60 

## statement 2
## Test the hypothesis that the Median for overtime is 2hrs long 
## with α=5% (overtime = 45mins or more).

subsetdata2<-subset(cleandata$tripduration,cleandata$tripduration>=45)

hist(subsetdata2)

quantile(subsetdata2)

binom.test(sum(subsetdata2<120),length(subsetdata2),0.5)
t.test(subsetdata2-120)

## Statement #3: Citi Bike management thinks 
## that men incur in more overtime fees.  
## Test this hypothesis by comparing overtime variances across genders.
attach(subsetdata3)
table(gender)
subsetdata3<-subset(cleandata,cleandata$tripduration>=45)
summary(aov(cleandata$tripduration ~ cleandata$gender))
library(ggplot2)
ggplot(subsetdata3,aes(x=factor(gender),y=tripduration)) + geom_boxplot(outlier.size=0.5,outlier.shape=0) +ggtitle("Boxplot for CitiBike")
