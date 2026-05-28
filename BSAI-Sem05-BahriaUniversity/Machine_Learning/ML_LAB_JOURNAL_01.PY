# Name: Muhammad Taqui
# Enrollment: 01-136221-021
# Machine Learning Lab Journal 01

# Load the dataset using pandas
import pandas as pd

df = pd.read_csv('/content/ML LAB DATASET 1.csv')
df.head()

# Plot a scatter plot to visualize the relationship between Year and AdjustedNetNationalIncomePerCapita
import matplotlib.pyplot as plt

plt.xlabel("Year")
plt.ylabel("Per Capita Income")
plt.scatter(df['year'], df['per capita income (US$)'], marker='+', color='r')

# Implement a linear regression model using scikit-learn to fit the training data
from sklearn import linear_model

model = linear_model.LinearRegression()
year = df[['year']]
income = df['per capita income (US$)']
model.fit(year, income)

# Discuss how confident you are in the model's prediction and why
# The confidence in the model's prediction for per capita income in the year 2020 depends on achieving a high R-squared and a low MSE.

# Use the trained model to predict the AdjustedNetNationalIncomePerCapita for the year 2020
predicted_income_2020 = model.predict([[2020]])
print(f"Predicted per capita income for the year 2020: ${predicted_income_2020[0]}")

# Plot the regression line
plt.plot(df['year'], model.predict(year), color='blue', linewidth=3)
plt.show()

# Calculate R-squared and Mean Squared Error (MSE)
from sklearn.metrics import r2_score, mean_squared_error
import numpy as np

# Y_true is the actual values and Y_pred is the predicted values
y_true = df['per capita income (US$)']
y_pred = model.predict(year)

# Calculate R-squared
r_squared = r2_score(y_true, y_pred)

# Calculate Mean Squared Error (MSE)
mse = mean_squared_error(y_true, y_pred)

print(f'R-squared: {r_squared}')
print(f'Mean Squared Error (MSE): {mse}')