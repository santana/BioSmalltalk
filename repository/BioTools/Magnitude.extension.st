Extension { #name : #Magnitude }

{ #category : #'*BioTools' }
Magnitude >> dumpToStream: aStream [
	" Private - Write the receiver's contents into aStream "

	aStream nextPutAll: self asString 

]
