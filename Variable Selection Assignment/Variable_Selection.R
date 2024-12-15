#HW C12 - Variable Selection Procedures
require(tidyverse)
require(GGally)
require(car)

house<-read.table('http://www1.aucegypt.edu/faculty/hadi/RABE5/Data5/P329.txt',header=T, sep='\t')

#Y - Sale Price
#X1 - Taxes
#X2 - Bathrooms
#X3 - Lot size
#X4 - Living Space
#X5 - Garage Stalls
#X6 - Number of Rooms
#X7 - Bedrooms
#X8 - Age of House
#X9 - Number of Fireplaces

#Q - Use ggpairs to see if there are any outliers in the data 
# and if any of the relationships between the variables look non-linear.
ggpairs(house)
## There are potentional outliers in our data but we will need further statistical analysis to verify this.


#Q - Calculate the VIF to check for collinearity.  Do you think that 
# ridge or lasso regression should be used in the example?
fit.full <- lm(Y ~ ., data = house)
vif(fit.full)

## Our highest VIF is X6 with a value of 11.7108.
## With the amount of predictors we can perform lasso regression to clean our model up a bit.
## Given that X6 = Number of Rooms, it is not as much of an important factor, therefore we can remove this predictor.


#Q - Using the step() function to suggest a model using the forward
# fitting method with the AIC as the stopping condition.
fit.null <- lm(Y ~ 1, data = house)
step(fit.null, scope = list(lower = fit.null, upper = fit.full), direction = "forward")

## Our suggested model stops at Y ~ X1 + X2 with an AIC = 52.69


#Q - Using the step() function to suggest a model using the forward
# fitting method with the BIC as the stopping function.
step(fit.null, scope = list(lower = fit.null, upper = fit.full), direction = "forward", k = log(30))

## Our suggested model stops at Y ~ X1 + X2 with an AIC = 56.89
## Given that AIC and BIC both select the same model shows that these predictors are robust.

#Q - Using the step() function to suggest a model using the backward
# fitting method with the AIC as the stopping function.
step(fit.full, direction = "backward")

## Our suggested model stops at Y ~ X1 + X3 with an AIC = 118


#Q - Using the AIC stopping method and the forward fit find identify the model as you 
# did before.  Now use the |t|>1 method to see if any of the variables should
# be added to you model using this criteria.  
# So, find model using forward fit with AIC.  Then add each variable individually 
# to that model to see if any show up as important based on |t|>1.

## - FORWARD FIT MODEL -
step(fit.null, scope = list(lower = fit.null, upper = fit.full), direction = "forward")
fit.AIC <- lm(Y ~ X1 + X2, data = house)

## - |t|>1 METHOD -

fit123 <- lm(Y ~ X1 + X2 + X3, data = house)
summary(fit123)$coefficients
fit124 <- lm(Y ~ X1 + X2 + X4, data = house)
summary(fit124)$coefficients
fit125 <- lm(Y ~ X1 + X2 + X5, data = house)
summary(fit125)$coefficients
fit126 <- lm(Y ~ X1 + X2 + X6, data = house)
summary(fit126)$coefficients
fit127 <- lm(Y ~ X1 + X2 + X7, data = house)
summary(fit127)$coefficients
fit128 <- lm(Y ~ X1 + X2 + X8, data = house)
summary(fit128)$coefficients
fit129 <- lm(Y ~ X1 + X2 + X9, data = house)
summary(fit129)$coefficients

## Add X9 because greatest |t| = 1.1795

fit1293 <- lm(Y ~ X1 + X2 + X9 + X3, data = house)
summary(fit1293)$coefficients
fit1294 <- lm(Y ~ X1 + X2 + X9 + X4, data = house)
summary(fit1294)$coefficients
fit1295 <- lm(Y ~ X1 + X2 + X9 + X5, data = house)
summary(fit1295)$coefficients
fit1296 <- lm(Y ~ X1 + X2 + X9 + X6, data = house)
summary(fit1296)$coefficients
fit1297 <- lm(Y ~ X1 + X2 + X9 + X7, data = house)
summary(fit1297)$coefficients
fit1298 <- lm(Y ~ X1 + X2 + X9 + X8, data = house)
summary(fit1298)$coefficients

## Add X8 because greatest |t| = -1.132

fit12983 <- lm(Y ~ X1 + X2 + X9 + X8 + X3, data = house)
summary(fit12983)$coefficients
fit12984 <- lm(Y ~ X1 + X2 + X9 + X8 + X4, data = house)
summary(fit12984)$coefficients
fit12985 <- lm(Y ~ X1 + X2 + X9 + X8 + X5, data = house)
summary(fit12985)$coefficients
fit12986 <- lm(Y ~ X1 + X2 + X9 + X8 + X6, data = house)
summary(fit12986)$coefficients
fit12987 <- lm(Y ~ X1 + X2 + X9 + X8 + X7, data = house)
summary(fit12987)$coefficients

## Add X5 because greatest |t| = 1.2156

fit129853 <- lm(Y ~ X1 + X2 + X9 + X8 + X5 + X3, data = house)
summary(fit129853)$coefficients
fit129854 <- lm(Y ~ X1 + X2 + X9 + X8 + X5 + X4, data = house)
summary(fit129854)$coefficients
fit129856 <- lm(Y ~ X1 + X2 + X9 + X8 + X5 + X6, data = house)
summary(fit129853)$coefficients
fit129857 <- lm(Y ~ X1 + X2 + X9 + X8 + X5 + X7, data = house)
summary(fit129853)$coefficients


#Q - Write down you final fitted model.

## Our Model stops at Y ~ X1 + X2 + X9 + X8 + X5
final.model <- lm(Y ~ X1 + X2 + X9 + X8 + X5, data = house)
summary(final.model)

#Q - Check the assumptions for linear regression for you model.  Do you 
# have any concerns?

## 1. Linearity - Signs of Outliers
house$final_model_residuals <- residuals(final.model)
house$final_model_fitted_values <- fitted.values(final.model)

ggplot(house, aes(x = final_model_fitted_values, y = final_model_residuals)) +
  geom_point() +
  geom_smooth(method = "lm", se = TRUE) +
  labs(title = "Residuals vs Fitted Values",
       x = "Fitted Values",
       y = "Residuals") +
  theme_minimal()
bptest(final.model)



## 2. Independence of Errors - No signs of Autocorrelation (DW = 1.9179, p-value = .4549)
library(lmtest)
dwtest(final.model)

## 3. Homoscedasticity - Not a strong funnel shape in the plot with some outliers. 
##                       BP test indicates no signs of heteroscedasticity. Not a huge concern. 

ggplot(house, aes(x = final_model_fitted_values, y = final_model_residuals)) +
  geom_point() +
  geom_smooth(method = "lm", se = TRUE) +
  labs(title = "Residuals vs Fitted Values",
       x = "Fitted Values",
       y = "Residuals") +
  theme_minimal()
bptest(final.model)

## 4. Normality of Errors - QQ plot shows that normality is acceptable. Minor deviations is all.

ggplot(house, aes(sample = final_model_residuals)) +
  stat_qq() +
  stat_qq_line(color = "blue") +
  labs(title = "QQ Plot of Residuals") +
  theme_minimal()

## 5. Collinearity - No signs of collinearity. All VIF < 5

vif(final.model)

