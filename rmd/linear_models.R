library(MASS)
library(car)
library(psych)
library(ggplot2)

#######################
### Linear models ####
######################

data(sat.act)

Df <- within(sat.act, 
             {gender <- factor(gender)}
)

# Simple linear regression
M <- lm(ACT ~ education, data=Df)
summary(M)

# Simple plot
plot(ACT ~ education, data=Df)
abline(M, lwd=3, col='red')

# Diagnostics 
plot(M)

# Confidence intervals
confint(M)

# Combine coefficients table with confidence intervals 
cbind(summary(M)$coefficients, confint(M))

# Make predictions
hypothetical.data <- data.frame(education = c(1, 2, 5, 10, 15))
predict(M, newdata=hypothetical.data)

# Multiple linear regression
M <- lm(ACT ~ education + age + gender, data=Df)
summary(M)

# Collinearity
vif(M)


# Ancova type stuff
M <- lm(Postwt ~ Prewt + Treat, data=anorexia)
summary(M)

prediction <- predict(M)
ggplot(data=cbind(anorexia, prediction),
       aes(x=Prewt, y=Postwt, color=Treat)) + 
  geom_point() +
  geom_line(aes(y=prediction))



### Model testing 
# Load data
load('data/beautyeval.Rda')


# Model 1: evaluation score as a function of beauty 
M.1 <- lm(eval ~ beauty, data=beautydata)

# Model 2: evaluation score as a function of beauty and sex 
M.2 <- lm(eval ~ beauty + sex, data=beautydata)

# Model 2: evaluation score as a function of beauty and sex and their interaction
M.3 <- lm(eval ~ beauty * sex, data=beautydata)

# Is there an interaction?
anova(M.2, M.3)