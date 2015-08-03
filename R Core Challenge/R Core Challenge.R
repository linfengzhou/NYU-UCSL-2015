library(ggplot2)

setwd("E:/Github Data/NYU-UCSL-2015/R Core Challenge")
dataset <- read.csv("2014-07 - Citi Bike trip data.csv", header=TRUE)
dataset = subset(dataset,dataset$birth.year != "\\N")


## def z-score function & calculate z-score
zscore <- function(citibike_data){
  tripduration.sd <- sd(citibike_data$tripduration)
  tripduration.mean <- mean(citibike_data$tripduration)
  z <- (citibike_data$tripduration-tripduration.mean)/tripduration.sd
  return(z)
}

z <- zscore(dataset)

## subset data
bikedata_origi <- dataset 
bikedata_clean  <- subset(dataset, z<2 & z>-2)

add_age <- function (dataset)
{
  a <- 2015-as.numeric(as.character(dataset$birth.year))
}



##
bikedata_origi$age <- add_age(bikedata_origi)
bikedata_clean$age <- add_age(bikedata_clean)

fit1 <- lm (tripduration ~ age , bikedata_origi)
fit2 <- lm (tripduration ~ age , bikedata_clean)

summary(fit1)
summary(fit2)



library(ggplot2)

ggplot(bikedata_origi,aes(x=tripduration)) + geom_histogram(binwidth=150,fill="white",colour="black")+ggtitle("tripduration of Original Data")

ggplot(bikedata_clean,aes(x=tripduration)) + geom_histogram(binwidth=100,fill="white",colour="black")+ggtitle("tripduration of Clean Data")

ggplot(bikedata_origi,aes(x=factor(usertype),y=tripduration)) + geom_boxplot(outlier.size=0.1,outlier.shape=0) +ggtitle("Boxplot for Original Data")

ggplot(bikedata_clean,aes(x=factor(usertype),y=tripduration)) + geom_boxplot(outlier.size=0.1,outlier.shape=0) +ggtitle("Boxplot for Clean Data")

