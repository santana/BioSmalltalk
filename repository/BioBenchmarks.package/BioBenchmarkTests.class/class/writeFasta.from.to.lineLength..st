benchmarking
writeFasta: aString from: inStream to: outStream lineLength: lineLength

	| i |

	outStream 
		nextPut: $>; 
		nextPutAll: aString; 
		nl.
	i := 0.
	[ inStream atEnd ] whileFalse:
	      [ i == lineLength ifTrue: [ outStream nl. i := 0 ].
	      outStream nextPut: inStream next.
	      i := i + 1 ].
   outStream nl