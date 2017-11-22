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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$iv778wEnYJgd$VLmW3kutOjLB6WIgqfpTzP1/wCuqVl3rjHRW2irOclg=',NULL,0,'我的账户','','','',0,1,'2017-11-18 02:04:20.804348'),(2,'pbkdf2_sha256$36000$JzJoOQyl5mS1$6xu1ubmN/rl2hcFSTq4GZF817xigizhPca1oZI9+eUk=',NULL,0,'jlu_administer','','','administer@jlu.edu.cn',0,1,'2017-11-18 02:06:39.953745'),(3,'pbkdf2_sha256$36000$e0t6775V6DNN$+G7UaF1m1PDgUkNuZzZ6Krpqq0uOp9JVWulnPJAg1RM=','2017-11-18 12:48:41.672486',0,'ctbsky','','','chentb2114@mails.jlu.edu.cn',0,1,'2017-11-18 02:23:37.391373');
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
INSERT INTO `django_session` VALUES ('5u62b997g6jjmzkmak8q4oilzcee16ne','OTcyMWUxN2U4Y2M4NzUwNWIwNmNmYTBlNTQ1MmIzMjkxYzE0MjA0NDp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NWQ2NjVjZWQ5OWI4OWY3N2M2ZjVjM2QwMjM2NjNhNDYxZjk4NTlkIn0=','2017-12-02 09:53:48.221887'),('evzflxk67x3pl6yw21x57jld97bdicjz','OTcyMWUxN2U4Y2M4NzUwNWIwNmNmYTBlNTQ1MmIzMjkxYzE0MjA0NDp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NWQ2NjVjZWQ5OWI4OWY3N2M2ZjVjM2QwMjM2NjNhNDYxZjk4NTlkIn0=','2017-12-02 02:26:47.569443'),('w5ckz9j9twjta1jyjwm08vkku51qxeht','OTcyMWUxN2U4Y2M4NzUwNWIwNmNmYTBlNTQ1MmIzMjkxYzE0MjA0NDp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NWQ2NjVjZWQ5OWI4OWY3N2M2ZjVjM2QwMjM2NjNhNDYxZjk4NTlkIn0=','2017-12-02 10:21:26.172724');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_forumpost`
--

LOCK TABLES `public_forumpost` WRITE;
/*!40000 ALTER TABLE `public_forumpost` DISABLE KEYS */;
INSERT INTO `public_forumpost` VALUES (1,'习近平会见全国道德模范代表侧记','热烈的掌声，在人民大会堂金色大厅内响起，铭记着一个暖心感人的场景。\r\n\r\n　　17日上午9时30分，中共中央总书记、国家主席、中央军委主席习近平来到人民大会堂金色大厅，亲切会见参加全国精神文明建设表彰大会的600多名代表。\r\n\r\n　　在热烈的掌声中，习近平总书记高兴地同大家热情握手、亲切交谈，代表们纷纷向总书记问好。握手结束后，习近平总书记回到队伍中间，准备同代表们合影。总书记看到93岁的黄旭华和82岁的黄大发两位道德模范代表年事已高，站在代表们中间，总书记握住他们的手，微笑着问候说：“你们这么大岁数，身体还不错。你们别站着了，到我边上坐下。”\r\n\r\n　　习近平总书记拉着他们的手，请两位老人坐到自己身旁来，两人执意推辞，习近平一再邀请，说：“来！挤挤就行了，就这样。”\r\n\r\n　　相机快门按下，记录下了这一感人瞬间。\r\n\r\n　　会见结束后，习近平语重心长对有关部门的同志说，给老道德模范让座，这是尊老敬老的传统美德，这就叫人伦常情。总书记的话是言传，更是身教，在人们的心田荡漾。\r\n\r\n　　黄旭华是中船重工719研究所名誉所长，他为了祖国的核潜艇事业，隐姓埋名、以身许国，阔别家乡30载，其间一次也没有回过老家。\r\n\r\n　　“从1958年开始到现在，我没有离开过核潜艇研制领域，我的一生没有虚度。”今天，习近平总书记的亲切会见，让黄旭华又一次感受着党和国家赋予他的使命与荣光。\r\n\r\n　　“我做梦也没想到，总书记竟然把我请过来坐到他身边，还问了我的健康情况。总书记对我们的关怀，我要回去传达，要让所有同志认识到我们任重道远，要再铸辉煌。”黄旭华说。\r\n\r\n　　黄大发是贵州省遵义市播州区平正仡佬族乡原草王坝村党支部书记，他带领村民们前后历经30多年，在峭壁悬崖间挖出一条10公里的“天渠”，使曾经缺水干旱的贫困村面貌一新。\r\n\r\n　　回想习近平总书记同大家合影的情景，黄大发十分激动：“总书记对我们老党员关心得很、尊敬得很，我很感动，也很光荣。合影后，总书记回头向大家挥手告别，我们也赶紧向他招手。”\r\n\r\n　　身教重于言教，掌声久久回响。习近平总书记一个自然而然的举动，身体力行中华民族尊老敬贤的传统美德，展现出亲民爱民的崇高风范。\r\n\r\n　　党的十八大以来，习近平总书记对先进模范的尊敬与关爱，一次次为全社会作出示范，引领着社会风尚。\r\n\r\n　　2013年9月26日，在会见第四届全国道德模范及提名奖获得者时，习近平总书记把目光转向坐在第一排左边的一位老人。他饱含深情地说，我刚才看到这位老大姐，她就是我们的老将军甘祖昌的夫人龚全珍，她今年90多岁了，我看到她以后心里一阵阵的感动。\r\n\r\n　　2014年10月15日，习近平总书记主持召开文艺工作座谈会。当大家发言结束，总书记准备发表讲话时，他望了望坐在右边不远处的中国红楼梦学会名誉会长、90岁高龄的冯其庸先生，对大家说，今天出席座谈会的不少老艺术家年事已高，大家如果累了，就到休息室休息或者走动走动。\r\n\r\n　　今天，习近平总书记用他的实际行动，为与会代表上了关爱模范、尊重典型的生动一课。\r\n\r\n　　中国人民解放军八一电影制片厂演员剧团原团长田华这次当选为全国道德模范，参加了这次会见。习近平总书记握着她的手，向她表示亲切问候。田华动情地回忆说，总书记工作那么忙还专门抽出时间来看望大家，同大家见面合影，这说明精神文明建设在中国特色社会主义建设过程中、在新的时代条件下具有何等重要性。如果全国人民都自觉做精神文明的建设者、践行者，国家和民族必将拥有更加昂扬自信的精神风貌！党的十八大以来精神文明建设成效越来越大，与党中央的重视与关心密不可分。\r\n\r\n　　作为第一届获奖的全国文明校园代表，吉林省长春市第二实验小学校长王艳军说，习近平总书记同参会代表亲切的“一握”，给老模范代表的“一让”，令人难忘、令人敬仰。我们作为教育工作者，应该倍加努力，为积极培育和践行社会主义核心价值观作出更大贡献，不辜负总书记的殷切希望。','2017-11-18 10:19:59.567625',19,NULL,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_log`
--

