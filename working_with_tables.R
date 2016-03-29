#####################################
# Working with tables
#####################################

# Load up Titanic data 
data("Titanic")

# How many dimensions?
dim(Titanic)

# What are the dimensions?
dimnames(Titanic)

# All classes, just males, all ages, just survivors
Titanic[,'Male',,'Yes']

# Marginalize by dimension 2, i.e. Sex
apply(Titanic, 2, sum)

# Marginalize by dimension 1 and 2, i.e. Class and Sex
apply(Titanic, c(1,2), sum)


# a. The proportion of males (children and adults) who survived.
male.survivors <- apply(Titanic, c(4,2), sum)['Yes','Male']
all.males <- apply(Titanic, 2, sum)['Male']

male.survivors/all.males


# b. The proportion of females (children and adults) who survived.
# c. The proportion of 1st class passengers who survived.
# d. The proportion of 2nd class passengers who survived.
# e. The proportion of 3rd class passengers who survived.
# f. The proportion of 2nd class male passengers who survived.
apply(Titanic, c(1, 2, 4), sum)[,,2] / apply(Titanic, c(1, 2), sum)