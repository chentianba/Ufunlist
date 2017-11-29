-- MySQL dump 10.13  Distrib 5.6.38, for Linux (x86_64)
--
-- Host: localhost    Database: ufunlist
-- ------------------------------------------------------
-- Server version	5.6.38

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_passwordverify`
--

LOCK TABLES `account_passwordverify` WRITE;
/*!40000 ALTER TABLE `account_passwordverify` DISABLE KEYS */;
INSERT INTO `account_passwordverify` VALUES (6,'pangzy2114@mails.jlu.edu.cn','BCMBQR','2017-11-20 10:32:50.792725');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_regverify`
--

LOCK TABLES `account_regverify` WRITE;
/*!40000 ALTER TABLE `account_regverify` DISABLE KEYS */;
INSERT INTO `account_regverify` VALUES (4,'chenjn2114@mails.jlu.edu.cn','FBZA9U','2017-11-19 11:20:05.211217');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$iv778wEnYJgd$VLmW3kutOjLB6WIgqfpTzP1/wCuqVl3rjHRW2irOclg=',NULL,0,'我的账户','','','',0,1,'2017-11-18 02:04:20.804348'),(2,'pbkdf2_sha256$36000$JzJoOQyl5mS1$6xu1ubmN/rl2hcFSTq4GZF817xigizhPca1oZI9+eUk=',NULL,0,'jlu_administer','','','administer@jlu.edu.cn',0,1,'2017-11-18 02:06:39.953745'),(3,'pbkdf2_sha256$36000$eRnG31fNuStC$+fSPiEKz73mT/kvXlgPRNCZ90PA5AGap+2b4FouRHSw=','2017-11-20 07:29:17.981088',0,'ctbsky','','','chentb2114@mails.jlu.edu.cn',0,1,'2017-11-18 02:23:37.391373'),(4,'pbkdf2_sha256$36000$FfqN5kSbFgHt$WCsEVQlY9GsIxuJnlJ3BLSflE6FXrfUITHKI8Po9cUw=','2017-11-20 07:00:27.286815',0,'zypang','','','pangzy2114@mails.jlu.edu.cn',0,1,'2017-11-19 07:44:07.249904'),(5,'pbkdf2_sha256$36000$sWd7D6tZpH6E$0h9x9n+Ubz2EvAm7plmXtSlAyowu4/+4QSfB4+wPUNI=','2017-11-19 13:49:57.836064',0,'Apple','','','chenjn2114@mails.jlu.edu.cn',0,1,'2017-11-19 11:18:05.869696');
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
INSERT INTO `django_session` VALUES ('0pujo90evwuntxb4f411ja9sxg4kxvuq','ZmVlZTA0OGM3ZWNlZDcwZDllNzcyODM5MWQ5ODg5NjQxMmQ3MjNhMjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc1ZDY2NWNlZDk5Yjg5Zjc3YzZmNWMzZDAyMzY2M2E0NjFmOTg1OWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-12-02 15:13:48.994152'),('2flyi2trr4s85pioju1ib0np8v3cd06p','MzdjMDkwMDBhMTBlNDVlMzEyYTE3OTQ0YjFkYzY0NjhmOTk2YjI0Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjM0OGQwYmQxZTA5MTllMmQ3YTY5OTFhZjUzNDRiZjU1NjYxYWQ2YjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-12-03 12:08:34.985557'),('5u62b997g6jjmzkmak8q4oilzcee16ne','OTcyMWUxN2U4Y2M4NzUwNWIwNmNmYTBlNTQ1MmIzMjkxYzE0MjA0NDp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NWQ2NjVjZWQ5OWI4OWY3N2M2ZjVjM2QwMjM2NjNhNDYxZjk4NTlkIn0=','2017-12-02 09:53:48.221887'),('6j7k7014z3rma575vy5zo9qfxi9qw0kd','ZmVlZTA0OGM3ZWNlZDcwZDllNzcyODM5MWQ5ODg5NjQxMmQ3MjNhMjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc1ZDY2NWNlZDk5Yjg5Zjc3YzZmNWMzZDAyMzY2M2E0NjFmOTg1OWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-12-03 06:56:47.315217'),('7qcdovqlb4sgkgurbgdkxj6u80l6o0c2','YjBmMTU5ZTk0MGFmZGY0NDU4YjliNzJiY2U4ZTQ1NjVlNTkxODE3MDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzVkNjY1Y2VkOTliODlmNzdjNmY1YzNkMDIzNjYzYTQ2MWY5ODU5ZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-12-03 03:31:11.913394'),('90slsfbfwz9xwunvrt8sdx8drfivw91j','YjNlYzdmYWY1MTQ4NDQzNjEzNmMxNzZlMmJlYzQ2YmQ3MTdiOTEwZjp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDVkMWU3ZGIzM2E5NGZmMzFkNDBkNjQ5Y2VmMDRkMzE2NDk5NTU4ZSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2017-12-04 07:29:17.994317'),('a9l8v2cppf5f92di4qn4l61ie3ks52s3','MzdjMDkwMDBhMTBlNDVlMzEyYTE3OTQ0YjFkYzY0NjhmOTk2YjI0Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjM0OGQwYmQxZTA5MTllMmQ3YTY5OTFhZjUzNDRiZjU1NjYxYWQ2YjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-12-03 07:44:07.317604'),('abb5hz2p64qzmjqfijm5e68l5j0j1m7l','MmQwNGRjMzRiYzk5ZWI1MGJjNDgwMGFiNjAwNjNhYTFjZmE1OGRiZDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc2MzlhN2U4ZWRjZDgzZTA1ZTdjMzBkNmFkZjQ0ZGE0MDZiZjJkMjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1In0=','2017-12-03 11:18:05.944334'),('evzflxk67x3pl6yw21x57jld97bdicjz','OTcyMWUxN2U4Y2M4NzUwNWIwNmNmYTBlNTQ1MmIzMjkxYzE0MjA0NDp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NWQ2NjVjZWQ5OWI4OWY3N2M2ZjVjM2QwMjM2NjNhNDYxZjk4NTlkIn0=','2017-12-02 02:26:47.569443'),('gyodbxh8vggvywb45u1cbj3q1tfg1d49','YjBmMTU5ZTk0MGFmZGY0NDU4YjliNzJiY2U4ZTQ1NjVlNTkxODE3MDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzVkNjY1Y2VkOTliODlmNzdjNmY1YzNkMDIzNjYzYTQ2MWY5ODU5ZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-12-02 14:35:24.824508'),('hyq1ww39ttm0aquln3zos3wvr5g4vgx7','ZjllNGU5MTBlYjZlZTBlZWFhYjg0NzNiMTZjY2NmNDM1MTJkMWRkZTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NWQxZTdkYjMzYTk0ZmYzMWQ0MGQ2NDljZWYwNGQzMTY0OTk1NThlIn0=','2017-12-03 09:51:23.758360'),('kc82pzu8kh38xfcggd0pw44zwlyzswub','OTcyZmRiMDdlYWZkZjQ4MjA0M2JmY2M5MDkyZGU5MzAyNWQ5ZDdhNTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9oYXNoIjoiMzQ4ZDBiZDFlMDkxOWUyZDdhNjk5MWFmNTM0NGJmNTU2NjFhZDZiNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2017-12-04 07:00:27.296663'),('o7ggwixcsgxk7z3dgxz0xdbbg16vzfvb','YTA3ZTNhZjRhMDVhMTBiNzg1ZDk5Y2NjNTk3NGQ2ZmQ5ODZmMGMyZjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ1ZDFlN2RiMzNhOTRmZjMxZDQwZDY0OWNlZjA0ZDMxNjQ5OTU1OGUiLCJfYXV0aF91c2VyX2lkIjoiMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2017-12-03 08:28:31.810904'),('p0opl65bqrten7r3lt8wibpogavkpfb0','MzdjMDkwMDBhMTBlNDVlMzEyYTE3OTQ0YjFkYzY0NjhmOTk2YjI0Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjM0OGQwYmQxZTA5MTllMmQ3YTY5OTFhZjUzNDRiZjU1NjYxYWQ2YjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2017-12-03 08:00:26.779931'),('t8mnch7ptva0733xd8gywv490w8gv1gi','YzRmMzQ1ZGM3NmJiZDI5ODk3MThiYjNmYzQ1MjZiMDNhZDFhZTJlYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ1ZDFlN2RiMzNhOTRmZjMxZDQwZDY0OWNlZjA0ZDMxNjQ5OTU1OGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-12-03 11:26:14.110043'),('u9bk1zrejesr5e5kk52hfpa1a05kmm64','NGYzMTc3NzFiZmUxOGE4MjJhMmZlYTllNzA3NDQ3YzI0MTQ5MTAzNDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNDhkMGJkMWUwOTE5ZTJkN2E2OTkxYWY1MzQ0YmY1NTY2MWFkNmI0In0=','2017-12-03 10:47:13.176516'),('vjd1ss42lqqwf0iaim0rnypweg67742z','MTZlY2ZlMzU5MTg5YjliMzgyY2NjYzAzOWUwMWRiNTU5N2Q3NmI0Yjp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9oYXNoIjoiNzYzOWE3ZThlZGNkODNlMDVlN2MzMGQ2YWRmNDRkYTQwNmJmMmQyNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2017-12-03 12:04:53.439687'),('w5ckz9j9twjta1jyjwm08vkku51qxeht','OTcyMWUxN2U4Y2M4NzUwNWIwNmNmYTBlNTQ1MmIzMjkxYzE0MjA0NDp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NWQ2NjVjZWQ5OWI4OWY3N2M2ZjVjM2QwMjM2NjNhNDYxZjk4NTlkIn0=','2017-12-02 10:21:26.172724'),('wmq0bf5fwdl7qgzrf1ekjtclytuqa8qi','MTZlY2ZlMzU5MTg5YjliMzgyY2NjYzAzOWUwMWRiNTU5N2Q3NmI0Yjp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9oYXNoIjoiNzYzOWE3ZThlZGNkODNlMDVlN2MzMGQ2YWRmNDRkYTQwNmJmMmQyNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2017-12-03 13:49:57.850882'),('wtc7ubv26ag1vzwjcy9i9tu9vdlrekb9','OTcyZmRiMDdlYWZkZjQ4MjA0M2JmY2M5MDkyZGU5MzAyNWQ5ZDdhNTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9oYXNoIjoiMzQ4ZDBiZDFlMDkxOWUyZDdhNjk5MWFmNTM0NGJmNTU2NjFhZDZiNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2017-12-04 05:16:33.044812');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_forumpost`
--

LOCK TABLES `public_forumpost` WRITE;
/*!40000 ALTER TABLE `public_forumpost` DISABLE KEYS */;
INSERT INTO `public_forumpost` VALUES (1,'习近平会见全国道德模范代表侧记','热烈的掌声，在人民大会堂金色大厅内响起，铭记着一个暖心感人的场景。\r\n\r\n　　17日上午9时30分，中共中央总书记、国家主席、中央军委主席习近平来到人民大会堂金色大厅，亲切会见参加全国精神文明建设表彰大会的600多名代表。\r\n\r\n　　在热烈的掌声中，习近平总书记高兴地同大家热情握手、亲切交谈，代表们纷纷向总书记问好。握手结束后，习近平总书记回到队伍中间，准备同代表们合影。总书记看到93岁的黄旭华和82岁的黄大发两位道德模范代表年事已高，站在代表们中间，总书记握住他们的手，微笑着问候说：“你们这么大岁数，身体还不错。你们别站着了，到我边上坐下。”\r\n\r\n　　习近平总书记拉着他们的手，请两位老人坐到自己身旁来，两人执意推辞，习近平一再邀请，说：“来！挤挤就行了，就这样。”\r\n\r\n　　相机快门按下，记录下了这一感人瞬间。\r\n\r\n　　会见结束后，习近平语重心长对有关部门的同志说，给老道德模范让座，这是尊老敬老的传统美德，这就叫人伦常情。总书记的话是言传，更是身教，在人们的心田荡漾。\r\n\r\n　　黄旭华是中船重工719研究所名誉所长，他为了祖国的核潜艇事业，隐姓埋名、以身许国，阔别家乡30载，其间一次也没有回过老家。\r\n\r\n　　“从1958年开始到现在，我没有离开过核潜艇研制领域，我的一生没有虚度。”今天，习近平总书记的亲切会见，让黄旭华又一次感受着党和国家赋予他的使命与荣光。\r\n\r\n　　“我做梦也没想到，总书记竟然把我请过来坐到他身边，还问了我的健康情况。总书记对我们的关怀，我要回去传达，要让所有同志认识到我们任重道远，要再铸辉煌。”黄旭华说。\r\n\r\n　　黄大发是贵州省遵义市播州区平正仡佬族乡原草王坝村党支部书记，他带领村民们前后历经30多年，在峭壁悬崖间挖出一条10公里的“天渠”，使曾经缺水干旱的贫困村面貌一新。\r\n\r\n　　回想习近平总书记同大家合影的情景，黄大发十分激动：“总书记对我们老党员关心得很、尊敬得很，我很感动，也很光荣。合影后，总书记回头向大家挥手告别，我们也赶紧向他招手。”\r\n\r\n　　身教重于言教，掌声久久回响。习近平总书记一个自然而然的举动，身体力行中华民族尊老敬贤的传统美德，展现出亲民爱民的崇高风范。\r\n\r\n　　党的十八大以来，习近平总书记对先进模范的尊敬与关爱，一次次为全社会作出示范，引领着社会风尚。\r\n\r\n　　2013年9月26日，在会见第四届全国道德模范及提名奖获得者时，习近平总书记把目光转向坐在第一排左边的一位老人。他饱含深情地说，我刚才看到这位老大姐，她就是我们的老将军甘祖昌的夫人龚全珍，她今年90多岁了，我看到她以后心里一阵阵的感动。\r\n\r\n　　2014年10月15日，习近平总书记主持召开文艺工作座谈会。当大家发言结束，总书记准备发表讲话时，他望了望坐在右边不远处的中国红楼梦学会名誉会长、90岁高龄的冯其庸先生，对大家说，今天出席座谈会的不少老艺术家年事已高，大家如果累了，就到休息室休息或者走动走动。\r\n\r\n　　今天，习近平总书记用他的实际行动，为与会代表上了关爱模范、尊重典型的生动一课。\r\n\r\n　　中国人民解放军八一电影制片厂演员剧团原团长田华这次当选为全国道德模范，参加了这次会见。习近平总书记握着她的手，向她表示亲切问候。田华动情地回忆说，总书记工作那么忙还专门抽出时间来看望大家，同大家见面合影，这说明精神文明建设在中国特色社会主义建设过程中、在新的时代条件下具有何等重要性。如果全国人民都自觉做精神文明的建设者、践行者，国家和民族必将拥有更加昂扬自信的精神风貌！党的十八大以来精神文明建设成效越来越大，与党中央的重视与关心密不可分。\r\n\r\n　　作为第一届获奖的全国文明校园代表，吉林省长春市第二实验小学校长王艳军说，习近平总书记同参会代表亲切的“一握”，给老模范代表的“一让”，令人难忘、令人敬仰。我们作为教育工作者，应该倍加努力，为积极培育和践行社会主义核心价值观作出更大贡献，不辜负总书记的殷切希望。','2017-11-18 10:19:59.567625',19,NULL,3),(2,'国务院刚发布的这项政策 与你的养老金息息相关','我国统一的企业职工基本养老保险制度自建立以来，对建立社会主义市场经济体制、维护改革发展稳定大局、保障企业离退休人员权益发挥了重要作用。\r\n\r\n　　但与此同时，受多种因素影响，也形成了一定的企业职工基本养老保险基金缺口。随着经济社会发展和人口老龄化加剧，基本养老保险基金支付压力不断加大，需要通过多种渠道加以解决。\r\n\r\n　　今日（11月18日）上午，国务院印发了《划转部分国有资本充实社保基金实施方案》（以下简称《方案》）。国务院称，随着经济社会发展和人口老龄化加剧，基本养老保险基金支付压力不断加大，为充分体现代际公平和国有企业发展成果全民共享，现决定划转部分国有资本充实社保基金。','2017-11-18 14:52:35.764720',19,NULL,3),(3,'西藏林芝发生6.9级地震','网友称震感强烈:被吓醒了','2017-11-18 14:52:54.539249',19,NULL,3),(4,'求是：中国才是当今世界最大的民主国家','核心要点：\r\n\r\n　　■ 西方把中国特色社会主义制度贴上“非民主”的标签，贬低甚至妖魔化中国的政治经济体制与发展成就。中国作为世界上人口最多的国家，是当今世界最大的民主国家。\r\n\r\n　　■ 西方无权垄断“民主国家”的标准。当代西方政治话语的实质是试图将西式民主确立为唯一“合法”的民主形式，西方人不顾自身民主的多元性，却刻意否认当代中国的民主形式。\r\n\r\n　　■ 西式民主并不像西方描绘的那般光鲜。历史和现实都证明了，西方民主只是民主在当下历史条件下的一种暂时的历史形态，在很大程度上已经异化为金钱政治和民粹主义政治而且不适合其他文化背景和不同历史发展条件的非西方国家。\r\n\r\n　　■ 中国正在稳步迈向人民民主的新境界。经过60多年的努力探索与实践，中国在民主政治建设的多个方面都取得了决定性的进展。中国特色社会主义民主是维护人民根本利益的最广泛、最真实、最管用的民主，正不断彰显着真实性、有效性、优越性。','2017-11-18 14:53:16.522666',19,NULL,3),(5,'87岁袁隆平像个“老顽童” 抽60多年的烟戒了','在水稻研究上永不止步的袁隆平，最近又实现了一个“小目标”。\r\n\r\n　　11月4日，广西灌阳县“超级稻+再生稻”示范基地进行了再生稻测产，结果显示平均亩产为552.1公斤，而今年该基地一季稻平均亩产为1009.45公斤，因此一季稻加再生稻平均亩产超过了1500公斤。——袁隆平“吨半稻”的心愿得以实现。\r\n\r\n　　“按照一人一年600斤粮食的量计算，两分田就可以养活一个人，不得了哇！”袁隆平一再感叹。今年已87岁的他，依然做着水稻的研究，喜欢去稻田里走一走，行程安排得很满。他越来越像一个“老顽童”，爱打牌和气排球，还把抽了60多年的烟戒了。','2017-11-18 14:53:54.779207',19,NULL,3),(6,'上万津巴布韦民众在首都抗议 呼吁总统穆加贝辞职','海外网11月18日电 据美国CNN新闻网、半岛电视台等外媒报道，在津巴布韦军方采取行动“软禁”该国总统穆加贝之后，当地时间18日，成千上万名津巴布韦民众走上街头，要求这位93岁的总统辞职。一些民众打出了“我们希望穆加贝辞职”的标语，也有人身着印有津巴布韦国旗的衣服参加游行。','2017-11-18 14:54:22.192562',19,NULL,3),(7,'刘凤海被查 今年已有四位原驻京办负责人落马','昨天（11月17日）晚上，辽宁纪检监察网发布了《辽宁省政府驻北京办事处主任刘凤海接受组织审查》的消息，消息表示，经辽宁省委批准，辽宁省政府原驻北京办事处主任刘凤海涉嫌严重违纪，目前正接受组织审查。\r\n\r\n　　公开资料显示：刘凤海，男，汉族，1957年9月生，内蒙古赤峰人，1982年2月参加工作，1985年12月加入中国共产党，农学学士。\r\n\r\n　　1978.03--1982.02沈阳农学院植物保护专业学生；\r\n\r\n　　1982.02--1985.06辽宁省植物保护站工作人员、副科长；\r\n\r\n　　1985.06--1990.02辽宁省农业厅办公室副主任科员、主任科员；\r\n\r\n　　1990.02--1992.05辽宁省农业厅信息中心副主任（其间：1991.03--1992.02驻喀左县扶贫开发工作队副队长）；\r\n\r\n　　1992.05--1993.03辽宁省农业厅办公室副主任；\r\n\r\n　　1993.03--1994.06辽宁省农信开发公司总经理；\r\n\r\n　　1994.06--1995.09辽宁省农业厅办公室副主任；\r\n\r\n　　1995.09--1997.12辽宁省农业厅办公室主任、政策法规处处长、信息中心主任；\r\n\r\n　　1997.12--1998.08辽宁省人民政府办公厅正处级秘书；\r\n\r\n　　1998.08--2001.12沈阳市苏家屯区副区长（挂职锻炼）；\r\n\r\n　　2001.12--2002.01沈阳市苏家屯区委副书记、副区长、代区长；\r\n\r\n　　2002.01--2004.09沈阳市苏家屯区委副书记、区长；\r\n\r\n　　2004.09--2010.02沈阳市政府副秘书长、棋盘山开发区管委会党工委书记、主任；\r\n\r\n　　2010.02--2011.11辽宁省农村经济委员会党组副书记、副主任、省农村工作领导小组办公室专职副主任（正厅级）；\r\n\r\n　　2011.11--2012.01锦州市委副书记、副市长、代市长；\r\n\r\n　　2012.01--2014.09锦州市委副书记、市长；\r\n\r\n　　2014.09--2016.07辽宁省政府办公厅党组成员，省政府驻北京办事处主任；\r\n\r\n　　2016.07至今辽宁省政府驻北京办事处主任。','2017-11-18 14:55:05.029382',19,NULL,3),(8,'铁总18家铁路局接连更名 背后有何深意？','中国铁路总公司（下称“铁总”）公司制改革又迈出了一步。\r\n\r\n　　中新社国是直通车记者查询国家企业信用信息公示系统发现，截至11月17日，铁总旗下的18家铁路局（公司）已经全部完成工商登记变更。\r\n\r\n中新社发 高国桥 摄中新社发 高国桥 摄\r\n　　这轮变更后，各铁路局名称全部改为“中国铁路XX局集团有限公司”。例如，原成都铁路局、沈阳铁路局相继更名为“中国铁路成都局集团有限公司”、“中国铁路沈阳局集团有限公司”。但18家路局集团依然为铁总的全资控股公司。\r\n\r\n　　中国铁路路局时代结束，路局集团公司时代开启。','2017-11-18 14:55:34.029314',19,NULL,3),(9,'中国人不能投中国:德国家形象调查奉自己为第一','[环球网报道 记者 郭鹏飞]16日，德国捷孚凯市场调查公司（GfK）以及英国政策咨询专家安霍尔特（Simon Anholt）公布一项针对50“国”的所谓的“各国品牌的实力与质量”指数排名。在全球对美国好感度大幅下跌之后，德国重新在这项排名中登顶。法国上升到第二名，英国回到第三位，而日本自2011年以来首次进入前五，并与加拿大并列第四位。中国的排名较去年大幅度上升，位列24。但是，环球网记者发现，该调查却对中国进行了“区别对待”，而且还把“台湾”称之为“国家”。','2017-11-18 14:56:12.627372',19,NULL,3),(10,'沙特反腐谈判:交钱免罪 上缴70%财产就能换自由','平地而起的沙特反腐风波又有了新进展。\r\n\r\n　　被捕的王子、富商们此时需要面对一个棘手的问题：要钱还是要自由？\r\n\r\n　　英国《金融时报》援引知情人士称，沙特当局正与被捕的王子们和商人们商量一笔交易——花钱买自由。两位知情人士向英国金融时报表示，在某些个案上，沙特政府要求嫌犯上交其70%的个人财富。','2017-11-18 14:56:46.111498',19,NULL,3),(11,'央行资产管理业务指导意见发布','专题摘要:\r\n11月17日，央行拟颁布新规，进一步加强金融机构资管业务监管。监管层拟出台新规：明确将打破资管业务刚性兑付','2017-11-18 14:57:13.812895',19,NULL,3),(12,'测试','测试','2017-11-19 07:50:46.254147',19,NULL,4),(13,NULL,'测试','2017-11-19 07:50:55.962378',19,12,4),(14,NULL,'测试','2017-11-19 07:51:06.253965',19,13,4),(15,NULL,'测试','2017-11-19 07:51:11.145831',19,14,4),(16,NULL,'你好','2017-11-19 08:00:43.058938',19,12,4),(17,NULL,'你好','2017-11-19 08:00:51.950653',19,13,4),(18,'第三组发来贺电O(∩_∩)O','第三组发来贺电O(∩_∩)O','2017-11-19 11:19:58.566862',19,NULL,5),(19,NULL,'赞','2017-11-19 11:26:35.747533',19,18,3),(20,NULL,'啦啦啦','2017-11-19 12:08:42.337668',19,18,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_log`
--

