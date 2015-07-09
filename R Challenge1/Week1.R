setwd("E:/Code/NYU-UCSL-2015/R")
citibike_data<-read.csv("201501-citibike-tripdata.csv",header=TRUE)
library(ggplot2)

#checking for size and dimensions of csv file loaded.
dim(citibike_data)  

#exploring headers in the .csv file.  This should match the headers in your .csv file
names(citibike_data)

#COMPUTING Z-SCORE
tripduration.sd <- sd(citibike_data$tripduration)
tripduration.mean <- mean(citibike_data$tripduration)
z <- (citibike_data$tripduration-tripduration.mean)/tripduration.sd

#creating subsets of data by Z value (z>3 as outlier)
bikedata_clean <- subset(citibike_data, z<3)
bikedata_origi <-subset(citibike_data)


## calculating the count for tripduration 
bikedata_clean.count <- dim(bikedata_clean)[1]
bikedata_origi.count <- dim(bikedata_origi)[1]

## calculating the mean for tripduration 
bikedata_clean.mean <- mean(bikedata_clean$tripduration)
bikedata_origi.mean <- mean(bikedata_origi$tripduration)

## calculating the standard deviation for tripduration
bikedata_clean.sd <- sd(bikedata_clean$tripduration)
bikedata_origi.sd <- sd(bikedata_origi$tripduration)

## calculating the min for tripduration
bikedata_clean.min <- min(bikedata_clean$tripduration)
bikedata_origi.min <- min(bikedata_origi$tripduration)

## calculating the max for tripduration
bikedata_clean.max <- max(bikedata_clean$tripduration)
bikedata_origi.max <- max(bikedata_origi$tripduration)

## calculating the median for tripduration
bikedata_clean.median <- median(bikedata_clean$tripduration)
bikedata_origi.median <- median(bikedata_origi$tripduration)

## calculate the quantiles for tripduration
bikedata_clean.quantile <- quantile(bikedata_clean$tripduration)
bikedata_origi.quantile<- quantile(bikedata_origi$tripduration)

## summary for tripduration
bikedata_clean.summary<-c(bikedata_clean.count,bikedata_clean.mean,bikedata_clean.sd,bikedata_clean.min,bikedata_clean.max,bikedata_clean.median,bikedata_clean.quantile[2:4])
bikedata_origi.summary<-c(bikedata_origi.count,bikedata_origi.mean,bikedata_origi.sd,bikedata_origi.min,bikedata_origi.max,bikedata_origi.median,bikedata_origi.quantile[2:4])

## data.frame the suumary
bikedata_summary <- data.frame(bikedata_origi.summary,bikedata_clean.summary)
row.names(bikedata_summary )<-(c("Count","Mean","Standard Deviation","Min","Max","Median","25% Quantiles","50% Quantiles","75 Quantiles"))
bikedata_summary 

#Visualize the trip duration by user type using clean
bikedata_Customer<- subset(bikedata_clean,usertype=="Customer")
bikedata_Customer<- subset(bikedata_clean,usertype=="Subscriber")

## histgram of tropduration by user type
ggplot(bikedata_clean,aes(x=tripduration)) + geom_histogram(fill="white",colour="black")+ facet_grid(usertype~., scales="free")

## boxplat of tropduration by user type
ggplot(bikedata_clean,aes(x=factor(usertype),y=tripduration)) + geom_boxplot()
