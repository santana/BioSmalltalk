testing
providerIsAvailable
	" Answer <true> if the receiver is available in this system "
	
	^ Smalltalk hasClassNamed: self providerClass asString