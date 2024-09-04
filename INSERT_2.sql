INSERT INTO genre(genre_name)
VALUES ('pop'), ('musical'), ('rock'), ('electronic music');

INSERT INTO person(nickname)
VALUES ('Moby'), ('Imagine Dragons'), ('Barbra Streisand'), ('Florent Mothe'), ('Sting');

INSERT INTO musician(genre_id, artist_id)
VALUES (4, 1), (3, 1), (3, 2), (1, 3), (2, 4), (3, 4), (1, 5), (3, 5);

INSERT INTO album(album_name, creation_date)
VALUES ('18', '2002-05-13'), ('Guilty', '1980-09-23'), (' Mozart, l’opéra rock', '2009-09-22'),
       ('Mercury — Act 1', '2021-09-03'), ('Ten Summoner’s Tales', '1993-03-09');
       
INSERT INTO repertoire(artist_id, album_id)
VALUES (1, 1), (2, 4), (3, 2), (4, 3), (5, 5);

INSERT INTO person(nickname)
VALUES ('Taylor Swift');

INSERT INTO musician(genre_id, artist_id)
VALUES (1, 6);

INSERT INTO album(album_name, creation_date)
VALUES ('Folklore', '2020-07-24');

INSERT INTO repertoire(artist_id, album_id)
VALUES (6, 6);

INSERT INTO track(album_id, track_name, duration)
VALUES (1, 'Extreme Ways', 237), (2, 'Woman in Love', 229), (3, 'L’Assasymphonie', 226),
       (4, 'My Life', 224), (4, 'Cutthroat', 169), (5, 'Shape of My Heart', 278),
       (6, 'Cardigan', 239);
       
INSERT INTO collection(title, creation_date)
VALUES ('Leon.The Professional (Soundtrack)', '1994-09-14'),
       ('The worlds best hits about love', '2019-02-14'),
       ('The Bourne Ultimatum', '2007-07-31');
       
INSERT INTO track_collection(track_id, collection_id)
VALUES (6, 1), (2, 2), (1, 3);