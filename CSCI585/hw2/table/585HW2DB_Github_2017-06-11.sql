# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.18)
# Database: 585HW2DB_Github
# Generation Time: 2017-06-11 23:14:26 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table branch
# ------------------------------------------------------------

DROP TABLE IF EXISTS `branch`;

CREATE TABLE `branch` (
  `branchId` int(11) NOT NULL,
  `repoId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`branchId`),
  KEY `fk5` (`repoId`),
  KEY `fk6` (`userId`),
  CONSTRAINT `fk5` FOREIGN KEY (`repoId`) REFERENCES `repository` (`repoId`),
  CONSTRAINT `fk6` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;

INSERT INTO `branch` (`branchId`, `repoId`, `userId`)
VALUES
	(1,2,1),
	(2,1,2),
	(3,2,2),
	(4,1,1),
	(5,3,2);

/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table codes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `codes`;

CREATE TABLE `codes` (
  `repoId` int(11) NOT NULL,
  `commits` int(11) NOT NULL,
  `branches` int(11) NOT NULL,
  `releases` int(11) DEFAULT NULL,
  `contributors` int(11) DEFAULT NULL,
  PRIMARY KEY (`repoId`),
  CONSTRAINT `fk4` FOREIGN KEY (`repoId`) REFERENCES `repository` (`repoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `codes` WRITE;
/*!40000 ALTER TABLE `codes` DISABLE KEYS */;

INSERT INTO `codes` (`repoId`, `commits`, `branches`, `releases`, `contributors`)
VALUES
	(1,2,1,1,2),
	(2,2,1,1,2);

/*!40000 ALTER TABLE `codes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table commits
# ------------------------------------------------------------

DROP TABLE IF EXISTS `commits`;

CREATE TABLE `commits` (
  `commitId` int(11) NOT NULL,
  `branchId` int(11) NOT NULL,
  `commitTime` datetime DEFAULT NULL,
  `noOfFiles` int(11) DEFAULT NULL,
  `additions` int(11) DEFAULT NULL,
  `deletions` int(11) DEFAULT NULL,
  PRIMARY KEY (`commitId`),
  KEY `fk7` (`branchId`),
  CONSTRAINT `fk7` FOREIGN KEY (`branchId`) REFERENCES `branch` (`branchId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `commits` WRITE;
/*!40000 ALTER TABLE `commits` DISABLE KEYS */;

INSERT INTO `commits` (`commitId`, `branchId`, `commitTime`, `noOfFiles`, `additions`, `deletions`)
VALUES
	(1,1,'2017-05-02 11:00:00',2,1000,2000),
	(2,1,'2000-01-01 11:00:00',2,100,20000);

/*!40000 ALTER TABLE `commits` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table issue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `issue`;

CREATE TABLE `issue` (
  `issueId` int(11) NOT NULL,
  `creatorId` int(11) NOT NULL,
  `raiseDate` date DEFAULT NULL,
  `resolverId` int(11) DEFAULT NULL,
  `resolveDate` date DEFAULT NULL,
  PRIMARY KEY (`issueId`),
  KEY `fk2` (`creatorId`),
  KEY `fk3` (`resolverId`),
  CONSTRAINT `fk2` FOREIGN KEY (`creatorId`) REFERENCES `users` (`userId`),
  CONSTRAINT `fk3` FOREIGN KEY (`resolverId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `issue` WRITE;
/*!40000 ALTER TABLE `issue` DISABLE KEYS */;

INSERT INTO `issue` (`issueId`, `creatorId`, `raiseDate`, `resolverId`, `resolveDate`)
VALUES
	(1,1,'2000-01-01',2,'2000-02-02'),
	(2,1,'2000-02-01',2,'2000-02-02'),
	(3,2,'2000-02-02',2,'2000-02-02'),
	(4,2,'2000-02-02',1,'2000-02-02');

/*!40000 ALTER TABLE `issue` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table repository
# ------------------------------------------------------------

DROP TABLE IF EXISTS `repository`;

CREATE TABLE `repository` (
  `repoId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `issueCount` int(11) DEFAULT NULL,
  `pullCount` int(11) DEFAULT NULL,
  `projectsCount` int(11) DEFAULT NULL,
  `wiki` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`repoId`),
  KEY `fk1` (`userId`),
  CONSTRAINT `fk1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `repository` WRITE;
/*!40000 ALTER TABLE `repository` DISABLE KEYS */;

INSERT INTO `repository` (`repoId`, `userId`, `issueCount`, `pullCount`, `projectsCount`, `wiki`)
VALUES
	(1,1,10,10,10,1),
	(2,1,10,10,10,1),
	(3,2,10,10,10,1);

/*!40000 ALTER TABLE `repository` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `noOfRepos` int(11) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `website` varchar(50) DEFAULT NULL,
  `contributions` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`userId`, `noOfRepos`, `location`, `email`, `website`, `contributions`)
VALUES
	(1,15,'jampot','a@x.cim','a.com',100),
	(2,20,'jampot','a@x,edu','b.com',240);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
