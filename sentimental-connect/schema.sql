CREATE DATABASE `linkedin`;
USE `linkedin`;
CREATE TABLE `users`(
    `id` INT AUTO_INCREMENT,
    `first_name`  VARCHAR(8) NOT NULL,
    `last_name`   VARCHAR(8) NOT NULL,
    `password`    VARCHAR(128) NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `schools`(
    `id` INT AUTO_INCREMENT,
    `name`  VARCHAR(32) NOT NULL,
    `location`  VARCHAR(32) NOT NULL,
    `foundation_year` ENUM("Primary","Secondary","High Education") NOT NULL,
     PRIMARY KEY(`id`)
);
CREATE TABLE `companies`(
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `location` VARCHAR(32) NOT NULL,
    `industry` ENUM("Technology","Education","Business"),
     PRIMARY KEY(`id`)
);
CREATE TABLE `connections_with_peoples`(
    `id` INT AUTO_INCREMENT,
    `first_user_id` INT,
    `second_user_id` INT,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`first_user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`second_user_id`) REFERENCES `users`(`id`)
);
CREATE TABLE `connections_with_schools`(
    `id` INT AUTO_INCREMENT,
    `user_id` INT,
    `school_id` INT,
    `joining_date` DATE,
    `graduation_date` DATE,
    `degree` VARCHAR(32),
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`)
);
CREATE TABLE `connections_with_companies`(
    `id` INT  AUTO_INCREMENT,
    `user_id` INT ,
    `company_id` INT ,
    `joining_date"`DATE,
    `retirement_date` DATE,
    `degree` VARCHAR(32),
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`)
);
