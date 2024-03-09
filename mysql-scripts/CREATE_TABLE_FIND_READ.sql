CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(10) NOT NULL,
  `ban` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `password_UNIQUE` (`password`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token_user_id` int NOT NULL,
  `token` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `token_UNIQUE` (`token`),
  KEY `token_user_id_fk` (`token_user_id`),
  CONSTRAINT `token_user_id_fk` FOREIGN KEY (`token_user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `books` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `book_name` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `book_type` varchar(255) NOT NULL,
  `publisher` varchar(255) NOT NULL,
  `book_img` varchar(255) NOT NULL,
  `contents` varchar(45) DEFAULT NULL,
  `add_by_id` int NOT NULL,
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `book_id_UNIQUE` (`book_id`),
  UNIQUE KEY `book_name_UNIQUE` (`book_name`),
  UNIQUE KEY `book_img_UNIQUE` (`book_img`),
  KEY `user_id_idx` (`add_by_id`),
  CONSTRAINT `add_by_id_fk` FOREIGN KEY (`add_by_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `commentssss` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `comment` text NOT NULL,
  `book_id` int NOT NULL,
  `comment_by_id` int NOT NULL,
  PRIMARY KEY (`comment_id`),
  UNIQUE KEY `comment_id_UNIQUE` (`comment_id`),
  KEY `user_id_idx` (`comment_by_id`),
  CONSTRAINT `comment_by_id_fk` FOREIGN KEY (`comment_by_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like` (
  `like_by_id` int NOT NULL,
  `book_id` int NOT NULL,
  `like` int NOT NULL,
  KEY `user_id_idx` (`like_by_id`),
  CONSTRAINT `like_by_id_fk` FOREIGN KEY (`like_by_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `wishlist` (
  `wishlist_by_id` int NOT NULL,
  `book_name` varchar(255) NOT NULL,
  `book_type` varchar(255) NOT NULL,
  `book_id` int NOT NULL,
  KEY `user_id_idx` (`wishlist_by_id`),
  CONSTRAINT `wishlist_by_id_fk` FOREIGN KEY (`wishlist_by_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



