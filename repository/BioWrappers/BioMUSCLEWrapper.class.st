Class {
	#name : #BioMUSCLEWrapper,
	#superclass : #BioWrapperObject,
	#category : #'BioWrappers-Aligners'
}

{ #category : #accessing }
BioMUSCLEWrapper class >> softwareName [
	" See superimplementor's comment "

	^ 'Muscle'
]

{ #category : #autogenerated }
BioMUSCLEWrapper class >> url [
	"WARNING: This is code generated automatically.
 On: 8 November 2012 - 9:58:13 pm"

	^ 'http://www.drive5.com/muscle/'
]

{ #category : #autogenerated }
BioMUSCLEWrapper >> clw [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:24:55 pm"

	"Write output in CLUSTALW format (default FASTA)"

	 ^ self addOption: 'clw'
]

{ #category : #autogenerated }
BioMUSCLEWrapper >> clwstrict [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:24:55 pm"

	"As -clw, with 'CLUSTAL W (1.81)' header"

	 ^ self addOption: 'clwstrict'
]

{ #category : #autogenerated }
BioMUSCLEWrapper >> diags [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:24:55 pm"

	"Find diagonals (faster for similar sequences)"

	 ^ self addOption: 'diags'
]

{ #category : #autogenerated }
BioMUSCLEWrapper >> html [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:24:55 pm"

	"Write output in HTML format (default FASTA)"

	 ^ self addOption: 'html'
]

{ #category : #autogenerated }
BioMUSCLEWrapper >> maxhours: h [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:24:55 pm"

	"Maximum time to iterate in hours (default no limit)"

	 ^ self propertyAt: 'maxhours' ifAbsentPut: [ h ]
]

{ #category : #autogenerated }
BioMUSCLEWrapper >> maxiters: n [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:24:55 pm"

	"Maximum number of iterations (integer, default 16)"

	 ^ self propertyAt: 'maxiters' ifAbsentPut: [ n ]
]

{ #category : #autogenerated }
BioMUSCLEWrapper >> msf [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:24:55 pm"

	"Write output in GCG MSF format (default FASTA)"

	 ^ self addOption: 'msf'
]

{ #category : #autogenerated }
BioMUSCLEWrapper >> muscleLinux64 [
	"WARNING: This is code generated automatically.
 On: 8 November 2012 - 9:58:13 pm"

	^ 'muscleLinux64'
]

{ #category : #autogenerated }
BioMUSCLEWrapper >> out: outputfile [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:24:54 pm"

	"Output alignment in FASTA format (default stdout)"

	 ^ self propertyAt: 'out' ifAbsentPut: [ outputfile ]
]

{ #category : #autogenerated }
BioMUSCLEWrapper >> quiet [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:24:55 pm"

	"Do not write progress messages to stderr"

	 ^ self addOption: 'quiet'
]

{ #category : #autogenerated }
BioMUSCLEWrapper >> version [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:24:56 pm"

	"Display version information and exit"

	 ^ self addOption: 'version'
]
