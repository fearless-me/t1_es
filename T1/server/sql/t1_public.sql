/*
SQLyog Ultimate v12.5.0 (64 bit)
MySQL - 5.6.31-log : Database - t1_public
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`t1_public` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `t1_public`;

/*Table structure for table `serv_restart` */

DROP TABLE IF EXISTS `serv_restart`;

CREATE TABLE `serv_restart` (
  `serv_id` int(10) unsigned NOT NULL,
  `run_no` int(10) unsigned NOT NULL,
  `latest` int(10) unsigned NOT NULL,
  PRIMARY KEY (`serv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/* Procedure structure for procedure `get_serv_start` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_serv_start` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`127.0.0.1` PROCEDURE `get_serv_start`( IN sid INT)
BEGIN
		DECLARE runs INT DEFAULT 0;
		SELECT run_no INTO runs FROM `serv_restart` WHERE serv_id = sid;
		IF runs <> 0 THEN 
			UPDATE `serv_restart` SET `run_no` = runs + 1, latest = UNIX_TIMESTAMP() WHERE serv_id = sid;	
		ELSE
			INSERT serv_restart(`serv_id`,`run_no`,`latest`) VALUES(sid,  1, UNIX_TIMESTAMP());
		END IF;
		SELECT run_no FROM `serv_restart` WHERE serv_id = sid;
	END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
