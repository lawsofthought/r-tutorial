library(lme4)

Df <- read.csv('data/LexicalDecision.csv')

# Log transform the reaction times
Df$loglatency <- log(Df$latency) 

# Attach this new variable to the Df frame using name "valence.category"
Df$valence.category <- cut(Df$valence, 
                           breaks = c(0, 3, 6, 10), 
                           labels = c('negative', 'neutral', 'positive'))



# Accurate responses only
I <- Df$accuracy == 1 

# Reaction time analysis
M.rt <- lmer(loglatency ~ frequency + (1|item) + (1|subject), data=Df[I,]) 

# Accuracy analysis
M.accuracy <- glmer(accuracy ~ frequency + (1|item) + (1|subject), data=Df, family=binomial) 

# Model comparison
M.rt.1 <- lmer(loglatency ~ frequency + valence.category + (1|item) + (1|subject), data=Df[I,])
M.rt.0 <- lmer(loglatency ~ frequency + (1|item) + (1|subject), data=Df[I,])
anova(M.rt.0, M.rt.1)

# A p-value package
library(lmerTest)
M.rt.0 <- lmer(loglatency ~ frequency + (1|item) + (1|subject), data=Df[I,])