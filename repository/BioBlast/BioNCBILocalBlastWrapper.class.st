"
Wrapper for the NCBI standalone BLAST tools. These are for running BLAST locally against your own database. To use this class you must install first the command line tools for your operating system. Notice there are two versions of BLAST tools.

1) The ""historical"" BLAST, now called the ""legacy"" version
2) The ""plus"" BLAST, which is the current up to date release version.

Both have the same version numbers, so there it is a 2.2.23 version for BLAST legacy AND BLAST+. Subclasses wrap their specific functionality, including behavior to guess which versions are installed in the current host system.



"
Class {
	#name : #BioNCBILocalBlastWrapper,
	#superclass : #BioNCBIBlastWrapper,
	#category : 'BioBlast-Local'
}

{ #category : #testing }
BioNCBILocalBlastWrapper class >> isLatestVersion [

	^ false
]

{ #category : #'instance creation' }
BioNCBILocalBlastWrapper class >> latest [
	" Answer a new instance of the receiver's latest version "
	
	^ ( self allSubclasses detect: [: cls | cls isLatestVersion ] ) new
]

{ #category : #'instance creation' }
BioNCBILocalBlastWrapper class >> legacy [
	" Answer a new instance of the receiver's latest legacy version "
	
	^ ( ( self allSubclasses 
				select: [: cls | cls isLegacyVersion ] )
					detectMax: [: cls | cls versionNumber ] ) new
]
