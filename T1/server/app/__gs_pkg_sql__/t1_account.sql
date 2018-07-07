-- MySQL dump 10.13  Distrib 5.6.31, for Win64 (x86_64)
--
-- Host: localhost    Database: t1_account
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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `aid` bigint(20) unsigned NOT NULL COMMENT '账号唯一ID',
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '平台AID_+平台Name生成的内部账号',
  `account_crc` bigint(11) unsigned NOT NULL,
  `plat_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '平台生成的账号',
  `plat_name` char(50) DEFAULT '',
  `device` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '游戏程序存在手机上的唯一标识',
  `imei` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '安卓设备号',
  `idfa` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'ios的号统计',
  `mac` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '手机mac',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `version_hash_code` int(11) NOT NULL DEFAULT '0' COMMENT '客户端包版本HashCode',
  PRIMARY KEY (`aid`),
  UNIQUE KEY `UK_account_account` (`account`),
  KEY `account_crc` (`account_crc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='全国唯一账号表';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-28 10:48:33
