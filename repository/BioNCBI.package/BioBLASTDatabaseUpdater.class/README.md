GTBLASTDatabase 

Allows to download the pre-formatted BLAST databases requested from the NCBI ftp site. Downloads are validated against their MD5 checksum. This is a port of the Perl script update_blastdb.pl

To show all available pre-formatted BLAST databases evaluate the following expression. The output of this message lists the database names which should be used when requesting downloads or updates.

GTBLASTDatabase new databases.

To display the output status of operations and set a timeout to 240 seconds (default is 120) you may send

GTBLASTDatabaseUpdater new 
	beVerbose;
	setTimeout: 240;
	databases.

and to stop having the displaying of details

GTBLASTDatabaseUpdater new 
	beQuiet.

To download the nr database (non-redundant protein sequence database with entries from GenPept, Swissprot, PIR, PDF, PDB, and NCBI RefSeq)

GTBLASTDatabaseUpdater new 
	database: 'nr';
	download.

to download a specific file

GTBLASTDatabaseUpdater new 
	download: 'pdbnt.tar.gz' 