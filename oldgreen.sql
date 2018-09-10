-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: oldgreen
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

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
-- Current Database: `oldgreen`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `oldgreen` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `oldgreen`;

--
-- Table structure for table `admin_menu`
--

DROP TABLE IF EXISTS `admin_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_menu`
--

LOCK TABLES `admin_menu` WRITE;
/*!40000 ALTER TABLE `admin_menu` DISABLE KEYS */;
INSERT INTO `admin_menu` VALUES (1,0,1,'首页','fa-bar-chart','/',NULL,'2018-08-01 15:44:56'),(2,0,4,'系统管理','fa-tasks',NULL,NULL,'2018-08-01 16:16:40'),(3,2,5,'管理员','fa-users','auth/users',NULL,'2018-08-01 16:16:40'),(4,2,6,'角色管理','fa-user','auth/roles',NULL,'2018-08-01 16:16:40'),(5,2,7,'权限管理','fa-ban','auth/permissions',NULL,'2018-08-01 16:16:40'),(6,2,8,'菜单管理','fa-bars','auth/menu',NULL,'2018-08-01 16:16:40'),(7,2,9,'操作日志','fa-history','auth/logs',NULL,'2018-08-01 16:16:40'),(8,0,3,'用户管理','fa-users','/users','2018-08-01 15:51:50','2018-08-01 16:16:40'),(9,0,2,'商品管理','fa-cubes','/products','2018-08-01 16:16:27','2018-08-01 16:16:40'),(10,0,0,'订单管理','fa-rmb','/orders','2018-08-09 18:02:06','2018-08-09 18:02:06');
/*!40000 ALTER TABLE `admin_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_operation_log`
--

DROP TABLE IF EXISTS `admin_operation_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=321 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_operation_log`
--

LOCK TABLES `admin_operation_log` WRITE;
/*!40000 ALTER TABLE `admin_operation_log` DISABLE KEYS */;
INSERT INTO `admin_operation_log` VALUES (1,1,'admin','GET','192.168.10.1','[]','2018-08-01 07:33:17','2018-08-01 07:33:17'),(2,1,'admin','GET','192.168.10.1','[]','2018-08-01 07:34:25','2018-08-01 07:34:25'),(3,1,'admin','GET','192.168.10.1','[]','2018-08-01 07:35:09','2018-08-01 07:35:09'),(4,1,'admin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-01 07:35:21','2018-08-01 07:35:21'),(5,1,'admin/auth/menu','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-01 07:36:27','2018-08-01 07:36:27'),(6,1,'admin/auth/menu','GET','192.168.10.1','[]','2018-08-01 15:37:21','2018-08-01 15:37:21'),(7,1,'admin/auth/menu','GET','192.168.10.1','[]','2018-08-01 15:39:09','2018-08-01 15:39:09'),(8,1,'admin/auth/menu','GET','192.168.10.1','[]','2018-08-01 15:39:38','2018-08-01 15:39:38'),(9,1,'admin/auth/menu/1/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-01 15:44:44','2018-08-01 15:44:44'),(10,1,'admin/auth/menu/1','PUT','192.168.10.1','{\"parent_id\":\"0\",\"title\":\"\\u9996\\u9875\",\"icon\":\"fa-bar-chart\",\"uri\":\"\\/\",\"roles\":[null],\"_token\":\"RdFGa6od6VxWS5BeP6Yr0SZQIgIbeDlwcOz3sPDd\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/oldgreen.test\\/admin\\/auth\\/menu\"}','2018-08-01 15:44:56','2018-08-01 15:44:56'),(11,1,'admin/auth/menu','GET','192.168.10.1','[]','2018-08-01 15:44:56','2018-08-01 15:44:56'),(12,1,'admin/auth/menu/2/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-01 15:45:03','2018-08-01 15:45:03'),(13,1,'admin/auth/menu/2','PUT','192.168.10.1','{\"parent_id\":\"0\",\"title\":\"\\u7cfb\\u7edf\\u7ba1\\u7406\",\"icon\":\"fa-tasks\",\"uri\":null,\"roles\":[\"1\",null],\"_token\":\"RdFGa6od6VxWS5BeP6Yr0SZQIgIbeDlwcOz3sPDd\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/oldgreen.test\\/admin\\/auth\\/menu\"}','2018-08-01 15:45:11','2018-08-01 15:45:11'),(14,1,'admin/auth/menu','GET','192.168.10.1','[]','2018-08-01 15:45:11','2018-08-01 15:45:11'),(15,1,'admin/auth/menu/3/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-01 15:45:24','2018-08-01 15:45:24'),(16,1,'admin/auth/menu/3','PUT','192.168.10.1','{\"parent_id\":\"2\",\"title\":\"\\u7ba1\\u7406\\u5458\",\"icon\":\"fa-users\",\"uri\":\"auth\\/users\",\"roles\":[null],\"_token\":\"RdFGa6od6VxWS5BeP6Yr0SZQIgIbeDlwcOz3sPDd\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/oldgreen.test\\/admin\\/auth\\/menu\"}','2018-08-01 15:45:32','2018-08-01 15:45:32'),(17,1,'admin/auth/menu','GET','192.168.10.1','[]','2018-08-01 15:45:33','2018-08-01 15:45:33'),(18,1,'admin/auth/menu/4/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-01 15:45:36','2018-08-01 15:45:36'),(19,1,'admin/auth/menu/4','PUT','192.168.10.1','{\"parent_id\":\"2\",\"title\":\"\\u89d2\\u8272\\u7ba1\\u7406\",\"icon\":\"fa-user\",\"uri\":\"auth\\/roles\",\"roles\":[null],\"_token\":\"RdFGa6od6VxWS5BeP6Yr0SZQIgIbeDlwcOz3sPDd\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/oldgreen.test\\/admin\\/auth\\/menu\"}','2018-08-01 15:45:44','2018-08-01 15:45:44'),(20,1,'admin/auth/menu','GET','192.168.10.1','[]','2018-08-01 15:45:44','2018-08-01 15:45:44'),(21,1,'admin/auth/menu/5/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-01 15:45:54','2018-08-01 15:45:54'),(22,1,'admin/auth/menu/5','PUT','192.168.10.1','{\"parent_id\":\"2\",\"title\":\"\\u6743\\u9650\\u7ba1\\u7406\",\"icon\":\"fa-ban\",\"uri\":\"auth\\/permissions\",\"roles\":[null],\"_token\":\"RdFGa6od6VxWS5BeP6Yr0SZQIgIbeDlwcOz3sPDd\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/oldgreen.test\\/admin\\/auth\\/menu\"}','2018-08-01 15:46:01','2018-08-01 15:46:01'),(23,1,'admin/auth/menu','GET','192.168.10.1','[]','2018-08-01 15:46:02','2018-08-01 15:46:02'),(24,1,'admin/auth/menu/6/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-01 15:46:13','2018-08-01 15:46:13'),(25,1,'admin/auth/menu/6','PUT','192.168.10.1','{\"parent_id\":\"2\",\"title\":\"\\u83dc\\u5355\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"auth\\/menu\",\"roles\":[null],\"_token\":\"RdFGa6od6VxWS5BeP6Yr0SZQIgIbeDlwcOz3sPDd\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/oldgreen.test\\/admin\\/auth\\/menu\"}','2018-08-01 15:46:24','2018-08-01 15:46:24'),(26,1,'admin/auth/menu','GET','192.168.10.1','[]','2018-08-01 15:46:24','2018-08-01 15:46:24'),(27,1,'admin/auth/menu/7/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-01 15:46:27','2018-08-01 15:46:27'),(28,1,'admin/auth/menu/7','PUT','192.168.10.1','{\"parent_id\":\"2\",\"title\":\"\\u64cd\\u4f5c\\u65e5\\u5fd7\",\"icon\":\"fa-history\",\"uri\":\"auth\\/logs\",\"roles\":[null],\"_token\":\"RdFGa6od6VxWS5BeP6Yr0SZQIgIbeDlwcOz3sPDd\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/oldgreen.test\\/admin\\/auth\\/menu\"}','2018-08-01 15:46:37','2018-08-01 15:46:37'),(29,1,'admin/auth/menu','GET','192.168.10.1','[]','2018-08-01 15:46:38','2018-08-01 15:46:38'),(30,1,'admin/auth/menu','POST','192.168.10.1','{\"parent_id\":\"0\",\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-users\",\"uri\":null,\"roles\":[null],\"_token\":\"RdFGa6od6VxWS5BeP6Yr0SZQIgIbeDlwcOz3sPDd\"}','2018-08-01 15:51:50','2018-08-01 15:51:50'),(31,1,'admin/auth/menu','GET','192.168.10.1','[]','2018-08-01 15:51:51','2018-08-01 15:51:51'),(32,1,'admin/auth/menu/8/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-01 15:51:56','2018-08-01 15:51:56'),(33,1,'admin/auth/menu/8','PUT','192.168.10.1','{\"parent_id\":\"0\",\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-users\",\"uri\":\"\\/users\",\"roles\":[null],\"_token\":\"RdFGa6od6VxWS5BeP6Yr0SZQIgIbeDlwcOz3sPDd\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/oldgreen.test\\/admin\\/auth\\/menu\"}','2018-08-01 15:52:04','2018-08-01 15:52:04'),(34,1,'admin/auth/menu','GET','192.168.10.1','[]','2018-08-01 15:52:04','2018-08-01 15:52:04'),(35,1,'admin/auth/menu','GET','192.168.10.1','[]','2018-08-01 15:52:15','2018-08-01 15:52:15'),(36,1,'admin/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-01 15:52:18','2018-08-01 15:52:18'),(37,1,'admin/auth/menu','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-01 15:54:37','2018-08-01 15:54:37'),(38,1,'admin/auth/permissions','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-01 15:55:11','2018-08-01 15:55:11'),(39,1,'admin/auth/permissions/create','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-01 15:55:15','2018-08-01 15:55:15'),(40,1,'admin/auth/permissions','POST','192.168.10.1','{\"slug\":\"users\",\"name\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":\"\\/users*\",\"_token\":\"RdFGa6od6VxWS5BeP6Yr0SZQIgIbeDlwcOz3sPDd\",\"_previous_\":\"http:\\/\\/oldgreen.test\\/admin\\/auth\\/permissions\"}','2018-08-01 15:55:42','2018-08-01 15:55:42'),(41,1,'admin/auth/permissions','GET','192.168.10.1','[]','2018-08-01 15:55:42','2018-08-01 15:55:42'),(42,1,'admin/auth/roles','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-01 15:55:52','2018-08-01 15:55:52'),(43,1,'admin/auth/roles/create','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-01 15:55:55','2018-08-01 15:55:55'),(44,1,'admin/auth/roles/create','GET','192.168.10.1','[]','2018-08-01 15:56:26','2018-08-01 15:56:26'),(45,1,'admin/auth/roles','POST','192.168.10.1','{\"slug\":\"operator\",\"name\":\"\\u8fd0\\u8425\",\"permissions\":[\"2\",\"3\",\"4\",\"6\",null],\"_token\":\"RdFGa6od6VxWS5BeP6Yr0SZQIgIbeDlwcOz3sPDd\"}','2018-08-01 15:56:45','2018-08-01 15:56:45'),(46,1,'admin/auth/roles','GET','192.168.10.1','[]','2018-08-01 15:56:46','2018-08-01 15:56:46'),(47,1,'admin/auth/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-01 15:57:05','2018-08-01 15:57:05'),(48,1,'admin/auth/users/create','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-01 15:57:08','2018-08-01 15:57:08'),(49,1,'admin/auth/users','POST','192.168.10.1','{\"username\":\"operator\",\"name\":\"\\u8fd0\\u8425\",\"password\":\"operator\",\"password_confirmation\":\"operator\",\"roles\":[\"2\",null],\"permissions\":[null],\"_token\":\"RdFGa6od6VxWS5BeP6Yr0SZQIgIbeDlwcOz3sPDd\",\"_previous_\":\"http:\\/\\/oldgreen.test\\/admin\\/auth\\/users\"}','2018-08-01 15:58:32','2018-08-01 15:58:32'),(50,1,'admin/auth/users','GET','192.168.10.1','[]','2018-08-01 15:58:33','2018-08-01 15:58:33'),(51,1,'admin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-01 15:58:55','2018-08-01 15:58:55'),(52,1,'admin/auth/logout','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-01 15:58:58','2018-08-01 15:58:58'),(53,2,'admin','GET','192.168.10.1','[]','2018-08-01 15:59:04','2018-08-01 15:59:04'),(54,2,'admin/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-01 15:59:07','2018-08-01 15:59:07'),(55,2,'admin/auth/logout','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-01 16:00:02','2018-08-01 16:00:02'),(56,1,'admin','GET','192.168.10.1','[]','2018-08-01 16:00:11','2018-08-01 16:00:11'),(57,1,'admin/auth/menu','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-01 16:14:17','2018-08-01 16:14:17'),(58,1,'admin/auth/menu','POST','192.168.10.1','{\"parent_id\":\"0\",\"title\":\"\\u5546\\u54c1\\u7ba1\\u7406\",\"icon\":\"fa-cubes\",\"uri\":\"\\/products\",\"roles\":[null],\"_token\":\"3YILR68IawnkStCpq5idjNoZYiEPyY1QGibVwsue\"}','2018-08-01 16:16:27','2018-08-01 16:16:27'),(59,1,'admin/auth/menu','GET','192.168.10.1','[]','2018-08-01 16:16:28','2018-08-01 16:16:28'),(60,1,'admin/auth/menu','POST','192.168.10.1','{\"_token\":\"3YILR68IawnkStCpq5idjNoZYiEPyY1QGibVwsue\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":9},{\\\"id\\\":8},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}','2018-08-01 16:16:40','2018-08-01 16:16:40'),(61,1,'admin/auth/menu','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-01 16:16:41','2018-08-01 16:16:41'),(62,1,'admin/auth/menu','GET','192.168.10.1','[]','2018-08-01 16:16:46','2018-08-01 16:16:46'),(63,1,'admin/products','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-01 16:16:49','2018-08-01 16:16:49'),(64,1,'admin/products','GET','192.168.10.1','[]','2018-08-01 16:27:50','2018-08-01 16:27:50'),(65,1,'admin/products/create','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-01 16:27:55','2018-08-01 16:27:55'),(66,1,'admin/products','GET','192.168.10.1','[]','2018-08-01 16:27:57','2018-08-01 16:27:57'),(67,1,'admin/products/create','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-01 16:28:19','2018-08-01 16:28:19'),(68,1,'admin/products/create','GET','192.168.10.1','[]','2018-08-01 16:30:30','2018-08-01 16:30:30'),(69,1,'admin/products/create','GET','192.168.10.1','[]','2018-08-01 16:30:32','2018-08-01 16:30:32'),(70,1,'admin/products','GET','192.168.10.1','[]','2018-08-01 16:30:40','2018-08-01 16:30:40'),(71,1,'admin/products/create','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-01 16:36:06','2018-08-01 16:36:06'),(72,1,'admin','GET','192.168.10.1','[]','2018-08-07 14:08:37','2018-08-07 14:08:37'),(73,1,'admin/products','GET','192.168.10.1','[]','2018-08-07 14:08:41','2018-08-07 14:08:41'),(74,1,'admin/products/create','GET','192.168.10.1','[]','2018-08-07 14:08:44','2018-08-07 14:08:44'),(75,1,'admin/products/create','GET','192.168.10.1','[]','2018-08-07 14:11:32','2018-08-07 14:11:32'),(76,1,'admin/products','POST','192.168.10.1','{\"title\":\"Apple\\/\\u82f9\\u679c iPhone X 5.8\\u82f1\\u5bf8\\u624b\\u673a \\u6e2f\\u7248\\u884c\\u8d27iphonex \\u82f9\\u679cX \\u65b0\\u6b3e8x\",\"description\":\"<p><span class=\\\"marker\\\"><em><strong>\\u4ef7\\u683c\\u5df2\\u5b9a\\uff0c\\u73b0\\u8d27\\u53d1\\u552e\\uff0c\\u652f\\u6301\\u82b1\\u5457\\u5206\\u671f\\uff0c\\u539f\\u88c5\\u6b63\\u54c1\\u652f\\u6301\\u552e\\u540e\\u9a8c\\u8d27<\\/strong><\\/em><\\/span><\\/p>\\r\\n\\r\\n<p><span class=\\\"marker\\\"><em><strong>\\u65b0\\u54c1\\u4e0a\\u5e02\\uff0c\\u6bcf\\u5929\\u4ef7\\u683c\\u4e0d\\u7a33\\u5b9a\\uff0c\\u6216\\u6da8\\u6216\\u8dcc\\uff0c\\u53d1\\u8d27\\u540e\\u4e0d\\u9000\\u5dee\\u4ef7\\uff0c\\u6fc0\\u6d3b\\u540e\\u65e0\\u8d28\\u91cf\\u95ee\\u9898\\u4e0d\\u9000\\u4e0d\\u6362\\u54e6<\\/strong><\\/em><\\/span><\\/p>\\r\\n\\r\\n<p><span class=\\\"marker\\\"><em><strong>\\u6e2f\\u7248\\u4e0d\\u652f\\u6301\\u7535\\u4fe1\\u54e6\\uff5e\\u6e2f\\u7248\\u4e0d\\u652f\\u6301\\u7535\\u4fe1\\u54e6\\uff5e<\\/strong><\\/em><\\/span><\\/p>\",\"on_sale\":\"0\",\"productSkus\":{\"new_1\":{\"title\":\"\\u767d\\u827264G\",\"description\":\"\\u767d\\u8272+64G\",\"price\":\"8188\",\"stock\":\"100\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"title\":\"\\u767d\\u8272256G\",\"description\":\"\\u767d\\u8272+256G\",\"price\":\"9688\",\"stock\":\"100\",\"id\":null,\"_remove_\":\"0\"},\"new_3\":{\"title\":\"\\u9ed1\\u8272256G\",\"description\":\"\\u9ed1\\u8272+256G\",\"price\":\"9688\",\"stock\":\"100\",\"id\":null,\"_remove_\":\"0\"},\"new_4\":{\"title\":\"\\u9ed1\\u827264G\",\"description\":\"\\u9ed1\\u8272+64G\",\"price\":\"8188\",\"stock\":\"100\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"KFH3MfeiBRpClQGMcz9vSJZ6kAxPJinsIUClW8XK\",\"_previous_\":\"http:\\/\\/oldgreen.test\\/admin\\/products\"}','2018-08-07 14:17:30','2018-08-07 14:17:30'),(77,1,'admin/products','GET','192.168.10.1','[]','2018-08-07 14:17:31','2018-08-07 14:17:31'),(78,1,'admin/products','GET','192.168.10.1','[]','2018-08-07 14:17:44','2018-08-07 14:17:44'),(79,1,'admin/products/1/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-07 14:21:16','2018-08-07 14:21:16'),(80,1,'admin/products/1/edit','GET','192.168.10.1','[]','2018-08-07 14:22:25','2018-08-07 14:22:25'),(81,1,'admin/products/1/edit','GET','192.168.10.1','[]','2018-08-07 14:22:42','2018-08-07 14:22:42'),(82,1,'admin/products','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-07 14:22:44','2018-08-07 14:22:44'),(83,1,'admin/products/1/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-07 14:22:48','2018-08-07 14:22:48'),(84,1,'admin/products','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-07 14:22:54','2018-08-07 14:22:54'),(85,1,'admin/products/1/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-07 14:23:01','2018-08-07 14:23:01'),(86,1,'admin/products','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-07 14:23:03','2018-08-07 14:23:03'),(87,1,'admin/products/1/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-07 14:24:02','2018-08-07 14:24:02'),(88,1,'admin/products','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-07 14:24:53','2018-08-07 14:24:53'),(89,1,'admin/products','GET','192.168.10.1','[]','2018-08-07 14:26:21','2018-08-07 14:26:21'),(90,1,'admin/products/create','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-07 14:26:26','2018-08-07 14:26:26'),(91,1,'admin/products/create','GET','192.168.10.1','[]','2018-08-07 14:26:31','2018-08-07 14:26:31'),(92,1,'admin/products/create','GET','192.168.10.1','[]','2018-08-07 14:26:35','2018-08-07 14:26:35'),(93,1,'admin/products/create','GET','192.168.10.1','[]','2018-08-07 14:26:40','2018-08-07 14:26:40'),(94,1,'admin/products','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-07 14:26:43','2018-08-07 14:26:43'),(95,1,'admin/products/1/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-07 14:26:45','2018-08-07 14:26:45'),(96,1,'admin/products/1/edit','GET','192.168.10.1','[]','2018-08-07 14:27:44','2018-08-07 14:27:44'),(97,1,'admin/products/create','GET','192.168.10.1','[]','2018-08-07 14:27:50','2018-08-07 14:27:50'),(98,1,'admin/products/create','GET','192.168.10.1','[]','2018-08-07 14:28:00','2018-08-07 14:28:00'),(99,1,'admin/products/create','GET','192.168.10.1','[]','2018-08-07 14:28:06','2018-08-07 14:28:06'),(100,1,'admin/products/create','GET','192.168.10.1','[]','2018-08-07 14:28:36','2018-08-07 14:28:36'),(101,1,'admin/products/create','GET','192.168.10.1','[]','2018-08-07 14:28:50','2018-08-07 14:28:50'),(102,1,'admin/products/create','GET','192.168.10.1','[]','2018-08-07 14:30:53','2018-08-07 14:30:53'),(103,1,'admin/products/create','GET','192.168.10.1','[]','2018-08-07 14:38:40','2018-08-07 14:38:40'),(104,1,'admin/auth/logout','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-07 14:38:50','2018-08-07 14:38:50'),(105,1,'admin','GET','192.168.10.1','[]','2018-08-07 14:38:58','2018-08-07 14:38:58'),(106,1,'admin/products','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-07 14:39:05','2018-08-07 14:39:05'),(107,1,'admin/products/create','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-07 14:39:07','2018-08-07 14:39:07'),(108,1,'admin/products/create','GET','192.168.10.1','[]','2018-08-07 14:47:14','2018-08-07 14:47:14'),(109,1,'admin/products','POST','192.168.10.1','{\"title\":\"\\u56fd\\u884c\\u6b63\\u54c1Apple\\/\\u82f9\\u679c iPhone X \\u6e2f\\u7248\\u73b0\\u8d27\\u82f9\\u679ciphonex \\u82f9\\u679cx\\u624b\\u673a10x\",\"description\":\"<h2 style=\\\"font-style: italic; text-align: center;\\\"><u><em><strong><span class=\\\"marker\\\"><q><span style=\\\"font-family:times new roman,times,serif\\\">\\u56fd\\u884c\\u6b63\\u54c1Apple\\/\\u82f9\\u679c iPhone X \\u6e2f\\u7248\\u73b0\\u8d27\\u82f9\\u679ciphonex \\u82f9\\u679cx\\u624b\\u673a10x<\\/span><\\/q><\\/span><\\/strong><\\/em><\\/u><\\/h2>\",\"on_sale\":\"0\",\"productSkus\":{\"new_1\":{\"title\":\"iPhone X \\u6df1\\u7a7a\\u7070 \\u539f\\u5c01\\u672a\\u6fc0\\u6d3b\\u6ee1\\u4fdd64G\",\"description\":\"iPhone X \\u6df1\\u7a7a\\u7070 \\u539f\\u5c01\\u672a\\u6fc0\\u6d3b\\u6ee1\\u4fdd\",\"price\":\"6888\",\"stock\":\"100\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"title\":\"iPhone X \\u94f6\\u8272 \\u539f\\u5c01\\u672a\\u6fc0\\u6d3b\\u6ee1\\u4fdd64G\",\"description\":\"iPhone X \\u94f6\\u8272 \\u539f\\u5c01\\u672a\\u6fc0\\u6d3b\\u6ee1\\u4fdd\",\"price\":\"6788\",\"stock\":\"100\",\"id\":null,\"_remove_\":\"0\"},\"new_3\":{\"title\":\"iPhone X \\u6df1\\u7a7a\\u7070 \\u539f\\u5c01\\u672a\\u6fc0\\u6d3b\\u6ee1\\u4fdd256G\",\"description\":\"iPhone X \\u6df1\\u7a7a\\u7070 \\u539f\\u5c01\\u672a\\u6fc0\\u6d3b\\u6ee1\\u4fdd\",\"price\":\"8388\",\"stock\":\"50\",\"id\":null,\"_remove_\":\"0\"},\"new_4\":{\"title\":\"iPhone X \\u94f6\\u8272 \\u539f\\u5c01\\u672a\\u6fc0\\u6d3b\\u6ee1\\u4fdd256G\",\"description\":\"iPhone X \\u94f6\\u8272 \\u539f\\u5c01\\u672a\\u6fc0\\u6d3b\\u6ee1\\u4fdd\",\"price\":\"8188\",\"stock\":\"60\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"jDDWhMMfVwYCi7LEghjOK24nlKONZDu3Sc2Pls3M\"}','2018-08-07 14:50:52','2018-08-07 14:50:52'),(110,1,'admin/products','GET','192.168.10.1','[]','2018-08-07 14:50:53','2018-08-07 14:50:53'),(111,1,'admin/products/2/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-07 14:51:00','2018-08-07 14:51:00'),(112,1,'admin/products','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-07 14:52:01','2018-08-07 14:52:01'),(113,1,'admin/products','GET','192.168.10.1','[]','2018-08-07 14:52:04','2018-08-07 14:52:04'),(114,1,'admin/products','GET','192.168.10.1','[]','2018-08-07 14:53:28','2018-08-07 14:53:28'),(115,1,'admin/products/2/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-07 14:53:32','2018-08-07 14:53:32'),(116,1,'admin/products/2/edit','GET','192.168.10.1','[]','2018-08-07 14:53:44','2018-08-07 14:53:44'),(117,1,'admin/products/2/edit','GET','192.168.10.1','[]','2018-08-07 14:56:07','2018-08-07 14:56:07'),(118,1,'admin/products/2/edit','GET','192.168.10.1','[]','2018-08-07 14:57:02','2018-08-07 14:57:02'),(119,1,'admin/products/2/edit','GET','192.168.10.1','[]','2018-08-07 14:57:39','2018-08-07 14:57:39'),(120,1,'admin/products/2/edit','GET','192.168.10.1','[]','2018-08-07 14:58:03','2018-08-07 14:58:03'),(121,1,'admin/products/2/edit','GET','192.168.10.1','[]','2018-08-07 14:58:26','2018-08-07 14:58:26'),(122,1,'admin/products/2/edit','GET','192.168.10.1','[]','2018-08-07 14:59:07','2018-08-07 14:59:07'),(123,1,'admin/products/2/edit','GET','192.168.10.1','[]','2018-08-07 14:59:37','2018-08-07 14:59:37'),(124,1,'admin/products/2/edit','GET','192.168.10.1','[]','2018-08-07 15:00:34','2018-08-07 15:00:34'),(125,1,'admin/products/2/edit','GET','192.168.10.1','[]','2018-08-07 15:00:57','2018-08-07 15:00:57'),(126,1,'admin/products/2/edit','GET','192.168.10.1','[]','2018-08-07 15:01:30','2018-08-07 15:01:30'),(127,1,'admin/products/2/edit','GET','192.168.10.1','[]','2018-08-07 15:02:30','2018-08-07 15:02:30'),(128,1,'admin/products/2/edit','GET','192.168.10.1','[]','2018-08-07 15:02:59','2018-08-07 15:02:59'),(129,1,'admin/products/2/edit','GET','192.168.10.1','[]','2018-08-07 15:03:43','2018-08-07 15:03:43'),(130,1,'admin/products/2/edit','GET','192.168.10.1','[]','2018-08-07 15:04:17','2018-08-07 15:04:17'),(131,1,'admin/products/2/edit','GET','192.168.10.1','[]','2018-08-07 15:05:09','2018-08-07 15:05:09'),(132,1,'admin/products/2/edit','GET','192.168.10.1','[]','2018-08-07 15:05:57','2018-08-07 15:05:57'),(133,1,'admin/products/2/edit','GET','192.168.10.1','[]','2018-08-07 15:06:45','2018-08-07 15:06:45'),(134,1,'admin/products/2/edit','GET','192.168.10.1','[]','2018-08-07 15:12:01','2018-08-07 15:12:01'),(135,1,'admin/products/2/edit','GET','192.168.10.1','[]','2018-08-07 15:13:38','2018-08-07 15:13:38'),(136,1,'admin/products/2/edit','GET','192.168.10.1','[]','2018-08-07 15:17:49','2018-08-07 15:17:49'),(137,1,'admin/products/2/edit','GET','192.168.10.1','[]','2018-08-07 15:18:27','2018-08-07 15:18:27'),(138,1,'admin/products/2/edit','GET','192.168.10.1','[]','2018-08-07 15:23:26','2018-08-07 15:23:26'),(139,1,'admin/products/2/edit','GET','192.168.10.1','[]','2018-08-07 15:24:19','2018-08-07 15:24:19'),(140,1,'admin/products','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-07 15:25:22','2018-08-07 15:25:22'),(141,1,'admin/products/2/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-07 15:25:36','2018-08-07 15:25:36'),(142,1,'admin/products/2/edit','GET','192.168.10.1','[]','2018-08-07 15:26:26','2018-08-07 15:26:26'),(143,1,'admin/products/2/edit','GET','192.168.10.1','[]','2018-08-07 15:27:29','2018-08-07 15:27:29'),(144,1,'admin/products/2','PUT','192.168.10.1','{\"title\":\"\\u56fd\\u884c\\u6b63\\u54c1Apple\\/\\u82f9\\u679c iPhone X \\u6e2f\\u7248\\u73b0\\u8d27\\u82f9\\u679ciphonex \\u82f9\\u679cx\\u624b\\u673a10x\",\"description\":\"<h2 style=\\\"font-style: italic; text-align: center;\\\"><u><em><strong><span class=\\\"marker\\\"><q><span style=\\\"font-family:times new roman,times,serif\\\">\\u56fd\\u884c\\u6b63\\u54c1Apple\\/\\u82f9\\u679c iPhone X \\u6e2f\\u7248\\u73b0\\u8d27\\u82f9\\u679ciphonex \\u82f9\\u679cx\\u624b\\u673a10x<\\/span><\\/q><\\/span><\\/strong><\\/em><\\/u><\\/h2>\",\"on_sale\":\"1\",\"skus\":{\"5\":{\"title\":\"iPhone X \\u6df1\\u7a7a\\u7070 \\u539f\\u5c01\\u672a\\u6fc0\\u6d3b\\u6ee1\\u4fdd64G\",\"description\":\"iPhone X \\u6df1\\u7a7a\\u7070 \\u539f\\u5c01\\u672a\\u6fc0\\u6d3b\\u6ee1\\u4fdd\",\"price\":\"6888.00\",\"stock\":\"100\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"title\":\"iPhone X \\u94f6\\u8272 \\u539f\\u5c01\\u672a\\u6fc0\\u6d3b\\u6ee1\\u4fdd64G\",\"description\":\"iPhone X \\u94f6\\u8272 \\u539f\\u5c01\\u672a\\u6fc0\\u6d3b\\u6ee1\\u4fdd\",\"price\":\"6788.00\",\"stock\":\"100\",\"id\":\"6\",\"_remove_\":\"0\"},\"7\":{\"title\":\"iPhone X \\u6df1\\u7a7a\\u7070 \\u539f\\u5c01\\u672a\\u6fc0\\u6d3b\\u6ee1\\u4fdd256G\",\"description\":\"iPhone X \\u6df1\\u7a7a\\u7070 \\u539f\\u5c01\\u672a\\u6fc0\\u6d3b\\u6ee1\\u4fdd\",\"price\":\"8388.00\",\"stock\":\"50\",\"id\":\"7\",\"_remove_\":\"0\"},\"8\":{\"title\":\"iPhone X \\u94f6\\u8272 \\u539f\\u5c01\\u672a\\u6fc0\\u6d3b\\u6ee1\\u4fdd256G\",\"description\":\"iPhone X \\u94f6\\u8272 \\u539f\\u5c01\\u672a\\u6fc0\\u6d3b\\u6ee1\\u4fdd\",\"price\":\"8188.00\",\"stock\":\"60\",\"id\":\"8\",\"_remove_\":\"0\"}},\"_token\":\"jDDWhMMfVwYCi7LEghjOK24nlKONZDu3Sc2Pls3M\",\"_method\":\"PUT\"}','2018-08-07 15:43:13','2018-08-07 15:43:13'),(145,1,'admin/products/2/edit','GET','192.168.10.1','[]','2018-08-07 15:43:14','2018-08-07 15:43:14'),(146,1,'admin/products/2','PUT','192.168.10.1','{\"title\":\"\\u56fd\\u884c\\u6b63\\u54c1Apple\\/\\u82f9\\u679c iPhone X \\u6e2f\\u7248\\u73b0\\u8d27\\u82f9\\u679ciphonex \\u82f9\\u679cx\\u624b\\u673a10x\",\"description\":\"<h2 style=\\\"font-style: italic; text-align: center;\\\"><u><em><strong><span class=\\\"marker\\\"><q><span style=\\\"font-family:times new roman,times,serif\\\">\\u56fd\\u884c\\u6b63\\u54c1Apple\\/\\u82f9\\u679c iPhone X \\u6e2f\\u7248\\u73b0\\u8d27\\u82f9\\u679ciphonex \\u82f9\\u679cx\\u624b\\u673a10x<\\/span><\\/q><\\/span><\\/strong><\\/em><\\/u><\\/h2>\",\"on_sale\":\"1\",\"skus\":{\"5\":{\"title\":\"\\u56fd\\u884c\\u6b63\\u54c1Apple\\/\\u82f9\\u679c iPhone X \\u6e2f\\u7248\\u73b0\\u8d27\\u82f9\\u679ciphonex \\u82f9\\u679cx\\u624b\\u673a10x\",\"description\":\"<h2 style=\\\"font-style: italic; text-align: center;\\\"><u><em><strong><span class=\\\"marker\\\"><q><span style=\\\"font-family:times new roman,times,serif\\\">\\u56fd\\u884c\\u6b63\\u54c1Apple\\/\\u82f9\\u679c iPhone X \\u6e2f\\u7248\\u73b0\\u8d27\\u82f9\\u679ciphonex \\u82f9\\u679cx\\u624b\\u673a10x<\\/span><\\/q><\\/span><\\/strong><\\/em><\\/u><\\/h2>\",\"price\":\"6888.00\",\"stock\":\"100\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"title\":\"\\u56fd\\u884c\\u6b63\\u54c1Apple\\/\\u82f9\\u679c iPhone X \\u6e2f\\u7248\\u73b0\\u8d27\\u82f9\\u679ciphonex \\u82f9\\u679cx\\u624b\\u673a10x\",\"description\":\"<h2 style=\\\"font-style: italic; text-align: center;\\\"><u><em><strong><span class=\\\"marker\\\"><q><span style=\\\"font-family:times new roman,times,serif\\\">\\u56fd\\u884c\\u6b63\\u54c1Apple\\/\\u82f9\\u679c iPhone X \\u6e2f\\u7248\\u73b0\\u8d27\\u82f9\\u679ciphonex \\u82f9\\u679cx\\u624b\\u673a10x<\\/span><\\/q><\\/span><\\/strong><\\/em><\\/u><\\/h2>\",\"price\":\"6788.00\",\"stock\":\"100\",\"id\":\"6\",\"_remove_\":\"0\"},\"7\":{\"title\":\"\\u56fd\\u884c\\u6b63\\u54c1Apple\\/\\u82f9\\u679c iPhone X \\u6e2f\\u7248\\u73b0\\u8d27\\u82f9\\u679ciphonex \\u82f9\\u679cx\\u624b\\u673a10x\",\"description\":\"<h2 style=\\\"font-style: italic; text-align: center;\\\"><u><em><strong><span class=\\\"marker\\\"><q><span style=\\\"font-family:times new roman,times,serif\\\">\\u56fd\\u884c\\u6b63\\u54c1Apple\\/\\u82f9\\u679c iPhone X \\u6e2f\\u7248\\u73b0\\u8d27\\u82f9\\u679ciphonex \\u82f9\\u679cx\\u624b\\u673a10x<\\/span><\\/q><\\/span><\\/strong><\\/em><\\/u><\\/h2>\",\"price\":\"8388.00\",\"stock\":\"50\",\"id\":\"7\",\"_remove_\":\"0\"},\"8\":{\"title\":\"\\u56fd\\u884c\\u6b63\\u54c1Apple\\/\\u82f9\\u679c iPhone X \\u6e2f\\u7248\\u73b0\\u8d27\\u82f9\\u679ciphonex \\u82f9\\u679cx\\u624b\\u673a10x\",\"description\":\"<h2 style=\\\"font-style: italic; text-align: center;\\\"><u><em><strong><span class=\\\"marker\\\"><q><span style=\\\"font-family:times new roman,times,serif\\\">\\u56fd\\u884c\\u6b63\\u54c1Apple\\/\\u82f9\\u679c iPhone X \\u6e2f\\u7248\\u73b0\\u8d27\\u82f9\\u679ciphonex \\u82f9\\u679cx\\u624b\\u673a10x<\\/span><\\/q><\\/span><\\/strong><\\/em><\\/u><\\/h2>\",\"price\":\"8188.00\",\"stock\":\"60\",\"id\":\"8\",\"_remove_\":\"0\"}},\"_token\":\"jDDWhMMfVwYCi7LEghjOK24nlKONZDu3Sc2Pls3M\",\"_method\":\"PUT\"}','2018-08-07 15:44:44','2018-08-07 15:44:44'),(147,1,'admin/products','GET','192.168.10.1','[]','2018-08-07 15:44:45','2018-08-07 15:44:45'),(148,1,'admin/products/2/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-07 15:45:01','2018-08-07 15:45:01'),(149,1,'admin/products','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-07 16:29:50','2018-08-07 16:29:50'),(150,1,'admin/products','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}','2018-08-07 16:30:03','2018-08-07 16:30:03'),(151,1,'admin/products','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\",\"page\":\"3\"}','2018-08-07 16:30:08','2018-08-07 16:30:08'),(152,1,'admin/products','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\",\"page\":\"4\"}','2018-08-07 16:30:11','2018-08-07 16:30:11'),(153,1,'admin/products','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\",\"page\":\"1\"}','2018-08-07 16:30:33','2018-08-07 16:30:33'),(154,1,'admin/products','GET','192.168.10.1','{\"page\":\"1\"}','2018-08-08 10:11:27','2018-08-08 10:11:27'),(155,1,'admin/products','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-08 12:19:53','2018-08-08 12:19:53'),(156,1,'admin/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-08 12:19:56','2018-08-08 12:19:56'),(157,1,'admin/products','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-08 16:51:13','2018-08-08 16:51:13'),(158,1,'admin/products/1/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-08 16:51:23','2018-08-08 16:51:23'),(159,1,'admin/products/1','PUT','192.168.10.1','{\"title\":\"voluptas\",\"description\":\"Quam consectetur quia harum iste itaque.\",\"on_sale\":\"0\",\"skus\":{\"1\":{\"title\":\"minima\",\"description\":\"Est possimus itaque vero et.\",\"price\":\"4578.00\",\"stock\":\"214\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"title\":\"molestiae\",\"description\":\"Corporis qui ex aspernatur quam.\",\"price\":\"618.00\",\"stock\":\"617\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"title\":\"non\",\"description\":\"Vel eum sint atque rerum dignissimos repudiandae.\",\"price\":\"9192.00\",\"stock\":\"370\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"title\":\"modi\",\"description\":\"Aut expedita aspernatur velit veritatis.\",\"price\":\"7199.00\",\"stock\":\"348\",\"id\":\"4\",\"_remove_\":\"0\"}},\"_token\":\"FizUjRp5Po7eb2vcauog0SBrQXcUfBf76RAzn2MU\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/oldgreen.test\\/admin\\/products\"}','2018-08-08 16:51:29','2018-08-08 16:51:29'),(160,1,'admin/products','GET','192.168.10.1','[]','2018-08-08 16:51:30','2018-08-08 16:51:30'),(161,1,'admin/auth/menu','GET','192.168.10.1','[]','2018-08-09 18:01:24','2018-08-09 18:01:24'),(162,1,'admin/auth/menu','POST','192.168.10.1','{\"parent_id\":\"0\",\"title\":\"\\u8ba2\\u5355\\u7ba1\\u7406\",\"icon\":\"fa-rmb\",\"uri\":\"\\/orders\",\"roles\":[null],\"_token\":\"STtXg0OIoTjuUrnBHZvTkRKYvACZEWOUfWuTRn6U\"}','2018-08-09 18:02:05','2018-08-09 18:02:05'),(163,1,'admin/auth/menu','GET','192.168.10.1','[]','2018-08-09 18:02:09','2018-08-09 18:02:09'),(164,1,'admin/auth/menu','GET','192.168.10.1','[]','2018-08-09 18:02:17','2018-08-09 18:02:17'),(165,1,'admin/orders','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-09 18:03:02','2018-08-09 18:03:02'),(166,1,'admin/orders','GET','192.168.10.1','[]','2018-08-09 18:04:43','2018-08-09 18:04:43'),(167,1,'admin/orders','GET','192.168.10.1','[]','2018-08-09 18:06:06','2018-08-09 18:06:06'),(168,1,'admin/orders','GET','192.168.10.1','[]','2018-08-09 18:06:45','2018-08-09 18:06:45'),(169,1,'admin/orders','GET','192.168.10.1','[]','2018-08-10 09:43:34','2018-08-10 09:43:34'),(170,1,'admin/orders/11','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-10 09:53:37','2018-08-10 09:53:37'),(171,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 09:55:47','2018-08-10 09:55:47'),(172,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 09:56:50','2018-08-10 09:56:50'),(173,1,'admin/orders','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-10 09:57:00','2018-08-10 09:57:00'),(174,1,'admin/orders/11','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-10 09:57:03','2018-08-10 09:57:03'),(175,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 10:19:33','2018-08-10 10:19:33'),(176,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 10:20:00','2018-08-10 10:20:00'),(177,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 10:20:24','2018-08-10 10:20:24'),(178,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 10:21:49','2018-08-10 10:21:49'),(179,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 11:01:19','2018-08-10 11:01:19'),(180,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 11:06:57','2018-08-10 11:06:57'),(181,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 11:12:32','2018-08-10 11:12:32'),(182,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 11:15:18','2018-08-10 11:15:18'),(183,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 11:16:29','2018-08-10 11:16:29'),(184,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 11:24:03','2018-08-10 11:24:03'),(185,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 11:24:40','2018-08-10 11:24:40'),(186,1,'admin/orders/11/ship','POST','192.168.10.1','{\"_token\":\"wNVm5HZbUUKsv5YHi42kGmMprZ5KZzlu5oGkCrIo\",\"express_company\":null,\"express_no\":\"220828521056\"}','2018-08-10 11:25:41','2018-08-10 11:25:41'),(187,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 11:25:42','2018-08-10 11:25:42'),(188,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 11:33:17','2018-08-10 11:33:17'),(189,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 11:33:40','2018-08-10 11:33:40'),(190,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 11:38:18','2018-08-10 11:38:18'),(191,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 11:39:10','2018-08-10 11:39:10'),(192,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 11:41:01','2018-08-10 11:41:01'),(193,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 11:41:34','2018-08-10 11:41:34'),(194,1,'admin/orders/getExpressCompany','POST','192.168.10.1','{\"LogisticCode\":\"220828521056\"}','2018-08-10 11:41:42','2018-08-10 11:41:42'),(195,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 11:51:21','2018-08-10 11:51:21'),(196,1,'admin/orders/getExpressCompany','POST','192.168.10.1','{\"LogisticCode\":\"220828521056\"}','2018-08-10 11:51:33','2018-08-10 11:51:33'),(197,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 11:52:15','2018-08-10 11:52:15'),(198,1,'admin/orders/getExpressCompany','POST','192.168.10.1','{\"LogisticCode\":\"220828521056\"}','2018-08-10 11:52:19','2018-08-10 11:52:19'),(199,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 11:53:14','2018-08-10 11:53:14'),(200,1,'admin/orders/getExpressCompany','POST','192.168.10.1','{\"LogisticCode\":\"220828521056\"}','2018-08-10 11:53:18','2018-08-10 11:53:18'),(201,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 11:53:48','2018-08-10 11:53:48'),(202,1,'admin/orders/getExpressCompany','POST','192.168.10.1','{\"LogisticCode\":\"220828521056\"}','2018-08-10 11:53:52','2018-08-10 11:53:52'),(203,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 13:37:06','2018-08-10 13:37:06'),(204,1,'admin/orders/getExpressCompany','POST','192.168.10.1','{\"LogisticCode\":\"220828521056\"}','2018-08-10 13:37:11','2018-08-10 13:37:11'),(205,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 13:38:31','2018-08-10 13:38:31'),(206,1,'admin/orders/getExpressCompany','POST','192.168.10.1','{\"LogisticCode\":\"220828521056\"}','2018-08-10 13:38:35','2018-08-10 13:38:35'),(207,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 13:39:01','2018-08-10 13:39:01'),(208,1,'admin/orders/getExpressCompany','POST','192.168.10.1','{\"LogisticCode\":\"220828521056\"}','2018-08-10 13:39:04','2018-08-10 13:39:04'),(209,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 13:43:37','2018-08-10 13:43:37'),(210,1,'admin/orders/getExpressCompany','POST','192.168.10.1','{\"LogisticCode\":\"220828521056\"}','2018-08-10 13:43:41','2018-08-10 13:43:41'),(211,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 13:46:21','2018-08-10 13:46:21'),(212,1,'admin/orders/getExpressCompany','POST','192.168.10.1','{\"LogisticCode\":\"220828521056\"}','2018-08-10 13:46:25','2018-08-10 13:46:25'),(213,1,'admin/orders/11/ship','POST','192.168.10.1','{\"_token\":\"wNVm5HZbUUKsv5YHi42kGmMprZ5KZzlu5oGkCrIo\",\"express_company\":\"\\u4e2d\\u901a\\u901f\\u9012\",\"express_no\":\"220828521056\"}','2018-08-10 13:46:39','2018-08-10 13:46:39'),(214,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 13:46:40','2018-08-10 13:46:40'),(215,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 13:48:14','2018-08-10 13:48:14'),(216,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 13:49:27','2018-08-10 13:49:27'),(217,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 13:50:23','2018-08-10 13:50:23'),(218,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 13:58:57','2018-08-10 13:58:57'),(219,1,'admin/orders','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-10 13:59:09','2018-08-10 13:59:09'),(220,1,'admin/orders/11','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-10 13:59:12','2018-08-10 13:59:12'),(221,1,'admin/orders','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-10 13:59:15','2018-08-10 13:59:15'),(222,1,'admin/orders','GET','192.168.10.1','[]','2018-08-10 13:59:28','2018-08-10 13:59:28'),(223,1,'admin/orders/11','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-10 13:59:30','2018-08-10 13:59:30'),(224,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 14:00:50','2018-08-10 14:00:50'),(225,1,'admin/orders/getExpressCompany','POST','192.168.10.1','{\"LogisticCode\":\"res.Shippers[0].ShipperName\"}','2018-08-10 14:00:54','2018-08-10 14:00:54'),(226,1,'admin/orders/getExpressCompany','POST','192.168.10.1','{\"LogisticCode\":\"220828521056\"}','2018-08-10 14:01:05','2018-08-10 14:01:05'),(227,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 14:02:58','2018-08-10 14:02:58'),(228,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 14:03:12','2018-08-10 14:03:12'),(229,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 14:03:35','2018-08-10 14:03:35'),(230,1,'admin/orders/getExpressCompany','POST','192.168.10.1','{\"LogisticCode\":\"220828521056\"}','2018-08-10 14:03:46','2018-08-10 14:03:46'),(231,1,'admin/orders/11/ship','POST','192.168.10.1','{\"_token\":\"wNVm5HZbUUKsv5YHi42kGmMprZ5KZzlu5oGkCrIo\",\"express_no\":\"220828521056\"}','2018-08-10 14:03:48','2018-08-10 14:03:48'),(232,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 14:03:49','2018-08-10 14:03:49'),(233,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 14:04:30','2018-08-10 14:04:30'),(234,1,'admin/orders/getExpressCompany','POST','192.168.10.1','{\"LogisticCode\":\"220828521056\"}','2018-08-10 14:04:34','2018-08-10 14:04:34'),(235,1,'admin/orders/11/ship','POST','192.168.10.1','{\"_token\":\"wNVm5HZbUUKsv5YHi42kGmMprZ5KZzlu5oGkCrIo\",\"express_company\":\"\\u4e2d\\u901a\\u901f\\u9012\",\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 14:04:36','2018-08-10 14:04:36'),(236,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 14:04:37','2018-08-10 14:04:37'),(237,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 14:06:21','2018-08-10 14:06:21'),(238,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 14:06:41','2018-08-10 14:06:41'),(239,1,'admin/orders/getExpressCompany','POST','192.168.10.1','{\"LogisticCode\":\"220828521056\"}','2018-08-10 14:06:51','2018-08-10 14:06:51'),(240,1,'admin/orders/11/ship','POST','192.168.10.1','{\"_token\":\"wNVm5HZbUUKsv5YHi42kGmMprZ5KZzlu5oGkCrIo\",\"express_company\":\"\\u4e2d\\u901a\\u901f\\u9012\",\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 14:08:16','2018-08-10 14:08:16'),(241,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 14:08:16','2018-08-10 14:08:16'),(242,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 14:10:19','2018-08-10 14:10:19'),(243,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 14:10:24','2018-08-10 14:10:24'),(244,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 14:11:44','2018-08-10 14:11:44'),(245,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 14:12:38','2018-08-10 14:12:38'),(246,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 14:12:52','2018-08-10 14:12:52'),(247,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 14:12:55','2018-08-10 14:12:55'),(248,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 14:14:20','2018-08-10 14:14:20'),(249,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 14:14:53','2018-08-10 14:14:53'),(250,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 14:14:57','2018-08-10 14:14:57'),(251,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 14:15:10','2018-08-10 14:15:10'),(252,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 14:15:13','2018-08-10 14:15:13'),(253,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 14:20:51','2018-08-10 14:20:51'),(254,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 14:20:54','2018-08-10 14:20:54'),(255,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 14:22:00','2018-08-10 14:22:00'),(256,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 14:22:04','2018-08-10 14:22:04'),(257,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 15:15:51','2018-08-10 15:15:51'),(258,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 15:15:58','2018-08-10 15:15:58'),(259,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 15:17:03','2018-08-10 15:17:03'),(260,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 15:17:06','2018-08-10 15:17:06'),(261,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 15:17:52','2018-08-10 15:17:52'),(262,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 15:17:55','2018-08-10 15:17:55'),(263,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 15:18:11','2018-08-10 15:18:11'),(264,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 15:18:14','2018-08-10 15:18:14'),(265,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 15:47:51','2018-08-10 15:47:51'),(266,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 15:48:22','2018-08-10 15:48:22'),(267,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 15:49:13','2018-08-10 15:49:13'),(268,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 15:52:20','2018-08-10 15:52:20'),(269,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 15:54:02','2018-08-10 15:54:02'),(270,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 15:55:28','2018-08-10 15:55:28'),(271,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 15:55:51','2018-08-10 15:55:51'),(272,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 15:56:11','2018-08-10 15:56:11'),(273,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 15:57:31','2018-08-10 15:57:31'),(274,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 15:57:55','2018-08-10 15:57:55'),(275,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 15:59:34','2018-08-10 15:59:34'),(276,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:00:36','2018-08-10 16:00:36'),(277,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:04:17','2018-08-10 16:04:17'),(278,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:05:47','2018-08-10 16:05:47'),(279,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:06:28','2018-08-10 16:06:28'),(280,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:09:58','2018-08-10 16:09:58'),(281,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:13:31','2018-08-10 16:13:31'),(282,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:14:01','2018-08-10 16:14:01'),(283,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:15:25','2018-08-10 16:15:25'),(284,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:16:40','2018-08-10 16:16:40'),(285,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:17:35','2018-08-10 16:17:35'),(286,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:19:20','2018-08-10 16:19:20'),(287,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:19:34','2018-08-10 16:19:34'),(288,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:19:44','2018-08-10 16:19:44'),(289,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:19:58','2018-08-10 16:19:58'),(290,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:20:29','2018-08-10 16:20:29'),(291,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:20:56','2018-08-10 16:20:56'),(292,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:21:19','2018-08-10 16:21:19'),(293,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:23:18','2018-08-10 16:23:18'),(294,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:23:50','2018-08-10 16:23:50'),(295,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:24:32','2018-08-10 16:24:32'),(296,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:24:55','2018-08-10 16:24:55'),(297,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:25:19','2018-08-10 16:25:19'),(298,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:25:55','2018-08-10 16:25:55'),(299,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:27:17','2018-08-10 16:27:17'),(300,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:28:01','2018-08-10 16:28:01'),(301,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:30:59','2018-08-10 16:30:59'),(302,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:31:35','2018-08-10 16:31:35'),(303,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:32:25','2018-08-10 16:32:25'),(304,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:32:28','2018-08-10 16:32:28'),(305,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:32:31','2018-08-10 16:32:31'),(306,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:32:48','2018-08-10 16:32:48'),(307,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:34:42','2018-08-10 16:34:42'),(308,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:36:38','2018-08-10 16:36:38'),(309,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 16:37:13','2018-08-10 16:37:13'),(310,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:37:15','2018-08-10 16:37:15'),(311,1,'admin/orders/11','GET','192.168.10.1','[]','2018-08-10 16:38:23','2018-08-10 16:38:23'),(312,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:38:25','2018-08-10 16:38:25'),(313,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-10 16:38:40','2018-08-10 16:38:40'),(314,1,'admin','GET','192.168.10.1','[]','2018-08-13 09:44:30','2018-08-13 09:44:30'),(315,1,'admin/orders','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-13 09:44:43','2018-08-13 09:44:43'),(316,1,'admin/orders/11','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-08-13 09:44:48','2018-08-13 09:44:48'),(317,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-13 09:44:50','2018-08-13 09:44:50'),(318,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-13 09:44:58','2018-08-13 09:44:58'),(319,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-13 09:45:04','2018-08-13 09:45:04'),(320,1,'admin/orders/getShipData','POST','192.168.10.1','{\"express_company_code\":\"ZTO\",\"express_no\":\"220828521056\"}','2018-08-13 09:45:11','2018-08-13 09:45:11');
/*!40000 ALTER TABLE `admin_operation_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_permissions`
--

DROP TABLE IF EXISTS `admin_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_permissions`
--

LOCK TABLES `admin_permissions` WRITE;
/*!40000 ALTER TABLE `admin_permissions` DISABLE KEYS */;
INSERT INTO `admin_permissions` VALUES (1,'All permission','*','','*',NULL,NULL),(2,'Dashboard','dashboard','GET','/',NULL,NULL),(3,'Login','auth.login','','/auth/login\r\n/auth/logout',NULL,NULL),(4,'User setting','auth.setting','GET,PUT','/auth/setting',NULL,NULL),(5,'Auth management','auth.management','','/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs',NULL,NULL),(6,'用户管理','users','','/users*','2018-08-01 15:55:42','2018-08-01 15:55:42');
/*!40000 ALTER TABLE `admin_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_menu`
--

DROP TABLE IF EXISTS `admin_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role_menu`
--

LOCK TABLES `admin_role_menu` WRITE;
/*!40000 ALTER TABLE `admin_role_menu` DISABLE KEYS */;
INSERT INTO `admin_role_menu` VALUES (1,2,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_permissions`
--

DROP TABLE IF EXISTS `admin_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role_permissions`
--

LOCK TABLES `admin_role_permissions` WRITE;
/*!40000 ALTER TABLE `admin_role_permissions` DISABLE KEYS */;
INSERT INTO `admin_role_permissions` VALUES (1,1,NULL,NULL),(2,2,NULL,NULL),(2,3,NULL,NULL),(2,4,NULL,NULL),(2,6,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_users`
--

DROP TABLE IF EXISTS `admin_role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role_users`
--

LOCK TABLES `admin_role_users` WRITE;
/*!40000 ALTER TABLE `admin_role_users` DISABLE KEYS */;
INSERT INTO `admin_role_users` VALUES (1,1,NULL,NULL),(2,2,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_roles`
--

DROP TABLE IF EXISTS `admin_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_roles`
--

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;
INSERT INTO `admin_roles` VALUES (1,'Administrator','administrator','2018-08-01 07:31:20','2018-08-01 07:31:20'),(2,'运营','operator','2018-08-01 15:56:45','2018-08-01 15:56:45');
/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user_permissions`
--

DROP TABLE IF EXISTS `admin_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user_permissions`
--

LOCK TABLES `admin_user_permissions` WRITE;
/*!40000 ALTER TABLE `admin_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'admin','$2y$10$E1qAjpfo9bDlk9.ivw79ce26f9BIdERukwYmAUp0lSRCalRdqrJDa','Administrator',NULL,'vqWciA5svVhfHnW4BqJzQEsfmjgclqXbsXVO4gH3MSjhI0PPdbofUcqumyKZ','2018-08-01 07:31:20','2018-08-01 07:31:20'),(2,'operator','$2y$10$1Q6ekMzWTzLxy59RB79.O.AvTEIebhIe8/4GTFO2cIc2mbvO4t4t.','运营',NULL,'l813pivSSVPdUAt1yDVw8tniGDxd4ZnQNwL8pKhFrKRqn1dwzQPIQnIV6o8M','2018-08-01 15:58:33','2018-08-01 15:58:33');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `product_sku_id` int(10) unsigned NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_items_user_id_foreign` (`user_id`),
  KEY `cart_items_product_sku_id_foreign` (`product_sku_id`),
  CONSTRAINT `cart_items_product_sku_id_foreign` FOREIGN KEY (`product_sku_id`) REFERENCES `product_skus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (2,1,2,1,NULL,NULL),(17,1,8,1,NULL,NULL);
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2018_07_30_082609_users_add_email_verified',2),(4,'2018_08_01_020058_create_user_addresses_table',3),(5,'2016_01_04_173148_create_admin_tables',4),(8,'2018_08_01_160057_create_products_table',5),(9,'2018_08_01_160203_create_product_skus_table',5),(10,'2018_08_07_173450_create_user_favorite_products_table',6),(11,'2018_08_08_101340_create_cart_items_table',7),(12,'2018_08_08_135822_create_orders_table',8),(13,'2018_08_08_140108_create_order_items_table',8);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `product_sku_id` int(10) unsigned NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `rating` int(10) unsigned DEFAULT NULL,
  `review` text COLLATE utf8mb4_unicode_ci,
  `reviewed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`),
  KEY `order_items_product_sku_id_foreign` (`product_sku_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_product_sku_id_foreign` FOREIGN KEY (`product_sku_id`) REFERENCES `product_skus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,7,27,3,4983.00,NULL,NULL,NULL,NULL,NULL),(2,1,5,17,1,5860.00,NULL,NULL,NULL,NULL,NULL),(3,2,2,5,1,3224.00,NULL,NULL,NULL,NULL,NULL),(4,3,2,6,1,5241.00,NULL,NULL,NULL,NULL,NULL),(5,4,5,17,1,5860.00,NULL,NULL,NULL,NULL,NULL),(6,5,7,25,2,4910.00,NULL,NULL,NULL,NULL,NULL),(7,6,7,26,1,3145.00,NULL,NULL,NULL,NULL,NULL),(8,6,11,41,1,4140.00,NULL,NULL,NULL,NULL,NULL),(10,8,5,17,1,5860.00,NULL,NULL,NULL,NULL,NULL),(11,9,3,10,3,9414.00,NULL,NULL,NULL,NULL,NULL),(12,10,7,26,1,3145.00,NULL,NULL,NULL,NULL,NULL),(13,11,4,13,1,4870.00,NULL,NULL,NULL,NULL,NULL),(14,12,2,6,1,5241.00,NULL,NULL,NULL,NULL,NULL),(15,13,2,5,1,3224.00,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` decimal(8,2) NOT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci,
  `paid_at` datetime DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refund_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `refund_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `closed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `reviewed` tinyint(1) NOT NULL DEFAULT '0',
  `ship_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `ship_data` text COLLATE utf8mb4_unicode_ci,
  `extra` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_no_unique` (`no`),
  UNIQUE KEY `orders_refund_no_unique` (`refund_no`),
  KEY `orders_user_id_foreign` (`user_id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'20180808170017913476',1,'{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c30\\u8857\\u9053\\u7b2c597\\u53f7\",\"zip\":112500,\"contact_name\":\"\\u5eb7\\u949f\",\"contact_phone\":\"17002181827\"}',20809.00,NULL,NULL,NULL,NULL,'pending',NULL,0,0,'pending',NULL,NULL,'2018-08-08 17:00:17','2018-08-08 17:00:17'),(2,'20180808172644162496',1,'{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c30\\u8857\\u9053\\u7b2c597\\u53f7\",\"zip\":112500,\"contact_name\":\"\\u5eb7\\u949f\",\"contact_phone\":\"17002181827\"}',3224.00,NULL,NULL,NULL,NULL,'pending',NULL,0,0,'pending',NULL,NULL,'2018-08-08 17:26:44','2018-08-08 17:26:44'),(3,'20180808172927006619',1,'{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u6d77\\u6dc0\\u533a\\u65b0\\u4e1c\\u65b9\\u5357\\u697c10\\u5c42\\u524d\\u9014\\u51fa\\u56fd\",\"zip\":10000,\"contact_name\":\"\\u5eb7\\u5eb7\",\"contact_phone\":\"13581857677\"}',5241.00,NULL,NULL,NULL,NULL,'pending',NULL,0,0,'pending',NULL,NULL,'2018-08-08 17:29:27','2018-08-08 17:29:27'),(4,'20180808174639732219',1,'{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e30\\u53f0\\u533a\\u4eac\\u94c1\\u5bb6\\u56ed\\u4e8c\\u533a2\\u53f7\\u697c920\",\"zip\":10000,\"contact_name\":\"\\u5468\\u5468\",\"contact_phone\":\"19801057323\"}',5860.00,NULL,NULL,NULL,NULL,'pending',NULL,0,0,'pending',NULL,NULL,'2018-08-08 17:46:39','2018-08-08 17:46:39'),(5,'20180808175155996069',1,'{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u6d77\\u6dc0\\u533a\\u65b0\\u4e1c\\u65b9\\u5357\\u697c10\\u5c42\\u524d\\u9014\\u51fa\\u56fd\",\"zip\":10000,\"contact_name\":\"\\u5eb7\\u5eb7\",\"contact_phone\":\"13581857677\"}',9820.00,NULL,NULL,NULL,NULL,'pending',NULL,1,0,'pending',NULL,NULL,'2018-08-08 17:51:55','2018-08-08 17:52:26'),(6,'20180809093646617124',1,'{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e30\\u53f0\\u533a\\u4eac\\u94c1\\u5bb6\\u56ed\\u4e8c\\u533a2\\u53f7\\u697c920\",\"zip\":10000,\"contact_name\":\"\\u5468\\u5468\",\"contact_phone\":\"19801057323\"}',7285.00,NULL,NULL,NULL,NULL,'pending',NULL,1,0,'pending',NULL,NULL,'2018-08-09 09:36:46','2018-08-09 10:06:47'),(8,'20180809145009937329',1,'{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u6d77\\u6dc0\\u533a\\u65b0\\u4e1c\\u65b9\\u5357\\u697c10\\u5c42\\u524d\\u9014\\u51fa\\u56fd\",\"zip\":10000,\"contact_name\":\"\\u5eb7\\u5eb7\",\"contact_phone\":\"13581857677\"}',5860.00,NULL,NULL,NULL,NULL,'pending',NULL,1,0,'pending',NULL,NULL,'2018-08-09 14:50:09','2018-08-09 15:20:09'),(9,'20180809150052291110',1,'{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u6d77\\u6dc0\\u533a\\u65b0\\u4e1c\\u65b9\\u5357\\u697c10\\u5c42\\u524d\\u9014\\u51fa\\u56fd\",\"zip\":10000,\"contact_name\":\"\\u5eb7\\u5eb7\",\"contact_phone\":\"13581857677\"}',28242.00,NULL,NULL,NULL,NULL,'pending',NULL,1,0,'pending',NULL,NULL,'2018-08-09 15:00:52','2018-08-09 15:30:54'),(10,'20180809151325675378',1,'{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u6d77\\u6dc0\\u533a\\u65b0\\u4e1c\\u65b9\\u5357\\u697c10\\u5c42\\u524d\\u9014\\u51fa\\u56fd\",\"zip\":10000,\"contact_name\":\"\\u5eb7\\u5eb7\",\"contact_phone\":\"13581857677\"}',3145.00,NULL,NULL,NULL,NULL,'pending',NULL,1,0,'pending',NULL,NULL,'2018-08-09 15:13:25','2018-08-09 15:43:25'),(11,'20180809152319956669',1,'{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u6d77\\u6dc0\\u533a\\u65b0\\u4e1c\\u65b9\\u5357\\u697c10\\u5c42\\u524d\\u9014\\u51fa\\u56fd\",\"zip\":10000,\"contact_name\":\"\\u5eb7\\u5eb7\",\"contact_phone\":\"13581857677\"}',4870.00,NULL,'2018-08-09 15:27:31','alipay','2018080921001004230200469986','pending',NULL,0,0,'received','{\"express_company\":\"\\u4e2d\\u901a\\u901f\\u9012\",\"express_no\":\"220828521056\",\"express_company_code\":\"ZTO\"}',NULL,'2018-08-09 15:23:19','2018-08-10 16:36:41'),(12,'20180809154359424712',1,'{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c30\\u8857\\u9053\\u7b2c597\\u53f7\",\"zip\":112500,\"contact_name\":\"\\u5eb7\\u949f\",\"contact_phone\":\"17002181827\"}',5241.00,NULL,NULL,NULL,NULL,'pending',NULL,1,0,'pending',NULL,NULL,'2018-08-09 15:43:59','2018-08-09 16:14:02'),(13,'20180809162213677734',1,'{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c30\\u8857\\u9053\\u7b2c597\\u53f7\",\"zip\":112500,\"contact_name\":\"\\u5eb7\\u949f\",\"contact_phone\":\"17002181827\"}',3224.00,NULL,NULL,NULL,NULL,'pending',NULL,1,0,'pending',NULL,NULL,'2018-08-09 16:22:13','2018-08-09 16:52:16');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_skus`
--

DROP TABLE IF EXISTS `product_skus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_skus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_skus_product_id_foreign` (`product_id`),
  CONSTRAINT `product_skus_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_skus`
--

LOCK TABLES `product_skus` WRITE;
/*!40000 ALTER TABLE `product_skus` DISABLE KEYS */;
INSERT INTO `product_skus` VALUES (1,'minima','Est possimus itaque vero et.',4578.00,214,1,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(2,'molestiae','Corporis qui ex aspernatur quam.',618.00,617,1,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(3,'non','Vel eum sint atque rerum dignissimos repudiandae.',9192.00,370,1,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(4,'modi','Aut expedita aspernatur velit veritatis.',7199.00,348,1,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(5,'sint','Dicta tempora sequi minima eius dignissimos.',3224.00,58,2,'2018-08-07 17:48:32','2018-08-09 16:52:16'),(6,'magni','Laudantium in aut quia corporis nemo corrupti.',5241.00,861,2,'2018-08-07 17:48:32','2018-08-09 16:14:02'),(7,'iusto','Ut amet excepturi voluptas nihil molestiae.',9084.00,818,2,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(8,'laboriosam','Veniam necessitatibus quia natus fugiat unde.',675.00,791,2,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(9,'iure','Labore rem aut numquam culpa repellat ea ea.',562.00,892,3,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(10,'impedit','Mollitia aspernatur placeat animi quo aut.',9414.00,266,3,'2018-08-07 17:48:32','2018-08-09 15:30:54'),(11,'accusamus','Excepturi quis quos officia rerum blanditiis et.',9512.00,361,3,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(12,'odit','Voluptate dolorem voluptatibus laboriosam aut reprehenderit velit.',2457.00,634,3,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(13,'exercitationem','Ipsum molestiae quibusdam recusandae est aut.',4870.00,398,4,'2018-08-07 17:48:32','2018-08-09 15:23:19'),(14,'sapiente','Quia sit cupiditate qui deleniti.',7230.00,249,4,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(15,'exercitationem','Tempora iusto aut animi soluta dolorem in.',3682.00,415,4,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(16,'corporis','Quo qui repudiandae maiores quia rerum in.',8537.00,875,4,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(17,'voluptatem','Voluptatem aspernatur voluptate et error consequatur.',5860.00,366,5,'2018-08-07 17:48:32','2018-08-09 15:20:09'),(18,'consequatur','Error eum magnam sint veniam aut et nisi.',7441.00,202,5,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(19,'aspernatur','Maxime ut aut iusto quaerat ratione natus maxime.',2299.00,223,5,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(20,'quo','Nisi repellendus tempore explicabo sed.',6582.00,425,5,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(21,'rem','Voluptas facere ex numquam voluptatem.',2769.00,505,6,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(22,'est','Omnis nam magni debitis officia.',8942.00,761,6,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(23,'delectus','Fugiat ex et et iusto.',957.00,788,6,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(24,'alias','Totam magni dignissimos rem.',4819.00,834,6,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(25,'voluptates','Est nihil qui omnis.',4910.00,206,7,'2018-08-07 17:48:32','2018-08-08 17:52:26'),(26,'praesentium','Quia saepe quibusdam voluptatem.',3145.00,797,7,'2018-08-07 17:48:32','2018-08-09 15:43:25'),(27,'nihil','Molestiae et debitis tempora repellendus.',4983.00,608,7,'2018-08-07 17:48:32','2018-08-08 17:00:17'),(28,'at','Laudantium mollitia perspiciatis laborum optio velit.',8049.00,706,7,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(29,'voluptas','Aut autem quasi quibusdam omnis laudantium magnam nam.',7386.00,572,8,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(30,'autem','Ratione quas voluptas autem quis atque dolor rerum.',3244.00,334,8,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(31,'sequi','Laboriosam numquam aut autem deleniti eveniet soluta non.',4216.00,413,8,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(32,'voluptas','Inventore est dolorem corrupti explicabo.',767.00,63,8,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(33,'sunt','Enim eum non et praesentium molestias quaerat quis.',599.00,956,9,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(34,'possimus','Expedita facere rerum recusandae rem.',250.00,13,9,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(35,'rerum','Quo autem in nam occaecati enim repellat.',6752.00,344,9,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(36,'modi','Ullam odio et tenetur corporis id.',5419.00,751,9,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(37,'ducimus','Itaque ut pariatur eligendi non a modi veritatis nihil.',4107.00,496,10,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(38,'temporibus','Dolores quasi et unde.',815.00,101,10,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(39,'sed','Voluptas voluptatum ut sed explicabo cumque.',838.00,261,10,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(40,'est','Qui est neque repellendus iste expedita dolor cum ullam.',2596.00,524,10,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(41,'mollitia','Sit qui error consequatur ex vero magni fuga rerum.',4140.00,54,11,'2018-08-07 17:48:32','2018-08-09 10:06:47'),(42,'quae','Et consequatur sapiente laborum ratione.',5793.00,331,11,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(43,'aut','Quod minima vitae ipsam quia cupiditate.',1999.00,330,11,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(44,'et','Est aut vero ipsum enim eum quia voluptatem quo.',3991.00,437,11,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(45,'commodi','Velit assumenda magnam deserunt et dicta laboriosam vel.',9320.00,882,12,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(46,'possimus','Dolorem quo architecto eveniet.',5463.00,868,12,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(47,'minima','Molestiae omnis qui omnis consectetur velit.',5371.00,217,12,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(48,'earum','Id velit eum qui vel qui.',8361.00,535,12,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(49,'corrupti','Sed et vitae eum aut aspernatur.',8658.00,555,13,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(50,'omnis','Quasi corrupti voluptates harum reiciendis architecto facere quis.',3342.00,147,13,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(51,'qui','Velit quis minus sunt nihil modi voluptatem.',6028.00,703,13,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(52,'aliquid','Amet qui voluptatem dolores aut.',1766.00,931,13,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(53,'omnis','Nulla doloremque voluptas sunt expedita voluptatem.',8877.00,9,14,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(54,'ex','Consequuntur pariatur repudiandae fuga explicabo ea mollitia possimus.',1453.00,348,14,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(55,'libero','Aliquam incidunt animi voluptatibus et consequatur accusamus.',8826.00,481,14,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(56,'asperiores','Alias fugiat eum saepe a illum nostrum cumque.',7844.00,509,14,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(57,'voluptas','Voluptatem sed molestias officia et.',7804.00,769,15,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(58,'quasi','Ex minima reprehenderit quos quisquam qui quam.',4551.00,40,15,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(59,'laborum','At soluta qui et neque quam.',5481.00,851,15,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(60,'qui','Deleniti placeat officia amet et sed.',8843.00,909,15,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(61,'quaerat','Nihil aspernatur assumenda assumenda molestiae ut quibusdam.',2784.00,848,16,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(62,'id','Cum commodi est veritatis quia dolores repellendus.',7287.00,664,16,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(63,'magni','Ut placeat dolor similique aliquid qui quibusdam.',9982.00,207,16,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(64,'consequatur','Nostrum vel omnis ex quis.',3052.00,503,16,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(65,'maiores','Quia omnis aut dignissimos.',2262.00,506,17,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(66,'saepe','Est qui ratione placeat libero id iure rem quibusdam.',1716.00,44,17,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(67,'consequatur','Voluptatibus rem fuga consequatur doloribus porro aut et porro.',3529.00,1,17,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(68,'optio','Itaque qui minus et ducimus quibusdam dignissimos error.',3598.00,666,17,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(69,'deleniti','Aut rem id placeat earum quisquam.',5374.00,627,18,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(70,'odio','Numquam odit optio enim quaerat.',7672.00,883,18,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(71,'a','Ut distinctio explicabo ab facilis temporibus laudantium sapiente.',3399.00,213,18,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(72,'hic','Qui perspiciatis quis et sed tempore est accusantium.',6032.00,486,18,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(73,'iure','Impedit aspernatur hic a nihil.',4734.00,390,19,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(74,'sed','Ut illum doloribus sit aut reprehenderit.',9972.00,659,19,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(75,'magnam','Laudantium vel ut eum aut ut amet fuga.',1925.00,378,19,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(76,'laboriosam','Placeat et corrupti perspiciatis quia facere beatae mollitia.',543.00,695,19,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(77,'iusto','Voluptas pariatur assumenda veniam minus sunt aut autem.',8826.00,110,20,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(78,'et','Consequatur totam aut quam magni.',1440.00,505,20,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(79,'vel','Assumenda nesciunt error ipsam et.',2080.00,890,20,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(80,'quas','Vero perferendis exercitationem nulla ipsam id voluptatem voluptas.',7319.00,131,20,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(81,'sint','Qui illum nesciunt perspiciatis iste sed et et nemo.',3776.00,253,21,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(82,'minus','Corrupti necessitatibus cupiditate necessitatibus facere aliquid libero.',8138.00,889,21,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(83,'qui','Fuga sunt veniam voluptas laboriosam ullam ullam tenetur.',1935.00,279,21,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(84,'labore','Repudiandae et molestiae asperiores soluta.',1536.00,826,21,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(85,'explicabo','Doloremque beatae aspernatur quo in eos deleniti nihil quaerat.',267.00,245,22,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(86,'inventore','Inventore eveniet dolor maxime vitae qui ducimus sed.',6476.00,557,22,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(87,'qui','Molestiae quae ipsa quia sit ab omnis eligendi.',1195.00,231,22,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(88,'non','Sunt nesciunt nihil repellendus aliquam et totam.',5403.00,764,22,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(89,'quo','Sit eveniet quasi autem ut dolores.',1741.00,156,23,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(90,'aut','Minima aut accusamus nesciunt voluptas.',1387.00,340,23,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(91,'iste','Odio beatae dolor aut quia.',5590.00,911,23,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(92,'itaque','Quidem vitae autem laboriosam eveniet ipsam a.',2745.00,874,23,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(93,'eveniet','Laborum iure et fuga illo qui.',8488.00,545,24,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(94,'velit','Voluptatem eaque assumenda tenetur veniam iure.',1250.00,206,24,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(95,'maxime','Sit quam dolor reiciendis est.',5540.00,972,24,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(96,'commodi','Qui quos provident nihil dolorem quia nihil.',1580.00,101,24,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(97,'animi','Labore sint aliquam quia et.',4184.00,465,25,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(98,'error','Perspiciatis et dolores corrupti labore harum repudiandae est rerum.',7510.00,780,25,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(99,'et','Dolorum eius nam temporibus quia et illo magni qui.',9258.00,958,25,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(100,'et','Reprehenderit eligendi impedit modi a non iusto veritatis nesciunt.',3770.00,855,25,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(101,'non','Sunt pariatur quo incidunt laboriosam.',838.00,308,26,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(102,'soluta','Voluptatem nihil doloremque quos quas.',2437.00,264,26,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(103,'maxime','Voluptatem sed qui et aliquid voluptatum nihil voluptatum.',2093.00,898,26,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(104,'sed','Veritatis repudiandae maiores eos doloremque quis voluptates consequuntur inventore.',9900.00,628,26,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(105,'et','Est sed ut est consequatur officiis dolorem.',7863.00,620,27,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(106,'et','Ad eum ut quas veritatis quia aut.',2276.00,533,27,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(107,'ex','Veniam voluptas neque doloribus non in.',9145.00,314,27,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(108,'similique','Sit voluptate qui est dignissimos.',1074.00,743,27,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(109,'voluptates','Accusantium quae quidem pariatur et tempore sunt.',9099.00,545,28,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(110,'molestiae','Et architecto nostrum amet ut soluta.',6711.00,731,28,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(111,'adipisci','Nostrum soluta a dignissimos dicta aut aliquid.',4752.00,127,28,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(112,'ut','Quis quos delectus enim eum.',998.00,225,28,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(113,'eius','Sit quisquam est qui.',3536.00,775,29,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(114,'aut','Fugit rerum voluptas similique cupiditate modi facere.',2445.00,218,29,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(115,'sequi','Ratione eos dolorum aut sit et voluptas.',5093.00,756,29,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(116,'nostrum','Labore perspiciatis nisi rerum iusto.',5689.00,396,29,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(117,'dolores','Consectetur sint iusto impedit esse aliquam fuga.',7459.00,521,30,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(118,'suscipit','Non et error dolor autem qui.',7397.00,205,30,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(119,'qui','Facilis et repellat distinctio minus ea.',8188.00,309,30,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(120,'qui','Ratione omnis id illum suscipit eos dolorem cum.',1301.00,256,30,'2018-08-07 17:48:32','2018-08-07 17:48:32');
/*!40000 ALTER TABLE `product_skus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `on_sale` tinyint(1) NOT NULL DEFAULT '1',
  `rating` double(8,2) NOT NULL DEFAULT '5.00',
  `sold_count` int(10) unsigned NOT NULL DEFAULT '0',
  `review_count` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'voluptas','Quam consectetur quia harum iste itaque.','https://lccdn.phphub.org/uploads/images/201806/01/5320/7kG1HekGK6.jpg',0,0.00,0,0,618.00,'2018-08-07 17:48:32','2018-08-08 16:51:29'),(2,'iure','Eum doloremque fugiat modi et explicabo enim.','https://lccdn.phphub.org/uploads/images/201806/01/5320/7kG1HekGK6.jpg',1,4.00,0,0,675.00,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(3,'porro','Voluptas eveniet suscipit vel.','https://lccdn.phphub.org/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg',1,5.00,0,0,562.00,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(4,'praesentium','Fuga sed reiciendis autem cupiditate voluptatem.','https://lccdn.phphub.org/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg',1,3.00,1,0,3682.00,'2018-08-07 17:48:32','2018-08-09 17:54:25'),(5,'repellat','In tenetur quisquam iusto facere labore debitis magnam.','https://lccdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg',1,3.00,0,0,2299.00,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(6,'voluptatem','Beatae voluptate occaecati quod repellendus.','https://lccdn.phphub.org/uploads/images/201806/01/5320/82Wf2sg8gM.jpg',1,1.00,0,0,957.00,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(7,'voluptatem','Et vero libero qui sed amet magnam aut qui.','https://lccdn.phphub.org/uploads/images/201806/01/5320/pa7DrV43Mw.jpg',1,4.00,0,0,3145.00,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(8,'voluptatem','Sunt ut modi quis ut facilis minus vel quasi.','https://lccdn.phphub.org/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg',1,1.00,0,0,767.00,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(9,'neque','Incidunt sed quod inventore dolore nihil sit non.','https://lccdn.phphub.org/uploads/images/201806/01/5320/1B3n0ATKrn.jpg',1,3.00,0,0,250.00,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(10,'quia','Voluptate sunt ut molestiae magnam.','https://lccdn.phphub.org/uploads/images/201806/01/5320/7kG1HekGK6.jpg',1,3.00,0,0,815.00,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(11,'veritatis','Qui rerum accusantium voluptatibus ipsa tempora.','https://lccdn.phphub.org/uploads/images/201806/01/5320/82Wf2sg8gM.jpg',1,0.00,0,0,1999.00,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(12,'ut','Minus iste non dolorem voluptatum natus nihil.','https://lccdn.phphub.org/uploads/images/201806/01/5320/r3BNRe4zXG.jpg',1,3.00,0,0,5371.00,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(13,'consectetur','Aut et voluptatibus iure aut.','https://lccdn.phphub.org/uploads/images/201806/01/5320/7kG1HekGK6.jpg',1,2.00,0,0,1766.00,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(14,'non','Placeat earum natus veniam assumenda.','https://lccdn.phphub.org/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg',1,2.00,0,0,1453.00,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(15,'porro','Unde est voluptatem aut sit aut quas qui.','https://lccdn.phphub.org/uploads/images/201806/01/5320/82Wf2sg8gM.jpg',1,0.00,0,0,4551.00,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(16,'rerum','Dolor at iure laborum excepturi consequatur molestiae.','https://lccdn.phphub.org/uploads/images/201806/01/5320/7kG1HekGK6.jpg',1,3.00,0,0,2784.00,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(17,'cupiditate','Veniam odio quidem in.','https://lccdn.phphub.org/uploads/images/201806/01/5320/r3BNRe4zXG.jpg',1,3.00,0,0,1716.00,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(18,'voluptates','Rerum sit soluta sed velit ducimus aspernatur tempore.','https://lccdn.phphub.org/uploads/images/201806/01/5320/2JMRaFwRpo.jpg',1,2.00,0,0,3399.00,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(19,'voluptatem','Consequatur molestias sunt sit qui.','https://lccdn.phphub.org/uploads/images/201806/01/5320/C0bVuKB2nt.jpg',1,5.00,0,0,543.00,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(20,'et','Velit et quis numquam omnis unde accusamus.','https://lccdn.phphub.org/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg',1,0.00,0,0,1440.00,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(21,'quae','Neque a ut magnam cumque aliquam qui sunt.','https://lccdn.phphub.org/uploads/images/201806/01/5320/1B3n0ATKrn.jpg',1,3.00,0,0,1536.00,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(22,'perspiciatis','Quis voluptatem eos esse aut id.','https://lccdn.phphub.org/uploads/images/201806/01/5320/r3BNRe4zXG.jpg',1,5.00,0,0,267.00,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(23,'aut','Voluptatem non maxime nihil et non.','https://lccdn.phphub.org/uploads/images/201806/01/5320/82Wf2sg8gM.jpg',1,5.00,0,0,1387.00,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(24,'eius','Atque quod dignissimos et odio occaecati possimus.','https://lccdn.phphub.org/uploads/images/201806/01/5320/r3BNRe4zXG.jpg',1,5.00,0,0,1250.00,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(25,'non','Sit consectetur et animi.','https://lccdn.phphub.org/uploads/images/201806/01/5320/1B3n0ATKrn.jpg',1,1.00,0,0,3770.00,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(26,'dolorem','Fugiat est voluptas iste sapiente amet laborum accusamus.','https://lccdn.phphub.org/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg',1,1.00,0,0,838.00,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(27,'nobis','Sint ipsa velit ut sed dignissimos.','https://lccdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg',1,4.00,0,0,1074.00,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(28,'voluptatum','Cupiditate rerum est ipsam numquam veritatis doloremque.','https://lccdn.phphub.org/uploads/images/201806/01/5320/r3BNRe4zXG.jpg',1,0.00,0,0,998.00,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(29,'et','Harum iste natus vero asperiores reprehenderit sed similique atque.','https://lccdn.phphub.org/uploads/images/201806/01/5320/C0bVuKB2nt.jpg',1,2.00,0,0,2445.00,'2018-08-07 17:48:32','2018-08-07 17:48:32'),(30,'iste','Est saepe placeat ex hic.','https://lccdn.phphub.org/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg',1,3.00,0,0,1301.00,'2018-08-07 17:48:32','2018-08-07 17:48:32');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_addresses`
--

DROP TABLE IF EXISTS `user_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` int(10) unsigned NOT NULL,
  `contact_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_used_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_addresses_user_id_foreign` (`user_id`),
  CONSTRAINT `user_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_addresses`
--

LOCK TABLES `user_addresses` WRITE;
/*!40000 ALTER TABLE `user_addresses` DISABLE KEYS */;
INSERT INTO `user_addresses` VALUES (2,1,'广东省','深圳市','福田区','第30街道第597号',112500,'康钟','17002181827','2018-08-09 16:22:13','2018-08-01 02:48:00','2018-08-09 16:22:13'),(3,1,'江苏省','南京市','浦口区','第18街道第106号',123400,'韦哲','18506542171',NULL,'2018-08-01 02:48:00','2018-08-01 02:48:00'),(4,1,'北京市','市辖区','丰台区','京铁家园二区2号楼920',10000,'周周','19801057323','2018-08-09 09:36:46','2018-08-01 06:23:33','2018-08-09 09:36:46'),(5,1,'北京市','市辖区','海淀区','新东方南楼10层前途出国',10000,'康康','13581857677','2018-08-09 15:23:19','2018-08-01 06:45:44','2018-08-09 15:23:19');
/*!40000 ALTER TABLE `user_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_favorite_products`
--

DROP TABLE IF EXISTS `user_favorite_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_favorite_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_favorite_products_user_id_foreign` (`user_id`),
  KEY `user_favorite_products_product_id_foreign` (`product_id`),
  CONSTRAINT `user_favorite_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_favorite_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_favorite_products`
--

LOCK TABLES `user_favorite_products` WRITE;
/*!40000 ALTER TABLE `user_favorite_products` DISABLE KEYS */;
INSERT INTO `user_favorite_products` VALUES (2,1,15,'2018-08-08 09:47:13','2018-08-08 09:47:13'),(3,1,2,'2018-08-10 10:22:35','2018-08-10 10:22:35');
/*!40000 ALTER TABLE `user_favorite_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','455093504@qq.com','$2y$10$AyCh/104kC9IFl2RYfC1BuOmL48cK.jSs.zvAqx/DUn/FQG/L0Hxa','wEcbFirAHxuPZHjJn01xJ4Alk4HC32DFzQ8UyHKNmGWhE1PDLENHpxPJrS3n',1,'2018-07-30 08:22:03','2018-08-01 01:18:13'),(2,'irene','m19801057323@163.com','$2y$10$fMvfN.vPxcjtDKlbCwmFWe122Y11HhqUninwJX9qcjN8K5HUTompm','Nb1k3mOAAsgLz9InYwEUkFYFoyMroZtCEH5jAL5L4OEBpqFC3Hanw1deg0jT',1,'2018-08-01 01:38:55','2018-08-01 02:25:47');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-07 10:24:49
