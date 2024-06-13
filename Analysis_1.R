library(readxl)
data<-read_excel("C:/Jayavardhan/3rd sem/DA2/Project/Analysis_1.xlsx")
head(data)
dim(data)
cleaned_data=na.omit(data)
dim(cleaned_data)

# Load necessary library
library(ggplot2)
library(tidyr)
library(dplyr)

model<-lm(SoilTemp_10cm~.-Date,data=data)
summary(model)

par(mfrow = c(2, 2))  # Set the plotting area to a 2x2 array

# 1. Residuals vs Fitted plot to check for linearity and homoscedasticity
plot(model, which = 1)

# 2. Normal Q-Q plot to check the normality of residuals
plot(model, which = 2)

# 3. Scale-Location plot (Spread-Location) to check homoscedasticity
plot(model, which = 3)

# 4. Residuals vs Leverage plot to check for independence of residuals
plot(model, which = 5)

# Reset the plotting area to default
par(mfrow = c(1, 1)


library(glmnet)
x <- as.matrix(data[, -which(names(data) %in% c("Date", "SoilTemp_10cm"))])
y <- data$SoilTemp_10cm
#Ridge 
cv_model <- cv.glmnet(x, y, alpha = 0)
plot(cv_model)
best_lambda <- cv_model$lambda.min
best_lambda
best_model <- glmnet(x, y, alpha = 0, lambda = best_lambda)
coef(best_model)
y_predicted <- predict(best_model, s = best_lambda, newx = x)
plot(y, y_predicted)
#find SST and SSE
sst <- sum((y - mean(y))^2)
sse <- sum((y_predicted - y)^2)
#find R-Squared
rsqridge <- 1 - sse / sst
rsqridge
##Lasso
cv_model1 <- cv.glmnet(x, y, alpha = 1)
plot(cv_model1)
best_lambda1 <- cv_model1$lambda.min
best_lambda1
best_model1 <- glmnet(x, y, alpha = 1, lambda = best_lambda1)
coef(best_model1)
y_predicted1 <- predict(best_model1, s = best_lambda1, newx = x)
plot(y, y_predicted1)
#find SST and SSE
sst1 <- sum((y - mean(y))^2)
sse1 <- sum((y_predicted1 - y)^2)
#find R-Squared
rsq1lasso <- 1 - sse1 / sst1
rsq1lasso


library(car)
vif(model)
plot(vif(model))

library(pls)

##pcr
pcr_fit=pcr(SoilTemp_10cm~.-Date,data=data,scale=TRUE,validation="CV")
summary(pcr_fit)
predplot(pcr_fit)
validationplot(pcr_fit, val.type = "MSEP")
validationplot(pcr_fit, val.type = "R2")


pcr_fit1=pcr(SoilTemp_10cm~.-Date,data=data,scale=TRUE,ncomp=3)
predplot(pcr_fit1)


###plsr
plsr_fit = plsr(SoilTemp_10cm~.-Date,data=data, scale = TRUE, validation = "CV")
summary(plsr_fit)
validationplot(plsr_fit, val.type = "MSEP")
validationplot(plsr_fit, val.type = "R2")
plsr_fit1 = plsr(SoilTemp_10cm~.-Date,data=data, scale = TRUE, ncomp = 3)
summary(plsr_fit1)
predplot(plsr_fit1)




