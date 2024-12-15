# Assignment: Variable Selection 

## Overview
This assignment focuses on variable selection in linear regression using the `house` dataset. We will identify the most significant predictors for house sale prices through methods like VIF, stepwise selection, and manual model refinement.

## Key Concepts
- **Variable Selection**: Techniques to identify the most relevant predictors in a regression model.
- **Variance Inflation Factor (VIF)**: Assessing multicollinearity among predictor variables.
- **Stepwise Selection**: Using AIC and BIC criteria for forward and backward model selection.
- **Assumption Testing**: Verifying linear regression assumptions including linearity, independence, homoscedasticity, and normality of residuals.

## How to Run
- Open `Variable_Selection.R` in RStudio.
- Install the required packages by running the installation commands included in the R code
- Execute the R code to perform data loading, variable selection, model fitting, and assumption checks.

## Dataset
- **Source**: [House Sales Data](http://www1.aucegypt.edu/faculty/hadi/RABE5/Data5/P329.txt)
- **Variables**:
  - **Y**: Sale Price
  - **X1**: Taxes
  - **X2**: Bathrooms
  - **X3**: Lot size
  - **X4**: Living Space
  - **X5**: Garage Stalls
  - **X6**: Number of Rooms
  - **X7**: Bedrooms
  - **X8**: Age of House
  - **X9**: Number of Fireplaces
