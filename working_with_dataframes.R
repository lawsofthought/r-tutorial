# Open Df frame
Df <- read.csv('data/LexicalDecision.csv', header=T)

###############################
# Viewing, summaries etc
###############################

# View Df frame
View(Df)

# Show first few rows 
head(Df)

# Show first 10 rows 
head(Df, 10)

# Show first 20 rows 
head(Df, 20)

# Provide a summary of variables
summary(Df)


###############################
# Renaming variables
###############################

# Get the names of the variables
names(Df)

# Rename name of second column
names(Df)[2] <- 'words'

# Rename names of second and third column
names(Df)[c(2, 3)] <- c('words', 'correct')


###############################
# Adding/deleting new variables to Df frame
###############################

# Add new variable called loglatency that is the log of the latency
Df$loglatency <- log(Df$latency)

# Delete the variable that is named loglatency 
Df$loglatency <- NULL


###############################
# Discretizing continuous variables
###############################

# Create a binary variable that indicates if rt is < 500
Df$fast.rt <- Df$latency < 500

# Cut the valence variable into three parts
# values in [0, 3) are labelled "negative"
# values in [3, 6) are labelled "neutral"
# values in [6, 10) are labelled "positive"
# Attach this new variable to the Df frame using name "valence.category"
Df$valence.category <- cut(Df$valence, 
                             breaks = c(0, 3, 6, 10), 
                             labels = c('negative', 'neutral', 'positive'))


###############################
# Subsets of the Df frame
###############################

# Rows 1 to 10, columns "subject" and "frequency"
Df[1:10, c('subject','frequency') ]

# All rows, and just columns 1 and 3
Df[, c(1, 3)]

# All rows, and all columns *except* 1 and 3
Df[, c(-1, -3)]

# All rows of Df frame where the latency variable is greater than 2000
subset(Df, latency > 2000)

# All rows of Df frame where the accuracy variable is equal to 1 (i.e. correct)
subset(Df, accuracy == 1)

# All rows of Df frame where the accuracy variable is equal to 1 (i.e. correct)
# *AND* latency variable is less than 2000
subset(Df, accuracy == 1 & latency < 2000)


#################################
# Combining and merging data ####
#################################

lexicon.A <- read.csv('data/lexiconA.csv', header=T)
lexicon.B <- read.csv('data/lexiconB.csv', header=T)
lexicon.C <- read.csv('data/lexiconC.csv', header=T)
behav.data <- read.csv('data/data.csv', header=T)

# Stack lexicon.A and lexicon.C on top of each other
lexicon <- rbind(lexicon.A, lexicon.C)

# Stack lexicon.A and behav.data side by side
Df <- cbind(lexicon.A, behav.data)

# Merge lexicon.A and lexicon.B based on common variables
lexicon <- merge(lexicon.A, lexicon.B)

# Merge lexicon.A and lexicon.B based on common variables (including unmatched observations)
lexicon <- merge(lexicon.A, lexicon.B)


###############################
# Aggregations over variables
###############################

# Aggregate the latency over valence category
aggregate(latency ~ valence.category, Df=Df, mean)
aggregate(latency ~ valence.category, Df=Df, median)
aggregate(latency ~ valence.category, Df=Df, sd)

# Aggregate the latency and accuracy over valence category
aggregate(cbind(latency, accuracy) ~ valence.category, Df=Df, mean)

# Aggregate the latency and accuracy over valence category by subject
aggregate(cbind(latency, accuracy) ~ valence.category + subject, Df=Df, mean)


#####################################
# Long to wide format; wide to long
#####################################

# Get reshape2 package
library(reshape2)

# First get a "long" Df set 
df.long <- aggregate(latency ~ valence.category + subject, Df=Df, mean)

# convert long to wide 
# template is dcast(df, "ID variables" ~ "variables to swing into cols", value.var = value)
df.wide <- dcast(df.long, subject ~ valence.category, value.var = 'latency')


# Working on the original Df frame also works, if we aggregate ....
dcast(Df, subject ~ valence.category, value.var = 'latency', fun.aggregate = mean)

# Going back to long from wide 
df.long.2 <- melt(df.wide, 
                  id.vars = c('subject'), 
                  variable.name = 'valence', 
                  value.name = 'latency')
