accessing - info
setInfoAF: aNumber
	" Set aNumber of allele frequency for each ALT allele in the same order as listed: use this when estimated from primary data, not called genotypes"

	self appendInfoDelimiter.
	self infoStream 
		nextPutAll: 'AF=';
		nextPutAll: aNumber asString 