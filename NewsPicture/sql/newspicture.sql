# Host: localhost  (Version: 5.6.21-log)
# Date: 2015-05-06 14:08:40
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "channel"
#

INSERT INTO `channel` VALUES (1,'风景'),(2,'人物'),(3,'汽车'),(4,'动漫'),(5,'新闻'),(6,'重大');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "album"
#

INSERT INTO `album` VALUES (9,'Test',1,9,'1','11111','2015-05-05 14:54:24'),(10,'银魂',2,9,'2','低调低调','2015-05-05 17:59:45');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "photo"
#

INSERT INTO `photo` VALUES (19,'图灵','1111',0,9,'1','data\\9\\20150505145438.jpg','data\\9\\20150505145438_big.jpg','data\\9\\20150505145438_small.jpg','2015-05-05 14:54:39'),(20,'神乐','111',1,10,'0','data\\9\\20150505180010.jpg','data\\9\\20150505180010_big.jpg','data\\9\\20150505180010_small.jpg','2015-05-05 18:00:11');
