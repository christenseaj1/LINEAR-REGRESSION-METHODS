# R Assignments: Data Science and Statistics

This repository contains a collection of R assignments completed as part of the Statistics coursework at Roanoke College. Each assignment focuses on different statistical techniques, predictive modeling methods, and dataset explorations using R.

## Assignments Overview

### 1. **Multiple Linear Regression**
- **Objective**: Utilize multiple linear regression to predict outcomes such as exam scores and cigarette sales.
- **Datasets**: 
  - [Examination Data](https://www1.aucegypt.edu/faculty/hadi/RABE6/Data6/Examination.Data.txt)
  - [Cigarette Consumption Data](https://www1.aucegypt.edu/faculty/hadi/RABE6/Data6/Cigarette.Consumption.txt)
- **Key Methods**: Model comparison, hypothesis testing, ANOVA.

### 2. **Checking Assumptions**
- **Objective**: Assess assumptions of linear models using diagnostics such as residuals and leverage.
- **Dataset**: [Exercise Data](https://www1.aucegypt.edu/faculty/hadi/RABE6/Data6/Exercise5.12.txt)
- **Key Methods**: Residual analysis, leverage, Cook’s distance.

### 3. **Categorical Predictors**
- **Objective**: Investigate the effects of categorical predictors in regression models.
- **Dataset**: Randomly generated categorical and quantitative data.
- **Key Methods**: Dummy variables, residual analysis, model comparison.

### 4. **Ridge Regression**
- **Objective**: Apply Ridge Regression to handle multicollinearity and predict salaries based on baseball performance metrics.
- **Dataset**: `Hitters` dataset from the `ISLR` package.
- **Key Methods**: Ridge regression with cross-validation, multicollinearity detection using VIF, coefficient shrinkage.

### 5. **Variable Selection Procedures**
- **Objective**: Compare various variable selection methods, such as forward, backward, and stepwise selection, to build optimal regression models.
- **Dataset**: [House Sales Data](http://www1.aucegypt.edu/faculty/hadi/RABE5/Data5/P329.txt)
- **Key Methods**: Stepwise selection using AIC/BIC, manual refinement with |t|>1 criteria, multicollinearity assessment with VIF.

---

## Project Structure


```
R-Assignments/
LINEAR-REGRESSION-METHODS/
├── Multiple Linear Regression Assignment/
│   ├── Multiple_Linear_Regression.R
│   └── README.md
├── Checking Assumptions Assignment/
│   ├── Checking_Assumptions.R
│   └── README.md
├── Categorical Predictors Assignment/
│   ├── Categorical_Predictors.R
│   └── README.md
├── Ridge Regression Assignment/
│   ├── Ridge_Regression.R
│   └── README.md
├── Variable Selection Assignment/
│   ├── Variable_Selection.R
│   └── README.md
└── README.md (This file)
```

## How to Run

1. Clone the repository:
   ```bash
   git clone https://github.com/christenseaj1/LINEAR-REGRESSION-METHODS.git
   cd R-Assignments

2. Open each .R file in RStudio to view the models and statistical analysis.
