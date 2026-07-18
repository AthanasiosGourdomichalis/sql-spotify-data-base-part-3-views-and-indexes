CREATE INDEX By_Name_Index on artists(name); --A
CREATE INDEX By_Artist_id on r_track_artist(artist_id); --B

EXPLAIN QUERY PLAN
SELECT t.name
FROM tracks t
JOIN r_track_artist rta ON t.id = rta.track_id
JOIN artists a ON rta.artist_id = a.id
WHERE a.name = 'Ludwig van Beethoven';

/*
BEFORE INDEXES: SCAN TABLE EXECUTION PLAN : Full table scan (slow on large datasets).
Before using indexes, during the execution of the command, a check is performed for every single element 
and every tuple in the "r_track_artist" table. It is mandatory to verify whether the artist corresponding 
to each track has the name 'Ludwig van Beethoven'. In other words, all tuples are examined sequentially.

AFTER INDEXES: USING INDEX EXECUTION PLAN :
After creating the indexes, instead of scanning the entire table, the system uses the "artist" table index (Index A) 
to search for the specific name we are looking for, in order to retrieve its corresponding id from the table. 
Then, based on this id, it searches directly through the index on "r_track_artist" (Index B) and returns every 
track_id that matches this artist id, completely eliminating the need to sequentially scan track ids one by one 
to compare if they match the correct artist id. Finally, the "tracks" table is accessed directly based on this 
track_id via the index defined by its primary key id to return the track name.
*/

