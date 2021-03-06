Class {
	#name : #BioBrowser,
	#superclass : #ObjectExplorer,
	#category : 'BioPharo-Platform'
}

{ #category : #menu }
BioBrowser class >> menuCommandOn: aBuilder [
	<worldMenu>

	(aBuilder item: #'BioBrowser')
		order: 1; 
		parent: #Bio;
		label: 'BioBrowser';
		icon: nil;
		help: 'Browse the BioSmalltalk classes' translated;
		action:[self openBioBrowser]
]
