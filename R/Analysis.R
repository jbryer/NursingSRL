# Install and Load Packages
source('R/package.R')
package(c('gdata','lavaan','psych','semPlot','xtable'))

# Set the working directory
setwd('~/Dropbox/Projects/NursingSRL') # Set according to your system
getwd()

# Load Packages
library(gdata) # For loading Excel files
library(lavaan)
library(psych)
library(semPlot)
library(xtable)

# Load Data
# Nagelsmith, L., Bryer, J., & Yan, Z. (2012). Measuring motivation and volition
# of nursing students in nontraditional learning environments. Journal of
# Nursing Measurement, 20(2), 90-112.
srl <- read.xls('Data/NursingSRL.xlsx', sheet=1)
names(srl)
head(srl)

# Get basic information about the data
str(srl) # Check the structure of the data frame
dim(srl)

# Create separate data frame for the AVSI and MSLQ instruments
names(srl)
avsi <- srl[,46:65]
mslq <- srl[,15:45]

# Covariance matrices
avsi.cov <- cov(avsi)
mslq.cov <- cov(mslq)

# Using the lavaan package
source('R/avsi.lavaan.R')
source('R/mslq.lavaan.R')
source('R/composite.lavaan.R')

# Note: VC = Value Component
#       EC = Expectancy Component
#       M = Motivation
#       V = Volition
avsi.fit0 <- lavaan::cfa(avsi.model0.lavaan, data=srl)
summary(avsi.fit0, fit.measures=TRUE)
pdf('Figures/AVSIModel0.pdf')
semPaths(avsi.fit0, rotation=4, curvePivot=TRUE)
title('AVSI CFA Model', line=3)
dev.off()

avsi.fit2 <- lavaan::cfa(avsi.model2.lavaan, data=srl)
summary(avsi.fit2, fit.measures=TRUE)
pdf('Figures/AVSIModel2.pdf')
semPaths(avsi.fit2, rotation=4, curvePivot=TRUE)
title('AVSI CFA Model', line=3)
dev.off()

mslq.fit0 <- lavaan::cfa(mslq.model0.lavaan, data=srl)
summary(mslq.fit0, fit.measures=TRUE)
pdf('Figures/MSLQModel0.pdf')
semPaths(mslq.fit0, rotation=4, curvePivot=TRUE)
title('MSLQ CFA Model', line=3)
dev.off()

mslq.fit2 <- lavaan::cfa(mslq.model2.lavaan, data=srl)
summary(mslq.fit2, fit.measures=TRUE)
pdf('Figures/MSLQModel2.pdf')
semPaths(mslq.fit2, rotation=4, curvePivot=TRUE)
title('MSLQ CFA Model', line=3)
dev.off()

comp.fit0 <- lavaan::cfa(comp.model0.lavaan, data=srl)
summary(comp.fit0, fit.measures=TRUE)
pdf('Figures/CompositeModel0.pdf')
semPaths(comp.fit0, rotation=4, curvePivot=TRUE)
title('Composite CFA Model', line=3)
dev.off()

comp.fit2 <- lavaan::cfa(comp.model2.lavaan, data=srl)
summary(comp.fit2, fit.measures=TRUE)
pdf('Figures/CompositeModel2.pdf')
semPaths(comp.fit2, rotation=4, curvePivot=TRUE, title=FALSE)
title('Composite CFA Model', line=3)
dev.off()

# SEM: Predicting gpa from Motivation and Volition
gpa.fit <- lavaan::sem(sem.model.lavaan, data=srl)
summary(gpa.fit, fit.measures=TRUE)
pdf('Figures/GPAPathModel.pdf')
semPaths(gpa.fit, what='std', rotation=4, curvePivot=TRUE, title=FALSE)
title('Path Model', line=3)
dev.off()

# Build summary table of the fit statistics
fits <- c('chisq','df','TLI','CFI','RMSEA')
fit.stats <- data.frame(
	MSLQ0 = as.numeric(fitMeasures(mslq.fit0, fits)),
	MSLQ2 = as.numeric(fitMeasures(mslq.fit2, fits)),
	AVSI0 = as.numeric(fitMeasures(avsi.fit0, fits)),
	AVSI2 = as.numeric(fitMeasures(avsi.fit2, fits)),
	Comp0 = as.numeric(fitMeasures(comp.fit0, fits)),
	Comp2 = as.numeric(fitMeasures(comp.fit2, fits)),
	GPA   = as.numeric(fitMeasures(gpa.fit, fits))
)
row.names(fit.stats) <- fits
fit.stats

# Save table to a CSV file
write.csv(fit.stats, file='Tables/FitStatistics.csv')
# Or save as an HTML table or LaTeX table to be included in another report.
x <- xtable(fit.stats, label='fitstats',
			caption='Model Fit Statistics for Confirmatory Factor Analysis')
print(x, type='html', file='Tables/FitStatistics.html')
print(x, type='latex', file='Tables/FitStatistics.tex')

# We are interested in the coefficients for GPA with Motivation and Volition
pe <- parameterEstimates(gpa.fit)
pe[pe$lhs == 'gpa',]

