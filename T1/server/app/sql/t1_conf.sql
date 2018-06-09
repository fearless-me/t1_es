-- MySQL dump 10.13  Distrib 5.6.31, for Win64 (x86_64)
--
-- Host: localhost    Database: t1_conf
-- ------------------------------------------------------
-- Server version	5.6.31-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_db_conf`
--

DROP TABLE IF EXISTS `account_db_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_db_conf` (
  `id` int(11) NOT NULL,
  `host` varchar(64) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `user` varchar(64) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `database` varchar(128) DEFAULT NULL,
  `conn` int(11) DEFAULT '30',
  `max_conn` int(11) DEFAULT '40',
  `worker` int(11) DEFAULT '20',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `player_db_conf`
--

DROP TABLE IF EXISTS `player_db_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_db_conf` (
  `id` int(11) NOT NULL,
  `host` varchar(64) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `user` varchar(64) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `database` varchar(128) DEFAULT NULL,
  `conn` int(11) DEFAULT '30',
  `max_conn` int(11) DEFAULT '40',
  `worker` int(11) DEFAULT '20',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `public_db_conf`
--

DROP TABLE IF EXISTS `public_db_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_db_conf` (
  `id` int(11) NOT NULL,
  `host` varchar(64) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `user` varchar(64) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `database` varchar(128) DEFAULT NULL,
  `conn` int(11) DEFAULT '30',
  `max_conn` int(11) DEFAULT '40',
  `worker` int(11) DEFAULT '20',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-09 16:47:32
