############################
### T-test #################
############################

# Independent samples t-test

set.seed(101)
x <- rnorm(10)
y <- rnorm(12)

t.test(x, y)

# or, if we assume variance equal, 
t.test(x, y, var.equal=T)

# Save the output
M <- t.test(x, y, var.equal=T)

# This will give us access to e.g. 
# The t-statistic
M$statistic
# The degrees of freedom
M$parameter
# The p-value
M$p.value

## By the way, we can confirm the p-value this way
pt(M$statistic, df=M$parameter, lower.tail = F) * 2

# A one sample t-test is
set.seed(102)
x <- rnorm(10)
t.test(x)


############################
### Binomial test ##########
############################

set.seed(103)
N <- 100
# Flip a fair coin N times 
coin.flips <- sample(c('Heads', 'Tails'), 
                     size=N, 
                     replace=TRUE)

n.heads <- sum(coin.flips=='Heads')
binom.test(n.heads, N)

############################
##### Mann Whitney #########
############################
set.seed(103)

x <- rnorm(10)
y <- rnorm(12)

wilcox.test(x, y) # Yes, I know it is not called Mann Whitney

n.x <- length(x)
n.y <- length(y)
sum(rank(c(x, y))[1:n.x]) - n.x*(n.x+1)/2


#####################################
##### Wilcoxon signed ranks #########
#####################################

set.seed(103)

x <- rnorm(10)
y <- rnorm(10)
wilcox.test(x, y, paired = TRUE) 

####################################
#### Chi square test ###############
####################################

# Back to Kate and Leo on the Titanic
data(Titanic)

# 2 x 2 table: Sex by Survival 
titanic.data <- apply(Titanic, c(2, 4), sum)

M <- chisq.test(titanic.data)

# We can check things easily too 
# This will be the Chi sq statistic 
sum((M$observed - M$expected)^2/M$expected)

# Expected frequencies are row-totals by col-totals by total-total 
apply(titanic.data, 1, sum) %o% apply(titanic.data, 2, sum) / sum(titanic.data)


############################
### Correlation ##########
############################

set.seed(105)
N <- 20

x <- rnorm(N)
y <- rnorm(N)
cor.test(x, y) # Pearson
cor.test(x, y, method='spearman')
