avsi.model0.lavaan <- '
    # Measurement model
	StressReducingActions =~ avsi35 + avsi40 + avsi45 + avsi47
	NegativeBasedIncentives =~ avsi34 + avsi38 + avsi39 + avsi42 + avsi44 + avsi46 + avsi48
	SelfEfficacyEnhancement =~ avsi32 + avsi33 + avsi36 + avsi37 + avsi41 + avsi43 + avsi49 + avsi50 + avsi51
'

avsi.model2.lavaan <- '
    # Measurement model
	StressReducingActions =~ avsi35 + avsi40 + avsi45 + avsi47
	NegativeBasedIncentives =~ avsi34 + avsi38 + avsi39 + avsi42 + avsi44 + avsi46 + avsi48
	SelfEfficacyEnhancement =~ avsi32 + avsi33 + avsi36 + avsi37 + avsi41 + avsi43 + avsi49 + avsi50 + avsi51
	# Residual correlations
	avsi35 ~~ avsi34
	avsi35 ~~ avsi49
	avsi40 ~~ avsi48
	avsi45 ~~ avsi46
	avsi34 ~~ avsi42
	avsi38 ~~ avsi37
	avsi42 ~~ avsi46
	avsi46 ~~ avsi49
	avsi46 ~~ avsi41
	avsi33 ~~ avsi36
	avsi37 ~~ avsi43
	avsi37 ~~ avsi50
	avsi49 ~~ avsi50
'
