Extension { #name : #Win32Platform }

{ #category : #'*BioPharoCommon' }
Win32Platform >> execNameFor: aString [
	" Private - See superimplementor's comment "
	
	^ aString , '.exe'
]
