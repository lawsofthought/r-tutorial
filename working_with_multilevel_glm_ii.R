library(lme4)

Df <- read.csv('data/EmoObjectCues.csv')

Df$Subject <- factor(Df$Subject)

M.0 <- lmer(logRT ~ 1 + (1|Subject) + (1|WordsPresented), data=Df)
M.1 <- lmer(logRT ~ CueType + (1|Subject) + (1|WordsPresented), data=Df)
M.2 <- lmer(logRT ~ DirectGenDK + (1|Subject) + (1|WordsPresented), data=Df)
M.3 <- lmer(logRT ~ CueType + DirectGenDK + (1|Subject) + (1|WordsPresented), data=Df)

anova(M.0, M.1)
anova(M.0, M.2)
anova(M.1, M.3)

##############################

Df <- read.csv('data/ABV.csv')
I <- !is.na(Df$RT1)
Df <- Df[I,]
Df$Participant <- factor(Df$Participant)

M <- lmer(log(RT1) ~ Order +  (1|Speaker) + (1|ABVG1) + (1|Participant), data=Df)
M <- glmer(Accuracy.1 ~ Order +  (1|Speaker) + (1|ABVG1) + (1|Participant), data=Df, family=binomial)