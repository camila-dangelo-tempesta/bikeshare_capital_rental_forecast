# **BIKESHARE CAPITAL RENTAL FORECAST**

## Forecasting Bicycle Rental Demand

<div align="center">
<p float="left">
  <img src="/images/bike.png" width="1000" height="750"/>
</p>
</div>

***
## 1. BUSINESS PROBLEMS

This experiment aims to demonstrate the process of building a regression model to predict the demand for bicycle rental. Where, the objective will be to predict the value of the variable cnt (count) that represents the amount of rented bicycles and whose objective within a specific hour range is from 1 to 977.

We will use a dataset to build and train our model.

The  dataset ["Bike Rental UCI"](https://archive.ics.uci.edu/ml/datasets/Bike+Sharing+Dataset) will be used to build and train the model in this experiment.

This dataset is based on real data from the company Capital Bikeshare, which operates bicycle rentals in the city of WashingtonDC, USA.

***
## 2. BUSINESS ASSUMPTIONS

The dataset contains 17,379 observations and 17 variables, representing the number of bikes rented within specific hours of the day, in the years 2011 and 2012. Weather conditions (such as temperature, humidity and wind speed) were included in the dataset and the dates were categorized such as holidays and weekdays.

### 2.1 **Assumptions:** 

- This code contains commands to filter and transform the bike rental data,
- This code was created to run on both Azure and RStudio;
- To run on Azure, change the value of the Azure variable to TRUE;
- That is, if the value is FALSE, the code will be executed in RStudio;

***
## 3. SOLUTION PLANNING

- [x] **Step 01:** **Data Collect**:

- [x] **Step 02:** **Data Munging**:
  - Data Cleaning
  - Data Transformation

- [x] **Step 03:** **Feature Engineering**:

- [x] **Step 04:** **Exploratory Data Analysis**:
  - Correlation
  - Time Series
	- [x] **Step 4.1:** Exploratory Data Analysis: Views
		- BoxPlot
		- Density Plot

- [x] **Step 05:** **Feature Selection**: 
  - Random Forest (R Language)
  - Kendall Correlation (Microsoft Azure Machine Learning)

- [x] **Step 06:** Machine Learning Modelling
  - 1º Linear Regression 
  - 2 Boosted Decision Tree Regression

- [x] **Step 07:** Convert Model Performance to Business Values

- [x] **Step 08:**  Deploy Modelo to Production
  - Microsoft Azure Machine Learning

***
## 4. TOP 5 DATA INSIGHTS

**Hypothesis 01:** 
 - *Reply:* ****. 



***
## 5. Machine Learning Model Applied

Regression tests were done using different algorithms with Microsoft Azure Machile Learning:

  - Linear Regression 
  - Boosted Decision Tree Regression

<div align="center">
<p float="left">
    <img src="/images/mind_map.png" width="600" height="500"/>
</p>
</div>
***

## 6. Machine Learning Modelo Performance

The summary below shows the metrics comparison after running the models

|                                    | Mean Absolute Error | Root Mean Squared Error | Relative Absolute Error | Relative Squared Error | **Relative Squared Error** | 
|------------------------------------|:-------------------:|:-----------------------:|:-----------------------:|:----------------------:|:--------------------------:|
| Linear Regression                  | 113.277058          | 150.46221               | 0.798987                | 0.689668               | **0.310332**               |
| Boosted Decision Tree Regression   | 29.342033           | 44.857338               | 0.206961                | 0.061299               | **0.938701**               |


### 6.1 **Waste Analysis:** 


***
## 7. Business Results

***
## 8. Conclusions

***
## 9. Lessons Learned

***
## 10. Next Steps to Improve

***
# Tools
- Microsoft Azure Machie Learning
- R Language

***
Made By **Camila D'Angelo**

- 🔭 I’m currently working on DS community
- 🌱 I’m currently learning Data Science
- 📫 How to reach me: [LinkeldIn](https://www.linkedin.com/in/camiladangelotempesta/)
