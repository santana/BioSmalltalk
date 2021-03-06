"
The membership class represents a group membership of gene. The same gene object can be in multiple groups. The membership encapsulation allows to assign different scores to same gene depending on the group. 
"
Class {
	#name : #BioOrthoMembership,
	#superclass : #BioOrthoScoreable,
	#category : 'BioOrthoXML-Core'
}

{ #category : #accessing }
BioOrthoMembership >> gene [
	" Answer a <BioOrthoGene> with the gene that this membership stands for."
]
