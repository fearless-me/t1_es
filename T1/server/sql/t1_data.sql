/*
SQLyog Ultimate v12.5.0 (64 bit)
MySQL - 5.6.31-log : Database - t1_data
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`t1_data` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `t1_data`;

/*Table structure for table `player` */

DROP TABLE IF EXISTS `player`;

CREATE TABLE `player` (
  `aid` bigint(20) unsigned NOT NULL,
  `uid` bigint(20) unsigned NOT NULL,
  `sid` int(11) unsigned NOT NULL,
  `name` varchar(192) CHARACTER SET utf8mb4 NOT NULL,
  `level` int(11) unsigned DEFAULT '1',
  `wing_level` int(11) unsigned DEFAULT '0',
  `sex` tinyint(4) unsigned DEFAULT '0',
  `camp` int(11) unsigned DEFAULT '0',
  `race` int(11) unsigned DEFAULT '1',
  `career` int(11) unsigned DEFAULT '1',
  `head` int(11) unsigned DEFAULT '1',
  `map_id` int(11) unsigned DEFAULT '1',
  `line` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '100',
  `y` float NOT NULL DEFAULT '100',
  `old_map_id` int(11) unsigned DEFAULT '1',
  `old_line` int(11) unsigned DEFAULT '1',
  `old_x` float unsigned DEFAULT '100',
  `old_y` float unsigned DEFAULT '100',
  `data` blob,
  `version` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `aid_ref_uid` (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
