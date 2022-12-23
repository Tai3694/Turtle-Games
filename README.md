# Turtle-Games Analysis 
This is analysing NHS data 


# Summary - Assignment 1
* Loyalty points and spending 
  * Negative intercept and positive x-coefficient. 
  * R^2= 0.452
  * Pot the regression line we see that most of the data points are further away from the line of best fit. This is more prominent at the right of the graph and the left of the graph there are data points which are much closer to the fitted line. 
* Loyalty points and remuneration
	* Negative intercept and positive x-coefficient 
	* R^2= 0.380
	* Plot the regression line we similar kind of trend and data points as in the regression of loyalty points and spending. We see that most of the dat points are further away from the line of best fit. This is more prominent at the right of the graph and the left of the graph there are data points which are much closer to the fitted line. 
* Loyalty points and age
	* Positive intercept and negative x-coefficient 
	* R^2= 0.002
	* Plot the regression line we see data points much further away from the regression line. 
As data analysts, we want to minimise residuals to determine the line of best fit; their goal is to minimize the distance between the data points and regression line. We see that loyalty points and spending have a much closer relationship. In addition, the R^2= 0.452 of the regression is the highest out of all 3 regression that we had run. The better the model, the closer the value is to 1 (or 100%). In this case, the R-squared is 0.452, meaning that the model's inputs can account for about 45.2% of the observed variation. Therefore, to an extent we could use spending to predict loyalty points. This would be the best predictor out of the 3 variables. 

# Summary - Assignment 2
Utilising both the elbow and silhouette methods helps determining the k-value. In both cases it can be difficult to see the specific peak or elbow. However, in the above graphs there tends to be a common value of k= 5. Indicating the optimal number of clusters is around 5. To further test this I employ 3 different values of k. Those values are 3, 4 and 5 to see and compare predicted values and visualisations. Going from k=3 to k=5, we see that the number of predicted values per class follows a better distribution. It is also interesting to see how clustering of k=5 fits within the dataset. Specifically, there are 5 different education/qualification level that an individual can have.
