writing
shouldWriteLabelOn: aStream
	" Private - Answer <true> if receiver should write the label in aStream "

	^ self label isString not 
			and: [ ( aStream copy contents includesSubString: self class notation ) not ]