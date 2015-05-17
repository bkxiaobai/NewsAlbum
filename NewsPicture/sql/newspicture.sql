# Host: localhost  (Version: 5.6.21-log)
# Date: 2015-05-17 17:06:37
# Generator: MySQL-Front 5.3  (Build 4.13)

/*!40101 SET NAMES utf8 */;

#
# Source for table "admin"
#

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `Id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `pass` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "admin"
#

INSERT INTO `admin` VALUES (1,'admin','admin');

#
# Source for table "channel"
#

DROP TABLE IF EXISTS `channel`;
CREATE TABLE `channel` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "channel"
#

INSERT INTO `channel` VALUES (1,'风景'),(2,'人物'),(3,'汽车'),(4,'动漫'),(5,'新闻'),(6,'重大'),(7,'软件学院');

#
# Source for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "user"
#

INSERT INTO `user` VALUES (8,'111111','111'),(9,'921118','bk'),(10,'890322','cy');

#
# Source for table "album"
#

DROP TABLE IF EXISTS `album`;
CREATE TABLE `album` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `times` mediumtext,
  `keyword` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK5897E6F2754EEEA` (`user_id`),
  KEY `FK5897E6F63C5BFCA` (`channel_id`),
  CONSTRAINT `FK5897E6F2754EEEA` FOREIGN KEY (`user_id`) REFERENCES `user` (`Id`),
  CONSTRAINT `FK5897E6F63C5BFCA` FOREIGN KEY (`channel_id`) REFERENCES `channel` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "album"
#

INSERT INTO `album` VALUES (12,'111',1,9,'14','111','2015-05-16 01:42:06'),(13,'苗子',1,10,'2','苗子','2015-05-17 15:05:37');

#
# Source for table "photo"
#

DROP TABLE IF EXISTS `photo`;
CREATE TABLE `photo` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `cover` tinyint(1) DEFAULT NULL,
  `album_id` int(11) DEFAULT NULL,
  `times` mediumtext,
  `p_url` varchar(255) DEFAULT NULL,
  `b_url` varchar(255) DEFAULT NULL,
  `s_url` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK65B3E322D5AB44A` (`album_id`),
  CONSTRAINT `FK65B3E322D5AB44A` FOREIGN KEY (`album_id`) REFERENCES `album` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "photo"
#

INSERT INTO `photo` VALUES (25,'1111','11111',0,12,'2','data\\9\\20150516143136.JPG','data\\9\\20150516143136_big.JPG','data\\9\\20150516143136_small.JPG','2015-05-16 14:31:37'),(26,'苗子1','111',1,13,'0','data\\10\\20150517150601.JPG','data\\10\\20150517150601_big.JPG','data\\10\\20150517150601_small.JPG','2015-05-17 15:06:02');

#
# Source for table "photo_word"
#

DROP TABLE IF EXISTS `photo_word`;
CREATE TABLE `photo_word` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `pw_title` varchar(200) DEFAULT NULL,
  `pw_content` varchar(200) DEFAULT NULL,
  `commit_date` datetime DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `p_id` (`p_id`),
  KEY `u_id` (`u_id`),
  KEY `FKE1C050F73050A200` (`u_id`),
  KEY `FKE1C050F7D30F266C` (`p_id`),
  CONSTRAINT `FKE1C050F73050A200` FOREIGN KEY (`u_id`) REFERENCES `user` (`Id`),
  CONSTRAINT `FKE1C050F7D30F266C` FOREIGN KEY (`p_id`) REFERENCES `photo` (`Id`),
  CONSTRAINT `photo_word_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `photo` (`Id`),
  CONSTRAINT `photo_word_ibfk_2` FOREIGN KEY (`u_id`) REFERENCES `user` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "photo_word"
#


#
# Source for table "album_word"
#

DROP TABLE IF EXISTS `album_word`;
CREATE TABLE `album_word` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `aw_title` varchar(200) DEFAULT NULL,
  `aw_content` mediumtext,
  `commit_date` datetime DEFAULT NULL,
  `a_id` int(11) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `a_id` (`a_id`),
  KEY `u_id` (`u_id`),
  KEY `p_id` (`p_id`),
  KEY `FKCD91AEDAD2369518` (`a_id`),
  KEY `FKCD91AEDA3050A200` (`u_id`),
  CONSTRAINT `FKCD91AEDA3050A200` FOREIGN KEY (`u_id`) REFERENCES `user` (`Id`),
  CONSTRAINT `FKCD91AEDAD2369518` FOREIGN KEY (`a_id`) REFERENCES `album` (`Id`),
  CONSTRAINT `album_word_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `album` (`Id`),
  CONSTRAINT `album_word_ibfk_2` FOREIGN KEY (`u_id`) REFERENCES `user` (`Id`),
  CONSTRAINT `album_word_ibfk_3` FOREIGN KEY (`p_id`) REFERENCES `photo` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "album_word"
#

INSERT INTO `album_word` VALUES (1,'1111','1111','2015-05-16 02:37:27',12,9,NULL),(2,'1111','1111','2015-05-16 02:38:18',12,9,NULL),(3,'苗子','这是个苗子','2015-05-17 15:06:26',13,10,NULL);
