

-- ### INSERTION PART ###

-- Iinserting data into genres table
INSERT INTO `genres` (`id`, `name`, `description`)
VALUES
    (1, 'Pop', 'Popular music genre with catchy melodies and simple lyrics.'),
    (2, 'Rock', 'Genre characterized by a strong rhythm and often revolves around the electric guitar.'),
    (3, 'Jazz', 'Music genre that originated from African American communities featuring improvisation.'),
    (4, 'Hip-Hop', 'Genre consisting of stylized rhythmic music and rap.'),
    (5, 'Classical', 'Art music rooted in the traditions of Western culture.');

-- Inserting data into users table
INSERT INTO `users` (`id`, `username`, `password`, `email`, `birthdate`, `gender`, `country`)
VALUES
    (1, 'alice_wonder', 'alicepass', 'alice@example.com', '1992-04-12', 'F', 'United States'),
    (2, 'bob_builder', 'bobsecure', 'bob@example.com', '1988-09-23', 'M', 'United Kingdom'),
    (3, 'charlie_chaplin', 'charlie123', 'charlie@example.com', '1990-01-17', 'M', 'Canada'),
    (4, 'diana_prince', 'dianapass', 'diana@example.com', '1995-07-08', 'F', 'Australia'),
    (5, 'eve_adams', 'evepass', 'eve@example.com', '1985-11-30', 'O', 'Germany');

-- Inserting data into artists table
INSERT INTO `artists` (`id`, `name`, `genre`, `country`, `bio`)
VALUES
    (1, 'The Melodies', 'Pop', 'United States', 'A pop band known for their upbeat songs and energetic performances.'),
    (2, 'Stone Crushers', 'Rock', 'United Kingdom', 'A legendary rock band with a massive global following.'),
    (3, 'Smooth Operators', 'Jazz', 'Canada', 'A jazz ensemble renowned for their improvisational skills.'),
    (4, 'Rhythm Rebels', 'Hip-Hop', 'Australia', 'A hip-hop group famous for their impactful lyrics and beats.'),
    (5, 'Symphony Stars', 'Classical', 'Germany', 'A classical orchestra performing timeless pieces across Europe.');

-- Inserting data into albums table
INSERT INTO `albums` (`id`, `title`, `release_date`, `genre`, `cover_url`, `artist_id`)
VALUES
    (1, 'Pop Paradise', '2015-05-20', 'Pop', 'http://example.com/covers/pop_paradise.jpg', 1),
    (2, 'Rock Revolution', '2012-08-14', 'Rock', 'http://example.com/covers/rock_revolution.jpg', 2),
    (3, 'Jazz Journey', '2018-11-30', 'Jazz', 'http://example.com/covers/jazz_journey.jpg', 3),
    (4, 'Hip-Hop Heights', '2020-03-22', 'Hip-Hop', 'http://example.com/covers/hiphop_heights.jpg', 4),
    (5, 'Classical Compositions', '2016-09-10', 'Classical', 'http://example.com/covers/classical_compositions.jpg', 5);

-- Inserting data into songs table
INSERT INTO `songs` (`id`, `title`, `duration`, `realease_date`, `album_id`, `artist_id`, `genre_id`, `play_count`)
VALUES
    (1, 'Summer Vibes', '00:03:30',  '2015-05-20', 1, 1, 1, 3200),
    (2, 'Thunderstruck', '00:04:50', '2012-08-14', 2, 2, 2, 2800),
    (3, 'Midnight Blues', '00:05:15',  '2018-11-30', 3, 3, 3, 1500),
    (4, 'Urban Legends', '00:03:45',  '2020-03-22', 4, 4, 4, 2200),
    (5, 'Moonlight Sonata', '00:07:05', '2016-09-10', 5, 5, 5, 1800);

-- Inserting data into playlists table
INSERT INTO `playlists` (`id`, `name`, `description`, `user_id`)
VALUES
    (1, 'Alice\'s Mix', 'A mix of Alice\'s favorite tracks across genres.', 1),
    (2, 'Bob\'s Rock Collection', 'Bob\'s compilation of classic rock songs.', 2),
    (3, "Diana\'s Chillout", 'Relaxing and soothing tracks selected by Diana.', 4);

-- Inserting data into playlist_songs table
INSERT INTO `playlist_songs` (`id`, `playlist_id`, `song_id`)
VALUES
    (1, 1, 1),
    (2, 1, 3),
    (3, 1, 5),
    (4, 2, 2),
    (5, 2, 4),
    (6, 3, 3),
    (7, 3, 5);

-- Inserting data into listening_histories table
INSERT INTO `listening_histories` (`id`, `user_id`, `song_id`, `played_at`)
VALUES
    (1, 1, 1, '2023-10-01 09:15:00'),
    (2, 2, 2, '2023-10-01 10:30:00'),
    (3, 3, 3, '2023-10-01 11:45:00'),
    (4, 4, 4, '2023-10-01 12:00:00'),
    (5, 5, 5, '2023-10-01 13:20:00'),
    (6, 1, 2, '2023-10-02 14:35:00'),
    (7, 2, 3, '2023-10-02 15:50:00');

-- Inserting data into follows table
INSERT INTO `follows` (`id`, `follower_id`, `followed_id`)
VALUES
    (1, 1, 2),
    (2, 1, 3),
    (3, 2, 4),
    (4, 3, 5),
    (5, 4, 1),
    (6, 5, 2);

-- Inserting data into likes table
INSERT INTO `likes` (`id`, `user_id`, `song_id`)
VALUES
    (1, 1, 5),
    (2, 2, 4),
    (3, 3, 3),
    (4, 4, 2),
    (5, 5, 1),
    (6, 1, 2),
    (7, 2, 3);

-- Inserting data into subscriptions table
INSERT INTO `subscriptions` (`id`, `user_id`, `suscription_type`, `start_date`, `end_date`)
VALUES
    (1, 1, 'PREMIUM', '2023-01-01', '2023-12-31'),
    (2, 2, 'PREMIUM_PLUS', '2023-02-15', '2024-02-14'),
    (3, 3, 'FREE', '2023-03-01', '2023-12-31'),
    (4, 4, 'PREMIUM', '2023-04-10', '2024-04-09'),
    (5, 5, 'FREE', '2023-05-20', '2023-12-31');

--### SELECT statements to test the data ###
-- tables' selection ---
SELECT * FROM `users`;

SELECT * FROM `artists`;

SELECT * FROM `albums`;

SELECT * FROM `songs`;

SELECT * FROM `playlists`;

SELECT * FROM `playlist_songs`;

SELECT * FROM `listening_histories`;

SELECT * FROM `follows`;

SELECT * FROM `likes`;

SELECT * FROM `subscriptions`;

SELECT * FROM `genres`;

--- indexes selection ---
SELECT * FROM `top liked songs`;

SELECT * FROM `top songs`;

SELECT * FROM `top artists`;

SELECT * FROM `top genres`;
