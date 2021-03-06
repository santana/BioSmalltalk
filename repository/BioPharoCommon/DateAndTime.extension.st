Extension { #name : #DateAndTime }

{ #category : #'*BioPharoCommon' }
DateAndTime >> printYMDHMS [
	" Answer the receiver's date <String> in user-friendly format "

	^ String streamContents: [ : s | 
		self printYMDOn: s.
		s nextPut: Character space.
		self printHMSOn: s ]
]

{ #category : #'*BioPharoCommon' }
DateAndTime >> printYMDHMSeparatedBy: aCharacter [
	" Answer the receiver's date <String> in user-friendly format "

	^ String streamContents: [ : s | 
		self printYMDOn: s.
		s nextPut: aCharacter.
		self printHMSWithDashesOn: s ]
]