LOCK TABLES `public_log` WRITE;
/*!40000 ALTER TABLE `public_log` DISABLE KEYS */;
INSERT INTO `public_log` VALUES (1,'49.140.122.18',1,'2017-11-18 02:23:37.459442',3),(2,'49.140.122.18',2,'2017-11-18 02:26:38.276110',3),(3,'49.140.122.18',1,'2017-11-18 02:26:47.564334',3),(4,'49.140.122.18',1,'2017-11-18 07:06:36.572285',3),(5,'49.140.122.18',2,'2017-11-18 09:07:42.359747',3),(6,'49.140.122.18',1,'2017-11-18 09:12:15.645752',3),(7,'49.140.122.18',1,'2017-11-18 09:53:48.216546',3),(8,'49.140.122.18',2,'2017-11-18 09:55:44.800071',3),(9,'49.140.122.18',1,'2017-11-18 09:56:41.806117',3),(10,'49.140.122.18',2,'2017-11-18 10:07:24.002172',3),(11,'49.140.122.18',1,'2017-11-18 10:19:18.806909',3),(12,'49.140.122.18',2,'2017-11-18 10:20:08.033869',3),(13,'49.140.122.18',1,'2017-11-18 10:21:26.167667',3),(14,'49.140.122.18',1,'2017-11-18 11:48:10.625680',3),(15,'49.140.122.18',2,'2017-11-18 12:47:15.740969',3),(16,'49.140.122.18',1,'2017-11-18 12:48:41.679512',3),(17,'49.140.122.18',2,'2017-11-18 12:49:08.320048',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_post`
--

LOCK TABLES `public_post` WRITE;
/*!40000 ALTER TABLE `public_post` DISABLE KEYS */;
INSERT INTO `public_post` VALUES (1,'2017-11-18 02:26:25.115845','2017-11-19 02:26:25.115845','这个帖子活不过11/19 10:25',1,'1','测试专用贴',1,70,1,2,'chentb2114@mails.jlu.edu.cn',1,10,3),(2,'2017-11-18 09:50:01.411966','2291-09-03 09:50:01.411966','关于举办“喜庆十九大  青春建新功”系列活动（十一）——吉林大学党团主题知识竞赛的通知',2,'团委','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于举办“喜庆十九大  青春建新功”系列活动（十一）——吉林大学党团主题知识竞赛的通知&id=4703642&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=团委',0,0,100000,0,'',1,2,2),(3,'2017-11-18 09:50:01.434022','2291-09-03 09:50:01.434022','关于转发《教育部办公厅关于进一步加强教育部主管社会组织管理工作的通知》的通知',2,'校长办公室','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于转发《教育部办公厅关于进一步加强教育部主管社会组织管理工作的通知》的通知&id=4704057&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=校长办公室',0,0,100000,0,'',1,2,2),(4,'2017-11-18 09:50:01.444072','2291-09-03 09:50:01.444072','关于成立吉林大学第七届本(专)科教学督导组的决定',2,'教务处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于成立吉林大学第七届本(专)科教学督导组的决定&id=4704251&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=教务处',0,0,100000,0,'',1,2,2),(5,'2017-11-18 09:50:01.460251','2291-09-03 09:50:01.460251','关于聘任吉林大学第七届本科教学学生协理员的决定',2,'教务处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于聘任吉林大学第七届本科教学学生协理员的决定&id=4704330&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=教务处',0,0,100000,0,'',1,2,2),(6,'2017-11-18 09:50:01.474404','2291-09-03 09:50:01.474404','关于公布吉林大学2017年博士研究生兼职辅导员学生工作研究种子基金项目立项名单的通知',2,'学生工作部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于公布吉林大学2017年博士研究生兼职辅导员学生工作研究种子基金项目立项名单的通知&id=4704827&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=学生工作部',0,0,100000,0,'',1,2,2),(7,'2017-11-18 09:50:01.488434','2291-09-03 09:50:01.488434','关于举办第三届吉林大学“喜庆十九大共筑中国梦”主题合唱比赛决赛的通知',2,'党委宣传部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于举办第三届吉林大学“喜庆十九大共筑中国梦”主题合唱比赛决赛的通知&id=4705047&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=党委宣传部',0,0,100000,0,'',1,2,2),(8,'2017-11-18 09:50:01.500526','2291-09-03 09:50:01.500526','关于新民校区基础楼变电所的停电通知',2,'资产管理与后勤处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于新民校区基础楼变电所的停电通知&id=4705147&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=资产管理与后勤处',0,0,100000,0,'',1,2,2),(9,'2017-11-18 09:50:01.508549','2291-09-03 09:50:01.508549','关于评选2017年研究生“海拉奖学金”的通知',2,'研究生院','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于评选2017年研究生“海拉奖学金”的通知&id=4705335&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=研究生院',0,0,100000,0,'',1,2,2),(10,'2017-11-18 09:50:01.525594','2291-09-03 09:50:01.525594','关于提醒2017年12月至2018年4月任期届满党支部按期换届的通知',2,'党委组织部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于提醒2017年12月至2018年4月任期届满党支部按期换届的通知&id=4705410&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=党委组织部',0,0,100000,0,'',1,2,2),(11,'2017-11-18 09:50:01.539731','2291-09-03 09:50:01.539731','关于对2016年度教学、科研单位公用房使用定额测算的通知',2,'资产管理与后勤处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于对2016年度教学、科研单位公用房使用定额测算的通知&id=4705542&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=资产管理与后勤处',0,0,100000,0,'',1,2,2),(12,'2017-11-18 09:50:01.554804','2291-09-03 09:50:01.554804','关于第十六届台湾学生“北国风情”冬令营志愿者面试的通知',2,'国际合作与交流处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于第十六届台湾学生“北国风情”冬令营志愿者面试的通知&id=4706066&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=国际合作与交流处',0,0,100000,0,'',1,2,2),(13,'2017-11-18 09:50:01.573942','2291-09-03 09:50:01.573942','关于印发《吉林大学教职工年度考核工作实施办法 （教师以外系列）》的通知',2,'人力资源和社会保障处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于印发《吉林大学教职工年度考核工作实施办法 （教师以外系列）》的通知&id=4707369&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=人力资源和社会保障处',0,0,100000,0,'',1,2,2),(14,'2017-11-18 09:50:01.589060','2291-09-03 09:50:01.589060','关于举办2017年“女性学课堂”系列讲座第八讲的通知',2,'妇委会','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于举办2017年“女性学课堂”系列讲座第八讲的通知&id=4707416&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=妇委会',0,0,100000,0,'',1,2,2),(15,'2017-11-18 09:50:01.601118','2291-09-03 09:50:01.601118','关于校部机关教职工第九届乒乓球比赛日程安排的通知',2,'机关党委','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于校部机关教职工第九届乒乓球比赛日程安排的通知&id=4707425&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=机关党委',0,0,100000,0,'',1,2,2),(16,'2017-11-18 09:50:01.615233','2291-09-03 09:50:01.615233','关于组织学生观看第三届吉林大学“喜庆十九大共筑中国梦”主题合唱比赛决赛的通知',2,'学生工作部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于组织学生观看第三届吉林大学“喜庆十九大共筑中国梦”主题合唱比赛决赛的通知&id=4707764&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=学生工作部',0,0,100000,0,'',1,2,2),(17,'2017-11-18 09:50:01.635286','2291-09-03 09:50:01.635286','关于举办学生工作干部学习党的十九大精神专题报告 （第二场）暨学生党支部书记培训班专题辅导讲座的通知',2,'学生工作部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于举办学生工作干部学习党的十九大精神专题报告 （第二场）暨学生党支部书记培训班专题辅导讲座的通知&id=4708076&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=学生工作部',0,0,100000,0,'',1,2,2),(18,'2017-11-18 09:50:01.648419','2291-09-03 09:50:01.648419','关于开展2017年度博士研究生指导教师选聘工作的通知',2,'研究生院','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于开展2017年度博士研究生指导教师选聘工作的通知&id=4709111&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=研究生院',0,0,100000,0,'',1,2,2),(19,'2017-11-18 09:50:01.668423','2291-09-03 09:50:01.668423','关于开展2017年吉林大学朝阳校区“建寝强青年，筑梦兴中华”寝室文化节的通知',2,'北区综合办公室','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于开展2017年吉林大学朝阳校区“建寝强青年，筑梦兴中华”寝室文化节的通知&id=4709633&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=北区综合办公室',0,0,100000,0,'',1,2,2),(20,'2017-11-18 09:50:01.678557','2291-09-03 09:50:01.678557','关于仪器设备拟报废处置的公告（2017-11）',2,'实验室与设备管理处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于仪器设备拟报废处置的公告（2017-11）&id=4709720&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=实验室与设备管理处',0,0,100000,0,'',1,2,2),(21,'2017-11-18 09:50:01.691621','2291-09-03 09:50:01.691621','关于网上直播第三届吉林大学“喜庆十九大 共筑中国梦”主题合唱比赛决赛的通知',2,'党委宣传部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于网上直播第三届吉林大学“喜庆十九大 共筑中国梦”主题合唱比赛决赛的通知&id=4711670&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=党委宣传部',0,0,100000,0,'',1,2,2),(22,'2017-11-18 09:50:01.706631','2291-09-03 09:50:01.706631','食品科学与工程学院2017年招聘海外博士启事',2,'食品科学与工程学院','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=食品科学与工程学院2017年招聘海外博士启事&id=4712095&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=食品科学与工程学院',0,0,100000,0,'',1,2,2),(23,'2017-11-18 09:50:01.721703','2291-09-03 09:50:01.721703','关于公布吉林大学2017年就业创业工作研究课题立项结果的通知',2,'学生就业创业指导与服务中心','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于公布吉林大学2017年就业创业工作研究课题立项结果的通知&id=4712440&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=学生就业创业指导与服务中心',0,0,100000,0,'',1,2,2),(24,'2017-11-18 09:50:01.734852','2291-09-03 09:50:01.734852','关于组织我校学生参加“韩国光云大学2018冬季韩语短期交流项目”的通知',2,'国际合作与交流处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于组织我校学生参加“韩国光云大学2018冬季韩语短期交流项目”的通知&id=4712978&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=国际合作与交流处',0,0,100000,0,'',1,2,2),(25,'2017-11-18 09:50:01.743877','2291-09-03 09:50:01.743877','关于做好2017年度部门决算有关工作的通知',2,'财务处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于做好2017年度部门决算有关工作的通知&id=4662215&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=财务处',0,0,100000,0,'',1,2,2),(26,'2017-11-18 09:50:01.756434','2291-09-03 09:50:01.756434','关于编制2018-2019年项目支出规划和2018年单位预算的通知',2,'财务处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于编制2018-2019年项目支出规划和2018年单位预算的通知&id=4565019&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=财务处',0,0,100000,0,'',1,2,2),(27,'2017-11-18 09:50:01.771282','2291-09-03 09:50:01.771282','关于印发《中共吉林大学委员会关于深入学习宣传贯彻党的十九大精神的意见》的通知',2,'党委办公室','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于印发《中共吉林大学委员会关于深入学习宣传贯彻党的十九大精神的意见》的通知&id=4671859&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=党委办公室',0,0,100000,0,'',1,2,2),(28,'2017-11-18 09:50:01.784603','2291-09-03 09:50:01.784603','关于开展2017年度单位银行账户年检及备案工作的通知',2,'财务处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于开展2017年度单位银行账户年检及备案工作的通知&id=4684440&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=财务处',0,0,100000,0,'',1,2,2),(29,'2017-11-18 09:50:01.795595','2291-09-03 09:50:01.795595','关于开展A类代理人员试用期考核及签订岗位聘用合同书的通知',2,'人力资源和社会保障处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于开展A类代理人员试用期考核及签订岗位聘用合同书的通知&id=4668741&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=人力资源和社会保障处',0,0,100000,0,'',1,2,2),(30,'2017-11-18 09:50:01.806625','2291-09-03 09:50:01.806625','关于开展2016年和2017年专业技术职务聘任工作的通知',2,'人力资源和社会保障处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于开展2016年和2017年专业技术职务聘任工作的通知&id=4701310&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=人力资源和社会保障处',0,0,100000,0,'',1,2,2),(31,'2017-11-18 09:50:01.822684','2291-09-03 09:50:01.822684','关于印发《吉林大学教师考核工作实施办法》的通知',2,'人力资源和社会保障处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于印发《吉林大学教师考核工作实施办法》的通知&id=4704983&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=人力资源和社会保障处',0,0,100000,0,'',1,2,2),(32,'2017-11-18 11:48:44.192648','2017-11-19 11:48:44.192648','无图',1,'999','无图',0,13,1,1,'15754310702',1,10,3);
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
INSERT INTO `public_userdetail` VALUES (1,'',0,'',1,1),(2,NULL,0,NULL,1,2),(3,'',0,'',1,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_userlikepost`
--

LOCK TABLES `public_userlikepost` WRITE;
/*!40000 ALTER TABLE `public_userlikepost` DISABLE KEYS */;
INSERT INTO `public_userlikepost` VALUES (3,1,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_userphonenum`
--

LOCK TABLES `public_userphonenum` WRITE;
/*!40000 ALTER TABLE `public_userphonenum` DISABLE KEYS */;
INSERT INTO `public_userphonenum` VALUES (1,'',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_userqq`
--

LOCK TABLES `public_userqq` WRITE;
/*!40000 ALTER TABLE `public_userqq` DISABLE KEYS */;
INSERT INTO `public_userqq` VALUES (1,'2440734460',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_userwechat`
--

LOCK TABLES `public_userwechat` WRITE;
/*!40000 ALTER TABLE `public_userwechat` DISABLE KEYS */;
INSERT INTO `public_userwechat` VALUES (1,'',3);
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

-- Dump completed on 2017-11-18 20:55:00
