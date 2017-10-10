# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.18)
# Database: 585HWDB_LinkedIn
# Generation Time: 2017-06-11 23:59:39 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table application
# ------------------------------------------------------------

DROP TABLE IF EXISTS `application`;

CREATE TABLE `application` (
  `userid` int(11) NOT NULL,
  `jobid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`jobid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;

INSERT INTO `application` (`userid`, `jobid`)
VALUES
	(1,1),
	(1,2),
	(1,3),
	(2,1),
	(2,2),
	(3,5),
	(5,5);

/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table experience
# ------------------------------------------------------------

DROP TABLE IF EXISTS `experience`;

CREATE TABLE `experience` (
  `userid` int(11) NOT NULL,
  `experienceid` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `organizationid` int(11) NOT NULL,
  `from_where` varchar(50) DEFAULT NULL,
  `to_where` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`experienceid`),
  KEY `userid` (`userid`),
  KEY `organizationid` (`organizationid`),
  CONSTRAINT `experience_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `experience_ibfk_2` FOREIGN KEY (`organizationid`) REFERENCES `organization` (`organizationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `experience` WRITE;
/*!40000 ALTER TABLE `experience` DISABLE KEYS */;

INSERT INTO `experience` (`userid`, `experienceid`, `title`, `organizationid`, `from_where`, `to_where`, `location`, `description`)
VALUES
	(1,1,'eg',1,NULL,NULL,NULL,NULL),
	(1,2,'eg',2,NULL,NULL,NULL,NULL),
	(2,3,'eg',1,NULL,NULL,NULL,NULL),
	(3,4,'eg',3,NULL,NULL,NULL,NULL),
	(4,5,'mg',4,NULL,NULL,NULL,NULL),
	(5,6,'mg',4,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `experience` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `jobid` int(11) NOT NULL,
  `dateposted` date DEFAULT NULL,
  `organizationid` int(11) NOT NULL,
  `genre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`jobid`),
  KEY `organizationid` (`organizationid`),
  CONSTRAINT `jobs_ibfk_1` FOREIGN KEY (`organizationid`) REFERENCES `organization` (`organizationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;

INSERT INTO `jobs` (`jobid`, `dateposted`, `organizationid`, `genre`)
VALUES
	(1,'2017-06-06',1,'a'),
	(2,'2017-06-06',2,'b'),
	(3,'2017-06-06',2,'c'),
	(4,'2017-06-06',3,'d'),
	(5,'2017-07-07',5,'cc');

/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table network
# ------------------------------------------------------------

DROP TABLE IF EXISTS `network`;

CREATE TABLE `network` (
  `userid` int(11) NOT NULL,
  `friendid` int(11) NOT NULL,
  `dateAdded` date DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userid`,`friendid`),
  KEY `friendid` (`friendid`),
  CONSTRAINT `network_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `network_ibfk_2` FOREIGN KEY (`friendid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `network` WRITE;
/*!40000 ALTER TABLE `network` DISABLE KEYS */;

INSERT INTO `network` (`userid`, `friendid`, `dateAdded`, `note`)
VALUES
	(1,2,'2017-06-06',NULL),
	(1,3,'2017-06-06',NULL),
	(2,3,'2017-06-06',NULL),
	(3,5,'2017-06-06',NULL),
	(4,3,'2017-06-06',NULL),
	(5,1,'2017-06-06',NULL);

/*!40000 ALTER TABLE `network` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table organization
# ------------------------------------------------------------

DROP TABLE IF EXISTS `organization`;

CREATE TABLE `organization` (
  `organizationid` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`organizationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;

INSERT INTO `organization` (`organizationid`, `name`)
VALUES
	(1,'O1'),
	(2,'O2'),
	(3,'O3'),
	(4,'O4'),
	(5,'O5'),
	(6,'O6');

/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table User
# ------------------------------------------------------------

DROP TABLE IF EXISTS `User`;

CREATE TABLE `User` (
  `userid` int(11) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `handle` varchar(50) DEFAULT NULL,
  `headline` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;

INSERT INTO `User` (`userid`, `email`, `handle`, `headline`, `location`)
VALUES
	(1,'1@gmail.com','?','?','LA'),
	(2,'2@gmail.com',NULL,NULL,'BA'),
	(3,'3@gmail.com',NULL,NULL,'MA'),
	(4,'4@gmail.com',NULL,NULL,'CA'),
	(5,'5@gmail.com',NULL,NULL,'SF'),
	(6,'5@gmail.com',NULL,NULL,'SD');

/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
