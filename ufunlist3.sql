-- MySQL dump 10.13  Distrib 5.7.19, for Win64 (x86_64)
--
-- Host: localhost    Database: ufunlist
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `account_passwordverify`
--

DROP TABLE IF EXISTS `account_passwordverify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_passwordverify` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `code` varchar(6) NOT NULL,
  `deadline` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_passwordverify`
--

LOCK TABLES `account_passwordverify` WRITE;
/*!40000 ALTER TABLE `account_passwordverify` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_passwordverify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_regverify`
--

DROP TABLE IF EXISTS `account_regverify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_regverify` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `code` varchar(6) NOT NULL,
  `deadline` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_regverify`
--

LOCK TABLES `account_regverify` WRITE;
/*!40000 ALTER TABLE `account_regverify` DISABLE KEYS */;
INSERT INTO `account_regverify` VALUES (1,'chentb2114@mails.jlu.edu.cn','J0WO9M','2017-11-18 02:25:31.254162');
/*!40000 ALTER TABLE `account_regverify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add university',7,'add_university'),(20,'Can change university',7,'change_university'),(21,'Can delete university',7,'delete_university'),(22,'Can add userdetail',8,'add_userdetail'),(23,'Can change userdetail',8,'change_userdetail'),(24,'Can delete userdetail',8,'delete_userdetail'),(25,'Can add log',9,'add_log'),(26,'Can change log',9,'change_log'),(27,'Can delete log',9,'delete_log'),(28,'Can add category',10,'add_category'),(29,'Can change category',10,'change_category'),(30,'Can delete category',10,'delete_category'),(31,'Can add post',11,'add_post'),(32,'Can change post',11,'change_post'),(33,'Can delete post',11,'delete_post'),(34,'Can add forumpost',12,'add_forumpost'),(35,'Can change forumpost',12,'change_forumpost'),(36,'Can delete forumpost',12,'delete_forumpost'),(37,'Can add picture',13,'add_picture'),(38,'Can change picture',13,'change_picture'),(39,'Can delete picture',13,'delete_picture'),(40,'Can add userlikepost',14,'add_userlikepost'),(41,'Can change userlikepost',14,'change_userlikepost'),(42,'Can delete userlikepost',14,'delete_userlikepost'),(43,'Can add userphonenum',15,'add_userphonenum'),(44,'Can change userphonenum',15,'change_userphonenum'),(45,'Can delete userphonenum',15,'delete_userphonenum'),(46,'Can add useremail',16,'add_useremail'),(47,'Can change useremail',16,'change_useremail'),(48,'Can delete useremail',16,'delete_useremail'),(49,'Can add userqq',17,'add_userqq'),(50,'Can change userqq',17,'change_userqq'),(51,'Can delete userqq',17,'delete_userqq'),(52,'Can add userwechat',18,'add_userwechat'),(53,'Can change userwechat',18,'change_userwechat'),(54,'Can delete userwechat',18,'delete_userwechat'),(55,'Can add reg verify',19,'add_regverify'),(56,'Can change reg verify',19,'change_regverify'),(57,'Can delete reg verify',19,'delete_regverify'),(58,'Can add password verify',20,'add_passwordverify'),(59,'Can change password verify',20,'change_passwordverify'),(60,'Can delete password verify',20,'delete_passwordverify');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$iv778wEnYJgd$VLmW3kutOjLB6WIgqfpTzP1/wCuqVl3rjHRW2irOclg=',NULL,0,'我的账户','','','',0,1,'2017-11-18 02:04:20.804348'),(2,'pbkdf2_sha256$36000$JzJoOQyl5mS1$6xu1ubmN/rl2hcFSTq4GZF817xigizhPca1oZI9+eUk=',NULL,0,'jlu_administer','','','administer@jlu.edu.cn',0,1,'2017-11-18 02:06:39.953745'),(3,'pbkdf2_sha256$36000$e0t6775V6DNN$+G7UaF1m1PDgUkNuZzZ6Krpqq0uOp9JVWulnPJAg1RM=','2017-11-18 02:26:47.554307',0,'ctbsky','','','chentb2114@mails.jlu.edu.cn',0,1,'2017-11-18 02:23:37.391373');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (20,'account','passwordverify'),(19,'account','regverify'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(10,'public','category'),(12,'public','forumpost'),(9,'public','log'),(13,'public','picture'),(11,'public','post'),(7,'public','university'),(8,'public','userdetail'),(16,'public','useremail'),(14,'public','userlikepost'),(15,'public','userphonenum'),(17,'public','userqq'),(18,'public','userwechat'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-11-18 02:01:33.247051'),(2,'auth','0001_initial','2017-11-18 02:01:34.487606'),(3,'admin','0001_initial','2017-11-18 02:01:34.745172'),(4,'admin','0002_logentry_remove_auto_add','2017-11-18 02:01:34.758436'),(5,'contenttypes','0002_remove_content_type_name','2017-11-18 02:01:35.048841'),(6,'auth','0002_alter_permission_name_max_length','2017-11-18 02:01:35.167557'),(7,'auth','0003_alter_user_email_max_length','2017-11-18 02:01:35.287495'),(8,'auth','0004_alter_user_username_opts','2017-11-18 02:01:35.301564'),(9,'auth','0005_alter_user_last_login_null','2017-11-18 02:01:35.397494'),(10,'auth','0006_require_contenttypes_0002','2017-11-18 02:01:35.404683'),(11,'auth','0007_alter_validators_add_error_messages','2017-11-18 02:01:35.418427'),(12,'auth','0008_alter_user_username_max_length','2017-11-18 02:01:35.522323'),(13,'sessions','0001_initial','2017-11-18 02:01:35.605670'),(14,'account','0001_initial','2017-11-18 02:03:42.982806'),(15,'public','0001_initial','2017-11-18 02:03:45.639389');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('evzflxk67x3pl6yw21x57jld97bdicjz','OTcyMWUxN2U4Y2M4NzUwNWIwNmNmYTBlNTQ1MmIzMjkxYzE0MjA0NDp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NWQ2NjVjZWQ5OWI4OWY3N2M2ZjVjM2QwMjM2NjNhNDYxZjk4NTlkIn0=','2017-12-02 02:26:47.569443');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `public_category`
--

DROP TABLE IF EXISTS `public_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(48) NOT NULL,
  `isforum` tinyint(1) NOT NULL,
  `parentid_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `public_category_parentid_id_eedd4a6e_fk_public_category_id` (`parentid_id`),
  CONSTRAINT `public_category_parentid_id_eedd4a6e_fk_public_category_id` FOREIGN KEY (`parentid_id`) REFERENCES `public_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_category`
--

LOCK TABLES `public_category` WRITE;
/*!40000 ALTER TABLE `public_category` DISABLE KEYS */;
INSERT INTO `public_category` VALUES (1,'通知',0,NULL),(2,'校内通知',0,1),(3,'院系通知',0,1),(4,'社团活动',0,1),(5,'失物招领',0,NULL),(6,'重要证件',0,5),(7,'较大价值',0,5),(8,'普通物件',0,5),(9,'购物',0,NULL),(10,'卖物',0,9),(11,'求购',0,9),(12,'交友',0,NULL),(13,'男生',0,12),(14,'女生',0,12),(15,'工作',0,NULL),(16,'全职',0,15),(17,'兼职',0,15),(18,'论坛',1,NULL),(19,'本科生',1,18),(20,'研究生',1,18),(21,'博士生',1,18);
/*!40000 ALTER TABLE `public_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `public_forumpost`
--

DROP TABLE IF EXISTS `public_forumpost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_forumpost` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` longtext,
  `content` longtext NOT NULL,
  `time` datetime(6) NOT NULL,
  `categoryid_id` bigint(20) NOT NULL,
  `parentid_id` bigint(20) DEFAULT NULL,
  `userid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `public_forumpost_categoryid_id_0a14b1a5_fk_public_category_id` (`categoryid_id`),
  KEY `public_forumpost_parentid_id_b52f66db_fk_public_forumpost_id` (`parentid_id`),
  KEY `public_forumpost_userid_id_01689bbb_fk_auth_user_id` (`userid_id`),
  CONSTRAINT `public_forumpost_categoryid_id_0a14b1a5_fk_public_category_id` FOREIGN KEY (`categoryid_id`) REFERENCES `public_category` (`id`),
  CONSTRAINT `public_forumpost_parentid_id_b52f66db_fk_public_forumpost_id` FOREIGN KEY (`parentid_id`) REFERENCES `public_forumpost` (`id`),
  CONSTRAINT `public_forumpost_userid_id_01689bbb_fk_auth_user_id` FOREIGN KEY (`userid_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_forumpost`
--

LOCK TABLES `public_forumpost` WRITE;
/*!40000 ALTER TABLE `public_forumpost` DISABLE KEYS */;
/*!40000 ALTER TABLE `public_forumpost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `public_log`
--

DROP TABLE IF EXISTS `public_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip` char(39) NOT NULL,
  `action` int(10) unsigned NOT NULL,
  `time` datetime(6) NOT NULL,
  `userid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `public_log_userid_id_4c713757_fk_auth_user_id` (`userid_id`),
  CONSTRAINT `public_log_userid_id_4c713757_fk_auth_user_id` FOREIGN KEY (`userid_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_log`
--

LOCK TABLES `public_log` WRITE;
/*!40000 ALTER TABLE `public_log` DISABLE KEYS */;
INSERT INTO `public_log` VALUES (1,'49.140.122.18',1,'2017-11-18 02:23:37.459442',3),(2,'49.140.122.18',2,'2017-11-18 02:26:38.276110',3),(3,'49.140.122.18',1,'2017-11-18 02:26:47.564334',3);
/*!40000 ALTER TABLE `public_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `public_picture`
--

DROP TABLE IF EXISTS `public_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(48) NOT NULL,
  `path` varchar(64) NOT NULL,
  `postid_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `public_picture_postid_id_path_name_7d8fe82a_uniq` (`postid_id`,`path`,`name`),
  CONSTRAINT `public_picture_postid_id_0ccbd9f9_fk_public_post_id` FOREIGN KEY (`postid_id`) REFERENCES `public_post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_picture`
--

LOCK TABLES `public_picture` WRITE;
/*!40000 ALTER TABLE `public_picture` DISABLE KEYS */;
INSERT INTO `public_picture` VALUES (1,'1_1.jpg','/media/',1),(2,'1_2.jpg','/media/',1),(3,'1_3.jpg','/media/',1),(4,'1_4.jpg','/media/',1);
/*!40000 ALTER TABLE `public_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `public_post`
--

DROP TABLE IF EXISTS `public_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime(6) NOT NULL,
  `deadtime` datetime(6) NOT NULL,
  `maintitle` longtext NOT NULL,
  `subtitleid` int(10) unsigned NOT NULL,
  `subtitle` longtext NOT NULL,
  `content` longtext NOT NULL,
  `haspicture` int(10) unsigned NOT NULL,
  `popularity` int(10) unsigned NOT NULL,
  `activetime` int(10) unsigned NOT NULL,
  `replymethodid` int(10) unsigned NOT NULL,
  `replymethod` varchar(48) NOT NULL,
  `state` int(10) unsigned NOT NULL,
  `categoryid_id` bigint(20) NOT NULL,
  `userid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `public_post_categoryid_id_92b15779_fk_public_category_id` (`categoryid_id`),
  KEY `public_post_userid_id_3ff556ae_fk_auth_user_id` (`userid_id`),
  CONSTRAINT `public_post_categoryid_id_92b15779_fk_public_category_id` FOREIGN KEY (`categoryid_id`) REFERENCES `public_category` (`id`),
  CONSTRAINT `public_post_userid_id_3ff556ae_fk_auth_user_id` FOREIGN KEY (`userid_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_post`
--

LOCK TABLES `public_post` WRITE;
/*!40000 ALTER TABLE `public_post` DISABLE KEYS */;
INSERT INTO `public_post` VALUES (1,'2017-11-18 02:26:25.115845','2017-11-19 02:26:25.115845','这个帖子活不过11/19 10:25',1,'1','测试专用贴',1,4,1,2,'chentb2114@mails.jlu.edu.cn',1,10,3);
/*!40000 ALTER TABLE `public_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `public_university`
--

DROP TABLE IF EXISTS `public_university`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_university` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(48) NOT NULL,
  `province` varchar(32) NOT NULL,
  `city` varchar(32) NOT NULL,
  `regstunum` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_university`
--

LOCK TABLES `public_university` WRITE;
/*!40000 ALTER TABLE `public_university` DISABLE KEYS */;
INSERT INTO `public_university` VALUES (1,'吉林大学','吉林省','长春市',1),(2,'东北师大','吉林省','长春市',0),(3,'长春理工大学','吉林省','长春市',0);
/*!40000 ALTER TABLE `public_university` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `public_userdetail`
--

DROP TABLE IF EXISTS `public_userdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_userdetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stuid` varchar(16) DEFAULT NULL,
  `gender` int(10) unsigned NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `universityid_id` bigint(20) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `public_userdetail_universityid_id_50566efb_fk_public_un` (`universityid_id`),
  CONSTRAINT `public_userdetail_universityid_id_50566efb_fk_public_un` FOREIGN KEY (`universityid_id`) REFERENCES `public_university` (`id`),
  CONSTRAINT `public_userdetail_user_id_c5ef32e0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_userdetail`
--

LOCK TABLES `public_userdetail` WRITE;
/*!40000 ALTER TABLE `public_userdetail` DISABLE KEYS */;
INSERT INTO `public_userdetail` VALUES (1,'',0,'',1,1),(2,NULL,0,NULL,1,2),(3,NULL,0,NULL,1,3);
/*!40000 ALTER TABLE `public_userdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `public_useremail`
--

DROP TABLE IF EXISTS `public_useremail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_useremail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `userid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid_id` (`userid_id`),
  CONSTRAINT `public_useremail_userid_id_258d8dca_fk_auth_user_id` FOREIGN KEY (`userid_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_useremail`
--

LOCK TABLES `public_useremail` WRITE;
/*!40000 ALTER TABLE `public_useremail` DISABLE KEYS */;
/*!40000 ALTER TABLE `public_useremail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `public_userlikepost`
--

DROP TABLE IF EXISTS `public_userlikepost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_userlikepost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postid_id` bigint(20) NOT NULL,
  `userid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `public_userlikepost_userid_id_postid_id_928d50b3_uniq` (`userid_id`,`postid_id`),
  KEY `public_userlikepost_postid_id_2534f939_fk_public_post_id` (`postid_id`),
  CONSTRAINT `public_userlikepost_postid_id_2534f939_fk_public_post_id` FOREIGN KEY (`postid_id`) REFERENCES `public_post` (`id`),
  CONSTRAINT `public_userlikepost_userid_id_c4d6c71a_fk_auth_user_id` FOREIGN KEY (`userid_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_userlikepost`
--

LOCK TABLES `public_userlikepost` WRITE;
/*!40000 ALTER TABLE `public_userlikepost` DISABLE KEYS */;
/*!40000 ALTER TABLE `public_userlikepost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `public_userphonenum`
--

DROP TABLE IF EXISTS `public_userphonenum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_userphonenum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phonenum` varchar(32) NOT NULL,
  `userid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid_id` (`userid_id`),
  CONSTRAINT `public_userphonenum_userid_id_51243fad_fk_auth_user_id` FOREIGN KEY (`userid_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_userphonenum`
--

LOCK TABLES `public_userphonenum` WRITE;
/*!40000 ALTER TABLE `public_userphonenum` DISABLE KEYS */;
/*!40000 ALTER TABLE `public_userphonenum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `public_userqq`
--

DROP TABLE IF EXISTS `public_userqq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_userqq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qq` varchar(32) NOT NULL,
  `userid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid_id` (`userid_id`),
  CONSTRAINT `public_userqq_userid_id_05c49074_fk_auth_user_id` FOREIGN KEY (`userid_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_userqq`
--

LOCK TABLES `public_userqq` WRITE;
/*!40000 ALTER TABLE `public_userqq` DISABLE KEYS */;
/*!40000 ALTER TABLE `public_userqq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `public_userwechat`
--

DROP TABLE IF EXISTS `public_userwechat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_userwechat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wechat` varchar(48) NOT NULL,
  `userid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid_id` (`userid_id`),
  CONSTRAINT `public_userwechat_userid_id_d4bdce70_fk_auth_user_id` FOREIGN KEY (`userid_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_userwechat`
--

LOCK TABLES `public_userwechat` WRITE;
/*!40000 ALTER TABLE `public_userwechat` DISABLE KEYS */;
/*!40000 ALTER TABLE `public_userwechat` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-18 10:53:42
