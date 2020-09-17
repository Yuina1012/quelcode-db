CREATE TABLE `users` (
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `name` varchar(100) NOT NULL,
      `mail` varchar(100) NOT NULL,
      `password` varchar(100) NOT NULL,
      `profile` varchar(1000) NOT NULL,
      `tel` verchar(13) ,
      `business_tel` verchar(13) ,
      `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      `delete_flag`  tinyint(1) NOT NULL DEFAULT '0',
      PRIMARY KEY (`id`)　
) ENGINE= InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `users_chat_rooms` (
      `user_id` int(11) NOT NULL ,
      `chat_room_id` int(11) NOT NULL ,
      `joined_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
   	  FOREIGN KEY (`user_id`) REFERENCES `users`(`id`)
   	  FOREIGN KEY (`chat_room_id`) REFERENCES `chat_rooms`(`id`)
      PRIMARY KEY (`id`, `chat_room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `chat_rooms` (
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `chat_name` varchar(100) NOT NULL,
      `chat_info` varchar(1000) NOT NULL,
      `delete_flag` tinyint(1) NOT NULL DEFAULT '0'
      `direct_chat_flag` tinyint(1) NOT NULL DEFAULT '0',
      `file_send_flag` tinyint(1) NOT NULL DEFAULT '0',
      `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      `creater_id` int(11) NOT NULL,
      `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      `updater_id` int(11) NOT NULL,
      PRIMARY KEY (`id`)　
)ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `posts` (
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `chat_room_id` int(11) NOT NULL,
      `post_content` varchar(1000) NOT NULL,
      `delete_flag` tinyint(1) NOT NULL DEFAULT '0',
      `posted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      `contributor_id` int(11) NOT NULL,
      `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      `updater_id` int(11) NOT NULL,
      PRIMARY KEY (`id`)　
)ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `tasks` (
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `task_content` varchar(1000) NOT NULL,
      `responsibler_id` int(11) NOT NULL,
      `chat_room_id` int(11) NOT NULL,
      `limited_at` datetime  DEFAULT NULL ,
      `done_at` datetime DEFAULT NULL,
      `delete_flag` tinyint(1) NOT NULL DEFAULT '0',
      `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      `creater_id` int(11) NOT NULL,
      `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      `updater_id` int(11) NOT NULL,
      PRIMARY KEY (`id`)　
) ENGINE= InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

