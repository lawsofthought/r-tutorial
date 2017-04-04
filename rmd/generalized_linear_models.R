#####################
# Logistic regression
#####################

load('data/affairs.Rda')

# Create a variable the indicates if 
# a person is a dirty cheat or not.
Affairs$cheater <- Affairs$affairs > 0

M <- glm(cheater ~ gender, 
         data=Affairs, 
         family=binomial)


# Predictions
hypothetical.data <- data.frame(gender=c('male', 'female'))

predict(M, newdata=hypothetical.data) # these are log odds
#l.outcome.female <- -1.2164 + 0.2356 * 0
#l.outcome.male <- -1.2164 + 0.2356 * 1 

# To get probabilities 
ilogit <- function(x){1/(1+exp(-x))}

logodds <- predict(M, newdata=hypothetical.data) # these are log odds
names(logodds) <- c('Male', 'Female')
ilogit(logodds)

# or else, just do
predict(M, newdata=hypothetical.data, type='response') 


#################
# Probability of cheating as a function of
# religiousness
M <- glm(cheater ~ religiousness, 
         data=Affairs, 
         family=binomial)


religiousness.range <- seq(1, 5, length.out=1000)
hypothetical.data <- data.frame(religiousness=religiousness.range)

prob.cheater.relig <- predict(M, newdata=hypothetical.data, type='response')

plot(prob.cheater.relig ~ religiousness.range,
     type='l',
     lwd=3,
     col='red',
     xlab='Religiousness',
     ylab='Probability of cheating',
     main='Predicted probability of cheating')


#### Using all predictors
M <- glm(cheater ~ gender + age + yearsmarried
         + children + religiousness + education
         + occupation + rating, 
         data=Affairs, 
         family=binomial)

# This is the "null" model, i.e. no predictors
M.null <- glm(cheater ~ 1, 
         data=Affairs, 
         family=binomial)

M.subset <- glm(cheater ~ age + yearsmarried 
                   +  religiousness + rating, 
                data=Affairs, 
                family=binomial)

M.subset.2 <- glm(cheater ~ age + yearsmarried
         + children + religiousness + education
         + occupation + rating, 
         data=Affairs, 
         family=binomial)


# Model comparison
anova(M.null, M, test='Chisq')
anova(M.subset, M, test='Chisq')
anova(M.subset.2, M, test='Chisq')


## The odds ratios for the coefficients is as simple as:
odds.ratios <- exp(M$coefficients)
# These give the factor by which the odds (of the outcome) 
# change for every unit change of the predictor variable.


#####################
# Poisson regression
#####################

M <- glm(affairs ~ gender + age + yearsmarried
         + children + religiousness + education
         + occupation + rating, 
         data=Affairs, 
         family=poisson)

M.null <- glm(affairs ~ 1, 
              data=Affairs, 
              family=poisson)

# Model fit comparison of null and full based on the "Deviance"
anova(M.null, M, test='Chisq')