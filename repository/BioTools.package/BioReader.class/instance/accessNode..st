accessing parser
accessNode: aNodeName
	" Private - Answer an object from the search result corresponding to aNodeName
	or raise an exception if there are no results in the receiver "
	
	| qResult |
	(qResult := self 
			selectNodes: (Array with: aNodeName)
			in: self results).
	^ qResult 
		at: aNodeName
		ifAbsent: [ self signalNotFound: 'Empty result set' translated ]