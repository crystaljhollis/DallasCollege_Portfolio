# Maternal Mortality Analysis

## Overview
This project analyzes disparities in maternal mortality rates using racial and demographic data. The goal is to provide actionable insights into healthcare inequities and highlight areas requiring intervention.

## Features
- Data preprocessing and engineering for analysis.
- Regression modeling for predicting maternal mortality rates.
- Visualization of racial and demographic disparities using **seaborn** and **plotly**.
- Insights and conclusions based on data-driven results.

## Data
The dataset includes the following columns:
- **Maternal Mortality Rate**: Target variable representing maternal mortality rates.
- **Racial and Age Subgroups**:
  - Subgroup_Hispanic
  - Subgroup_Black, Non-Hispanic
  - Subgroup_Asian, Non-Hispanic
  - Subgroup_American Indian or Alaska Native, Non-Hispanic
  - Subgroup_Native Hawaiian or Other Pacific Islander, Non-Hispanic
  - Subgroup_Under 25 years
  - Subgroup_25-39 years
  - Subgroup_40 years and over

## Dependencies
Ensure the following Python libraries are installed:
- pandas
- numpy
- matplotlib
- seaborn
- scikit-learn
- autogluon
- feature-engine
- plotly
- sweetviz

Install dependencies with:
```bash
pip install -r requirements.txt
```

## Usage
### 1. Preprocessing and Prediction
The project begins by preprocessing the data and building a regression model for maternal mortality prediction.

### 2. Visualizing Disparities
Run the visualization scripts to generate the following plots:
- **Bar Plot**: Displays maternal mortality rates by racial subgroups.
- **Interactive Plot**: Allows exploration of mortality rates using plotly.

### 3. Insights
The conclusions focus on disparities in maternal mortality rates and suggest actionable steps to address healthcare inequities.

## Running the Code
1. Clone this repository or download the project files.
2. Ensure the dataset (`engineered_data.csv`) is available in the working directory.
3. Run the Jupyter notebook (`maternalmortality.ipynb`) to execute the analysis step by step.

### Key Scripts
- **Data Analysis and Visualization**:
  - Plots maternal mortality rates by racial and demographic subgroups.
- **Model Training and Prediction**:
  - Uses regression models to predict mortality rates based on subgroup data.

## Insights and Conclusions
The analysis highlights significant racial and socioeconomic disparities in maternal mortality rates. This project underscores the importance of targeted healthcare interventions to improve outcomes for underserved populations.

## License
This project is licensed under the MIT License. See the LICENSE file for details.

