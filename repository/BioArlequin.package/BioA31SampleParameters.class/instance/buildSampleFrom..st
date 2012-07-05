private
buildSampleFrom: assoc

	| ids |
	
	ids := self extractIdentifiers: assoc.
	( ids size > 1 and: [ self countFrequenciesByGroup ] )
		ifTrue: [ 
			ids doWithIndex: [: prefix : index | 
				identifiers add: ( self samplesPrefix , ( self newIdFor: prefix ) ).
				frequencies add: ( ( assoc value at: ( assoc value keys at: index ) ) size ).
				sequences add: assoc key. ] ]				
		ifFalse: [
			ids size > 1
				ifFalse: [
					identifiers add: ( self samplesPrefix , ( self newIdFor: ids anyOne ) ).
					frequencies add: ( assoc value sum: #size ).
					sequences add: assoc key ]
				ifTrue: [
					self halt.
					identifiers := ids ] ]