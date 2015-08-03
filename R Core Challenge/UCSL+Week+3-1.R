
### Urban Skills Computing Lab (USCL) -  Summer 2015 
### WEEK #3 R Script: 'USCL Week #3: Linear Models & Prediction'
###  
###  Created:J.C. Bonilla; jb3379@nyu.edu
###
##########################################


#this predefines values for x from 1 to 10
x <- c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10) 

#this is the linear model or equation we are building y = -3x +12
y <- (-3*x+12)

#results for y using the predefined values of x above
y  
plot(x,y)        

# loading outliners dataset
bikedata<- read.csv("~/Dropbox/USCL/Data/Citi Bike Clean Data outliers.csv", header=TRUE, stringsAsFactors=FALSE)

# scatter looking at the relationship of  birth year vs trip duration
plot(bikedata$birth.year, bikedata$tripduration_min)  


#As per section 3.5, we demonstrate OLS minimizes SSE
x <- c(0,3,1,0,6,5,3,4,10,8)
y <- c(12,13,15,19,26,27,29,31,40,48)
plot(x,y)
x.mean <- mean(x)
y.mean <- mean(y)
plot(x,y,col="red", lwd = 5)
points(x.mean,y.mean,col="green", lwd = 10)



#To calculate the sum of squares estimates and coefficient we built a data.frame as such:

data <- data.frame(x, y, xdev=(x-mean(x)), ydev=(y-mean(y)), xdevydev=((x-mean(x))*(y-mean(y))), xdev2=(x-mean(x))^2,ydev2=(y-mean(y))^2)
data


#This now permits us to calculate the estimates for the OLS

SP <- sum(data$xdevydev)
SSx <- sum(data$xdev2)
SSy <- sum(data$ydev2)
b1 <- SP / SSx
b1
b0 <- mean(y)-(b1*mean(x))
b0
model1 <- b0+b1*x
plot(x,y,col="red", lwd = 5)
points(x.mean,y.mean,col="green", lwd = 10)
lines(x,model1)


#To run a simple linear regression in R using the *lm()* function, do the following
x <- c(0,3,1,0,6,5,3,4,10,8)
y <- c(12,13,15,19,26,27,29,31,40,48)
lm(y ~ x)


#So the regression equation is: y = 3 (x) + 14.  

#Using R's summary function, we can obtain residuals, standard errors, t-values, p-values, R^2, and significance.
model2<-lm(y ~ x)
summary(model2)


#Plotting the regression line on a scatterplot is simple.  Keep in mind that R provides various regression diagnostics, which we will cover next week with model validation. For now a graphic display of how good the model fit is can be achieved as follows:
par(mfrow=c(2,2))
plot(model2)





