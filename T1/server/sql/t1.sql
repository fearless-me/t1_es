-- MySQL dump 10.16  Distrib 10.2.9-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: t1_account
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
-- Current Database: `t1_account`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `t1_account` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `t1_account`;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `aid` bigint(20) unsigned NOT NULL COMMENT '账号唯一ID',
  `account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '平台AID_+平台Name生成的内部账号',
  `account_crc` bigint(11) unsigned NOT NULL,
  `plat_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '平台生成的账号',
  `plat_name` char(50) DEFAULT '',
  `device` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '游戏程序存在手机上的唯一标识',
  `imei` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '安卓设备号',
  `idfa` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ios的号统计',
  `mac` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机mac',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `version_hash_code` int(11) NOT NULL DEFAULT 0 COMMENT '客户端包版本HashCode',
  PRIMARY KEY (`aid`),
  UNIQUE KEY `UK_account_account` (`account`),
  KEY `account_crc` (`account_crc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='全国唯一账号表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 't1_account'
--

--
-- Current Database: `t1_conf`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `t1_conf` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `t1_conf`;

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
  `conn` int(11) DEFAULT 30,
  `max_conn` int(11) DEFAULT 40,
  `worker` int(11) DEFAULT 20,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data_db_conf`
--

DROP TABLE IF EXISTS `data_db_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_db_conf` (
  `id` int(11) NOT NULL,
  `host` varchar(64) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `user` varchar(64) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `database` varchar(128) DEFAULT NULL,
  `conn` int(11) DEFAULT 30,
  `max_conn` int(11) DEFAULT 40,
  `worker` int(11) DEFAULT 20,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
  `conn` int(11) DEFAULT 30,
  `max_conn` int(11) DEFAULT 40,
  `worker` int(11) DEFAULT 20,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 't1_conf'
--

--
-- Current Database: `t1_data`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `t1_data` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `t1_data`;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player` (
  `aid` bigint(20) unsigned NOT NULL,
  `uid` bigint(20) unsigned NOT NULL,
  `sid` int(11) unsigned NOT NULL,
  `name` varchar(192) CHARACTER SET utf8mb4 NOT NULL,
  `level` int(11) unsigned DEFAULT 1,
  `wing_level` int(11) unsigned DEFAULT 0,
  `sex` tinyint(4) unsigned DEFAULT 0,
  `camp` int(11) unsigned DEFAULT 0,
  `race` int(11) unsigned DEFAULT 1,
  `career` int(11) unsigned DEFAULT 1,
  `head` int(11) unsigned DEFAULT 1,
  `map_id` int(11) unsigned DEFAULT 1,
  `line` int(11) NOT NULL DEFAULT 0,
  `x` float NOT NULL DEFAULT 100,
  `y` float NOT NULL DEFAULT 100,
  `old_map_id` int(11) unsigned DEFAULT 1,
  `old_line` int(11) unsigned DEFAULT 1,
  `old_x` float unsigned DEFAULT 100,
  `old_y` float unsigned DEFAULT 100,
  `delete_flag` int(10) unsigned DEFAULT 0,
  `delete_time` int(10) unsigned DEFAULT 0,
  `data` blob DEFAULT NULL,
  `version` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `aid_ref_uid` (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 't1_data'
--

--
-- Current Database: `t1_public`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `t1_public` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `t1_public`;

--
-- Table structure for table `serv_restart`
--

DROP TABLE IF EXISTS `serv_restart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serv_restart` (
  `serv_id` int(10) unsigned NOT NULL,
  `run_no` int(10) unsigned NOT NULL,
  `latest` int(10) unsigned NOT NULL,
  PRIMARY KEY (`serv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 't1_public'
--
/*!50003 DROP PROCEDURE IF EXISTS `get_serv_start` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`127.0.0.1` PROCEDURE `get_serv_start`( IN sid INT)
BEGIN

		DECLARE runs INT DEFAULT 0;

		SELECT run_no INTO runs FROM `serv_restart` WHERE serv_id = sid;

		IF runs <> 0 THEN 

			UPDATE `serv_restart` SET `run_no` = runs + 1, latest = UNIX_TIMESTAMP() WHERE serv_id = sid;	

		ELSE

			INSERT serv_restart(`serv_id`,`run_no`,`latest`) VALUES(sid,  1, UNIX_TIMESTAMP());

		END IF;

		SELECT run_no FROM `serv_restart` WHERE serv_id = sid;

	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-12 10:54:34
