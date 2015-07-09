### Urban Skills Computing Lab (USCL) -  Summer 2015 
### WEEK #1 R Script: Descriptive & Summary Statistics
###  
###  Created:J.C. Bonilla; jb3379@nyu.edu
###
###  Updated: June 7, 2015


# loading data from .csv file:
citibikedata<- read.csv("~/Dropbox/USCL/Data/2013-07 - Citi Bike trip data.csv", header=TRUE,
                         stringsAsFactors=FALSE)

#checking for size and dimensions of csv file loaded.
dim(citibikedata)  

#exploring headers in the .csv file.  This should match the headers in your .csv file
names(citibikedata)

#calculating the mean for tripduration using a pre-built R function
tripduration.mean <- mean(citibikedata$tripduration_min)
tripduration.mean

#calculating mean using formula
sum((citibikedata$tripduration_min)/(length(citibikedata$tripduration_min-1)))

#calculate the variance for tripduration using a pre-built R function
tripduration.var <-var(citibikedata$tripduration_min)
tripduration.var

#calculating variance using formula
sum((citibikedata$tripduration_min - tripduration.mean)^2/(length(citibikedata$tripduration_min-1)))

#calculate the standard deviation for tripduration using a pre-built R function
tripduration.sd <-sd(citibikedata$tripduration_min)
tripduration.sd

#calculating standard deviation with formula
sqrt(tripduration.var)

#calculate the min for tripduration.
tripduration.min <- min(citibikedata$tripduration_min)
tripduration.min

#calculate the max for tripduration.
tripduration.max <- max(citibikedata$tripduration_min)
tripduration.max

#calculate the media for tripduration.
tripduration.median <- median(citibikedata$tripduration_min)
tripduration.median

##calculate the quantiles for tripduration.
tripduration.quantile <- quantile(citibikedata$tripduration_min)
tripduration.quantile


#R function that generates summary statistics: min, 1st quantile, median, mean, 3rd quantile, and max 
summary(citibikedata$tripduration_min)

#plotting a histogram
hist(citibikedata$tripduration_min, main = "Trip Duration", xlab = "time (min)", col='red')

#because the data has extreme events, it is difficult to fit in one linear histogram. By converting the
# the histogram to log scale, log(x), we are able to visualize the bike data's frequency 
hist(log(citibikedata$tripduration_min), main = "Trip Duration", xlab = "time (min)", col='blue')

# you can calibrate the histogram by adjusting the number of bins or breaks() 
hist(log(citibikedata$tripduration_min), breaks =50, main = "Trip Duration", xlab = "time (min)", col='green')

#ploting a boxplot
boxplot(citibikedata$tripduration_min, main="Boxplot for Citibike", xlab="time(min)")

#ploting a boxplot in log scale
boxplot(citibikedata$tripduration_min, main="Boxplot for Citibike", xlab="time(sec)", log = "y")

#ploting a boxplot without outliers
boxplot(citibikedata$tripduration_min, main="Boxplot for Citibike", xlab="time(sec)", outline=FALSE)


#creating subsets of data by gender
citibike.gender.0 <- subset(citibikedata, gender == 0)
citibike.gender.1 <- subset(citibikedata, gender == 1)
citibike.gender.2 <- subset(citibikedata, gender == 2)

#comparing the boxplots by gender
boxplot(citibike.gender.0$tripduration_min, citibike.gender.1$tripduration_min, citibike.gender.2$tripduration_min, 
        outline=FALSE)

#Finanlly, lets use the argument horizontal=TRUE to lay them out horizontally,add names to each boxplot.
boxplot(citibike.gender.0$tripduration_min, citibike.gender.1$tripduration_min, citibike.gender.2$tripduration_min, 
        main="Boxplot for Citibike by Gender", xlab="time(min)",
        outline=FALSE, horizontal = TRUE, 
        names=c("N/A", "males","females"),
        col=c("red","yellow","blue"))

#Calculate average age of user
mean(citibikedata$birth.year)

#This has two problems.  First mean() works of numeric or logical arguments
#   and citibikedata$birth.year is a character.  The second problem is the introduction of "\\N" 
class(citibikedata$birth.year)  #to read class type
citibikedata$birth.year

#first replace "\\N" for "NA"
citibikedata$birth.year[citibikedata$birth.year == "\\N"] <- ""

#transform from character to numeric
citibike.birth.year <- as.numeric(citibikedata$birth.year)

#calculate mean
mean(citibike.birth.year, na.rm=TRUE)

#Ploting stats on birthyear
hist(citibike.birth.year, col="blue",border="white")

boxplot(citibike.birth.year, size = 20, main="Boxplot for Citibike by Birth Year", 
        xlab="year",horizontal = TRUE,
        col="red")

# One figure in row 1 and two figures in row 2
par(mfrow=c(2,1)) 
hist(citibike.birth.year, col="blue",border="white")
hist(log(citibikedata$tripduration_min), breaks =50, main = "Trip Duration", xlab = "time (min)", col='green')


plot(citibike.birth.year, citibikedata$tripduration_min)
duration.lm<-lm(citibike.birth.year ~ citibikedata$tripduration_min)
