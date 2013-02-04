*BioSqueak
parseDocumentFrom: anObject useNamespaces: aBoolean

	| parser |

	" driver := SAXDriver on: anObject readStream. "
	" validating: true. "
	" parser := self new driver: driver. "
	parser := self on: anObject readStream.
	[ parser usesNamespaces: false ]
	on: MessageNotUnderstood
	do: [ : ex | parser useNamespaces: false ].
	parser startDocument.
	^ parser parseDocument.
