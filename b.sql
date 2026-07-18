PRAGMA index_list('r_albums_artists');
PRAGMA index_info('sqlite_autoindex_r_albums_artists_1');

PRAGMA index_list('albums');
PRAGMA index_info('sqlite_autoindex_albums_1');

/* 
In SQLite, when defining an attribute as a primary key or a unique constraint, 
an index is automatically created for each one individually. This index includes 
the columns (attributes) in the exact order they were declared in the composite key 
or composite Unique constraint. 

For example, in the "r_albums_artists" table, when executing the command 
"PRAGMA index_list('r_albums_artists');", we notice that an index named 
"sqlite_autoindex_r_albums_artists_1" is created. Executing the command 
"PRAGMA index_info('sqlite_autoindex_r_albums_artists_1');" proves that this index 
consists of the columns album_id and artist_id, in the same order they were 
declared in the primary key during table creation. 

Similarly, for the "albums" table, an index named "sqlite_autoindex_albums_1" 
is created, with its column (attribute) being the album id, which also constitutes 
the primary key of the table.
*/

