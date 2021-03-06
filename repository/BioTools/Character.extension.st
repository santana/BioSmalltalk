Extension { #name : #Character }

{ #category : #'*BioTools' }
Character >> asAminoacidLetter [
	" Answer the receiver "
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'hfm'>

	^ self
]

{ #category : #'*BioTools' }
Character >> asAminoacidName [
	" Answer the complete name of the receiver's aminoacid letter. "
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'hfm'>
	
	^ BioIUPACAlphabet oneLetterAminoacidNames 
			at: self asUppercase
			ifAbsent: [ self signalNotFound: 'Letter code not recognized as aminoacid' ]
]

{ #category : #'*BioTools' }
Character >> asDNANucleotide [
	" Answer the receiver as a <BioDNANucleotide> "
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ BioDNANucleotide with: self
]

{ #category : #'*BioTools' }
Character >> asDisambiguatedDNA [
	" Answer a <String> matching the receiver's disambiguated DNA letter. For example M -> AC "

	^ BioSequence disambiguateLetter: self asString
]

{ #category : #'*BioTools' }
Character >> asDisambiguatedDNAFormatted [
	" Answer a <String>. If the receiver represents an DNA ambiguous letter, then answer will match the receiver's disambiguated DNA letter. For example M -> AC. Otherwise, answer the receiver "

	^ String streamContents: [ : stream |
		(BioIUPACAmbiguousDNA ambiguityCodes includes: self)
			ifTrue: [ 
				stream
					nextPut: $[;
					nextPutAll: ('/' join: self asDisambiguatedDNA);
					nextPut: $] ]
			ifFalse: [ stream nextPutAll: self asString ] ]
]

{ #category : #'*BioTools' }
Character >> isBiologicalSequence [
	" Answer <true> if the receiver represents an identifiable biological letter "
	
	^ self isDNASequence or: [ self isRNASequence or: [ self isProteinSequence ] ]
]

{ #category : #'*BioTools' }
Character >> isDNASequence [
	" Answer <true> if the receiver represents an identifiable biological letter "
	
	^ (BioIUPACUnambiguousDNA codes includes: self asUppercase) or: [
		BioIUPACUnambiguousDNA ambiguityCodes includes: self ]
]

{ #category : #'*BioTools' }
Character >> isProteinSequence [
	" Answer <true> if the receiver represents an identifiable biological letter "
	
	^ (BioIUPACProtein codes includes: self asUppercase) or: [
		BioIUPACProtein ambiguityCodes includes: self ]
]

{ #category : #'*BioTools' }
Character >> isRNASequence [
	" Answer <true> if the receiver represents an identifiable biological letter "
	
	^ (BioIUPACUnambiguousRNA codes includes: self asUppercase) or: [
		BioIUPACUnambiguousRNA ambiguityCodes includes: self ]
]
