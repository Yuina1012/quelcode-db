CREATE TABLE `users` (
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `name` varchar(100) NOT NULL,
      `mail` varchar(100) NOT NULL,
      `password` varchar(100) NOT NULL,
      `profile` varchar(1000) NOT NULL,
      `tel` varchar(13) ,
      `business_tel` varchar(13) ,
      `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
      `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      `delete_flag` tinyint(1) NOT NULL DEFAULT '0',
      PRIMARY KEY (`id`)
) ENGINE= InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;


CREATE TABLE `chat_rooms` (
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `chat_name` varchar(100) NOT NULL,
      `chat_info` varchar(1000) NOT NULL,
      `is_delete` tinyint(1) NOT NULL DEFAULT '0',
      `is_direct_chat` tinyint(1) NOT NULL DEFAULT '0',
      `is_attachble` tinyint(1) NOT NULL DEFAULT '0',
      `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
      `creater_id` int(11) NOT NULL,
      `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      `updater_id` int(11) NOT NULL,
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
      `file` text(24) DEFAULT NULL,
      `delete_flag` tinyint(1) NOT NULL DEFAULT '0',
      `posted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
      `contributor_id` int(11) NOT NULL,
      `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      `updater_id` int(11) NOT NULL,
  	  FOREIGN KEY (`chat_room_id`) REFERENCES `chat_rooms`(`id`),
  	  FOREIGN KEY (`contributor_id`) REFERENCES `users`(`id`),
  	  FOREIGN KEY (`updater_id`) REFERENCES `users`(`id`),
      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `tasks` (
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `task_content` varchar(1000) NOT NULL,
      `responsibler_id` int(11) NOT NULL,
      `chat_room_id` int(11) NOT NULL,
      `limited_at` datetime  DEFAULT NULL ,
      `is_completed` tinyint(1) NOT NULL DEFAULT '0',
      `delete_flag` tinyint(1) NOT NULL DEFAULT '0',
      `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
      `creater_id` int(11) NOT NULL,
      `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      `updater_id` int(11) NOT NULL,
	  FOREIGN KEY (`responsibler_id`) REFERENCES `users`(`id`),
  	  FOREIGN KEY (`chat_room_id`) REFERENCES `chat_rooms`(`id`),
	  FOREIGN KEY (`creater_id`) REFERENCES `users`(`id`),
  	  FOREIGN KEY (`updater_id`) REFERENCES `users`(`id`),
      PRIMARY KEY (`id`)
) ENGINE= InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

