"
Represents a multiple alignment of sequences

    Instance Variables
	set:		<Collection>

"
Class {
	#name : #BioAlignment,
	#superclass : #BioNamedObject,
	#instVars : [
		'set',
		'consensusStrategy'
	],
	#category : #'BioTools-Core'
}

{ #category : #accessing }
BioAlignment >> addFastaRecord: fastaRecord [
	" Add anObject to the alignment "
	
	^ self addSequence: fastaRecord sequence named: fastaRecord sequenceName
]

{ #category : #accessing }
BioAlignment >> addFromSequence: aBioSequence [
	" Add aBioSequence to the receiver's alignments "
	
	set addLast: aBioSequence
]

{ #category : #accessing }
BioAlignment >> addFromSequences: aSequenceCollection [
	" Add aSequenceCollection to the receiver's alignments "
	
	aSequenceCollection do: [ : seq | self addSequence: seq asSequence ]

]

{ #category : #accessing }
BioAlignment >> addSequence: anObject [
	" Add anObject to the alignment "
	
	^ anObject addToAlignment: self
]

{ #category : #accessing }
BioAlignment >> addSequence: anObject named: seqName [
	" Add anObject to the alignment "
	
	^ anObject addToAlignment: self named: seqName
]

{ #category : #accessing }
BioAlignment >> addToFastaMultiRecord: aBSTFastaMultiRecord [
	" Add the receiver's sequences to aBSTFastaMultiRecord "
	
	aBSTFastaMultiRecord sequences: self sequences
]

{ #category : #accessing }
BioAlignment >> alignMaxSize [
	"Answer the maximum length of sequences in the alignment "
	
	^ (self sequences detectMax: #size) size
]

{ #category : #accessing }
BioAlignment >> alignMinSize [
	"Answer the minimum length of sequences in the alignment "
	
	^ (self sequences detectMin: [ : seq | seq size ]) size
]

{ #category : #accessing }
BioAlignment >> anyOne [ 
	"Answer a representative sample of the receiver "

	^ set anyOne
]

{ #category : #converting }
BioAlignment >> asFasta [
	" Answer the receiver as a MultiFasta record object "
	
	^ self asMultiFasta
]

{ #category : #converting }
BioAlignment >> asMultiFasta [
	" Answer the receiver as a MultiFasta record object "
	
	^ BioFastaMultiRecord from: self sequences
]

{ #category : #converting }
BioAlignment >> asMultiFastaString [
	" Answer the receiver as a MultiFasta record object "
	
	^ self asMultiFasta asString
]

{ #category : #converting }
BioAlignment >> asString [
	" Answer a String representation of the receiver "
	
	^ String streamContents: [ : stream |
		self sequences do: [ : seq | 
			stream 
				nextPutAll: seq asString;
				space;
				nextPutAll: seq name;
				cr ] ]
]

{ #category : #accessing }
BioAlignment >> at: anObject [
	" Answer a Sequence or a Collection of Sequences at anObject "
	
	^ anObject alignmentAt: self
]

{ #category : #accessing }
BioAlignment >> atAccession: accessionString [
	" Answer a <BioSequence> identified by accessionString "
	
	^ set 
		detect: [ : sequence | sequence name asLowercase = accessionString asLowercase ]
		ifNone: [ self signalAlignmentNotFound: accessionString ]
]

{ #category : #accessing }
BioAlignment >> atAccession: accessionString ifPresent: aBlock [

	| found |
	
	found := self sequences
		detect: [ : sequence | sequence name asLowercase = accessionString asLowercase ]
		ifNone: [ nil ].
	^ found
		ifNotNil: aBlock
		ifNil: [ self signalAlignmentNotFound: accessionString ] 
]

{ #category : #accessing }
BioAlignment >> atAlignment: alignNumber [
	" Answer a Collection with the receiver's sequences at alignNumber position "
	
	^ (alignNumber between: 1 and: self size)
		ifTrue: [ self sequences at: alignNumber ]
		ifFalse: [ self signalInvalidObject: alignNumber asString , ' is out of range in the receiver''s sequences' ]
]

{ #category : #accessing }
BioAlignment >> atAlignments: alignInterval [
	" Answer a Collection with the receiver's sequences at alignNumber position "
	
	^ (alignInterval between: 1 and: self size)
		ifTrue: [ self copyFrom: alignInterval first to: alignInterval last ]
		ifFalse: [ self signalInvalidObject: alignInterval asString , ' is out of range in the receiver''s sequences' ]
]

{ #category : #accessing }
BioAlignment >> atColumn: aColumnNumber [
	" Answer a Collection with the receiver's sequences at aColumnNumber position "
	
	^ (aColumnNumber between: 1 and: self alignMaxSize)
		ifTrue: [ (set collect: [ : seq | seq at: aColumnNumber ]) joinUsing: String empty ]
		ifFalse: [ self signalInvalidObject: aColumnNumber asString , ' is out of range in the receiver''s sequences' ]
]

{ #category : #accessing }
BioAlignment >> consensus [
	" Consensus sequence is the calculated order of most frequent residues, either nucleotide or amino acid, found at each position in a sequence alignment. Only DNA and RNA sequences are valid "

	| consensusSeq |
	
	consensusSeq := BioMutableSeq newWith: (String new: self numberOfCharacters) alphabet: BioIUPACAmbiguousDNA.
	1 to: self numberOfCharacters do: [ : index | consensusSeq at: index put: (self consensusAt: (self atColumn: index)) ].
    ^ consensusSeq
]

{ #category : #accessing }
BioAlignment >> consensusAt: aString [ 

	^ self consensusStrategy consensusAt: aString asUppercase
]

{ #category : #accessing }
BioAlignment >> consensusStrategy [

	^ consensusStrategy
		ifNil: [ consensusStrategy := self defaultConsensusStrategy ]
]

{ #category : #accessing }
BioAlignment >> copyFrom: startIndex to: stopIndex [
	" Answer a String representation of the receiver "
	
	^ startIndex <= stopIndex
		ifTrue: [ self sequences copyFrom: startIndex to: stopIndex ]
		ifFalse: [ self signalInvalidObject: 'First index should be minor or equal than stop index' ]
]

{ #category : #defaults }
BioAlignment >> defaultConsensusStrategy [

	^ BioDummyConsensusStrategy new
]

{ #category : #enumerating }
BioAlignment >> do: aBlock [
	" Evaluate aBlock with each of the receiver's set as the argument. "
	
	^ set do: aBlock
]

{ #category : #enumerating }
BioAlignment >> do: aBlockClosure displayingProgress: aString [ 
	"Evaluate aBlock with each of the receiver's set as the argument."

	^ set do: aBlockClosure displayingProgress: aString
]

{ #category : #accessing }
BioAlignment >> first [
	"Return the first element in the receiver"

	^ self at: 1
]

{ #category : #'initialize-release' }
BioAlignment >> initialize [
	" Private - Initialize the receiver's contents "

	super initialize.
	set := OrderedCollection new
]

{ #category : #testing }
BioAlignment >> isEmpty [
	"Answer whether the receiver contains any elements."
	
	^ set isEmpty
]

{ #category : #accessing }
BioAlignment >> last [
	"Return the last element in the receiver"

	^ self at: self size
]

{ #category : #accessing }
BioAlignment >> longestConsecutive: aCharacter [
	" Answer the length of the longest substring containing only letter for each element of aCharacter.
	
	From Biostrings: 
		v = c('AAACTGTGFG', 'GGGAATT', 'CCAAAAAAAAAATT')
		longestConsecutive(v, 'A') "

	self shouldBeImplemented
]

{ #category : #accessing }
BioAlignment >> numberOfCharacters [
	" Answer a <Number> with the receiver's sequence size (considering all having the same size) "
	
	^ self sequences first size

]

{ #category : #printing }
BioAlignment >> printOn: aStream [
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	aStream space.
	set do: [ : seq |
		aStream 
			cr;
			nextPutAll: seq asString ]
]

{ #category : #accessing }
BioAlignment >> select: aBlock [
	"Refer to the comment in Collection|select:."

	set := self sequences select: aBlock.
]

{ #category : #accessing }
BioAlignment >> sequenceNames [
	" Answer a Collection of receiver's alignments names. If any or all of the receiver's sequences are unnamed, then assign a numeric identifier corresponding to the position in the receiver's alignment set "
	
	| alignNames |
	
	alignNames := OrderedCollection new: set size.
	set doWithIndex: [ : seq : index | 
		alignNames add: (seq name
				ifNil: [ index asString ]
				ifNotNil: [ seq name ]) ].
	^ alignNames
		
]

{ #category : #accessing }
BioAlignment >> sequenceStrings [
	" Answer a <Collection> of receiver's alignments String's "
	
	^ set collect: #asString
]

{ #category : #accessing }
BioAlignment >> sequences [
	" Answer a Collection of the receiver's sequences "
	
	^ set
]

{ #category : #accessing }
BioAlignment >> signalAlignmentNotFound: accessionString [
	" Private - Signal an exception "
	
	self signalNotFound: (String streamContents: [ : stream |
		stream
			nextPutAll: 'Alignment not found for accession: ' translated;
			nextPutAll: accessionString ])
]

{ #category : #accessing }
BioAlignment >> size [
	"Answer how many sequences the receiver contains."
	
	^ set size
]
