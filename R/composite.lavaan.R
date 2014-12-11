comp.model0.lavaan <- '
	# Measurement model
	VC =~ mslqvcigo + mslqvcego + mslqvctv
	EC =~ mslqeccolb + mslqecse
	V =~ avsisee + avsinbi + avsisra
	M =~ VC + EC
	V ~~ 0*V
'

comp.model2.lavaan <- '
	# Measurement model
	VC =~ mslqvcigo + mslqvcego + mslqvctv
	EC =~ mslqeccolb + mslqecse
	V =~ avsisee + avsinbi + avsisra
	M =~ VC + EC
	# Residual correlations
	mslqvcego ~~ avsisee
	mslqvcego ~~ avsinbi
	mslqecse  ~~ avsisee
	mslqecse  ~~ avsinbi
'

sem.model.lavaan <- '
	# Measurement model
	VC =~ mslqvcigo + mslqvcego + mslqvctv
	EC =~ mslqeccolb + mslqecse
	V =~ avsisee + avsinbi + avsisra
	M =~ VC + EC
	# Regressions
	gpa ~ M + V
	# Residual correlations
	mslqvcego ~~ avsisee
	mslqvcego ~~ avsinbi
	mslqecse  ~~ avsisee
	mslqecse  ~~ avsinbi
'
