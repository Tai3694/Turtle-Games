#Set the working directory which is Course 3 > Assignment 

#Import the data set
turtle_data <- read.csv('/Users/taibachaudhry/Desktop/LSE - Data Analytics/Course 3/Assignment/LSE_DA301_assignment_files/turtle_sales.csv')

#Import necessary packages 
library(tidyverse)
library(ggplot2)
library(tidyverse)
library(DataExplorer)
library(dplyr)
library(moments)
library(stargazer)

#Assignment - Week 4
#Remove columns and create a subset 
turtle_data2 <- turtle_data[,!names(turtle_data) %in% c("Ranking", "Year", "Genre", "Publisher")]
#Save this new data frame as a CSV file 

##Explore the data 
#Print the data frame
as_tibble(turtle_data2)
str(turtle_data2)

#Determine the sum of missing values 
sum(is.na(turtle_data2))

#Determine the descriptive statistics
summary(turtle_data2)
#EU Sales - min, max, mean 
min(turtle_data2$EU_Sales)
max(turtle_data2$EU_Sales)
mean(turtle_data2$EU_Sales)

#NA Sales - min, max, mean 
min(turtle_data2$NA_Sales)
max(turtle_data2$NA_Sales)
mean(turtle_data2$NA_Sales)

#Global Sales - min, max, mean 
min(turtle_data2$Global_Sales)
max(turtle_data2$Global_Sales)
mean(turtle_data2$Global_Sales)

#Create insights into the sales data set - plotting various graphs:
##Bar graph 
qplot(Platform, data = turtle_data2, fill=Platform, geom='bar')
bar1 <- ggplot(turtle_data2, aes(Platform, Global_Sales))+ geom_point(aes(color=Platform))
bar1

bar2 <- ggplot(turtle_data2, aes(Platform, NA_Sales))+ geom_point(aes(color=Platform))
bar2

bar3 <- ggplot(turtle_data2, aes(Platform, EU_Sales))+ geom_point(aes(color=Platform))
bar3

##Scatterplot 
#Scatterplot - Looking at overall regional sales 
qplot(y=Global_Sales, data=turtle_data2)
qplot(y=EU_Sales, data=turtle_data2)
qplot(y=NA_Sales, data=turtle_data2)

#Scatterplot - Looking at the various regional for the specific platforms 
qplot(Platform, NA_Sales, data=turtle_data2)
qplot(Platform, EU_Sales, data=turtle_data2)
qplot(Platform, Global_Sales, data=turtle_data2)

##Histogram
#Looking at the distribution of Platform 
qplot(Platform, data=turtle_data2, fill=Platform)

#Looking at the distribution of Global Sales 
Global_Sales <-turtle_data2$Global_Sales
hist(Global_Sales,col = 'Blue')
qplot(Global_Sales, data=turtle_data2, fill=Platform)

#Looking at the distribution of EU Sales 
EU_Sales <-turtle_data2$EU_Sales
hist(EU_Sales,col = 'Green')
qplot(EU_Sales, data=turtle_data2, fill=Platform)

#Looking at the distribution of NA Sales 
NA_Sales <-turtle_data2$NA_Sales
hist(NA_Sales,col = 'Red')
qplot(NA_Sales, data=turtle_data2, fill=Platform)
#Given that the histogram is looking at the frequency distribution, it may not be the best suitable graph in this case

#Assignment Week 5 
##Examining the impact on sales per product 
#Group data based on Product and determine the sum per Product
agg_turtle1 <- turtle_data2 %>%
  group_by(Product) %>%
  summarise(NA_ProductSales = sum(NA_Sales),
            EU_ProductSales = sum(EU_Sales),
            Global_ProductSales = sum(Global_Sales),
            .groups = 'drop')

#Group data based on Product and Platform to determine the sum per Product
agg_turtle2 <- turtle_data2 %>%
  group_by(Product, Platform) %>%
  summarise(NA_ProductSales = sum(NA_Sales),
            EU_ProductSales = sum(EU_Sales),
            Global_ProductSales = sum(Global_Sales),
            .groups = 'drop')
#Can choose to save these two new data frames as a CSV file 

#Further Plots to determine insights into sales
##Scatterplots - using aggregated data for product
qplot(y=Global_ProductSales, data=agg_turtle1)
qplot(y=NA_ProductSales, data=agg_turtle1)
qplot(y=EU_ProductSales, data=agg_turtle1)
#Scatterplots - using aggregated data for product and platform 
qplot(y=Global_ProductSales, data=agg_turtle2)
qplot(y=NA_ProductSales, data=agg_turtle2)
qplot(y=EU_ProductSales, data=agg_turtle2)

##Histogram 
EU_ProductSales <-agg_turtle1$EU_ProductSales
hist(EU_ProductSales,col = 'Green')

