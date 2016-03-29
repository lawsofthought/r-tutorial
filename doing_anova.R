#####################
### Oneway Anova ####
#####################

# Oneway 
data(PlantGrowth)
M <- aov(weight ~ group, data=PlantGrowth)

# Tukey's range test 
TukeyHSD(M)

# Also, we can do Anova this way 
M <- lm(weight ~ group, data=PlantGrowth)
anova(M)

# Twoway 
data("ToothGrowth")

# Interaction plot
with(Df, 
     interaction.plot(dose, supp, len, lwd=3))

boxplot(len ~ supp * dose, data=ToothGrowth, ylab="Tooth Length", main="Boxplots of Tooth Growth Data")

M <- aov(len ~ supp*dose, data=ToothGrowth)


################################
### Repeated measures Anova ####
################################

# Oneway 
Df <- read.table('data/recall_data.txt', header=T)
M <- aov(Recall ~ Valence + Error(Subject/Valence), data=Df)

# Multiple comparisons, with Bonferroni correction
with(Df, 
     pairwise.t.test(x=Recall, g=Valence), 
     p.adjust.methods='bonferroni', 
     paired=T)


# Twoway
Df <- read.table('data/recall_data2.txt', header=T)

# Interaction plot
with(Df, 
     interaction.plot(Valence, Task, Recall, lwd=3))

M <- aov(Recall ~ Valence*Task + Error(Subject/(Task*Valence)), data=Df)