#Andrew Christensen
#Install the package ISLR to get baseball data
install.packages('ISLR')
install.package('tidyverse')
install.packages('GGally')


require(ISLR)
require(tidyverse)
require(GGally)

#Load the data
data("Hitters")

#Remove the observations with missing data
hitters<-na.omit(Hitters)

#Check the data
head(hitters)

#Predictor variables we will consider
vars <- c("Hits", "HmRun", "RBI", "Walks")

# Create a subset of the data with Salary and the selected variables
hitters_subset <- hitters %>%
  select(Salary, all_of(vars))

# Display the subset
head(hitters_subset)


#Q: Use OLS to make a model explaining Salary by the variables
#Hits, HmRun, RBI, Walks and show the summary of the model.
ols_model <- lm(Salary ~ ., data = hitters_subset)
summary(ols_model)


#Q: Are the signs of any of the variables surprising?  Explain.
## Overall, the model is significant but "Walks" is the highest significant predictor
## with an Estimate of 5.2305 and p-value of .0002. The model explains about 26%
## of variance to Salary. This means there could be other variables influencing salary.


#Q: Use ggpairs show scatterplots of all pairs of variables.
ggpairs(hitters, title = "Scatterplot of Hitters' Variables")
ggpairs(hitters_subset, title = "Scatterplot of Hitters' Subset Variables")


#Q: Calculate the VIF for RBI by hand.
rbi_model <- lm(RBI ~ Hits + HmRun + Walks, data = hitters)
r2 <- summary(rbi_model)$r.squared
vif_manual <- 1 / (1 - r2)
vif_manual


#Q: Use the vif() function in the car package to calculate the
#VIF for all predictor varaibles.
install.packages("car")
library(car)

## OLS model (Hitters Subset)
vif_values <- vif(ols_model)
vif_values

## All Predictors (Hitters original)
ols_model_all <- lm(Salary ~ ., data = hitters)
vif_values_all <- vif(ols_model_all)
vif_values_all


#Q: Use ridge regression to make a model explaining salary by the
#4 predictor variables.
install.packages("glmnet")
library(glmnet)
library(dplyr)
y <- hitters_subset$Salary
X <- as.matrix(hitters_subset %>% select(-Salary))
ridge_cv <- cv.glmnet(X, y, alpha = 0)
plot(ridge_cv)
ridge_cv$lambda.min


#Q: Display the coefficients of the model for ridge regression and
#write down the fitted model.
ridge_model <- glmnet(X, y, alpha = 0, lambda = ridge_cv$lambda.min)
coef(ridge_model)

## Y^ = 60.14 + 1.42 x Hits + 2.38 × HmRun + 2.46 × RBI + 4.1 × Walks

#Q: Use the model to predict the salary of player with
# Hits=200,HmRun=30,RBI=80,Walks=70
player <- data.frame(Hits = 200, HmRun = 30, RBI = 80, Walks = 70) predicted_salary <- predict(ridge_model, newx = as.matrix(player)) predicted_salary