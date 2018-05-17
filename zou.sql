/*
SQLyog  v12.2.6 (64 bit)
MySQL - 5.5.59 : Database - gdut_ssm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`gdut_ssm` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `gdut_ssm`;

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `b_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `author` varchar(255) DEFAULT NULL,
  `book_image` varchar(255) DEFAULT NULL,
  `book_name` varchar(255) DEFAULT NULL,
  `book_num` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `total_page` int(11) DEFAULT NULL,
  `pubilshing` varchar(255) DEFAULT NULL,
  `uptime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `book` */

/*Table structure for table `book_category` */

DROP TABLE IF EXISTS `book_category`;

CREATE TABLE `book_category` (
  `bc_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `b_id` bigint(20) NOT NULL,
  `c_id` bigint(20) NOT NULL,
  `uptime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`bc_id`),
  KEY `b_id` (`b_id`),
  KEY `c_id` (`c_id`),
  CONSTRAINT `book_category_ibfk_2` FOREIGN KEY (`c_id`) REFERENCES `category` (`c_id`),
  CONSTRAINT `book_category_ibfk_1` FOREIGN KEY (`b_id`) REFERENCES `book` (`b_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `book_category` */

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `c_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '类型名字',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '"0"代表无父类型',
  `uptime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `category` */

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `o_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_name` int(11) NOT NULL COMMENT '订单名',
  `order_status` int(11) NOT NULL COMMENT '订单情况:"0"未交费，“1"交费',
  `target_address` varchar(255) DEFAULT NULL COMMENT '订单目标地址',
  `telephone` varchar(255) DEFAULT NULL COMMENT '快递员电话',
  `price` int(11) NOT NULL COMMENT '总价',
  `description` varchar(255) DEFAULT NULL COMMENT '订单描述',
  `u_id` bigint(20) NOT NULL COMMENT '对应的用户',
  `uptime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最近一次更新时间',
  PRIMARY KEY (`o_id`),
  KEY `u_id` (`u_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `order` */

/*Table structure for table `order_detail` */

DROP TABLE IF EXISTS `order_detail`;

CREATE TABLE `order_detail` (
  `od_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bookname` varchar(255) DEFAULT NULL,
  `book_price` int(11) DEFAULT NULL,
  `book_num` int(11) DEFAULT NULL,
  `o_id` bigint(20) NOT NULL,
  `uptime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`od_id`),
  KEY `o_id` (`o_id`),
  CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`o_id`) REFERENCES `order` (`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `order_detail` */

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `r_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '权限名称',
  `role_desc` varchar(255) NOT NULL COMMENT '权限描述',
  `uptime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最近一次被更新时间',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`r_id`,`name`,`role_desc`,`uptime`) values 
(1,'超级管理员','拥有所有权限','2018-05-16 21:24:44'),
(2,'普通管理员','拥有除处理超级管理员外及修改用户权限外所有部分权限','2018-05-16 21:24:44'),
(3,'普通用户','拥有浏览网页，购买商品权限','2018-05-16 21:24:44');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `u_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL COMMENT '账号',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `nickname` varchar(255) NOT NULL COMMENT '昵称',
  `status` int(2) NOT NULL COMMENT '状态:"1"表示正常,"2"表示禁用',
  `uptime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户创号时间',
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`u_id`,`username`,`password`,`nickname`,`status`,`uptime`) values 
(2,'zou','12345i','8c65a0',1,'2018-05-16 21:30:14'),
(3,'zou','12345i','546ff1',1,'2018-05-16 21:30:14'),
(4,'zou','12345i','619ff2',1,'2018-05-16 21:30:14'),
(5,'zou','12345i','c86ec3',1,'2018-05-16 21:30:14'),
(6,'zou','12345i','648d74',1,'2018-05-16 21:30:14'),
(7,'zou','12345i','c93175',1,'2018-05-16 21:30:14'),
(8,'zou','12345i','974486',1,'2018-05-16 21:30:14'),
(9,'zou','12345i','4a2907',1,'2018-05-16 21:30:14'),
(10,'zou','12345i','ba0ab8',1,'2018-05-16 21:30:14'),
(11,'zou','12345i','d9bce9',1,'2018-05-16 21:30:14');

/*Table structure for table `user_address` */

DROP TABLE IF EXISTS `user_address`;

CREATE TABLE `user_address` (
  `a_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `receiver` varchar(255) NOT NULL COMMENT '收货人姓名',
  `address` varchar(255) NOT NULL COMMENT '收货人地址',
  `phone` varchar(255) NOT NULL COMMENT '收货人电话',
  `u_id` bigint(20) NOT NULL COMMENT '对应用户的id',
  `uptime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最近一次更新时间',
  PRIMARY KEY (`a_id`),
  KEY `u_id` (`u_id`),
  CONSTRAINT `user_address_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_address` */

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `ur_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `u_id` bigint(20) NOT NULL COMMENT '对应用户表主键',
  `r_id` bigint(20) NOT NULL COMMENT '对应权限表主键',
  `uptime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近一次更新时间',
  PRIMARY KEY (`ur_id`),
  KEY `u_id` (`u_id`),
  KEY `r_id` (`r_id`),
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`r_id`) REFERENCES `role` (`r_id`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_role` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
