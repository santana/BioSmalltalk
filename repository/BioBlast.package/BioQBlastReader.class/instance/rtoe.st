accessing-put
rtoe
	" Answer a String with the Request Time of Execution in seconds "
	
	| lastRtoe |
	
	self gtLog: 'Parsing RTOE...'.
	lastRtoe := self parserForRTOE parse: self results.
	^ ( lastRtoe beginsWith: 'Error' )
		ifFalse: [ 
			self gtLog: 'New RTOE = ' , lastRtoe.
			rtoe := lastRtoe ]
		ifTrue: [ 
			self gtLog: 'RTOE not found: ' , lastRtoe.
			rtoe 
				ifNil: [ self error: 'Couldn''t parse Request Time of Execution' ]
				ifNotNil: [ rtoe ] ] " Using the last known RTOE... "