NA_ProductSales <-agg_turtle1$NA_ProductSales
hist(NA_ProductSales,col = 'Red')

Global_ProductSales <-agg_turtle1$Global_ProductSales
hist(Global_ProductSales,col = 'Blue')
#Might not be best to completely rely on a histogram but we can see that the data doesn't have a normal distribution 

##Boxplot
#Boxplot for the original data 
boxplot (turtle_data2$Global_Sales) 
boxplot (turtle_data2$EU_Sales) 
boxplot (turtle_data2$NA_Sales) 
#Boxplot for the aggregated data by product 
boxplot (agg_turtle1$Global_ProductSales) 
boxplot (agg_turtle1$EU_ProductSales) 
boxplot (agg_turtle1$NA_ProductSales) 

##Determine the normality of the data set
##Q-Q plot for Global sales data - original data 
qqnorm(turtle_data2$Global_Sales,
       col='blue',
       xlab="z Value",
       ylab='Time')
#Specify the qqline function.
#Add a reference line to the qqplot.
qqline(turtle_data2$Global_Sales,
       col='red',
       lwd=2) 

#Q-Q plot for all Global sales data -aggregated data 
qqnorm(agg_turtle1$Global_ProductSales,
       col='blue',
       xlab="z Value",
       ylab='Time')
#Specify the qqline function.
#Add a reference line to the qqplot.
qqline(agg_turtle1$Global_ProductSales,
       col='red',
       lwd=2) 


##Q-Q plot for EU sales data - original data 
qqnorm(turtle_data2$EU_Sales,
       col='blue',
       xlab="z Value",
       ylab='Time')
#Specify the qqline function.
#Add a reference line to the qqplot.
qqline(turtle_data2$EU_Sales,
       col='red',
       lwd=2) 

#Q-Q plot for EU sales data - aggregated data
qqnorm(agg_turtle1$EU_ProductSales,
       col='blue',
       xlab="z Value",
       ylab='Time')
#Specify the qqline function.
#Add a reference line to the qqplot.
qqline(agg_turtle1$EU_ProductSales,
       col='red',
       lwd=2) 


##Q-Q plot for NA sales data - original data 
qqnorm(turtle_data2$NA_Sales,
       col='blue',
       xlab="z Value",
       ylab='Time')
#Specify the qqline function.
#Add a reference line to the qqplot.
qqline(turtle_data2$NA_Sales,
       col='red',
       lwd=2) 

#Q-Q plot for NA sales data - aggregated data
qqnorm(agg_turtle1$NA_ProductSales,
       col='blue',
       xlab="z Value",
       ylab='Time')
#Specify the qqline function.
#Add a reference line to the qqplot.
qqline(agg_turtle1$NA_ProductSales,
       col='red',
       lwd=2) 

##Assessing normality of the data 
#Shapiro-Wilk test on each regional data - original data:
shapiro.test(turtle_data2$Global_Sales)
shapiro.test(turtle_data2$EU_Sales)
shapiro.test(turtle_data2$NA_Sales)

#Shapiro-Wilk test on each regional data - aggregated data:
shapiro.test(agg_turtle1$Global_ProductSales)
shapiro.test(agg_turtle1$EU_ProductSales)
shapiro.test(agg_turtle1$NA_ProductSales)

##Determining the Skewness and Kurtosis: 
#Original Data- Global Sales:
skewness(turtle_data2$Global_Sales) 
kurtosis(turtle_data2$Global_Sales)
#Aggregated Data - Global Sales:
skewness(agg_turtle1$Global_ProductSales) 
kurtosis(agg_turtle1$Global_ProductSales)

#Original Data- EU Sales:
skewness(turtle_data2$EU_Sales) 
kurtosis(turtle_data2$EU_Sales)
#Aggregated Data - EU Sales:
skewness(agg_turtle1$EU_ProductSales) 
kurtosis(agg_turtle1$EU_ProductSales)

#Original Data- NA Sales:
skewness(turtle_data2$NA_Sales) 
kurtosis(turtle_data2$NA_Sales)
#Aggregated Data - NA Sales:
skewness(agg_turtle1$NA_ProductSales) 
kurtosis(agg_turtle1$NA_ProductSales)

##Determining any correlation between sales data 
#Original data 
cor(turtle_data2$Global_Sales,turtle_data2$EU_Sales)
cor(turtle_data2$Global_Sales,turtle_data2$NA_Sales)
cor(turtle_data2$NA_Sales,turtle_data2$EU_Sales)

#Aggregated data 
cor(agg_turtle1$Global_ProductSales,agg_turtle1$EU_ProductSales)
cor(agg_turtle1$Global_ProductSales,agg_turtle1$NA_ProductSales)
cor(agg_turtle1$NA_ProductSales,agg_turtle1$EU_ProductSales)
round(cor(agg_turtle1),
      digits = 2)

