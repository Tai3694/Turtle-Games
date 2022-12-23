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


# Summary - Assignment 3
By using sentiment analysis, a quick summary of current consumer satisfaction is presented. Turtle Games want to learn more about how their consumers feel about their goods and services, and they want to know what proportion of customer reviews are neutral, positive, or negative. 

First by creating a Word cloud, where a tag is a visual representation of text data; tags are often single words whose significance is shown by their size and colour. When looking at reviews the most common words are game, love, great, fun, new and much more. These words suggest that customers are having a positive experience. Following this we can also look at customer summaries to see if this idea holds. In fact, the common tags in customer summaries is very similar and we see more words such as five stars, excellent and so on.

Overall, this suggests a satisfying interaction with the goods or services. By looking at the most popular good and negative reviews on their website. We could further analyse this by looking the top positive and negative reviews from their website. When focusing on positive reviews and summaries, we again see the words highlighted above but additional words such as best, wonderful, and perfect. However, when focusing on negative reviews and summaries, the most words that appear are boring and disappointing.

# Summary - Assignment 4 
For quickly producing graphs in R, utilise the flexible function qplot() or quickplot(). It makes it simple to create intricate graphs, establish relationships between variables, see outliers in the data, and locate missing or disorganised data. I begin by observing overall sales in the various areas. Globally, we see sales above £60 million. Then looking specifically at North America and the EU, there are more sales within North America than the EU. In North America sales are above £30 million, whilst in the EU it is above £20 million. Given this, they would be able to identify a greater proportion of clients are within North America. Furthermore, looking at the various Platforms can help identify popular games consoles. In particular the DS, PC, PS3, Wii and X360 seem to be the most popular platforms. This would be useful to get an general overview of the various consoles. This would help Turtle Games when trying to improve overall sales. It would be best to use these popular Platforms to boost sales. 

In addition, we can further explore this to see whether these consoles are popular globally, in North America or the EU. I find that the popularity of these consoles hold to an extent, but it varies. For example, the previously identified consoles tend to have an equal share of sales in the EU, but in North America it seems a larger share of sales is towards PC’s. 
