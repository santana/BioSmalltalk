Extension { #name : #BioObject }

{ #category : #'*BioPharo4' }
BioObject >> connectionRetry [ 
	" Private - Ask for retrying attempt "
	
	^ UIManager default 
			chooseFrom: #('try again' 'give up') 
			title: 'Would you like to try again?' translated
]

{ #category : #'*BioPharo4' }
BioObject >> fileDirectoryClass [
	" See comment in class method "

	^ self class fileDirectoryClass
]

{ #category : #'*BioPharo4' }
BioObject class >> fileDirectoryClass [
	" Answer a helper class to manage file related operations "

	^ FileSystem
]

{ #category : #'*BioPharo4' }
BioObject class >> fileExists: fileName [
	" Answer <true> if fileName exists in receiver's workingDirectory "
	
	^ fileName asFileReference exists
]

{ #category : #'*BioPharo4' }
BioObject class >> filesIn: pathString [
	" Answer a <Collection> of file references contained in pathString "
	
	| fs |
	^ (FileReference fileSystem: (fs := FileSystem disk) path: (fs pathFromString: pathString)) allFiles.
	
]

{ #category : #'*BioPharo4' }
BioObject class >> newFullFileNamed: fileName [
	" Answer a FileStream for a new fileName in the receiver's configured folder "
	
	^ fileName asFileReference writeStream
]

{ #category : #'*BioPharo4' }
BioObject class >> openFileNamed: fileName [
	" Answer a <FileStream> for fileName in the image directory. Assume the file exists "
	
	^ fileName 
		ifNotNil: [ fileName asFileReference readStream ]
		ifNil: [ self signalInvalidObject: 'Please specify a file' translated ]
]

{ #category : #'*BioPharo4' }
BioObject class >> openFullFileNamed: fileName [
	" Answer a FileStream for fileName in the image directory. Assume the file exists "
	
	^ fileName 
		ifNotNil: [ fileName asFileReference readStream ]
		ifNil: [ self signalInvalidObject: 'Please specify a file' translated ]
]

{ #category : #'*BioPharo4' }
BioObject class >> removeFileNamed: fileName [
	" Remove fileName in the receiver's current folder "
	
	^ (self workingDirectory , self slash , fileName) asFileReference delete.
]

{ #category : #'*BioPharo4' }
BioObject >> requestDirectoryPath [
	" Answer a <FileReference> with selected directory "

	^ self class requestDirectoryPath

]

{ #category : #'*BioPharo4' }
BioObject class >> requestDirectoryPath [
	" Answer a <FileReference> with selected directory "

	| tmpFileDialog |
	tmpFileDialog := FileDialogWindow basicNew
		initialize;
		title: 'Select a directory';
		answerDirectory;
		openModal.
	tmpFileDialog isNil ifTrue: [ self error: 'FileDialogWindow is broken' ].
	^ tmpFileDialog answer "pathString"

]

{ #category : #'*BioPharo4' }
BioObject >> requestOpenCSVFile [
	" See comment in class side "
	
	^ self class requestOpenCSVFile
]

{ #category : #'*BioPharo4' }
BioObject class >> requestOpenCSVFile [
	" Open request dialog to select a CSV file "
	
	^ UIManager default 
		chooseFullFileNameMatching:  (Array with: self filenameMatchPattern , BioCSVFormatter formatExtension)
		label: 'Choose CSV file'
]

{ #category : #'*BioPharo4' }
BioObject class >> requestOpenCSVFile: actionBlock [
	" Open request dialog to select a CSV file and perform actionBlock if selected path is valid "
	
	^ self requestOpenCSVFile ifNotNilDo: actionBlock
]

{ #category : #'*BioPharo4' }
BioObject >> requestOpenCSVFile: aBlock [
	" See comment in class side "
	
	^ self class requestOpenCSVFile: aBlock
]

{ #category : #'*BioPharo4' }
BioObject class >> requestOpenFASTAFile [
	" Open request dialog to select a FASTA file "
	
	^ UIManager default 
		chooseFullFileNameMatching: (Array with: self filenameMatchPattern , BioFASTAFormatter formatExtension)
		label: 'Choose FASTA file'
]

{ #category : #'*BioPharo4' }
BioObject class >> requestOpenXMLFile [
	" Open request dialog to select a XML file "
	
	^ UIManager default 
		chooseFullFileNameMatching: (Array with: self filenameMatchPattern , BioXMLFormatter formatExtension)
		label: 'Choose XML file'
]

{ #category : #'*BioPharo4' }
BioObject >> slash [
	" See comment in class side "
	
	^ self class slash
]

{ #category : #'*BioPharo4' }
BioObject class >> slash [
	"Return a <String> with the path delimiter used by this filesystem."
	
	^ FileSystem disk delimiter asString
]

{ #category : #'*BioPharo4' }
BioObject class >> workingDirectory [
	" Answer a <String> with the default directory "
	
	^ FileSystem disk workingDirectory fullName
]