##Assignment Week 6 
##Create a simple linear regression model:
#Simple linear regression - Global_Sales and NA_Sales original data 
Global_modelA1 <- lm(Global_Sales ~ NA_Sales, data = turtle_data2)
Global_modelA
summary(Global_modelA)
#Create plots to view the linear regression
plot(Global_modelA$residuals)
abline(coefficients(Global_modelA))

#Simple linear regression - Global_Sales and NA_Sales aggregated data 
Global_modelA2 <- lm(Global_ProductSales ~ NA_ProductSales, data = agg_turtle1)
Global_modelA2
summary(Global_modelA2)
#Create plots to view the linear regression
plot(Global_modelA2$residuals)
abline(coefficients(Global_modelA2))

#Simple linear regression - Global_Sales and EU_Sales original data
Global_modelB1 <- lm(Global_Sales ~ EU_Sales, data = turtle_data2)
Global_modelB1
summary(Global_modelB1)
#Create plots to view the linear regression
plot(Global_modelB1$residuals)
abline(coefficients(Global_modelB1))

#Simple linear regression - Global_Sales and EU_Sales aggregated data 
Global_modelB2 <- lm(Global_ProductSales ~ EU_ProductSales, data = agg_turtle1)
Global_modelB2
summary(Global_modelB2)
#Create plots to view the linear regression
plot(Global_modelB2$residuals)
abline(coefficients(Global_modelB2))

#Simple linear regression - NA_Sales and EU_Sales original data 
NA_model_A <- lm(NA_Sales ~ EU_Sales, data = turtle_data2)
NA_model_A
summary(NA_model_A)
#Create plots to view the linear regression
plot(NA_model_A$residuals)
abline(coefficients(NA_model_A))

#Simple linear regression - NA_Sales and EU_Sales aggregated data  
NA_model_B <- lm(NA_ProductSales ~ EU_ProductSales, data = agg_turtle1)
NA_model_B
summary(NA_model_B)
#Create plots to view the linear regression
plot(NA_model_B$residuals)
abline(coefficients(NA_model_B))

#Simple linear regression - EU_Sales and NA_Sales original data
EU_model_A <- lm(EU_Sales ~ NA_Sales, data = turtle_data2)
EU_model_A
summary(EU_model_A)
#Create plots to view the linear regression
plot(EU_model_A$residuals)
abline(coefficients(EU_model_A))

#Simple linear regression - EU_Sales and NA_Sales aggregate data 
EU_model_B <- lm(EU_ProductSales ~ NA_ProductSales, data = agg_turtle1)
EU_model_B
summary(EU_model_B)
#Create plots to view the linear regression
plot(EU_model_B$residuals)
abline(coefficients(EU_model_B))

stargazer(Global_modelA1, Global_modelA2, Global_modelB1, Global_modelB2, type = "text")
stargazer(NA_model_A, NA_model_B, EU_model_A, EU_model_B, type = "text")
##Create a multiple linear regression model
#Original data 
Model_A <-lm (Global_Sales ~ EU_Sales + NA_Sales, data = turtle_data2)
Model_A
summary(Model_A)

#Aggregated data 
Model_B <-lm (Global_ProductSales ~ EU_ProductSales + NA_ProductSales, data = agg_turtle1)
Model_B
summary(Model_B)

##Predictions based on given values
#Compare with observed values for a number of records
#Original data predictions 
newdata1 = data.frame(NA_Sales=34.02, EU_Sales= 23.80)
predict(Model_A, data=newdata1)

newdata2 = data.frame(NA_Sales=3.93, EU_Sales= 1.56)
predict(Model_A, data=newdata2)

newdata3 = data.frame(NA_Sales=2.73, EU_Sales= 0.65)
predict(Model_A, data=newdata3)

newdata4 = data.frame(NA_Sales=2.26, EU_Sales= 0.97)
predict(Model_A, data=newdata4)

newdata5 = data.frame(NA_Sales=22.08, EU_Sales= 0.52)
predict(Model_A, data=newdata5)

#Aggregated data predictions 
newdata6 = data.frame(NA_ProductSales=34.02, EU_ProductSales= 23.80)
predict(Model_B, data=newdata6)

newdata7 = data.frame(NA_ProductSales=3.93, EU_ProductSales= 1.56)
predict(Model_B, data=newdata7)

newdata8 = data.frame(NA_ProductSales=2.73, EU_ProductSales= 0.65)
predict(Model_B, data=newdata8)

newdata9 = data.frame(NA_ProductSales=2.26, EU_ProductSales= 0.97)
predict(Model_B, data=newdata9)

newdata10 = data.frame(NA_ProductSales=22.08, EU_ProductSales= 0.52)
predict(Model_B, data=newdata10)

