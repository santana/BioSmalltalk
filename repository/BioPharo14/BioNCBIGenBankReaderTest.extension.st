Extension { #name : #BioNCBIGenBankReaderTest }

{ #category : #'*biopharo14' }
BioNCBIGenBankReaderTest class >> testFilesDirectoryName [
	" Answer a String where the files for testing will be placed "
	
	^ BioObject testFilesDirectoryName , 
		BioObject fileDirectoryClass slash , 
		'GenBankTestFiles'
]
