mslq.model0.lavaan <- '
	# Measurement model
	IntrinsicGoalOrientation =~ mslq1 + mslq16 + mslq22 + mslq24
	TaskValue =~ mslq4 + mslq10 + mslq17 + mslq23 + mslq26 + mslq27
	TestAnxiety =~ mslq3 + mslq8 + mslq14 + mslq19 + mslq28
	ExtrinsicGoalOrienation  =~ mslq7 + mslq11 + mslq13 + mslq30
	ControlOfLearningBeliefs =~ mslq2 + mslq9 + mslq18 + mslq25
	SelfEfficacy =~ mslq5 + mslq6 + mslq12 + mslq15 + mslq20 + mslq21 + mslq29 + mslq31
'

mslq.model2.lavaan <- '
	# Measurement model
	IntrinsicGoalOrientation =~ mslq1 + mslq16 + mslq22 + mslq24
	TaskValue =~ mslq4 + mslq10 + mslq17 + mslq23 + mslq26 + mslq27
	TestAnxiety =~ mslq3 + mslq8 + mslq14 + mslq19 + mslq28
	ExtrinsicGoalOrienation  =~ mslq7 + mslq11 + mslq13 + mslq30
	ControlOfLearningBeliefs =~ mslq2 + mslq9 + mslq18 + mslq25
	SelfEfficacy =~ mslq5 + mslq6 + mslq12 + mslq15 + mslq20 + mslq21 + mslq29 + mslq31
	# Residual correlations
	mslq1  ~~ mslq16
	mslq16 ~~ mslq15
	mslq16 ~~ mslq22
	mslq16 ~~ mslq25
	mslq16 ~~ mslq18
	mslq22 ~~ mslq23
	mslq22 ~~ mslq26
	mslq24 ~~ mslq25
	mslq4  ~~ mslq23
	mslq10 ~~ mslq9
	mslq10 ~~ mslq27
	mslq17 ~~ mslq23
	mslq23 ~~ mslq27
	mslq13 ~~ mslq21
	mslq9  ~~ mslq25
	mslq18 ~~ mslq15
	mslq18 ~~ mslq21
	mslq5  ~~ mslq29
	mslq5  ~~ mslq15
	mslq6  ~~ mslq15
'
