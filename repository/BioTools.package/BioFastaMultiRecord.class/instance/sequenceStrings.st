accessing
sequenceStrings
	" Answer a Collection with receiver's sequence strings "
	
	^ self sequences collect: [ : fRec | fRec sequenceString ]