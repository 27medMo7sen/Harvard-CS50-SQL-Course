
-- ### CREATEION OF TABLES ###
-- creating users table with the following columns: id, username, password, email, birthdate. this table is the core of the application
CREATE TABLE `users`(
    `id` INT AUTO_INCREMENT,
    `username` VARCHAR(255) UNIQUE NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `birthdate` DATE NOT NULL,
    `gender` ENUM('M', 'F', 'O') NOT NULL,
    `country` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
 );
-- creating artists table with the following columns: id, name, genre, country, bio. this table is used to store information about artists
CREATE TABLE `artists`(
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(255) UNIQUE NOT NULL,
    `genre` VARCHAR(255) NOT NULL,
    `country` VARCHAR(255) NOT NULL,
    `bio` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
);

-- creating albums table with the following columns: id, title, release_date, genre, cover_url, artist_id. this table is used to store information about albums
CREATE TABLE `albums`(
    `id` INT AUTO_INCREMENT,
    `title` VARCHAR(255) NOT NULL,
    `release_date` DATE NOT NULL,
    `genre` VARCHAR(255) NOT NULL,
    `cover_url` VARCHAR(255) NOT NULL,
    `artist_id` INT NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`artist_id`) REFERENCES `artists`(`id`)
);
-- creating songs table with the following columns: id, title, duration, genre, release_date, album_id, artist_id, play_count. this table is used to store information about songs
CREATE TABLE `songs`(
    `id` INT AUTO_INCREMENT,
    `title` VARCHAR(255) NOT NULL,
    `duration` TIME NOT NULL,
    `genre` VARCHAR(255) NOT NULL,
    `realease_date` DATE NOT NULL,
    `album_id` INT,
    `artist_id` INT,
    `genre_id` INT,
    `play_count` INT DEFAULT 0,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`album_id`) REFERENCES `albums`(`id`),
    FOREIGN KEY (`artist_id`) REFERENCES `artists`(`id`),
    FOREIGN KEY (`genre_id`) REFERENCES `genres`(`id`)
);
-- creating playlists table with the following columns: id, name, description, user_id. this table is used to store information about playlists
CREATE TABLE `playlists`(
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT ,
    `user_id` INT NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`)
);

-- creating playlist_songs table with the following columns: id, playlist_id, song_id. this table is used to store the relationship between playlists and songs
CREATE TABLE `playlist_songs`(
    `id` INT AUTO_INCREMENT,
    `playlist_id` INT,
    `song_id` INT,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`playlist_id`) REFERENCES `playlists`(`id`),
    FOREIGN KEY (`song_id`) REFERENCES `songs`(`id`)
);

-- creating listening_histories table with the following columns: id, user_id, song_id, played_at. this table is used to store the listening history of users
CREATE TABLE `listening_histories`(
    `id` INT AUTO_INCREMENT,
    `user_id` INT,
    `song_id` INT,
    `played_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`song_id`) REFERENCES `songs`(`id`)
);

-- creating follows table with the following columns: id, follower_id, followed_id. this table is used to store the relationship between users
CREATE TABLE `follows`(
    `id` INT AUTO_INCREMENT,
    `follower_id` INT,
    `followed_id` INT,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`follower_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`followed_id`) REFERENCES `users`(`id`)
);

-- creating likes table with the following columns: id, user_id, song_id. this table is used to store the likes of users
CREATE TABLE `likes`(
    `id` INT AUTO_INCREMENT,
    `user_id` INT,
    `song_id` INT,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`song_id`) REFERENCES `songs`(`id`)
);

-- creating comments table with the following columns: id, user_id, song_id, content, created_at. this table is used to store the comments of users
CREATE TABLE `subscriptions`(
    `id` INT AUTO_INCREMENT,
    `user_id` INT,
    `suscription_type` ENUM('FREE', 'PREMIUM', 'PREMIUM_PLUS') NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`)
);

-- creating comments table with the following columns: id, user_id, song_id, content, created_at. this table is used to store the comments of users
CREATE TABLE `genres`(
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(255) UNIQUE NOT NULL,
    `description` TEXT,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
);

-- ### CREATION OF VIEWS ###

-- Creating views for top liked songs
CREATE VIEW `top liked songs` AS
SELECT `songs`.`title`, `genres`.`name` AS `genre`, `songs`.`play_count` AS `number of plays`, COUNT(`songs`.`id`) AS `number of likes` FROM `songs`
JOIN `likes` ON `songs`.`id` = `likes`.`song_id`
JOIN `genres` ON `songs`.`genre_id` = `genres`.`id`
GROUP BY `songs`.`id`
ORDER BY `number of likes` DESC;

-- Creating views for top listened songs
CREATE VIEW `top songs` AS
SELECT `songs`.`title`, `songs`.`duration`, `songs`.`play_count` AS `number of plays`, COUNT(`likes`.`song_id`) AS `number of likes` FROM `songs`
JOIN `genres` ON `songs`.`genre_id` = `genres`.`id`
JOIN `likes` ON `songs`.`id` = `likes`.`song_id`
GROUP BY `songs`.`id`
ORDER BY `songs`.`play_count` DESC

-- Creating views for top artists
CREATE VIEW `top artists` AS
SELECT `artists`.`name`, `artists`.`genre`, COUNT(`likes`.`song_id`) AS `number of likes`, COUNT(`follows`.`followed_id`) AS `number of followers` FROM `artists`
JOIN `albums` ON `artists`.`id` = `albums`.`artist_id`
JOIN `songs` ON `albums`.`id` = `songs`.`album_id`
JOIN `likes` ON `songs`.`id` = `likes`.`song_id`
JOIN `follows` ON `artists`.`id` = `follows`.`followed_id`
GROUP BY `artists`.`id`
ORDER BY `number of followers` DESC ;

-- Creating views for top genres
CREATE VIEW `top genres` AS
SELECT `genres`.`name`, COUNT(`likes`.`song_id`) AS `number of likes`FROM `genres`
JOIN `songs` ON `genres`.`id` = `songs`.`genre_id`
JOIN `likes` ON `songs`.`id` = `likes`.`song_id`
GROUP BY `genres`.`id`
ORDER BY `number of likes` DESC ;

-- ### CREATION OF INDEXES ###
CREATE INDEX `album_artist_id_idx` ON `albums` (`artist_id`);

CREATE INDEX `follows_followed_id_idx` ON `follows` (`followed_id`);

CREATE INDEX `follows_follower_id_idx` ON `follows` (`follower_id`);

CREATE INDEX `likes_song_id_idx` ON `likes` (`song_id`);

CREATE INDEX `user_id_song_id_history_idx` ON `listening_histories` (`song_id`);

CREATE INDEX `user_id_history_idx` ON `listening_histories` (`user_id`);

CREATE INDEX `song_id_history_idx` ON `listening_histories` (`song_id`);

CREATE INDEX `playlist_songs_playlist_id_idx` ON `playlist_songs` (`playlist_id`);

CREATE INDEX `playlist_songs_song_id_idx` ON `playlist_songs` (`song_id`);

CREATE INDEX `user_id_playlist_idx` ON `playlists` (`user_id`);

CREATE INDEX `genre_id_song_idx` ON `songs` (`genre_id`);

CREATE INDEX `album_id_song_idx` ON `songs` (`album_id`);

CREATE INDEX `artist_id_song_idx` ON `songs` (`artist_id`);

CREATE INDEX `user_id_subscription_idx` ON `subscriptions` (`user_id`);

