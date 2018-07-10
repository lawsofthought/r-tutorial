library(knitr)


purl('rmd/vectors.Rmd', output='tmp/vectors.R')

purl('rmd/dataframes.Rmd', output='tmp/dataframes.R')

purl('rmd/visualization.Rmd', output='tmp/visualization.R')

purl('rmd/linear_models.Rmd', output='tmp/linear_models.R')

purl('rmd/anova.Rmd', output='tmp/anova.R')