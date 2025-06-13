# The Machine Learning Process

* Data Pre-Processing
	* Import the data
	* Clean the data
	* Split into training & test sets
* Modelling
	* Build the model
	* Train the model
	* Make predictions
* Evaluation
	* Calculate performance metrics
	* Make verdict

## Feature Scaling

* Normalization: taking the minimum inside a colum and subtracting fthat minimum from every single value inside that column. And then dividing by the difference between the maximum and minimum values in that column. And you'll endup with a new column with values whithin the range of [0;1].
	* $$X' = \frac{X-X_{min}}{X_{max} - X_{min}}$$
* Standardization: is a similar process, but instead we subtract the values from the column from the column's mean value and divide by the deviation. And now the column values will reside within the range [-3;+3].
	* $$X' = \frac{X-\mu}{\sigma}$$