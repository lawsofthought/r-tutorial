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
