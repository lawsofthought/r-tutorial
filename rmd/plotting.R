# Open Df frame
Df <- read.csv('data/LexicalDecision.csv', header=T)


###############################
# Histograms
###############################
# Histogram of log of latency variable 
hist(log(Df$latency))

# Histogram of log of latency variable, 25 bins
hist(log(Df$latency), 25)

# Histogram of log of latency variable, 25 bins
# But just prettier
hist(log(Df$latency), 
     xlab='Log of Latency',
     ylab='Frequency',
     xlim=c(5.5, 8),
     main='My prettier histogram',
     breaks=25)


###############################
# Plotting 
###############################
# Plot latency as a function of frequency 
plot(latency ~ frequency, data=Df)

# Plot latency as a function of log frequency
plot(latency ~ log(frequency), data=Df)


# Plot latency as a function of valence
# but with labels etc 
plot(latency ~ log(frequency), 
     xlim=c(-1, 6),
     ylim=c(0, 1500),
     xlab='Log of word frequency',
     ylab="Reaction time (seconds)",
     main='Predicting reaction times',
     pch=16,
     cex=0.5,
     col='blue',
     data=Df)
abline(lm(latency ~ log(frequency), data=Df), col='red', lwd=3)


##################################
## ggplotting 
##################################
library(ggplot2)

# A scatter plot
ggplot(Df, aes(x=log(frequency), y=latency)) + geom_point()

# A scatter plot with line of best fit plus error
ggplot(Df, aes(x=log(frequency), y=latency)) + 
  stat_smooth(method='lm') + 
  geom_point()

# A scatter plot with line of best fit plus error
# with tighter axes
ggplot(Df, aes(x=log(frequency), y=latency)) + 
  stat_smooth(method='lm') + 
  geom_point(size=2, shape=5, colour='blue') +
  coord_cartesian(xlim = c(0, 5), ylim=c(250, 1000)) 
  

# Load a new data set
load('data/beautyeval.Rda')

# Make scatterplot, point colour by male/female
ggplot(beautydata, aes(x=beauty, y=eval, colour=sex)) + 
  geom_point(size=3) +
  scale_color_manual(values=c('blue', 'red')) +
  scale_y_continuous(name='Teaching evaluation score') +
  scale_x_continuous((name='Attractiveness rating'))

# Scatterplot, with lines of best fit and errors
ggplot(beautydata, aes(x=beauty, y=eval, colour=sex)) + 
  stat_smooth(method='lm') + 
  geom_point(size=3) +
  scale_color_manual(values=c('blue', 'red')) +
  scale_y_continuous(name='Teaching evaluation score') +
  scale_x_continuous((name='Attractiveness rating')) +
  theme(axis.text=element_text(size=14),
        axis.title=element_text(size=16, face="bold"))


# Scatterplot, with lines of best fit and errors
# one per tenure group
ggplot(beautydata, aes(x=beauty, y=eval, colour=sex)) + 
  stat_smooth(method='lm') + 
  geom_point(size=3) +
  scale_color_manual(values=c('blue', 'red')) +
  scale_y_continuous(name='Teaching evaluation score') +
  scale_x_continuous((name='Attractiveness rating')) +
  facet_grid(. ~ tenure) +
  theme(axis.text=element_text(size=14),
        axis.title=element_text(size=16, face="bold"))

