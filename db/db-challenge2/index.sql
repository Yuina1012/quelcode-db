CREATE TABLE `users` (
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `name` varchar(100) NOT NULL,
      `mail` varchar(100) NOT NULL,
      `password` varchar(100) NOT NULL,
      `profile` varchar(1000) DEFAULT NULL,
      `mobile_tel` varchar(13) DEFAULT NULL,
      `business_tel` varchar(13) DEFAULT NULL,
      `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
      `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
      PRIMARY KEY (`id`)
) ENGINE= InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `chat_rooms` (
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `name` varchar(100) NOT NULL,
      `infomation` varchar(1000) DEFAULT NULL,
      `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
      `is_direct_chat` tinyint(1) NOT NULL DEFAULT '0',
      `is_attachable` tinyint(1) NOT NULL DEFAULT '0',
      `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
      `created_by` int(11) NOT NULL,
      `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      `updated_by` int(11) NOT NULL,
  	  FOREIGN KEY (`creater_id`) REFERENCES `users`(`id`),
  	  FOREIGN KEY (`updater_id`) REFERENCES `users`(`id`),
	  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `users_chat_rooms` (
      `user_id` int(11) NOT NULL ,
      `chat_room_id` int(11) NOT NULL ,
      `joined_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
   	  FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
   	  FOREIGN KEY (`chat_room_id`) REFERENCES `chat_rooms`(`id`),
      PRIMARY KEY (`user_id`, `chat_room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `posts` (
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `chat_room_id` int(11) NOT NULL,
      `post_content` varchar(1000) NOT NULL,
      `file` varchar(24) DEFAULT NULL,
      `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
      `posted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
      `posted_by` int(11) NOT NULL,
      `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      `updated_by` int(11) NOT NULL,
  	  FOREIGN KEY (`chat_room_id`) REFERENCES `chat_rooms`(`id`),
  	  FOREIGN KEY (`posted_by`) REFERENCES `users`(`id`),
  	  FOREIGN KEY (`updated_by`) REFERENCES `users`(`id`),
      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `tasks` (
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `content` varchar(1000) NOT NULL,
      `person_in_charge` int(11) NOT NULL,
      `chat_room_id` int(11) NOT NULL,
      `deadline` datetime  DEFAULT NULL ,
      `is_completed` tinyint(1) NOT NULL DEFAULT '0',
      `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
      `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
      `created_by` int(11) NOT NULL,
      `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      `updated_by` int(11) NOT NULL,
	  FOREIGN KEY (`person_in_charge`) REFERENCES `users`(`id`),
  	  FOREIGN KEY (`chat_room_id`) REFERENCES `chat_rooms`(`id`),
	  FOREIGN KEY (`created_by`) REFERENCES `users`(`id`),
  	  FOREIGN KEY (`updated_by`) REFERENCES `users`(`id`),
      PRIMARY KEY (`id`)
) ENGINE= InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