LOCK TABLES `public_log` WRITE;
/*!40000 ALTER TABLE `public_log` DISABLE KEYS */;
INSERT INTO `public_log` VALUES (1,'49.140.122.18',1,'2017-11-18 02:23:37.459442',3),(2,'49.140.122.18',2,'2017-11-18 02:26:38.276110',3),(3,'49.140.122.18',1,'2017-11-18 02:26:47.564334',3),(4,'49.140.122.18',1,'2017-11-18 07:06:36.572285',3),(5,'49.140.122.18',2,'2017-11-18 09:07:42.359747',3),(6,'49.140.122.18',1,'2017-11-18 09:12:15.645752',3),(7,'49.140.122.18',1,'2017-11-18 09:53:48.216546',3),(8,'49.140.122.18',2,'2017-11-18 09:55:44.800071',3),(9,'49.140.122.18',1,'2017-11-18 09:56:41.806117',3),(10,'49.140.122.18',2,'2017-11-18 10:07:24.002172',3),(11,'49.140.122.18',1,'2017-11-18 10:19:18.806909',3),(12,'49.140.122.18',2,'2017-11-18 10:20:08.033869',3),(13,'49.140.122.18',1,'2017-11-18 10:21:26.167667',3),(14,'49.140.122.18',1,'2017-11-18 11:48:10.625680',3),(15,'49.140.122.18',2,'2017-11-18 12:47:15.740969',3),(16,'49.140.122.18',1,'2017-11-18 12:48:41.679512',3),(17,'49.140.122.18',2,'2017-11-18 12:49:08.320048',3),(18,'222.34.4.6',1,'2017-11-18 14:35:24.822201',3),(19,'222.34.4.8',1,'2017-11-18 15:13:48.991876',3),(20,'222.34.4.6',1,'2017-11-19 03:31:11.911209',3),(21,'222.34.4.6',1,'2017-11-19 06:56:47.311690',3),(22,'222.34.4.10',1,'2017-11-19 07:44:07.315835',4),(23,'222.34.4.8',1,'2017-11-19 08:00:25.629003',4),(24,'222.34.4.8',1,'2017-11-19 08:00:26.776220',4),(25,'222.34.4.6',1,'2017-11-19 08:28:31.804991',3),(26,'222.34.4.6',1,'2017-11-19 09:51:23.756440',3),(27,'222.34.4.10',1,'2017-11-19 10:47:13.175085',4),(28,'222.34.4.15',1,'2017-11-19 11:18:05.942127',5),(29,'222.34.4.6',1,'2017-11-19 11:26:14.107134',3),(30,'222.34.4.15',1,'2017-11-19 12:04:53.437659',5),(31,'139.214.251.9',1,'2017-11-19 12:08:34.983349',4),(32,'222.34.4.15',1,'2017-11-19 13:49:57.848938',5),(33,'49.140.191.61',1,'2017-11-20 04:19:52.794124',4),(34,'49.140.191.61',2,'2017-11-20 04:20:15.666992',4),(35,'139.214.254.62',1,'2017-11-20 05:16:33.041059',4),(36,'49.140.86.131',1,'2017-11-20 07:00:27.293186',4),(37,'49.140.122.18',1,'2017-11-20 07:29:17.987756',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_picture`
--

LOCK TABLES `public_picture` WRITE;
/*!40000 ALTER TABLE `public_picture` DISABLE KEYS */;
INSERT INTO `public_picture` VALUES (9,'35_1.jpg','/media/',35),(10,'35_2.jpg','/media/',35),(11,'36_1.jpg','/media/',36),(12,'36_2.jpg','/media/',36),(13,'39_1.jpg','/media/',39),(14,'40_1.jpg','/media/',40),(15,'55_1.jpg','/media/',55),(16,'55_2.jpg','/media/',55),(17,'55_3.jpg','/media/',55);
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
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_post`
--

LOCK TABLES `public_post` WRITE;
/*!40000 ALTER TABLE `public_post` DISABLE KEYS */;
INSERT INTO `public_post` VALUES (2,'2017-11-18 09:50:01.411966','2291-09-03 09:50:01.411966','关于举办“喜庆十九大  青春建新功”系列活动（十一）——吉林大学党团主题知识竞赛的通知',2,'团委','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于举办“喜庆十九大  青春建新功”系列活动（十一）——吉林大学党团主题知识竞赛的通知&id=4703642&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=团委',0,0,100000,0,'',1,2,2),(3,'2017-11-18 09:50:01.434022','2291-09-03 09:50:01.434022','关于转发《教育部办公厅关于进一步加强教育部主管社会组织管理工作的通知》的通知',2,'校长办公室','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于转发《教育部办公厅关于进一步加强教育部主管社会组织管理工作的通知》的通知&id=4704057&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=校长办公室',0,0,100000,0,'',1,2,2),(4,'2017-11-18 09:50:01.444072','2291-09-03 09:50:01.444072','关于成立吉林大学第七届本(专)科教学督导组的决定',2,'教务处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于成立吉林大学第七届本(专)科教学督导组的决定&id=4704251&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=教务处',0,0,100000,0,'',1,2,2),(5,'2017-11-18 09:50:01.460251','2291-09-03 09:50:01.460251','关于聘任吉林大学第七届本科教学学生协理员的决定',2,'教务处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于聘任吉林大学第七届本科教学学生协理员的决定&id=4704330&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=教务处',0,0,100000,0,'',1,2,2),(6,'2017-11-18 09:50:01.474404','2291-09-03 09:50:01.474404','关于公布吉林大学2017年博士研究生兼职辅导员学生工作研究种子基金项目立项名单的通知',2,'学生工作部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于公布吉林大学2017年博士研究生兼职辅导员学生工作研究种子基金项目立项名单的通知&id=4704827&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=学生工作部',0,0,100000,0,'',1,2,2),(7,'2017-11-18 09:50:01.488434','2291-09-03 09:50:01.488434','关于举办第三届吉林大学“喜庆十九大共筑中国梦”主题合唱比赛决赛的通知',2,'党委宣传部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于举办第三届吉林大学“喜庆十九大共筑中国梦”主题合唱比赛决赛的通知&id=4705047&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=党委宣传部',0,0,100000,0,'',1,2,2),(8,'2017-11-18 09:50:01.500526','2291-09-03 09:50:01.500526','关于新民校区基础楼变电所的停电通知',2,'资产管理与后勤处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于新民校区基础楼变电所的停电通知&id=4705147&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=资产管理与后勤处',0,0,100000,0,'',1,2,2),(9,'2017-11-18 09:50:01.508549','2291-09-03 09:50:01.508549','关于评选2017年研究生“海拉奖学金”的通知',2,'研究生院','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于评选2017年研究生“海拉奖学金”的通知&id=4705335&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=研究生院',0,0,100000,0,'',1,2,2),(10,'2017-11-18 09:50:01.525594','2291-09-03 09:50:01.525594','关于提醒2017年12月至2018年4月任期届满党支部按期换届的通知',2,'党委组织部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于提醒2017年12月至2018年4月任期届满党支部按期换届的通知&id=4705410&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=党委组织部',0,0,100000,0,'',1,2,2),(11,'2017-11-18 09:50:01.539731','2291-09-03 09:50:01.539731','关于对2016年度教学、科研单位公用房使用定额测算的通知',2,'资产管理与后勤处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于对2016年度教学、科研单位公用房使用定额测算的通知&id=4705542&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=资产管理与后勤处',0,0,100000,0,'',1,2,2),(12,'2017-11-18 09:50:01.554804','2291-09-03 09:50:01.554804','关于第十六届台湾学生“北国风情”冬令营志愿者面试的通知',2,'国际合作与交流处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于第十六届台湾学生“北国风情”冬令营志愿者面试的通知&id=4706066&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=国际合作与交流处',0,0,100000,0,'',1,2,2),(13,'2017-11-18 09:50:01.573942','2291-09-03 09:50:01.573942','关于印发《吉林大学教职工年度考核工作实施办法 （教师以外系列）》的通知',2,'人力资源和社会保障处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于印发《吉林大学教职工年度考核工作实施办法 （教师以外系列）》的通知&id=4707369&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=人力资源和社会保障处',0,0,100000,0,'',1,2,2),(14,'2017-11-18 09:50:01.589060','2291-09-03 09:50:01.589060','关于举办2017年“女性学课堂”系列讲座第八讲的通知',2,'妇委会','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于举办2017年“女性学课堂”系列讲座第八讲的通知&id=4707416&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=妇委会',0,0,100000,0,'',1,2,2),(15,'2017-11-18 09:50:01.601118','2291-09-03 09:50:01.601118','关于校部机关教职工第九届乒乓球比赛日程安排的通知',2,'机关党委','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于校部机关教职工第九届乒乓球比赛日程安排的通知&id=4707425&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=机关党委',0,0,100000,0,'',1,2,2),(16,'2017-11-18 09:50:01.615233','2291-09-03 09:50:01.615233','关于组织学生观看第三届吉林大学“喜庆十九大共筑中国梦”主题合唱比赛决赛的通知',2,'学生工作部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于组织学生观看第三届吉林大学“喜庆十九大共筑中国梦”主题合唱比赛决赛的通知&id=4707764&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=学生工作部',0,0,100000,0,'',1,2,2),(17,'2017-11-18 09:50:01.635286','2291-09-03 09:50:01.635286','关于举办学生工作干部学习党的十九大精神专题报告 （第二场）暨学生党支部书记培训班专题辅导讲座的通知',2,'学生工作部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于举办学生工作干部学习党的十九大精神专题报告 （第二场）暨学生党支部书记培训班专题辅导讲座的通知&id=4708076&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=学生工作部',0,0,100000,0,'',1,2,2),(18,'2017-11-18 09:50:01.648419','2291-09-03 09:50:01.648419','关于开展2017年度博士研究生指导教师选聘工作的通知',2,'研究生院','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于开展2017年度博士研究生指导教师选聘工作的通知&id=4709111&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=研究生院',0,0,100000,0,'',1,2,2),(19,'2017-11-18 09:50:01.668423','2291-09-03 09:50:01.668423','关于开展2017年吉林大学朝阳校区“建寝强青年，筑梦兴中华”寝室文化节的通知',2,'北区综合办公室','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于开展2017年吉林大学朝阳校区“建寝强青年，筑梦兴中华”寝室文化节的通知&id=4709633&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=北区综合办公室',0,0,100000,0,'',1,2,2),(20,'2017-11-18 09:50:01.678557','2291-09-03 09:50:01.678557','关于仪器设备拟报废处置的公告（2017-11）',2,'实验室与设备管理处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于仪器设备拟报废处置的公告（2017-11）&id=4709720&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=实验室与设备管理处',0,0,100000,0,'',1,2,2),(21,'2017-11-18 09:50:01.691621','2291-09-03 09:50:01.691621','关于网上直播第三届吉林大学“喜庆十九大 共筑中国梦”主题合唱比赛决赛的通知',2,'党委宣传部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于网上直播第三届吉林大学“喜庆十九大 共筑中国梦”主题合唱比赛决赛的通知&id=4711670&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=党委宣传部',0,0,100000,0,'',1,2,2),(22,'2017-11-18 09:50:01.706631','2291-09-03 09:50:01.706631','食品科学与工程学院2017年招聘海外博士启事',2,'食品科学与工程学院','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=食品科学与工程学院2017年招聘海外博士启事&id=4712095&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=食品科学与工程学院',0,0,100000,0,'',1,2,2),(23,'2017-11-18 09:50:01.721703','2291-09-03 09:50:01.721703','关于公布吉林大学2017年就业创业工作研究课题立项结果的通知',2,'学生就业创业指导与服务中心','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于公布吉林大学2017年就业创业工作研究课题立项结果的通知&id=4712440&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=学生就业创业指导与服务中心',0,0,100000,0,'',1,2,2),(24,'2017-11-18 09:50:01.734852','2291-09-03 09:50:01.734852','关于组织我校学生参加“韩国光云大学2018冬季韩语短期交流项目”的通知',2,'国际合作与交流处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于组织我校学生参加“韩国光云大学2018冬季韩语短期交流项目”的通知&id=4712978&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=国际合作与交流处',0,0,100000,0,'',1,2,2),(25,'2017-11-18 09:50:01.743877','2291-09-03 09:50:01.743877','关于做好2017年度部门决算有关工作的通知',2,'财务处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于做好2017年度部门决算有关工作的通知&id=4662215&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=财务处',0,0,100000,0,'',1,2,2),(26,'2017-11-18 09:50:01.756434','2291-09-03 09:50:01.756434','关于编制2018-2019年项目支出规划和2018年单位预算的通知',2,'财务处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于编制2018-2019年项目支出规划和2018年单位预算的通知&id=4565019&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=财务处',0,0,100000,0,'',1,2,2),(27,'2017-11-18 09:50:01.771282','2291-09-03 09:50:01.771282','关于印发《中共吉林大学委员会关于深入学习宣传贯彻党的十九大精神的意见》的通知',2,'党委办公室','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于印发《中共吉林大学委员会关于深入学习宣传贯彻党的十九大精神的意见》的通知&id=4671859&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=党委办公室',0,0,100000,0,'',1,2,2),(28,'2017-11-18 09:50:01.784603','2291-09-03 09:50:01.784603','关于开展2017年度单位银行账户年检及备案工作的通知',2,'财务处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于开展2017年度单位银行账户年检及备案工作的通知&id=4684440&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=财务处',0,0,100000,0,'',1,2,2),(29,'2017-11-18 09:50:01.795595','2291-09-03 09:50:01.795595','关于开展A类代理人员试用期考核及签订岗位聘用合同书的通知',2,'人力资源和社会保障处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于开展A类代理人员试用期考核及签订岗位聘用合同书的通知&id=4668741&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=人力资源和社会保障处',0,0,100000,0,'',1,2,2),(30,'2017-11-18 09:50:01.806625','2291-09-03 09:50:01.806625','关于开展2016年和2017年专业技术职务聘任工作的通知',2,'人力资源和社会保障处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于开展2016年和2017年专业技术职务聘任工作的通知&id=4701310&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=人力资源和社会保障处',0,0,100000,0,'',1,2,2),(31,'2017-11-18 09:50:01.822684','2291-09-03 09:50:01.822684','关于印发《吉林大学教师考核工作实施办法》的通知',2,'人力资源和社会保障处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于印发《吉林大学教师考核工作实施办法》的通知&id=4704983&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=人力资源和社会保障处',0,0,100000,0,'',1,2,2),(32,'2017-11-18 11:48:44.192648','2017-11-19 11:48:44.192648','无图',1,'999','无图',0,35,1,1,'15754310702',1,10,3),(33,'2017-11-19 03:31:54.366256','2291-09-04 03:31:54.366272','关于举办和平校区“纵燃青春 织梦和平”欢迎2017级新生文艺晚会的通知',2,'西区综合办公室','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于举办和平校区“纵燃青春 织梦和平”欢迎2017级新生文艺晚会的通知&id=4716599&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=西区综合办公室',0,0,100000,0,'',1,2,2),(35,'2017-11-19 07:03:52.754978','2017-11-24 07:03:52.754993','猫',1,'999999','猫',1,21,5,2,'chentb2114@mails.jlu.edu.cn',1,10,3),(36,'2017-11-19 07:47:39.763363','2017-11-28 07:47:39.763381','小米MIX2',1,'1999','小米MIX2 99新，2017年9月购入',1,22,9,1,'15506836596',1,10,4),(38,'2017-11-19 09:52:06.176286','2017-11-20 09:52:06.176305','Hello',1,'1','Hello',0,14,1,1,'15754310702',1,10,3),(39,'2017-11-19 13:51:58.889039','2018-01-24 13:51:58.889051','寻找一个苹果',0,'','寻找一个苹果',1,8,66,1,'15754310968',1,7,5),(40,'2017-11-19 14:04:16.236479','2018-01-24 14:04:16.236495','莫愁前路无知己，天下谁人不识君。',0,'','莫愁前路无知己，天下谁人不识君。',1,8,66,3,'895255299',1,13,5),(41,'2017-11-20 01:32:48.373101','2291-09-05 01:32:48.373116','关于公布2017年度吉林大学“大学生创新创业训练计划”项目评审结果的通知',2,'教务处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于公布2017年度吉林大学“大学生创新创业训练计划”项目评审结果的通知&id=4718361&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=教务处',0,0,100000,0,'',1,2,2),(42,'2017-11-20 01:32:48.377562','2291-09-05 01:32:48.377580','关于对李尚昆等进行考察的预告',2,'党委组织部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于对李尚昆等进行考察的预告&id=4718379&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=党委组织部',0,0,100000,0,'',1,2,2),(43,'2017-11-20 01:32:48.389414','2291-09-05 01:32:48.389432','关于对陈晋市等进行考察的预告',2,'党委组织部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于对陈晋市等进行考察的预告&id=4718401&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=党委组织部',0,0,100000,0,'',1,2,2),(44,'2017-11-20 03:05:45.740469','2291-09-05 03:05:45.740481','关于参加吉林省2018年全国硕士研究生招生考试自命题保密教育暨考务工作培训会的通知',2,'招生办公室','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于参加吉林省2018年全国硕士研究生招生考试自命题保密教育暨考务工作培训会的通知&id=4720767&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=招生办公室',0,0,100000,0,'',1,2,2),(45,'2017-11-20 03:05:45.745677','2291-09-05 03:05:45.745693','关于吉林大学网络实验建设项目结题及检查的通知',2,'教务处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于吉林大学网络实验建设项目结题及检查的通知&id=4720966&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=教务处',0,0,100000,0,'',1,2,2),(46,'2017-11-20 03:05:45.760899','2291-09-05 03:05:45.760914','关于召开中央宣讲团党的十九大精神宣讲报告会 的通知',2,'党委宣传部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于召开中央宣讲团党的十九大精神宣讲报告会 的通知&id=4720256&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=党委宣传部',0,0,100000,0,'',1,2,2),(47,'2017-11-20 04:19:04.716731','2291-09-05 04:19:04.716751','关于为我校计划内博士后落实新增待遇有关情况的说明',2,'人力资源和社会保障处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于为我校计划内博士后落实新增待遇有关情况的说明&id=4721467&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=人力资源和社会保障处',0,0,100000,0,'',1,2,2),(48,'2017-11-20 05:16:09.097587','2291-09-05 05:16:09.097618','2017年度“友利银行奖学金”获奖学生名单公示',2,'学生工作部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=2017年度“友利银行奖学金”获奖学生名单公示&id=4719701&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=学生工作部',0,0,100000,0,'',1,2,2),(49,'2017-11-20 05:16:09.111349','2291-09-05 05:16:09.111367','关于组织学生参加中央宣讲团集中宣讲活动的通知',2,'学生工作部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于组织学生参加中央宣讲团集中宣讲活动的通知&id=4721782&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=学生工作部',0,0,100000,0,'',1,2,2),(50,'2017-11-20 07:12:49.196410','2291-09-05 07:12:49.196430','关于组织学生参加中央宣讲团党的十九大精神宣讲报告会的通知',2,'学生工作部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于组织学生参加中央宣讲团党的十九大精神宣讲报告会的通知&id=4721782&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=学生工作部',0,0,100000,0,'',1,2,2),(51,'2017-11-20 07:12:49.203164','2291-09-05 07:12:49.203185','关于公示吉林大学基本科研业务费哲学社会科学研究思想政治工作专项立项名单的通知',2,'学生工作部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于公示吉林大学基本科研业务费哲学社会科学研究思想政治工作专项立项名单的通知&id=4723407&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=学生工作部',0,0,100000,0,'',1,2,2),(52,'2017-11-20 07:12:49.208941','2291-09-05 07:12:49.208960','关于召开“双一流”学科建设方案答辩会的通知',2,'发展规划处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于召开“双一流”学科建设方案答辩会的通知&id=4723421&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=发展规划处',0,0,100000,0,'',1,2,2),(53,'2017-11-20 07:12:49.216960','2291-09-05 07:12:49.216980','关于印发《吉林大学2017年今冬明春火灾防控工作方案》的通知',2,'保卫处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于印发《吉林大学2017年今冬明春火灾防控工作方案》的通知&id=4724165&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=保卫处',0,0,100000,0,'',1,2,2),(54,'2017-11-20 07:12:49.221838','2291-09-05 07:12:49.221857','关于开展2017年吉林省教育厅人文社会科学研究项目验收工作的通知',2,'社会科学处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于开展2017年吉林省教育厅人文社会科学研究项目验收工作的通知&id=4724122&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=社会科学处',0,0,100000,0,'',1,2,2),(55,'2017-11-20 07:31:15.209766','2017-11-24 07:31:15.209838','猫',1,'99999','大图测试',1,2,4,1,'15754310702',1,10,3),(56,'2017-11-20 07:43:16.343251','2291-09-05 07:43:16.343308','关于举办吉林大学2018届毕业生就业创业大市场的通知',2,'学生就业创业指导与服务中心','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于举办吉林大学2018届毕业生就业创业大市场的通知&id=4724601&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=学生就业创业指导与服务中心',0,0,100000,0,'',1,2,2),(57,'2017-11-20 09:24:17.793750','2291-09-05 09:24:17.793776','关于做好入党积极分子信息统计工作的通知',2,'党委组织部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于做好入党积极分子信息统计工作的通知&id=4725024&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=党委组织部',0,0,100000,0,'',1,2,2),(58,'2017-11-20 09:24:17.826869','2291-09-05 09:24:17.826969','关于填报2016年三大检索收录论文信息的通知',2,'科学技术处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于填报2016年三大检索收录论文信息的通知&id=4698221&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=科学技术处',0,0,100000,0,'',1,2,2),(59,'2017-11-21 02:36:59.543175','2291-09-06 02:36:59.543196','关于经营性资产改革和管理办公室（产业党委）网站上线试运行的通告',2,'经营性资产改革和管理办公室','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于经营性资产改革和管理办公室（产业党委）网站上线试运行的通告&id=4727595&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=经营性资产改革和管理办公室',0,0,100000,0,'',1,2,2),(60,'2017-11-21 02:36:59.564248','2291-09-06 02:36:59.564269','关于2016年和2017年专业技术职务聘任工作的补充通知',2,'人力资源和社会保障处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于2016年和2017年专业技术职务聘任工作的补充通知&id=4728116&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=人力资源和社会保障处',0,0,100000,0,'',1,2,2),(61,'2017-11-21 07:41:16.879442','2291-09-06 07:41:16.879475','关于图书馆秋季“信息素养教育课堂”系列讲座之十九的通知——文献管理与辅助论文写作',2,'图书馆','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于图书馆秋季“信息素养教育课堂”系列讲座之十九的通知——文献管理与辅助论文写作&id=4723465&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=图书馆',0,0,100000,0,'',1,2,2),(62,'2017-11-21 07:41:16.895349','2291-09-06 07:41:16.895367','关于公布吉林大学2017年度“博世助学金”获得者的通知',2,'学生工作部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于公布吉林大学2017年度“博世助学金”获得者的通知&id=4729261&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=学生工作部',0,0,100000,0,'',1,2,2),(63,'2017-11-21 07:41:16.900886','2291-09-06 07:41:16.900903','关于2017年12月毕业的博、硕士研究生向图书馆提交学位论文的通知',2,'图书馆','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于2017年12月毕业的博、硕士研究生向图书馆提交学位论文的通知&id=4729591&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=图书馆',0,0,100000,0,'',1,2,2),(64,'2017-11-21 07:41:16.905112','2291-09-06 07:41:16.905128','关于举办“喜庆十九大 青春建新功”系列活动（十二）——吉林大学2017年大学生PPT设计大赛的通知',2,'团委','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于举办“喜庆十九大 青春建新功”系列活动（十二）——吉林大学2017年大学生PPT设计大赛的通知&id=4729685&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=团委',0,0,100000,0,'',1,2,2),(65,'2017-11-21 07:41:16.909893','2291-09-06 07:41:16.909922','关于召开我校科学技术协会第一届委员会第二次会议的通知',2,'科学技术协会秘书处办公室','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于召开我校科学技术协会第一届委员会第二次会议的通知&id=4730698&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=科学技术协会秘书处办公室',0,0,100000,0,'',1,2,2),(66,'2017-11-21 07:41:16.915754','2291-09-06 07:41:16.915775','关于召开放管服改革推进落实工作汇报会通知',2,'发展规划处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于召开放管服改革推进落实工作汇报会通知&id=4731066&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=发展规划处',0,0,100000,0,'',1,2,2),(67,'2017-11-21 07:41:16.922859','2291-09-06 07:41:16.922910','关于公布2017年青年骨干教师出国研修项目第二批录取人员名单的通知',2,'人力资源和社会保障处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于公布2017年青年骨干教师出国研修项目第二批录取人员名单的通知&id=4731112&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=人力资源和社会保障处',0,0,100000,0,'',1,2,2),(68,'2017-11-21 08:26:42.271414','2291-09-06 08:26:42.271423','关于举办第十七期“心理百科半月谈”暨《大学生心理健康》慕课助教工作研讨会的通知',2,'学生心理健康指导中心','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于举办第十七期“心理百科半月谈”暨《大学生心理健康》慕课助教工作研讨会的通知&id=4731789&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=学生心理健康指导中心',0,0,100000,0,'',1,2,2),(69,'2017-11-21 08:26:42.279313','2291-09-06 08:26:42.279323','关于中国翻译协会语言服务创业创新中心LSCAT考试报名通知',2,'注册与考试中心','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于中国翻译协会语言服务创业创新中心LSCAT考试报名通知&id=4731929&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=注册与考试中心',0,0,100000,0,'',1,2,2),(70,'2017-11-21 08:26:42.286265','2291-09-06 08:26:42.286272','关于查询2017年9月全国英语等级考试（PETS1-4级）成绩的通知',2,'注册与考试中心','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于查询2017年9月全国英语等级考试（PETS1-4级）成绩的通知&id=4732197&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=注册与考试中心',0,0,100000,0,'',1,2,2),(71,'2017-11-21 08:26:42.293576','2291-09-06 08:26:42.293586','关于推进吉林大学第三批在线课程建设项目应用及做好第四批在线课程建设工作的通知',2,'教务处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于推进吉林大学第三批在线课程建设项目应用及做好第四批在线课程建设工作的通知&id=4732279&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=教务处',0,0,100000,0,'',1,2,2),(72,'2017-11-21 08:26:42.300528','2291-09-06 08:26:42.300536','关于查询2017年下半年剑桥商务英语证书考试（BEC）初级准考证的通知',2,'注册与考试中心','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于查询2017年下半年剑桥商务英语证书考试（BEC）初级准考证的通知&id=4732288&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=注册与考试中心',0,0,100000,0,'',1,2,2),(73,'2017-11-21 09:27:30.184790','2291-09-06 09:27:30.184802','关于举办第六届大学生廉洁文化知识竞赛决赛的通知',2,'学生工作部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于举办第六届大学生廉洁文化知识竞赛决赛的通知&id=4732583&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=学生工作部',0,0,100000,0,'',1,2,2),(74,'2017-11-21 09:27:30.192887','2291-09-06 09:27:30.192900','关于召开“双一流”学科建设方案答辩会的补充通知',2,'发展规划处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于召开“双一流”学科建设方案答辩会的补充通知&id=4732752&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=发展规划处',0,0,100000,0,'',1,2,2),(75,'2017-11-21 09:27:30.201244','2291-09-06 09:27:30.201255','关于公布第十六届台湾学生“北国风情”冬令营志愿者名单的通知',2,'国际合作与交流处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于公布第十六届台湾学生“北国风情”冬令营志愿者名单的通知&id=4732994&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=国际合作与交流处',0,0,100000,0,'',1,2,2),(76,'2017-11-29 09:16:01.068923','2291-09-14 09:16:01.068956','关于举办“迪瑞杯”吉林大学朝阳校区大学生商业创意大赛的通知',2,'北区综合办公室','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于举办“迪瑞杯”吉林大学朝阳校区大学生商业创意大赛的通知&id=4768643&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=北区综合办公室',0,0,100000,0,'',1,2,2),(77,'2017-11-29 09:16:01.082092','2291-09-14 09:16:01.082117','关于举行国际学生与中国家庭第三期对接会的通知',2,'国际教育学院','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于举行国际学生与中国家庭第三期对接会的通知&id=4768971&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=国际教育学院',0,0,100000,0,'',1,2,2),(78,'2017-11-29 09:16:01.093930','2291-09-14 09:16:01.093947','转发《关于2017年度国家自然科学基金委员会与金砖国家科技和创新框架计划合作研究项目 受理日期...',2,'科学技术处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=转发《关于2017年度国家自然科学基金委员会与金砖国家科技和创新框架计划合作研究项目 受理日期延期的通知》&id=4771149&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=科学技术处',0,0,100000,0,'',1,2,2),(79,'2017-11-29 09:16:01.104830','2291-09-14 09:16:01.104848','关于前卫南区因管道更换导致部分楼舍停水的通知',2,'后勤服务集团','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于前卫南区因管道更换导致部分楼舍停水的通知&id=4771371&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=后勤服务集团',0,0,100000,0,'',1,2,2),(80,'2017-11-29 09:16:01.115158','2291-09-14 09:16:01.115171','关于公示2017年研究生“海拉奖学金”获奖名单的通知',2,'研究生院','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于公示2017年研究生“海拉奖学金”获奖名单的通知&id=4771443&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=研究生院',0,0,100000,0,'',1,2,2),(81,'2017-11-29 09:16:01.124813','2291-09-14 09:16:01.124826','关于表彰2017年度“博世奖学金”获得者的决定',2,'学生工作部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于表彰2017年度“博世奖学金”获得者的决定&id=4771459&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=学生工作部',0,0,100000,0,'',1,2,2),(82,'2017-11-29 09:16:01.134708','2291-09-14 09:16:01.134721','关于表彰2017年度“友利银行奖学金”获得者的决定',2,'学生工作部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于表彰2017年度“友利银行奖学金”获得者的决定&id=4771501&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=学生工作部',0,0,100000,0,'',1,2,2),(83,'2017-11-29 09:16:01.143700','2291-09-14 09:16:01.143713','吉林大学2017年度“海拉奖学金”获奖学生名单公示',2,'学生工作部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=吉林大学2017年度“海拉奖学金”获奖学生名单公示&id=4771678&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=学生工作部',0,0,100000,0,'',1,2,2),(84,'2017-11-29 09:16:01.153243','2291-09-14 09:16:01.153267','转发吉林省科技厅关于推荐2017年下半年省级科技特派员的通知',2,'科学技术处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=转发吉林省科技厅关于推荐2017年下半年省级科技特派员的通知&id=4771690&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=科学技术处',0,0,100000,0,'',1,2,2),(85,'2017-11-29 09:16:01.163710','2291-09-14 09:16:01.163733','2017年11月研究生校园地国家助学贷款催缴工作通知',2,'研究生院','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=2017年11月研究生校园地国家助学贷款催缴工作通知&id=4772099&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=研究生院',0,0,100000,0,'',1,2,2),(86,'2017-11-29 09:16:01.185712','2291-09-14 09:16:01.185738','关于公布2017年“两学一做”学习教育支部风采展示活动评审结果的通知',2,'党委组织部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于公布2017年“两学一做”学习教育支部风采展示活动评审结果的通知&id=4772472&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=党委组织部',0,0,100000,0,'',1,2,2),(87,'2017-11-29 09:16:01.198324','2291-09-14 09:16:01.198348','吉林大学2017年度富德奖学金获奖公示',2,'校友联络和教育基金管理处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=吉林大学2017年度富德奖学金获奖公示&id=4773203&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=校友联络和教育基金管理处',0,0,100000,0,'',1,2,2),(88,'2017-11-29 09:16:01.210320','2291-09-14 09:16:01.210344','吉林大学2017年度李四光地学奖学金、优秀青年教师奖获奖公示',2,'校友联络和教育基金管理处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=吉林大学2017年度李四光地学奖学金、优秀青年教师奖获奖公示&id=4773208&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=校友联络和教育基金管理处',0,0,100000,0,'',1,2,2),(89,'2017-11-29 09:16:01.222937','2291-09-14 09:16:01.222962','关于第三十三期学生入党积极分子培训班结业考试的通知',2,'党委组织部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于第三十三期学生入党积极分子培训班结业考试的通知&id=4773420&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=党委组织部',0,0,100000,0,'',1,2,2),(90,'2017-11-29 09:16:01.234862','2291-09-14 09:16:01.234894','关于发放2017年9月全国计算机等级考试证书的通知',2,'注册与考试中心','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于发放2017年9月全国计算机等级考试证书的通知&id=4773472&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=注册与考试中心',0,0,100000,0,'',1,2,2),(91,'2017-11-29 09:16:01.246619','2291-09-14 09:16:01.246643','发布关于2018年青岛市源头创新计划应用基础研究项目申报指南的通知',2,'科技开发中心','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=发布关于2018年青岛市源头创新计划应用基础研究项目申报指南的通知&id=4773923&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=科技开发中心',0,0,100000,0,'',1,2,2),(92,'2017-11-29 09:16:01.275647','2291-09-14 09:16:01.275669','吉林大学2017年新疆籍少数民族学生专职辅导员招聘公告',2,'学生工作部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=吉林大学2017年新疆籍少数民族学生专职辅导员招聘公告&id=4739293&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=学生工作部',0,0,100000,0,'',1,2,2),(93,'2017-11-29 09:16:01.288125','2291-09-14 09:16:01.288149','吉林大学2017年本科生专职辅导员招聘公告',2,'学生工作部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=吉林大学2017年本科生专职辅导员招聘公告&id=4739180&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=学生工作部',0,0,100000,0,'',1,2,2),(94,'2017-11-29 09:16:01.299878','2291-09-14 09:16:01.299903','关于组织2018年海外人才招聘会的通知',2,'人才工作办公室','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于组织2018年海外人才招聘会的通知&id=4749286&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=人才工作办公室',0,0,100000,0,'',1,2,2),(95,'2017-11-29 09:16:01.311790','2291-09-14 09:16:01.311814','关于开展国家“千人计划”入选专家到岗情况调研督查工作的通知',2,'人才工作办公室','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于开展国家“千人计划”入选专家到岗情况调研督查工作的通知&id=4752879&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=人才工作办公室',0,0,100000,0,'',1,2,2),(96,'2017-11-29 09:16:01.324313','2291-09-14 09:16:01.324337','关于开展2017年度聘期内长江学者到岗时间核查的通知',2,'人才工作办公室','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于开展2017年度聘期内长江学者到岗时间核查的通知&id=4750338&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=人才工作办公室',0,0,100000,0,'',1,2,2),(97,'2017-11-29 09:16:01.336725','2291-09-14 09:16:01.336749','关于成立“吉林大学黄大年精神研究会”的通知',2,'党委宣传部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于成立“吉林大学黄大年精神研究会”的通知&id=4759104&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=党委宣传部',0,0,100000,0,'',1,2,2),(98,'2017-11-29 09:16:01.349167','2291-09-14 09:16:01.349198','关于开展慰问困难教职工活动的通知',2,'教育工会','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于开展慰问困难教职工活动的通知&id=4747636&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=教育工会',0,0,100000,0,'',1,2,2),(99,'2017-11-29 09:16:01.361195','2291-09-14 09:16:01.361219','关于召开学校网站群管理人员培训会的通知',2,'大数据和网络管理中心','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于召开学校网站群管理人员培训会的通知&id=4763455&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=大数据和网络管理中心',0,0,100000,0,'',1,2,2),(100,'2017-11-29 09:16:01.373890','2291-09-14 09:16:01.373913','关于2016年和2017年专业技术职务聘任工作申报表格填写及系统填报要求的通知',2,'人力资源和社会保障处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于2016年和2017年专业技术职务聘任工作申报表格填写及系统填报要求的通知&id=4768694&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=人力资源和社会保障处',0,0,100000,0,'',1,2,2),(101,'2017-11-29 09:16:01.386572','2291-09-14 09:16:01.386600','吉林大学工业技术研究总院拟聘B类人事代理人员公示',2,'科技开发中心','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=吉林大学工业技术研究总院拟聘B类人事代理人员公示&id=4763311&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=科技开发中心',0,0,100000,0,'',1,2,2),(102,'2017-11-29 09:16:01.400170','2291-09-14 09:16:01.400193','关于报送校部机关机构工作职责的通知',2,'人力资源和社会保障处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于报送校部机关机构工作职责的通知&id=4768778&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=人力资源和社会保障处',0,0,100000,0,'',1,2,2);
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
INSERT INTO `public_university` VALUES (1,'吉林大学','吉林省','长春市',3),(2,'东北师大','吉林省','长春市',0),(3,'长春理工大学','吉林省','长春市',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_userdetail`
--

LOCK TABLES `public_userdetail` WRITE;
/*!40000 ALTER TABLE `public_userdetail` DISABLE KEYS */;
INSERT INTO `public_userdetail` VALUES (1,'',0,'',1,1),(2,NULL,0,NULL,1,2),(3,'',1,'',1,3),(4,'',1,'',1,4),(5,'21141625',1,'陈佳楠',1,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_userphonenum`
--

LOCK TABLES `public_userphonenum` WRITE;
/*!40000 ALTER TABLE `public_userphonenum` DISABLE KEYS */;
INSERT INTO `public_userphonenum` VALUES (1,'',3),(2,'15554986532',4),(3,'15754310968',5);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_userqq`
--

LOCK TABLES `public_userqq` WRITE;
/*!40000 ALTER TABLE `public_userqq` DISABLE KEYS */;
INSERT INTO `public_userqq` VALUES (1,'2440734460',3),(2,'',4),(3,'895255299',5);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_userwechat`
--

LOCK TABLES `public_userwechat` WRITE;
/*!40000 ALTER TABLE `public_userwechat` DISABLE KEYS */;
INSERT INTO `public_userwechat` VALUES (1,'',3),(2,'lifemiss',4),(3,'',5);
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

-- Dump completed on 2017-11-29 18:39:51
