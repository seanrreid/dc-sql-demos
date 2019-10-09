-- 1 What are tracks for a given album?
SELECT
    song.name,
    track.duration
FROM
    album
    INNER JOIN track ON track.album_id = album.id
    INNER JOIN song ON track.song_id = song.id
WHERE
    album.title = 'A Love Supreme'
    -- 2 What are the albums produced by a given artist?
    SELECT
        *
    FROM
        album
        INNER JOIN artist ON album.id = artist.id
    WHERE
        artist.name = 'John Coltrane';

-- What is the track with the longest duration?
SELECT
    *
FROM
    track
    INNER JOIN song ON song.id = track.song_id
ORDER BY
    duration DESC
LIMIT 1;

-- What are the albums released in the 60s? 70s? 80s? 90s?
SELECT
    *
FROM
    album
WHERE
    year BETWEEN 1960 AND 1970
    -- How many albums did a given artist produce in the 90s?
    SELECT
        *
    FROM
        album
        INNER JOIN artist ON album.artist_id = artist.id
    WHERE
        year BETWEEN 1960 AND 1970
        AND artist.name = 'John Coltrane'
        -- What year is each artist's latest album?
        SELECT
            artist.name, max(album.year)
        FROM
            artist
            INNER JOIN album ON album.artist_id = artist.id
        GROUP BY
            artist.id
            -- What is the title of each artist's latest album? *Hint: try using a combination of order by, a subselect, and a distinct on*
            SELECT
                *
            FROM
                artist
                JOIN album ON artist.id = album.artist_id
            WHERE
                year = (
                    SELECT
                        max(year)
                    FROM
                        album
                    WHERE
                        album.artist_id = artist.id);

-- alterative
SELECT DISTINCT ON (artist.id)
    *
FROM
    artist
    JOIN album ON artist.id = album.artist_id
ORDER BY
    artist.id,
    year DESC;

-- List all albums along with its total duration based on summing the duration of its tracks.
SELECT
    album.id,
    album.title,
    sum(track.duration)
FROM
    album
    INNER JOIN track ON track.album_id = album.id
GROUP BY
    album.id
    -- Who are the 5 most prolific artists based on the number of albums they have recorded?
    SELECT
        artist.name,
        count(album.title)
    FROM
        artist
    LEFT OUTER JOIN album ON artist.id = album.artist_id
GROUP BY
    artist.id
ORDER BY
    count DESC
LIMIT 5;

-- What are all the tracks a given artist has recorded?
SELECT
    *
FROM
    artist
    LEFT OUTER JOIN album ON artist.id = album.artist_id
    LEFT OUTER JOIN track ON track.album_id = album.id
    LEFT OUTER JOIN song ON track.song_id = song.id
WHERE
    artist.name = 'Charles Mingus'
    -- Who are the song writers whose songs a given artist has recorded?
    SELECT DISTINCT
        (song_writer.name)
    FROM
        artist
        INNER JOIN album ON album.artist_id = artist.id
        INNER JOIN track ON track.album_id = album.id
        INNER JOIN song ON track.song_id = song.id
        INNER JOIN song_writer ON song.song_writer_id = song_writer.id
    WHERE
        artist.name = 'John Coltrane'
        -- Given a lead artist, what collaborators has he worked with? Hint: you can give the same table 2 different aliases. For example, a query to find all people you follow would look like `select from "user" as follower, "user" as followee where ...`*
        SELECT
            lead_artist.name AS lead_artist, album.name AS album, a_collaborator.name
        FROM
            artist AS lead_artist
        LEFT OUTER JOIN album ON album.artist_id = lead_artist.id
    LEFT OUTER JOIN collaborators ON collaborators.album_id = album.id
    LEFT OUTER JOIN artist AS a_collaborator ON collaborators.artist_id = a_collaborator.id
WHERE
    artist.name = Julie;

