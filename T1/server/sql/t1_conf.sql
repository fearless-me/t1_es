/*
SQLyog Ultimate v12.5.0 (64 bit)
MySQL - 5.6.31-log : Database - t1_conf
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`t1_conf` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `t1_conf`;

/*Table structure for table `account_db_conf` */

DROP TABLE IF EXISTS `account_db_conf`;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `data_db_conf` */

DROP TABLE IF EXISTS `data_db_conf`;

CREATE TABLE `data_db_conf` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `public_db_conf` */

DROP TABLE IF EXISTS `public_db_conf`;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
