-- MySQL dump 10.16  Distrib 10.2.9-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: t1_log
-- ------------------------------------------------------
-- Server version	10.2.9-MariaDB

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
-- Current Database: `t1_log`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `t1_log` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `t1_log`;

--
-- Table structure for table `log_money`
--

DROP TABLE IF EXISTS `log_money`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_money` (
  `auto_id__` bigint(20) NOT NULL AUTO_INCREMENT,
  `aid` bigint(20) unsigned NOT NULL,
  `uid` bigint(20) unsigned NOT NULL,
  `sid` int(11) unsigned NOT NULL,
  `name` varchar(192) CHARACTER SET utf8mb4 NOT NULL,
  `level` int(11) unsigned DEFAULT 1,
  `camp` int(11) unsigned DEFAULT 0,
  `race` int(11) unsigned DEFAULT 1,
  `career` int(11) unsigned DEFAULT 1,
  `head` int(11) unsigned DEFAULT 1,
  `map_id` int(11) unsigned DEFAULT 1,
  `line` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`auto_id__`),
  KEY `aid_ref_uid` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_player`
--

DROP TABLE IF EXISTS `log_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_player` (
  `auto_id__` bigint(20) NOT NULL AUTO_INCREMENT,
  `aid` bigint(20) unsigned NOT NULL,
  `uid` bigint(20) unsigned NOT NULL,
  `sid` int(11) unsigned NOT NULL,
  `name` varchar(192) CHARACTER SET utf8mb4 NOT NULL,
  `level` int(11) unsigned DEFAULT 1,
  `camp` int(11) unsigned DEFAULT 0,
  `race` int(11) unsigned DEFAULT 1,
  `career` int(11) unsigned DEFAULT 1,
  `head` int(11) unsigned DEFAULT 1,
  `map_id` int(11) unsigned DEFAULT 1,
  `line` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`auto_id__`),
  KEY `aid_ref_uid` (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 't1_log'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-21 10:19:21
