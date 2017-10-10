# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.18)
# Database: 585HWDB_YouTube
# Generation Time: 2017-06-11 23:59:47 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table channel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `channel`;

CREATE TABLE `channel` (
  `channelid` int(11) NOT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `ownerid` int(11) NOT NULL,
  `videocount` int(11) DEFAULT NULL,
  `subscribercount` int(11) DEFAULT NULL,
  PRIMARY KEY (`channelid`),
  KEY `ownerid` (`ownerid`),
  CONSTRAINT `channel_ibfk_1` FOREIGN KEY (`ownerid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `channel` WRITE;
/*!40000 ALTER TABLE `channel` DISABLE KEYS */;

INSERT INTO `channel` (`channelid`, `genre`, `ownerid`, `videocount`, `subscribercount`)
VALUES
	(1,'b',1,2,1),
	(2,'c',1,3,5),
	(3,'a',2,4,2),
	(4,'cc',3,5,1);

/*!40000 ALTER TABLE `channel` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table subscription
# ------------------------------------------------------------

DROP TABLE IF EXISTS `subscription`;

CREATE TABLE `subscription` (
  `channelid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`channelid`,`userid`),
  KEY `userid` (`userid`),
  CONSTRAINT `subscription_ibfk_1` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`),
  CONSTRAINT `subscription_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `handle` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `favoriteGenre` varchar(50) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`userid`, `email`, `phone`, `handle`, `name`, `favoriteGenre`, `location`)
VALUES
	(1,'1@gmail.com',213,NULL,NULL,'a','LA'),
	(2,'2@gmail.com',213,NULL,NULL,'b','BA'),
	(3,'3@gmail.com',213,NULL,NULL,'c','MA'),
	(4,'4@gmail.com',213,NULL,NULL,'d','CA'),
	(5,'5@gmail.com',213,NULL,NULL,'a','SF'),
	(6,'6@gmail.com',213,NULL,NULL,'cc','SD');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table video
# ------------------------------------------------------------

DROP TABLE IF EXISTS `video`;

CREATE TABLE `video` (
  `videoid` int(11) NOT NULL,
  `channelid` int(11) NOT NULL,
  PRIMARY KEY (`videoid`),
  KEY `channelid` (`channelid`),
  CONSTRAINT `video_ibfk_1` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;

INSERT INTO `video` (`videoid`, `channelid`)
VALUES
	(1,1),
	(3,1),
	(2,2),
	(4,2),
	(5,2),
	(6,3),
	(7,3),
	(8,3),
	(9,3),
	(10,4),
	(11,4),
	(12,4),
	(13,4),
	(14,4);

/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
