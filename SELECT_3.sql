--Название и продолжительность самого длительного трека.
SELECT track_name, duration
  FROM track
 WHERE duration = (SELECT MAX(duration) FROM track);

--Название треков, продолжительность которых не менее 3,5 минут.
SELECT track_name
  FROM track
 WHERE duration >= 210;

--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT title
  FROM collection
 WHERE EXTRACT(YEAR FROM creation_date) BETWEEN 2018 AND 2020;

--Исполнители, чьё имя состоит из одного слова.
SELECT nickname
  FROM person
 WHERE nickname NOT LIKE '% %'
 ORDER BY nickname;

--Название треков, которые содержат слово «мой» или «my».
SELECT track_name
  FROM track
 WHERE track_name LIKE ANY (ARRAY['%My %', '% my %', '%Мой %', '%мой %']);

--Количество исполнителей в каждом жанре.
SELECT genre_name, COUNT(artist_id) AS number_of_artists
  FROM genre INNER JOIN musician
    ON genre.genre_id = musician.genre_id
 GROUP BY genre_name;

--Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT album_name, COUNT(track_id) AS number_of_tracks
  FROM album INNER JOIN track
    ON album.album_id = track.album_id
 WHERE EXTRACT(YEAR FROM creation_date) IN (2018, 2020)
 GROUP BY album_name;

--Средняя продолжительность треков по каждому альбому.
SELECT album_name, ROUND(AVG(duration), 0) AS average_duration
  FROM album JOIN track
    ON album.album_id = track.album_id
 GROUP BY album_name
 ORDER BY average_duration DESC;

--Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT nickname
  FROM person JOIN repertoire
    ON person.artist_id = repertoire.artist_id
  JOIN album ON album.album_id = repertoire.album_id
 WHERE EXTRACT(YEAR FROM creation_date) <> 2020
 GROUP BY nickname;

--Названия сборников, в которых присутствует конкретный исполнитель.
SELECT title
  FROM collection JOIN track_collection
    ON collection.collection_id = track_collection.collection_id
  JOIN track ON track_collection.track_id = track.track_id
  JOIN album ON track.track_id = album.album_id
  JOIN repertoire ON album.album_id = repertoire.album_id
  JOIN person ON repertoire.artist_id = person.artist_id
 WHERE nickname = 'Moby';

--Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT album_name
  FROM album JOIN repertoire
    ON album.album_id = repertoire.album_id
  JOIN person ON repertoire.album_id = person.artist_id
  JOIN musician ON person.artist_id = musician.artist_id 
  JOIN genre ON musician.genre_id = genre.genre_id
 GROUP BY album_name, person.artist_id
HAVING COUNT(genre.genre_id) > 1;

--Наименования треков, которые не входят в сборники.
SELECT track_name
  FROM track LEFT JOIN track_collection
    ON track.track_id = track_collection.track_id
 WHERE track_collection.collection_id IS NULL;

--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек.
SELECT person.nickname, track.track_name, track.duration 
  FROM person JOIN repertoire
    ON person.artist_id = repertoire.artist_id
  JOIN album ON repertoire.album_id = album.album_id
  JOIN track ON album.album_id = track.album_id 
 WHERE track.duration = (SELECT MIN(duration) FROM track);

--Названия альбомов, содержащих наименьшее количество треков.
SELECT album.album_name, COUNT(track.track_id) AS number_of_tracks
  FROM album JOIN track ON album.album_id = track.album_id
 GROUP BY album_name
HAVING COUNT(track.track_id) IN 
          (SELECT COUNT(track_id) FROM track
             JOIN album ON track.album_id = album.album_id
            GROUP BY album_name
            ORDER BY COUNT(track_id)
            LIMIT 1);




