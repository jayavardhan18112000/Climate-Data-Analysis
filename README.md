## Analysis of Climate Data in Response to Soil Temperature and Moisture

### Introduction

This project involves the application of statistical methods to analyze climate data, particularly focusing on soil and air temperatures. The goal is to understand the relationship between various climate factors (e.g., relative humidity, dew point, soil moisture) and their impact on soil temperature and moisture.

### Data Collection

- **Source**: Weather sensors located at the FIU MMC campus, near the Ocean Bank Arena building.
- **Period**: February 15th to March 30th, 2024.
- **Frequency**: Data recorded every five minutes.
- **Variables**: Air temperature, relative humidity, dew point, soil moisture, and soil temperature.

### Objectives

1. **Model 1**: Assess the daily impact of relative humidity and dew point on soil temperature.
2. **Model 2 & 3**: Compare the impact of relative humidity and dew point on soil moisture at midday and midnight.
3. **Model 4**: Evaluate the impact of relative humidity and dew point on soil temperature.

### Data Preparation

- **Averaging**: Data recorded every 5 minutes was averaged to simplify the analysis.
- **Variables**:
  - Air temperature, relative humidity, and dew point from sensors at 6 feet on a tree and a light post.
  - Soil moisture from sensors at 15 cm under the ground.
  - Soil temperature from sensors at 10 cm depth.

### Methodology

1. **Multiple Linear Regression**: Fitting models to show linear relationships between soil temperature/moisture and climate predictors.
2. **Regularized Regression**: Applying Ridge and Lasso regression to handle multicollinearity and improve model performance.
3. **Principal Component Regression (PCR)**: Transforming correlated predictors into uncorrelated principal components.
4. **Partial Least Squares (PLS)**: Reducing dimensionality and capturing variance in soil temperature and moisture.

### Results

#### Model 1: Soil Temperature (10 cm Depth)
- Multiple Linear Regression: Explained 81.97% of variability.
- Ridge and Lasso Regression: Ridge achieved R-squared of 83.04; Lasso performed feature selection, achieving R-squared of 83.56.
- Principal Component Analysis: Captured 83.43% variance with the first three components.

#### Model 2 & 3: Soil Temperature at Midnight and Noon
- Multiple Linear Regression: Explained 83.97% (midnight) and 80.44% (noon) of variability.
- Regularized Regression: Ridge and Lasso confirmed model overfitting and multicollinearity.
- Principal Component Analysis: Similar strong variance explanation with minor differences between models.

#### Model 4: Soil Moisture (15 cm Depth)
- Multiple Linear Regression: Explained 29.43% variability; highlighted other factors like rainfall might better explain soil moisture.
- Regularized Regression: Lasso indicated dew point and air temperature as significant predictors.
- Principal Component Analysis: Selected four components explaining a substantial portion of variance.

### Conclusions

1. **Soil Temperature**: Significantly influenced by dew point, humidity, and air temperature.
2. **Multicollinearity**: Ridge and Lasso regression effectively managed multicollinearity, with Lasso simplifying the model.
3. **Diurnal Variation**: Soil temperature changes contrary to air temperature, cooling off until midday and warming afterward.
4. **Model Fit**: Regularized regression models were more appropriate than multiple regression for this dataset.
5. **Soil Moisture**: Low R-squared value indicated other factors like rainfall might better explain soil moisture variability.
6. **Future Work**: Extend sample size and apply time series analysis to explore additional patterns such as cycles, seasonality, and trends.

### How to Use

1. **Data Preparation**: Ensure data is collected and averaged as described.
2. **Model Implementation**: Use Python with libraries such as Pandas, NumPy, TensorFlow, and Scikit-learn to build and evaluate the models.
3. **Visualization**: Employ Matplotlib and Seaborn for plotting and visualizing the results.
4. **Regularization Techniques**: Apply Ridge and Lasso regression for better model performance and interpretability.
5. **Principal Component Analysis**: Use PCA to handle multicollinearity and reduce dimensionality.

### Requirements

- Python 3.x
- Pandas
- NumPy
- TensorFlow
- Scikit-learn
- Matplotlib
- Seaborn

### Running the Project

1. **Data Collection**: Gather and preprocess the data as per the specified period and frequency.
2. **Model Building**: Implement the statistical models and evaluate their performance.
3. **Visualization**: Generate plots to visualize the relationship between predictors and the response variables.
4. **Interpret Results**: Analyze the model outputs and derive insights based on the statistical significance and model fit.

### Contact

For further information or questions, please contact the project maintainer at [jsreddydsai@gmail.com](mailto:jsreddydsai@gmail.com).
