# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.18)
# Database: 585HW2DB_Read
# Generation Time: 2017-06-11 20:09:27 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table author
# ------------------------------------------------------------

DROP TABLE IF EXISTS `author`;

CREATE TABLE `author` (
  `authorId` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`authorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;

INSERT INTO `author` (`authorId`, `name`)
VALUES
	(1,'John'),
	(2,'Y'),
	(3,'X'),
	(4,'HAO WU');

/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table book
# ------------------------------------------------------------

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `isbn` varchar(255) NOT NULL,
  `title` varchar(20) DEFAULT NULL,
  `authorId` int(11) DEFAULT NULL,
  `numpages` int(11) NOT NULL,
  `avgrating` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`isbn`),
  KEY `fk1` (`authorId`),
  CONSTRAINT `fk1` FOREIGN KEY (`authorId`) REFERENCES `author` (`authorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;

INSERT INTO `book` (`isbn`, `title`, `authorId`, `numpages`, `avgrating`)
VALUES
	('978-0345803481','Fifty Shades of Grey',1,514,0.00),
	('978-0439023498','Catching Fire',3,391,0.00),
	('978-0439023528','The Hunger Games',2,384,0.00),
	('978-0812974492','Unbroken',3,299,3.50),
	('978-1595620156','StrengthsFinder 2.0',4,175,0.00);

/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table friends
# ------------------------------------------------------------

DROP TABLE IF EXISTS `friends`;

CREATE TABLE `friends` (
  `uid` int(11) NOT NULL,
  `fid` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`fid`),
  KEY `fk5` (`fid`),
  CONSTRAINT `fk4` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`),
  CONSTRAINT `fk5` FOREIGN KEY (`fid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;

INSERT INTO `friends` (`uid`, `fid`)
VALUES
	(5,1),
	(1,2),
	(5,2),
	(1,3),
	(2,3),
	(5,7);

/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shelf
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shelf`;

CREATE TABLE `shelf` (
  `uid` int(11) NOT NULL,
  `isbn` varchar(255) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `rating` decimal(3,2) DEFAULT NULL,
  `dateRead` date DEFAULT NULL,
  `dateAdded` date DEFAULT NULL,
  PRIMARY KEY (`uid`,`isbn`),
  KEY `fk3` (`isbn`),
  CONSTRAINT `fk2` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`),
  CONSTRAINT `fk3` FOREIGN KEY (`isbn`) REFERENCES `book` (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `shelf` WRITE;
/*!40000 ALTER TABLE `shelf` DISABLE KEYS */;

INSERT INTO `shelf` (`uid`, `isbn`, `name`, `rating`, `dateRead`, `dateAdded`)
VALUES
	(1,'978-0345803481','ADMIN\'S BOOK SHELF',5.00,'2017-06-05','2017-06-06'),
	(2,'978-0439023528','HAO\'S BOOK SHELF',5.00,'2017-06-05','2017-06-06'),
	(2,'978-0812974492','HAO\'S BOOK SHELF',3.00,'2017-06-05','2017-06-06'),
	(5,'978-0812974492','X SHELF',5.00,'2017-06-06','2018-05-05'),
	(6,'978-0439023528','Y SHELF',1.00,'2017-06-06','2017-06-06'),
	(6,'978-0812974492','Y SHELF',5.00,'2017-06-06','2017-06-06'),
	(7,'978-0812974492','A SEHLF ',1.00,NULL,NULL);

/*!40000 ALTER TABLE `shelf` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `uid` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `location` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `readCt` int(11) DEFAULT NULL,
  `toReadCt` int(11) DEFAULT NULL,
  `currentlyReadCt` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`uid`, `name`, `age`, `sex`, `location`, `birthday`, `readCt`, `toReadCt`, `currentlyReadCt`)
VALUES
	(1,'Admin',50,'M','LA','1992-08-04',1,1,0),
	(2,'HAO',25,'M','LA','1992-08-04',2,2,0),
	(3,'Taro',4,'F','LA','2011-08-04',0,0,0),
	(4,'Whisky',25,'M','LA','1992-09-04',0,0,0),
	(5,'X',20,'M','LA','1992-01-01',1,1,0),
	(6,'Y',22,'F','CA','1987-09-09',2,2,0),
	(7,'A',21,NULL,NULL,NULL,1,1,0);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
