use yuebadb;
SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for activity_tab
-- ----------------------------
DROP TABLE IF EXISTS `activity_tab`;
CREATE TABLE `activity_tab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` varchar(255) NOT NULL DEFAULT '',
  `start_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fb_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sport_type` varchar(255) NOT NULL DEFAULT '',
  `person_number` varchar(8) NOT NULL DEFAULT '0',
  `detail_desc` varchar(255) DEFAULT NULL,
  `sport_place` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) DEFAULT NULL,
  `activity_state` varchar(255) NOT NULL DEFAULT '',
  `jingdu` float NOT NULL DEFAULT '0',
  `weidu` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `owner_id` (`owner_id`),
  CONSTRAINT `activity_tab_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `user_tab` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Table structure for message_tab
-- ----------------------------
DROP TABLE IF EXISTS `message_tab`;
CREATE TABLE `message_tab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receive_id` varchar(255) NOT NULL DEFAULT '',
  `send_id` varchar(255) NOT NULL DEFAULT '',
  `comment` varchar(255) DEFAULT NULL,
  `send_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `message_type` varchar(255) NOT NULL DEFAULT '',
  `is_read` tinyint DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `receive_id` (`receive_id`),
  KEY `send_id` (`send_id`),
  CONSTRAINT `message_tab_ibfk_1` FOREIGN KEY (`receive_id`) REFERENCES `user_tab` (`user_id`),
  CONSTRAINT `message_tab_ibfk_2` FOREIGN KEY (`send_id`) REFERENCES `user_tab` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Table structure for relation_tab
-- ----------------------------
DROP TABLE IF EXISTS `relation_tab`;
CREATE TABLE `relation_tab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` varchar(255) NOT NULL DEFAULT '',
  `join_id` varchar(255) NOT NULL DEFAULT '',
  `activity_id` int(11) NOT NULL DEFAULT '0',
  `focus_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `owner_id` (`owner_id`),
  KEY `join_id` (`join_id`),
  KEY `plan_id` (`activity_id`),
  CONSTRAINT `relation_tab_ibfk_3` FOREIGN KEY (`activity_id`) REFERENCES `activity_tab` (`id`),
  CONSTRAINT `relation_tab_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `user_tab` (`user_id`),
  CONSTRAINT `relation_tab_ibfk_2` FOREIGN KEY (`join_id`) REFERENCES `user_tab` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Table structure for user_tab
-- ----------------------------
DROP TABLE IF EXISTS `user_tab`;
CREATE TABLE `user_tab` (
  `user_id` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `introduction` varchar(255) DEFAULT NULL,
  `profession` varchar(255) NOT NULL DEFAULT '',
  `age` int(3) NOT NULL DEFAULT '0',
  `sex` varchar(10) NOT NULL DEFAULT '',
  `sports` varchar(255) DEFAULT NULL,
  `portrait_url` varchar(255) DEFAULT NULL,
  `person_sign` varchar(255) DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL,
  `contract_way` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Table structure for photos_tab
-- ----------------------------
DROP TABLE IF EXISTS `photos_tab`;
CREATE TABLE `photos_tab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL DEFAULT '',
  `photo_url` varchar(255) NOT NULL DEFAULT '',
  `photo-time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  FOREIGN KEY (user_id) REFERENCES user_tab(user_id)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gb2312;
-- ----------------------------
-- Table structure for comments-tab
-- ----------------------------
DROP TABLE IF EXISTS `comments_tab`;
CREATE TABLE `comments_tab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL DEFAULT '',
  `comment` varchar(255) NOT NULL DEFAULT '',
  `comment_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_read` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  FOREIGN KEY (user_id) REFERENCES user_tab(user_id)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gb2312;