/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.2.9-MariaDB : Database - t1_conf
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

/*Data for the table `account_db_conf` */

insert  into `account_db_conf`(`id`,`host`,`port`,`user`,`password`,`database`,`conn`,`max_conn`,`worker`) values 
(0,'127.0.0.1',3306,'root','1234','t1_account',5,5,5);

/*Data for the table `data_db_conf` */

insert  into `data_db_conf`(`id`,`host`,`port`,`user`,`password`,`database`,`conn`,`max_conn`,`worker`) values 
(1,'127.0.0.1',3306,'root','1234','t1_data',5,5,5);

/*Data for the table `log_db_conf` */

insert  into `log_db_conf`(`id`,`host`,`port`,`user`,`password`,`database`,`conn`,`max_conn`,`worker`) values 
(1,'127.0.0.1',3306,'root','1234','t1_log',5,5,5),
(1010,'127.0.0.1',3306,'root','1234','t1_log',5,5,5);

/*Data for the table `public_db_conf` */

insert  into `public_db_conf`(`id`,`host`,`port`,`user`,`password`,`database`,`conn`,`max_conn`,`worker`) values 
(0,'127.0.0.1',3306,'root','1234','t1_public',1,1,1),
(1010,'127.0.0.1',3306,'root','1234','t1_public',5,5,5);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
