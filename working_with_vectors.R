#################################
# Working with vectors 
#################################
# A vector is an array of numbers

x <- c(18,11,19,12,11,16,14,11,19,18,16,19,
       13,12,20,20,19,13,14,17,17,14,13,15,
       18,19,13,18,13,18,14,12,19,12,13,19,
       13,14,16,12,17,11,11,20,15,19,19,12,
       13,19,13,13,19,15,16,19,19,19,15,17,
       17,13,18,16,13,18,19,13,18,11,19,17,
       13,13,15,14,20,11,14,19,11,14,12,13,
       18,11,18,18,14,11,18,18,14,19,11,18,
       17,18,19,11)

# How many data points, observations?
length(x)

# What is the value of the 68th element?
x[68]

# What are the values of elements 12 to 18?
x[12:18]

# What are the values of elements 17, 89, 39, 42?
x[c(17, 89, 39, 42)]

# What is the mean of the data?
mean(x)

# What is the standard deviation of the data?
sd(x)

# What is the variance, maximum absolute deviation, interquartile range, range, minimum, maximum, median
var(x)
mad(x)
IQR(x)
range(x)
min(x)
max(x)
median(x)

# What are the 0%  25%  50%  75% 100% percentiles?
quantile(x)

# What the 0.025, 0.05, 0.95, 0.975 percentiles?
quantile(x, probs=c(0.025, 0.05, 0.95, 0.975))

# What is the frequency distribution of the data?
table(x)

# How many values are equal to 11?
sum(x==11)

# How man values are equal to or less than 17?
sum(x <= 17)

# How many values or equal to 17 or equal to 20?
sum(x == 17 | x == 20)

# Which values are less than 15?
x[x < 15]


# Add the values "17, 18, 22" to the original data 
x <- c(x, c(17, 18, 22))
