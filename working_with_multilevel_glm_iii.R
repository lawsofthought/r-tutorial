library(lme4)

Df <- read.csv('data/ABV.csv')
I <- !is.na(Df$RT1)
Df <- Df[I,]
Df$Participant <- factor(Df$Participant)

M <- lmer(log(RT1) ~ Order +  (1|Speaker) + (1|ABVG1) + (1|Participant), data=Df)
M <- glmer(Accuracy.1 ~ Order +  (1|Speaker) + (1|ABVG1) + (1|Participant), data=Df, family=binomial)
