library(lme4)
data("sleepstudy")

# Plot all data points
plot(Reaction ~ Days, 
     pch=16,
     col='red',
     data=sleepstudy)

# Plot data on subject by subject basis 
xyplot(Reaction ~ Days | Subject,
       type=c('p', 'r', 'g'),
       index = function(x,y) coef(lm(y~x))[2],
       data=sleepstudy)

# Multilevel linear regression analysis
# Looking at effect of days without sleep on reaction time
# where this effect can vary randomly across subjects
M.sleep <- lmer(Reaction ~ Days + (Days | Subject),
                data=sleepstudy)


# Fixed effect linear relationship: 
# Reaction time ~ intercept + slope * Days
# Random variability in intercept only
M <- lmer(Reaction ~ 1 + Days + (1| Subject),
          data = sleepstudy)

# Fixed effect linear relationship: 
# Reaction time ~ intercept + slope * Days
# Random variability in slope only 
M <- lmer(Reaction ~ 1 + Days + (0 + Days| Subject),
          data = sleepstudy)

# Fixed effect linear relationship: 
# Reaction time ~ intercept + slope * Days
# Random variability in both intercept and slope 
M <- lmer(Reaction ~ 1 + Days + (1 + Days| Subject),
          data = sleepstudy)

# Fixed linear relationship: 
# Reaction time ~ intercept
# Random variability in intercept
M <- lmer(Reaction ~ 1 + (1 + Days| Subject),
          data = sleepstudy)
