CREATE VIEW FullTrackInfo(tracks,albums,artists)
AS SELECT tr.name, ab.name, ar.name
FROM albums as ab
JOIN r_albums_tracks as at ON ab.id = at.album_id
JOIN tracks as tr ON at.track_id = tr.id 
JOIN r_track_artist as ta ON tr.id = ta.track_id
JOIN artists as ar ON ar.id = ta.artist_id;

--Retrieve the artists, their albums, and the number of tracks, grouped by album, 
--and ordered alphabetically by artist name, further grouped by artist name.

SELECT artists, albums, COUNT(tracks) AS tracks_count
FROM FullTrackInfo
GROUP BY artists, albums
ORDER BY artists;

