################################################################################
# Using the sem package
library(sem)
# Load the models
specifyModel(file='R/avsi.model.txt')
specifyModel(file='R/mslq.model.txt')
specifyModel(file='R/composite.model.txt')

# Confirmatory factor models
avsi.sem <- sem::sem(avsi.model, avsi.cov, nrow(srl))
summary(avsi.sem, saturated=TRUE, fit.indicies=c('GFI','CFI','RMSEA'), 
		saturated=TRUE, standardized=TRUE)

mslq.sem <- sem::sem(mslq.model, mslq.cov, nrow(srl), par.size='startvalues')
summary(mslq.sem, saturated=TRUE, fit.indicies=c('GFI','CFI','RMSEA'))

