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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_passwordverify`
--

LOCK TABLES `account_passwordverify` WRITE;
/*!40000 ALTER TABLE `account_passwordverify` DISABLE KEYS */;
INSERT INTO `account_passwordverify` VALUES (2,'2440734460@qq.com','R3WYAP','2017-11-17 10:40:13.421944');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_regverify`
--

LOCK TABLES `account_regverify` WRITE;
/*!40000 ALTER TABLE `account_regverify` DISABLE KEYS */;
INSERT INTO `account_regverify` VALUES (2,'chentb2114@mails.jlu.edu.cn','OJTOQF','2017-11-15 10:38:48.757218'),(3,'liuxz2114@mails.jlu.edu.cn','QNPZSB','2017-11-15 10:39:24.381504'),(4,'tongliu2114@mails.jlu.edu.cn','SS6D0J','2017-11-15 10:40:31.971082'),(5,'pangzy2114@mails.jlu.edu.cn','MTEL3C','2017-11-15 10:40:42.397650');
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
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add category',7,'add_category'),(20,'Can change category',7,'change_category'),(21,'Can delete category',7,'delete_category'),(22,'Can add forumpost',8,'add_forumpost'),(23,'Can change forumpost',8,'change_forumpost'),(24,'Can delete forumpost',8,'delete_forumpost'),(25,'Can add log',9,'add_log'),(26,'Can change log',9,'change_log'),(27,'Can delete log',9,'delete_log'),(28,'Can add picture',10,'add_picture'),(29,'Can change picture',10,'change_picture'),(30,'Can delete picture',10,'delete_picture'),(31,'Can add post',11,'add_post'),(32,'Can change post',11,'change_post'),(33,'Can delete post',11,'delete_post'),(34,'Can add university',12,'add_university'),(35,'Can change university',12,'change_university'),(36,'Can delete university',12,'delete_university'),(37,'Can add userdetail',13,'add_userdetail'),(38,'Can change userdetail',13,'change_userdetail'),(39,'Can delete userdetail',13,'delete_userdetail'),(40,'Can add useremail',14,'add_useremail'),(41,'Can change useremail',14,'change_useremail'),(42,'Can delete useremail',14,'delete_useremail'),(43,'Can add userlikepost',15,'add_userlikepost'),(44,'Can change userlikepost',15,'change_userlikepost'),(45,'Can delete userlikepost',15,'delete_userlikepost'),(46,'Can add userphonenum',16,'add_userphonenum'),(47,'Can change userphonenum',16,'change_userphonenum'),(48,'Can delete userphonenum',16,'delete_userphonenum'),(49,'Can add userqq',17,'add_userqq'),(50,'Can change userqq',17,'change_userqq'),(51,'Can delete userqq',17,'delete_userqq'),(52,'Can add userwechat',18,'add_userwechat'),(53,'Can change userwechat',18,'change_userwechat'),(54,'Can delete userwechat',18,'delete_userwechat'),(55,'Can add password verify',19,'add_passwordverify'),(56,'Can change password verify',19,'change_passwordverify'),(57,'Can delete password verify',19,'delete_passwordverify'),(58,'Can add reg verify',20,'add_regverify'),(59,'Can change reg verify',20,'change_regverify'),(60,'Can delete reg verify',20,'delete_regverify');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$UHM9OBm95Rci$tdb66++LNhoXu5/xwu6Fye3lNlxkUDF/K9Q4G9W+4TM=','2017-11-18 01:13:56.738199',0,'ctbsky','','','2440734460@qq.com',0,1,'2017-11-14 11:05:38.599120'),(3,'pbkdf2_sha256$36000$rnXNLaWYLYUg$Rn0aBWC2rg9XiPhcJYSUBuqhjmiz5l8vIDQUz1DxxCk=','2017-11-15 08:36:28.865844',1,'skyhunter','','','skyhunter@qq.com',1,1,'2017-11-15 08:36:10.088101'),(4,'pbkdf2_sha256$36000$WH1K47P5TxLi$0MUXhqiHPZ8UKz8F5st/Ygl+GCgm5MJKKBHxVlBuEc0=',NULL,0,'jlu_administer','','','administer@jlu.edu.cn',0,1,'2017-11-15 08:39:11.196441'),(5,'pbkdf2_sha256$36000$Ar946Auml4mX$Q9Ug4w50QP0V1SadJiLpxYKJ6Kvhk97VYodN51DA44E=','2017-11-15 11:05:38.702269',0,'陈天霸123','','','chentb2114@mails.jlu.edu.cn',0,1,'2017-11-15 10:36:11.910859'),(6,'pbkdf2_sha256$36000$yvPrO2kl1JV7$TKpedZkBjDYCo/hXlkRyHJmeW2dXIaQQT7dfws8nqqQ=','2017-11-15 10:37:02.976789',0,'lxz123','','','liuxz2114@mails.jlu.edu.cn',0,1,'2017-11-15 10:37:02.920065'),(7,'pbkdf2_sha256$36000$XhcB578143EB$SRlO1kO/4Sv9UPZu2pnJzEH29ywBsjia+CLPloHJbOU=','2017-11-17 15:49:09.545099',0,'atong','','','tongliu2114@mails.jlu.edu.cn',0,1,'2017-11-15 10:37:57.722480'),(8,'pbkdf2_sha256$36000$CoeHJmCiqUrU$WDFxEASYE3TONlBBP2BnSbBxaIY4zja0aQLTptxkGp8=','2017-11-15 11:05:26.716999',0,'zypang','','','pangzy2114@mails.jlu.edu.cn',0,1,'2017-11-15 10:38:15.800505');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-11-15 08:37:27.620196','2','jlu_administer',3,'',4,3);
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
INSERT INTO `django_content_type` VALUES (19,'account','passwordverify'),(20,'account','regverify'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'public','category'),(8,'public','forumpost'),(9,'public','log'),(10,'public','picture'),(11,'public','post'),(12,'public','university'),(13,'public','userdetail'),(14,'public','useremail'),(15,'public','userlikepost'),(16,'public','userphonenum'),(17,'public','userqq'),(18,'public','userwechat'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'account','0001_initial','2017-11-14 11:04:55.309006'),(2,'contenttypes','0001_initial','2017-11-14 11:04:55.390054'),(3,'auth','0001_initial','2017-11-14 11:04:56.694688'),(4,'admin','0001_initial','2017-11-14 11:04:56.965090'),(5,'admin','0002_logentry_remove_auto_add','2017-11-14 11:04:56.978156'),(6,'contenttypes','0002_remove_content_type_name','2017-11-14 11:04:57.186991'),(7,'auth','0002_alter_permission_name_max_length','2017-11-14 11:04:57.295243'),(8,'auth','0003_alter_user_email_max_length','2017-11-14 11:04:57.435647'),(9,'auth','0004_alter_user_username_opts','2017-11-14 11:04:57.447675'),(10,'auth','0005_alter_user_last_login_null','2017-11-14 11:04:57.570899'),(11,'auth','0006_require_contenttypes_0002','2017-11-14 11:04:57.576914'),(12,'auth','0007_alter_validators_add_error_messages','2017-11-14 11:04:57.589950'),(13,'auth','0008_alter_user_username_max_length','2017-11-14 11:04:57.698365'),(14,'public','0001_initial','2017-11-14 11:05:00.753864'),(15,'sessions','0001_initial','2017-11-14 11:05:00.850579'),(16,'public','0002_auto_20171116_2241','2017-11-16 14:41:41.766038');
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
INSERT INTO `django_session` VALUES ('056nnaz2bdoz5fvnouzpxr4hnc4qtkct','YzRhMGU3NDM1MThmMDA5NTlmNzQxNGYwNzE1OWVjMDVmYzYzNWIyODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMTdkMWI3Mzc0NGQxNzZiNTBjODk1NDdlMGNlYzI3Y2Q5Njg2MjAyIn0=','2017-11-28 12:03:34.863542'),('0j4v6ckt2beek3f571agbj6xkk1g7inb','YzRhMGU3NDM1MThmMDA5NTlmNzQxNGYwNzE1OWVjMDVmYzYzNWIyODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMTdkMWI3Mzc0NGQxNzZiNTBjODk1NDdlMGNlYzI3Y2Q5Njg2MjAyIn0=','2017-11-30 13:20:54.521264'),('27ng8pv0bb9komnax1wblq89q4bol1i3','YzRhMGU3NDM1MThmMDA5NTlmNzQxNGYwNzE1OWVjMDVmYzYzNWIyODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMTdkMWI3Mzc0NGQxNzZiNTBjODk1NDdlMGNlYzI3Y2Q5Njg2MjAyIn0=','2017-11-29 00:07:15.737254'),('2vmnqxbwj92zq7sgjro5kfog8s5dxq14','YzRhMGU3NDM1MThmMDA5NTlmNzQxNGYwNzE1OWVjMDVmYzYzNWIyODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMTdkMWI3Mzc0NGQxNzZiNTBjODk1NDdlMGNlYzI3Y2Q5Njg2MjAyIn0=','2017-11-29 04:53:58.120351'),('3cf9fm6o5ule2qogjb0uv05mlreesheq','N2YwNWJiN2NhNGRkMWQ4ZmQwYjUyOGIxZTU0ZjE4ZmExZjg1OWQwODp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNjE5OWJkZDA2N2ZlYzc1NjQwM2YzNzQ3NjBlN2YyMTFlNjk5Yjk3In0=','2017-12-01 15:49:09.563864'),('56t6ker5yq6wjc9jpwltdfds0apenakf','YzRhMGU3NDM1MThmMDA5NTlmNzQxNGYwNzE1OWVjMDVmYzYzNWIyODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMTdkMWI3Mzc0NGQxNzZiNTBjODk1NDdlMGNlYzI3Y2Q5Njg2MjAyIn0=','2017-11-29 01:10:19.164213'),('akbev0fn5oimfrqns38a4235p87qq67x','YzRhMGU3NDM1MThmMDA5NTlmNzQxNGYwNzE1OWVjMDVmYzYzNWIyODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMTdkMWI3Mzc0NGQxNzZiNTBjODk1NDdlMGNlYzI3Y2Q5Njg2MjAyIn0=','2017-12-01 09:43:33.637061'),('axpoazuz6ykmm3r6rjant54bakw6o0in','YzRhMGU3NDM1MThmMDA5NTlmNzQxNGYwNzE1OWVjMDVmYzYzNWIyODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMTdkMWI3Mzc0NGQxNzZiNTBjODk1NDdlMGNlYzI3Y2Q5Njg2MjAyIn0=','2017-11-29 01:10:45.016907'),('dqwyg2ddthqcm8j487hno9htmn1hwv6u','YzRhMGU3NDM1MThmMDA5NTlmNzQxNGYwNzE1OWVjMDVmYzYzNWIyODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMTdkMWI3Mzc0NGQxNzZiNTBjODk1NDdlMGNlYzI3Y2Q5Njg2MjAyIn0=','2017-11-29 04:31:44.556235'),('fc77xe1m9ujnfsqju5750b308l65d02o','YzRhMGU3NDM1MThmMDA5NTlmNzQxNGYwNzE1OWVjMDVmYzYzNWIyODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMTdkMWI3Mzc0NGQxNzZiNTBjODk1NDdlMGNlYzI3Y2Q5Njg2MjAyIn0=','2017-11-29 01:23:46.011409'),('h4i13tpw96ccyncptmail4ui922ihats','ZDc2ZDdmN2NkOTNiZTJkOWM3M2FlZmYyMmVmMDQ4ZGNjZWYxYmEzYjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImYxN2QxYjczNzQ0ZDE3NmI1MGM4OTU0N2UwY2VjMjdjZDk2ODYyMDIifQ==','2017-11-28 11:58:41.306010'),('hmli7mmhnyb4ovlzvcscdgjg0eyo4tgi','OGVjNjkzOTRkYjE1ZTk4ZTEyYzFlMzRmMmRiYzZjMWYzZWVmZjVmMzp7Il9hdXRoX3VzZXJfaWQiOiI4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZTVmNWExYWRjNDRlZDk1ZWY1MTAwZGJjM2Q0ZWYzZDU3NDJjNmMzIn0=','2017-11-29 11:05:26.729386'),('hqqe6acuhwu6oeksxkybdmiw7d83ho3s','YjdhMGI4YzJiYmUxM2RiOGU1YmJjMDJiZTUyZjY2YTA3MTJjYmNhNTp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNmQyY2Y3YmQzNTVkMTkzN2JhOWFiNGUzNGYxNTk5MTY5YTFiZGEzIn0=','2017-11-29 10:37:02.985575'),('ks43wfhwjfgxl77261b69pnfhhiv3kqh','YzRhMGU3NDM1MThmMDA5NTlmNzQxNGYwNzE1OWVjMDVmYzYzNWIyODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMTdkMWI3Mzc0NGQxNzZiNTBjODk1NDdlMGNlYzI3Y2Q5Njg2MjAyIn0=','2017-11-29 04:39:48.157019'),('ksd3xturqihgzd6asu5s86xztkgtcoen','N2YwNWJiN2NhNGRkMWQ4ZmQwYjUyOGIxZTU0ZjE4ZmExZjg1OWQwODp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNjE5OWJkZDA2N2ZlYzc1NjQwM2YzNzQ3NjBlN2YyMTFlNjk5Yjk3In0=','2017-11-29 10:37:57.800606'),('lmb9anolceiyt1verhakd0907mnm0uu4','ZTUyMjU1MzM2ODdmNDAxZGQwODlmZGI1ZmFkZGY2NWNiNjczMWQ3Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiM2ViNjZmODcyYjMxYmNjYzE3YjJiYzNkMWQ0MmY2MGExNmQ5OWIyIn0=','2017-12-01 12:00:35.001450'),('lwzkd5v3xw5864xfgo2c8spf1ogvoev1','YzRhMGU3NDM1MThmMDA5NTlmNzQxNGYwNzE1OWVjMDVmYzYzNWIyODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMTdkMWI3Mzc0NGQxNzZiNTBjODk1NDdlMGNlYzI3Y2Q5Njg2MjAyIn0=','2017-11-30 14:23:08.233799'),('m11iy1ukk44e6u32smtsfl01hthtx8t2','YzRhMGU3NDM1MThmMDA5NTlmNzQxNGYwNzE1OWVjMDVmYzYzNWIyODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMTdkMWI3Mzc0NGQxNzZiNTBjODk1NDdlMGNlYzI3Y2Q5Njg2MjAyIn0=','2017-11-29 04:51:56.897291'),('p0vphsqrn0311ae8z604j2krw0x86ui3','YzRhMGU3NDM1MThmMDA5NTlmNzQxNGYwNzE1OWVjMDVmYzYzNWIyODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMTdkMWI3Mzc0NGQxNzZiNTBjODk1NDdlMGNlYzI3Y2Q5Njg2MjAyIn0=','2017-11-29 02:21:24.153597'),('r2rtdo5j0w2lkg9vfkikcn7rjhix5wo1','MWM2YzExOGMzMmZhNGU1YTc4ZTQ1OWFlNmM4MDUxMGNlZjk3NjA5Njp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjOTQ1YTkxMTAyYmI0MGFlOTQyZTc0ODdlZDdhYmZmM2NiMDBkZTBjIn0=','2017-11-29 10:36:12.092198'),('rgl5n4lzlna1kbtsf803a3q5uyenuoxy','OGVjNjkzOTRkYjE1ZTk4ZTEyYzFlMzRmMmRiYzZjMWYzZWVmZjVmMzp7Il9hdXRoX3VzZXJfaWQiOiI4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZTVmNWExYWRjNDRlZDk1ZWY1MTAwZGJjM2Q0ZWYzZDU3NDJjNmMzIn0=','2017-11-29 10:38:15.871992'),('sh1ptdbukx1eibvpdd7svunzl1zxjv56','YzRhMGU3NDM1MThmMDA5NTlmNzQxNGYwNzE1OWVjMDVmYzYzNWIyODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMTdkMWI3Mzc0NGQxNzZiNTBjODk1NDdlMGNlYzI3Y2Q5Njg2MjAyIn0=','2017-12-01 05:30:22.618199'),('tn4vlix0cf0ayzf1esqgupvjao8vtxlk','MWM2YzExOGMzMmZhNGU1YTc4ZTQ1OWFlNmM4MDUxMGNlZjk3NjA5Njp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjOTQ1YTkxMTAyYmI0MGFlOTQyZTc0ODdlZDdhYmZmM2NiMDBkZTBjIn0=','2017-11-29 11:05:38.713477'),('uj6x49md7k3s18loxhoqara8e3p423rj','ZTUyMjU1MzM2ODdmNDAxZGQwODlmZGI1ZmFkZGY2NWNiNjczMWQ3Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiM2ViNjZmODcyYjMxYmNjYzE3YjJiYzNkMWQ0MmY2MGExNmQ5OWIyIn0=','2017-12-01 11:40:39.401934'),('ulywm2zcbble5axhont2qlvfsjuwlcns','YzRhMGU3NDM1MThmMDA5NTlmNzQxNGYwNzE1OWVjMDVmYzYzNWIyODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMTdkMWI3Mzc0NGQxNzZiNTBjODk1NDdlMGNlYzI3Y2Q5Njg2MjAyIn0=','2017-11-28 12:02:28.276735'),('v0bs1p2jbxwqksu7rdr6kh87bqq0munj','YzRhMGU3NDM1MThmMDA5NTlmNzQxNGYwNzE1OWVjMDVmYzYzNWIyODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMTdkMWI3Mzc0NGQxNzZiNTBjODk1NDdlMGNlYzI3Y2Q5Njg2MjAyIn0=','2017-11-30 14:52:02.928415'),('vysngm1sla0pq8d7h6r75hz8c2p6ohle','YzRhMGU3NDM1MThmMDA5NTlmNzQxNGYwNzE1OWVjMDVmYzYzNWIyODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMTdkMWI3Mzc0NGQxNzZiNTBjODk1NDdlMGNlYzI3Y2Q5Njg2MjAyIn0=','2017-11-29 11:53:10.251384'),('xobzpj1bbr4mznmnihhunzg99cxeo7ra','OGUwMzcyZjhkOGQwYTNjNDhlYjI3NGNiNTExODc2YWVlYWY1ZDU4Yjp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTI4Y2YxMGRmY2I0NmU2ZWQ1YzFiNjRiNGNkMTI1MWQ1MzNlNWY4In0=','2017-11-29 08:36:28.872734');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_category`
--

LOCK TABLES `public_category` WRITE;
/*!40000 ALTER TABLE `public_category` DISABLE KEYS */;
INSERT INTO `public_category` VALUES (1,'通知',0,NULL),(2,'校内通知',0,1),(3,'院系通知',0,1),(4,'社团活动',0,1),(5,'失物招领',0,NULL),(6,'重要证件',0,5),(7,'较大价值',0,5),(8,'普通物件',0,5),(9,'购物',0,NULL),(10,'卖物',0,9),(11,'求购',0,9),(12,'交友',0,NULL),(13,'男寻男',0,12),(14,'女寻男',0,12),(15,'男寻女',0,12),(16,'工作',0,NULL),(17,'全职',0,16),(18,'兼职',0,16),(19,'论坛',1,NULL),(20,'本科生',1,19),(21,'研究生',1,19),(22,'博士生',1,19);
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
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_forumpost`
--

LOCK TABLES `public_forumpost` WRITE;
/*!40000 ALTER TABLE `public_forumpost` DISABLE KEYS */;
INSERT INTO `public_forumpost` VALUES (1,'为什么近千年来人类都没有发生显著的进化？','自有文字记载的历史至今已过千年，为什么人类都没有发生显著的进化？（身高的增长应该不算）按理说，千年的跨度已经不短，而且环境改变之剧烈应该远胜之前，但为何还是没有发生显著的进化现象/特征呢？','2017-11-14 11:16:38.594457',20,NULL,1),(2,NULL,'你看，当你以为翼手龙和霸王龙是同时代的龙时，其实它们足足差了一亿年。\n你看，当你觉得黄帝和汉武帝都是距离我们差不多远的人物时，其实黄帝到汉武帝之间的跨度比汉武帝到\n我们现在的时间跨度都要长了。\n你看，当你看到书本中说，北斗七星不是一成不变的，它是不断变幻位置的时候，你深信不疑。当你打开\n星相图又疑惑了，北斗七星没有变化啊。可是你不知道的是，北斗七星的变化是以万年计的。\n千年，这个词，对每个人来说很长了，甚至对一个家族、一个国家，更乃至于人类社会，都是极为漫长的\n了。可是，从茹毛饮血到开始穿衣，你知道过了多久吗？几万年。\n朝菌不知晦朔，蟪蛄不知春秋。哀吾生之须臾，羡长江之无穷。\n当我们比较时，一定要有参考系。“千年”这个参考系下的变化，是针对的人类社会，如果要针对人类构\n造，万年计也许都没有意义。','2017-11-14 11:18:43.153173',20,1,1),(3,'你们的老师干过什么惊为天人的事情？','加上早晨两位同学迟到，班主任（教生物的，50＋岁）叫出去以后罚跑圈，跑完之后让他们两个背《劝学》......同学不会背，然后班主任流畅的背完秀了同学两脸........\r\n你们老师有什么骚操作？','2017-11-14 11:20:07.804479',20,NULL,1),(4,'有哪些令人拍案叫绝的推理桥段？','有哪些令人拍案叫绝的推理桥段？','2017-11-14 11:21:15.267120',21,NULL,1),(5,NULL,'作者：银闪\n链接：https://www.zhihu.com/question/37248069/answer/73921411\n来源：知乎\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。\n\n没有比平凡的事物更不寻常，更值得研究的了。——福尔摩斯我是一名肾内科医生，肾内科收治的病人大概分为三类：第一，需要透析或已经透析的病人；第二，泌尿系统感染的患者；第三，存在血尿、蛋白尿需明确原因的患者。今天要说的事就是这第三种患者。该患者是一个40多岁的白领，看样子应该是公司中层领导的感觉，入院的原因是因为发现蛋白尿1月，双下肢水肿。这是个肾内科很普通的病，这种情况一般诊治方法是：除外其他可以导致肾脏病变的疾病后，应该行肾穿刺，取一块肾组织进行病理检查明确诊断。但是问题就出在肾穿刺这件事上了。患者在肾穿刺前，我通过抽血检查，发现了一件很严重的事，患者的血小板只有20×10^9个/L（正常是100~300×10^9个/L），这提示患者存在比较严重的出血倾向，别说做肾穿刺，就是呆着不动都有很高的出血风险，可是这个患者半点出血倾向都没有，既没有月经过多、鼻衄，也没有皮下出血，牙龈出血。所以我又给她复查了一次，结果提示血小板只有10×10^9个/L。这种情况都应该输血小板了！但是患者确实没有半点临床表现，不过安全起见，我要去告知患者避免磕碰，防止出血，顺便看看能不能找到血小板减少的原因。可是当我心急火燎的告诉患者这个情况时，她完全是一副无所谓的样子，并且向我保证她绝对不会有事，要求按照计划行肾穿刺，看我很不解，她告诉我她每年都体检，血小板少也有10年了，之前医生也叫她住院检查，她做过一次骨髓穿刺，并没有发现问题，这么多年也没出事，所以她就没再把这事当回事。为了证明自己没胡说，她给我看了她8年的化验单，确实大部分化验单中的血小板都在10-30×10^9个/L这个水平，只有两次例外，例外的那两次，一次是100×10^9个/L，另一次是90×10^9个/L。&lt;img src=\"https://pic2.zhimg.com/50/539e0a637989de389fc4082a666cd419_hd.png\" data-rawwidth=\"539\" data-rawheight=\"300\" class=\"origin_image zh-lightbox-thumb\" width=\"539\" data-original=\"https://pic2.zhimg.com/539e0a637989de389fc4082a666cd419_r.png\"&gt;到目前为止，这个患者主要出现了两个问题，第一个问题是：血小板减少的原因是啥？骨髓穿刺没问题说明骨髓造血功能正常，那么血小板减少的原因就是破坏过多导致的了，有疾病可以引起血小板破坏过多吗？第二个问题是：血小板减少与蛋白尿有关系吗？思考这两个问题后我得出了一个结论：系统性红斑狼疮（SLE）。这是一种比较常见的自身免疫性疾病，其病情可轻可重，轻则几乎没有表现，重则威胁生命。比较容易出现肾脏或血液系统损害，从这点上看，这个患者貌似比较像SLE，但是后面的进一步检查结果却让我大出所料：除了肾脏和血小板的异常，SLE的其他证据全都没有。诊断思路再次陷入僵局，我仔细思索这任何一个细节，企图发现解开这个谜团的线索，在百思不得其解之际，患者那无所谓的样子总是出现在我的脑海里，按常理来说，这么严重的情况，即使再神经大条的患者也会担心，况且这个患者每年体检，说明是一个对自己健康比较重视的人，可是面对如此危险的情况却丝毫不在意，这种情况太反常了。唯一的解释就是她对自己的身体有着十足的自信，自信到相信自己不会因血小板低而出血，这种自信来自于这10年的经历，体检结果提示的血小板少及这10年的健康让她认为她的“血小板减少”是没有问题的。&lt;img src=\"https://pic3.zhimg.com/50/6987618382929583ebe953c3e5839b32_hd.png\" data-rawwidth=\"580\" data-rawheight=\"315\" class=\"origin_image zh-lightbox-thumb\" width=\"580\" data-original=\"https://pic3.zhimg.com/6987618382929583ebe953c3e5839b32_r.png\"&gt;突然，我感觉真的像一道灵光穿过我的头脑一样，也许“血小板减少”的原因确实不是患者的身体出了问题呢？患者10年来体检在同一家医院，为什么有两次是比较高的呢？带着这些问题，我去仔细检索了文献，发现了一个疾病——突然，我感觉真的像一道灵光穿过我的头脑一样，也许“血小板减少”的原因确实不是患者的身体出了问题呢？患者10年来体检在同一家医院，为什么有两次是比较高的呢？带着这些问题，我去仔细检索了文献，发现了一个疾病——EDTA相关假性血小板减少。这里要介绍一下这种疾病的背景？我们知道到医院做检查抽血时是有不同的采血管的，如图&lt;img src=\"https://pic4.zhimg.com/50/6a4e16eefe6d6c5ebc496ada9aff9277_hd.png\" data-rawwidth=\"1166\" data-rawheight=\"875\" class=\"origin_image zh-lightbox-thumb\" width=\"1166\" data-original=\"https://pic4.zhimg.com/6a4e16eefe6d6c5ebc496ada9aff9277_r.png\"&gt;其中查血小板用的就是那个紫色的，是使用EDTA（乙二胺四乙酸）作为抗凝剂的。而有一部分人的血小板是会受EDTA影响发生聚集，导致机器检验时出现血小板减少的误判。其中查血小板用的就是那个紫色的，是使用EDTA（乙二胺四乙酸）作为抗凝剂的。而有一部分人的血小板是会受EDTA影响发生聚集，导致机器检验时出现血小板减少的误判。如果是这样，大概说的通了，接下来就是找出证据，我给患者分别用两个紫帽管和两个蓝帽管留取了血样，跑到检验科去跟检验医师说明了想法，首先同时检查了一个紫帽管和一个蓝帽管的血，结果提示，紫帽管血小板为100×10^9个/L，蓝帽管血小板为280×10^9个/L接下来，我等了半个小时，将另两个管的血进行了检查，结果提示紫帽管血小板下降至20×10^9个/L，而蓝帽管仍为280×10^9个/L。这个结果说明，在紫帽管里的血小板会随时间的延长而减少，也就是说，患者的血小板减少并不是她本身的问题，而是由于身体特质导致的检测方法出现误差。这件事的结局，那个患者顺利的完成了肾穿检查，结果不是SLE，而是膜性肾病。收获最大的是那个检验医师，他以这件事发了篇case，而我最大的收获就是讹了他一顿饭。','2017-11-14 11:22:31.649392',21,4,1),(6,'密度比水大的物体会沉到水底，为什么密度比土地大的物体不会沉到地心呢？','密度比水大的物体会沉到水底，为什么密度比土地大的物体不会沉到地心呢？','2017-11-14 11:23:46.184858',20,NULL,1),(7,NULL,'赞','2017-11-14 11:30:05.779516',20,2,1),(8,NULL,'赞','2017-11-14 11:31:46.774661',20,7,1),(9,NULL,'我竟然无话可说！','2017-11-14 11:32:55.398312',21,5,1),(10,NULL,'what？','2017-11-14 11:33:07.293377',21,5,1),(11,NULL,'pardon?','2017-11-14 11:34:54.511198',21,5,1),(12,NULL,'more one','2017-11-14 11:35:11.602834',21,5,1),(13,NULL,'到此一游','2017-11-14 11:36:02.357530',20,2,1),(14,NULL,'bug？','2017-11-14 11:36:22.475602',21,5,1),(15,NULL,'bug','2017-11-14 11:36:51.892011',20,2,1),(16,NULL,'bug','2017-11-14 11:37:01.830260',21,5,1),(17,'中国潜艇出口迎来井喷式发展，一口气推出三种前卫产品','中国海军的早期潜艇部队，装备的潜艇是从苏联购买的产品以及引进技术而获得的国产型号。随着我们逐步吃透苏联技术，建立起完备的潜艇工业，并形成自己的研发和建造力量，终于有了独立自主的国产潜艇。截至目前，我国已经建立了齐全的，囊括常规潜艇、攻击型核潜艇和弹道导弹核潜艇等多个类别，能够研发建造数代潜艇的工业基础。目前，中国海军使用的大多数潜艇，都是我们自行研制的。','2017-11-15 00:35:11.881228',20,NULL,1),(18,NULL,'赞','2017-11-15 00:41:48.201694',20,17,1),(19,NULL,'赞','2017-11-15 00:41:55.705713',20,18,1),(20,NULL,'赞','2017-11-15 00:42:02.042827',20,19,1),(21,NULL,'赞','2017-11-15 00:44:52.933095',20,20,1),(22,'两伊边境地震已致400余人死亡 家属悲痛欲绝救援工作持续','据报道，伊拉克北部苏莱曼尼亚省与伊朗交界地区11月12日发生强烈地震。据中国地震台网正式测定，地震震级7.8级，震中位于北纬34.9度、东经45.75度，震源深度20千米。','2017-11-15 00:48:09.735669',20,NULL,1),(23,'“雷神”克里斯·海姆斯沃斯露喉结 让你知道什么叫荷尔蒙爆棚','当地时间2017年11月11日，墨西哥，克里斯·海姆斯沃斯出席威士忌品牌活动。','2017-11-15 00:48:40.817066',20,NULL,1),(24,'都市送煤工全是“50后” 每天扛煤上万斤手指染黑','2017年11月6日，山东省济南市，在张庄路街道办事处，30多吨清洁煤运抵没有供暖的居民区，4名运煤工驾驶三轮车分批将居民订购的清洁煤运送到家中。','2017-11-15 00:49:03.012961',20,NULL,1),(25,'延迟退休从哪一年开始实施？','首先，声明一下，现在全部网上的延迟退休时间表，都是假的。\r\n因为，人社部一直没有对外发布过延迟退休时间表。虽然都是假的，但不一定都是错的，因为就那么几种选择，人社部总得选啊，顶多综合一下，呵呵。\r\n\r\n延迟退休是一个十分敏感的话题，随着政务公开的不断进步，这个方案必须要报中央后才能对外公布的，而且还会对外征求意见的，绝对不是暗箱操作直接批准实施。','2017-11-15 00:49:39.144017',20,NULL,1),(26,'美国加州一小学附近发生枪击案 已致4死多伤','当地时间周二（15日）上午8点左右，美国加利福尼亚州北部一小学发生了枪击事件，目前已造成4人死亡、多人受伤，枪手已被警方击毙。据称，枪手在7个不同的地点随机开枪，其中包括一所小学。','2017-11-15 00:51:05.716115',20,NULL,1),(27,'安倍称将把中日关系提升至新阶段 深化交流合作','当地时间14日晚，正在历访亚洲各国的日本首相安倍晋三在菲律宾首都马尼拉举行的记者会上强调，明年将迎来中日和平友好条约缔结40周年，将深化交流，把中日关系提升到一个新阶段。','2017-11-15 00:51:20.815712',20,NULL,1),(28,'欧盟将建\"23国防务联盟\" 弱化美国为首的北约作用','“欧洲的大日子!”德国《明镜》周刊14日报道称，欧盟13日就军事合作达成共识，23个会员国将组防务联盟。防务联盟的成立，或使美国为首的北约组织角色弱化。','2017-11-15 00:51:36.369575',20,NULL,1),(29,'中日对江歌案均有刑事管辖权 中国有属人管辖权','近日，留日学生江歌遇害案因一段视频再次成为舆论关注焦点。根据公开报道，2016年11月3日凌晨，在日本东京中野区，来自山东青岛的中国留学生江歌在其租住的公寓中遇害。中国人民大学法学院副院长时延安告诉《法制日报》记者，针对此案，日本和中国都有刑事管辖权，日本有属地管辖权。','2017-11-15 00:52:05.310161',20,NULL,1),(30,'巴黎女市长被曝挂虚职 曾有意竞选下任法国总统','刚刚被民调评为“法国最具影响力女性第二名”的巴黎市长伊达尔戈，日前突然被爆出“挂虚职、领空饷”丑闻，这让身为社会党重量级人物的她一时间陷入难堪境地。','2017-11-15 00:52:23.237659',20,NULL,1),(31,'4美军士兵在尼日尔牺牲 专家称IS或逃入北非西非','美国《华盛顿邮报》网站11月3日发表题为《4名美国大兵在尼日尔丧生，揭开在非洲对抗“伊斯兰国”组织的影子战争一角》的报道称，不到一年前，“伊斯兰国”在非洲的野心似乎灰飞烟灭了。利比亚民兵组织在美军特种部队和空袭的协助下，把“伊斯兰国”武装分子赶出他们位于苏尔特市的据点。','2017-11-15 00:52:39.633111',20,NULL,1),(32,'中俄大客机或2025年投入运营 优于空客波音飞机','俄媒称，俄罗斯技术公司总裁谢尔盖·切梅佐夫在第15届迪拜国际航空展上透露，中俄宽体客机CR-929的第一阶段工作已经结束，双方将继续合作。新客机理当成为空客350和波音787梦想客机的竞争对手。','2017-11-15 00:52:57.219216',20,NULL,1),(33,'外媒：中国广场舞遍地开花惹争议 官方出手管治','据英国广播公司网站11月14日报道，中国体育总局日前发出通告，要求各级政府进一步规范广场舞，包括禁止在烈士陵园等场所跳舞、所产生噪音不可影响周边学生上课和居民生活等。','2017-11-15 00:53:16.667427',20,NULL,1),(34,'北京今起正式供暖 家中室温\"底线\"必须达到18℃','昨天，三四级的北风呼啸一天，将夜里的低温吹至零下。但好在外面的路途再寒冷，也终有进入家门的暖意融融。从今天开始，北京正式进入供暖季，全市1500余家供暖企业的3300余台锅炉点火率将达100%。也就意味着从今天零时起，居民家中室温的“底线”必须达到18℃。','2017-11-15 00:53:33.419042',20,NULL,1),(35,'官方公布川航航班扰序案件：乘客机舱内喊“有人要劫机”','中新经纬客户端11月15日电 湖南公安厅官方微博“湖南公安在线”15日凌晨公布了川航一航班扰序案件，14日晚， 22岁旅客张某进在航班飞行途中突然指着驾驶舱方向喊“有人要害我，有人要劫机”，航班降落长沙黄花机场后，民警进入机舱将嫌疑人控制，带回调查。经核查，张某进无违法犯罪记录、无吸毒史，且排除近期吸毒嫌疑，其今年曾因感情与工作原因造成精神波动，近期又因结石病入院治疗。','2017-11-15 00:54:25.678922',20,NULL,1),(36,'新一轮强冷空气明起来袭 中东部局地降温超12℃','中新网北京11月15日电 根据最新的气象预报，受强冷空气影响，16日至18日中国自北向南将出现一次大范围大风降温及雨雪天气过程。中东部大部地区气温将下降8～10℃，部分地区降温超过12℃，长江以北大部地区有4～6级偏北风，阵风可达7至8级。','2017-11-15 00:54:50.126497',20,NULL,1),(37,'再有重要职务，十九大后赵克志3次履新','近日，中央政法委主办的中国长安网领导机构栏目更新，其中显示，公安部部长、党委书记赵克志已任中央政法委委员。','2017-11-15 00:55:18.498473',20,NULL,1),(38,'外交部就中方是否加入CPTPP、朝鲜半岛局势等答问','第一，无论是TPP也好，还是新组建的CPTPP也好，都不是APEC框架下的倡议。刚刚在越南结束的APEC会议没有就该倡议进行过讨论，会议发表的成果文件也没有涉及这一倡议。\r\n\r\n第二，APEC领导人会议发表了《岘港宣言》，各方在《宣言》中重申要深入推进区域经济一体化，共同构建和平、稳定、活力、联动和繁荣的亚太命运共同体，还重申要全面系统推进并最终建成亚太自贸区。所有APEC成员都应按照领导人确定的这一目标作出努力。\r\n\r\n第三，在此进程中，应该坚持开放、包容，让各方都有机会平等参与；坚持维护多边贸易体制，遵守WTO规则；坚持合作共赢，让各方都能均衡受益。\r\n\r\n中方愿与亚太地区各方一道，落实领导人确立的目标，为推动区域经济一体化进程，促进亚太和世界经济增长、实现各国互利共赢做出努力。','2017-11-15 00:55:50.550711',20,NULL,1),(39,'男子坐牢五年学偷盗，出狱后做卧底被砍三刀','曾入狱5年的杭州反扒辅警徐中抱即将结婚，其未婚妻去年手机遭偷窃，正是徐中抱帮着寻回来的。\r\n\r\n11月14日，徐中抱告诉每日人物，快出狱时，他就想着公安局“要我就做警察，不要我就反过来做扒手”。但他又想坐牢时没人看得起，出狱后就想做个对社会有用的人，“当时也没有什么懂的，就对偷东西比较懂。”\r\n\r\n徐中抱在狱中偷学狱友的偷窃技巧，出狱后去公安局自告奋勇做卧底，最终成了一名专职反扒辅警。现年五十的徐中抱已专职反扒十年，抓了近500个小偷。','2017-11-15 00:56:19.791905',20,NULL,1),(40,NULL,'赞','2017-11-15 01:18:33.718495',20,39,1),(41,NULL,'赞','2017-11-15 01:18:40.417802',20,40,1),(44,NULL,'Hi','2017-11-15 04:54:08.466978',20,41,1),(45,'天下第一楼','天下第一楼','2017-11-15 10:39:17.765683',20,NULL,5),(46,NULL,'抢沙发','2017-11-15 10:39:36.087223',20,45,5),(47,NULL,'抢沙发','2017-11-15 10:39:49.540829',20,46,5),(48,NULL,'回复 陈天霸123抢沙发','2017-11-15 10:40:03.458077',20,47,5),(49,NULL,'我是大肥桶','2017-11-15 10:40:23.401979',20,47,6),(50,NULL,'我是肥桶','2017-11-15 10:41:00.601419',20,46,6),(51,'HelloHelloHelloHelloHelloHelloHelloHelloHelloHello','HelloHelloHello','2017-11-15 10:48:17.082702',20,NULL,5),(52,NULL,'你好','2017-11-15 10:49:06.718766',20,39,8),(53,NULL,'你好','2017-11-15 10:50:03.054927',20,44,8),(54,NULL,'灌水','2017-11-15 10:50:13.326530',20,45,7),(55,NULL,'hello','2017-11-15 10:50:28.686899',20,53,8),(56,NULL,'到此一游','2017-11-15 10:51:28.037640',20,1,7),(57,NULL,'你好','2017-11-15 10:51:43.006063',20,40,8),(58,NULL,'你好','2017-11-15 10:54:25.472995',20,40,8),(59,NULL,'你好','2017-11-15 10:54:33.945582',20,40,8),(60,NULL,'hi','2017-11-15 10:54:35.477619',20,50,5),(61,'高薪聘找bug的小妹妹','找个善于发现bug的小妹妹 工资一枚范桶','2017-11-15 10:58:54.798172',20,NULL,6),(62,'python是最好的语言','不服来辩！','2017-11-15 11:07:43.582584',20,NULL,7),(63,NULL,'是是是','2017-11-15 11:08:48.668312',20,62,6),(64,NULL,'丑拒','2017-11-15 11:09:03.353710',20,62,6),(65,'博士范桶求gay','清华博士范桶 想找一个男盆友 幸福的生活下去','2017-11-15 11:11:29.798220',20,NULL,6),(66,'你好','你好','2017-11-15 11:12:27.778591',20,NULL,8),(67,NULL,'真的吗','2017-11-15 11:13:44.470253',20,65,5),(68,NULL,'庞神好','2017-11-15 11:14:45.664421',20,66,6),(69,NULL,'男男女女','2017-11-15 11:14:54.351092',20,61,8),(70,'博士求一起上自习的妹子','本人饭桶，名校博士，找一个能一起上自习的妹子','2017-11-15 11:18:16.038628',22,NULL,7),(71,NULL,'肯定是真的啊','2017-11-15 11:18:29.537838',20,67,8),(72,NULL,'那是必须的','2017-11-15 11:18:35.944246',20,71,8),(73,NULL,'必须的','2017-11-15 11:19:04.108639',20,67,8),(74,NULL,'核力量','2017-11-15 11:27:25.154312',20,73,5),(75,NULL,'舒服舒服老师','2017-11-15 11:27:33.163983',20,74,5),(76,'这么快就要睡觉了','时间好快啊','2017-11-16 14:35:56.370001',20,NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_log`
--

LOCK TABLES `public_log` WRITE;
/*!40000 ALTER TABLE `public_log` DISABLE KEYS */;
INSERT INTO `public_log` VALUES (1,'49.140.122.18',1,'2017-11-14 11:05:38.662458',1),(2,'49.140.122.18',2,'2017-11-14 11:53:32.797925',1),(3,'49.140.122.18',1,'2017-11-14 11:58:35.525987',1),(4,'49.140.122.18',1,'2017-11-14 11:59:17.221690',1),(5,'49.140.122.18',2,'2017-11-14 12:02:08.302361',1),(6,'49.140.122.18',1,'2017-11-14 12:02:28.268748',1),(7,'49.140.122.18',1,'2017-11-14 12:03:34.857421',1),(8,'127.0.0.1',1,'2017-11-15 00:07:15.729240',1),(9,'127.0.0.1',1,'2017-11-15 01:10:19.148204',1),(10,'127.0.0.1',1,'2017-11-15 01:10:44.997321',1),(11,'127.0.0.1',1,'2017-11-15 01:23:45.996226',1),(12,'127.0.0.1',1,'2017-11-15 02:21:24.138157',1),(13,'127.0.0.1',1,'2017-11-15 04:31:44.550010',1),(14,'127.0.0.1',1,'2017-11-15 04:39:24.972046',1),(15,'127.0.0.1',2,'2017-11-15 04:39:40.566118',1),(16,'127.0.0.1',1,'2017-11-15 04:39:48.151942',1),(17,'127.0.0.1',1,'2017-11-15 04:51:56.892777',1),(18,'127.0.0.1',1,'2017-11-15 04:53:58.114338',1),(19,'127.0.0.1',1,'2017-11-15 07:16:15.407966',1),(20,'10.151.169.95',1,'2017-11-15 10:36:12.087318',5),(21,'10.148.233.75',1,'2017-11-15 10:37:02.981063',6),(22,'10.148.188.70',1,'2017-11-15 10:37:57.794529',7),(23,'10.148.253.110',1,'2017-11-15 10:38:15.865964',8),(24,'10.148.253.110',1,'2017-11-15 11:05:26.724838',8),(25,'10.151.169.95',1,'2017-11-15 11:05:38.708458',5),(26,'10.151.169.95',1,'2017-11-15 11:53:10.246405',1),(27,'49.140.122.18',1,'2017-11-16 13:20:54.515209',1),(28,'127.0.0.1',1,'2017-11-16 14:23:08.228811',1),(29,'127.0.0.1',1,'2017-11-16 14:52:02.915341',1),(30,'127.0.0.1',1,'2017-11-17 02:58:44.007112',1),(31,'127.0.0.1',2,'2017-11-17 05:04:17.932304',1),(32,'127.0.0.1',1,'2017-11-17 05:09:27.528920',1),(33,'127.0.0.1',2,'2017-11-17 05:16:34.617703',1),(34,'127.0.0.1',1,'2017-11-17 05:16:42.989948',1),(35,'127.0.0.1',2,'2017-11-17 05:17:17.777250',1),(36,'127.0.0.1',1,'2017-11-17 05:18:07.377886',1),(37,'127.0.0.1',2,'2017-11-17 05:26:41.346822',1),(38,'127.0.0.1',1,'2017-11-17 05:30:22.613603',1),(39,'127.0.0.1',1,'2017-11-17 09:40:24.835968',1),(40,'127.0.0.1',2,'2017-11-17 09:40:27.907608',1),(41,'127.0.0.1',1,'2017-11-17 09:43:33.632008',1),(42,'127.0.0.1',1,'2017-11-17 10:37:33.738084',1),(43,'127.0.0.1',2,'2017-11-17 10:43:21.142199',1),(44,'127.0.0.1',1,'2017-11-17 11:40:39.397422',1),(45,'49.140.122.18',1,'2017-11-17 12:00:34.993424',1),(46,'49.140.122.18',1,'2017-11-17 15:47:51.657268',7),(47,'49.140.122.18',2,'2017-11-17 15:48:04.053286',7),(48,'49.140.122.18',1,'2017-11-17 15:49:09.559567',7),(49,'49.140.122.18',1,'2017-11-18 01:13:56.747304',1),(50,'49.140.122.18',2,'2017-11-18 01:30:07.539358',1);
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
  KEY `public_picture_postid_id_0ccbd9f9` (`postid_id`),
  CONSTRAINT `public_picture_postid_id_0ccbd9f9_fk_public_post_id` FOREIGN KEY (`postid_id`) REFERENCES `public_post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_picture`
--

LOCK TABLES `public_picture` WRITE;
/*!40000 ALTER TABLE `public_picture` DISABLE KEYS */;
INSERT INTO `public_picture` VALUES (31,'169_1.jpg','/media/',169),(32,'169_2.jpg','/media/',169),(33,'169_3.jpg','/media/',169),(34,'169_4.jpg','/media/',169),(35,'170_1.jpg','/media/',170),(36,'170_2.jpg','/media/',170);
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
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_post`
--

LOCK TABLES `public_post` WRITE;
/*!40000 ALTER TABLE `public_post` DISABLE KEYS */;
INSERT INTO `public_post` VALUES (2,'2017-11-15 00:33:11.481354','小米电视4 49英寸',1,'3599','4.9mm 极超薄高端旗舰电视',0,28,11,2,'2440734460@qq.com',1,11,1),(3,'2017-11-15 00:58:40.608819','gozo 专柜 羊毛 外套 日式 七分袖',1,'99','宝贝介绍\r\n\r\n专柜，洗一穿一，羊毛。',0,18,20,2,'2440734460@qq.com',1,10,1),(4,'2017-11-15 01:01:05.252116','乐歌D7H大承重气压支架32-43寸显示器支架',1,'699','宝贝介绍\r\n\r\n转行卖其他东西了，最后两个清仓了，新货未开封，不计成本豆腐价卖了算球。',0,16,44,1,'15754310702',1,10,1),(5,'2017-11-15 01:04:14.233770','电脑游戏电脑 整套',1,'1488','宝贝介绍\r\n\r\n电脑整机 到手即玩 主机配置如图如图、显示器华硕24寸超薄，落地球形支架，1080p，支持VGA、HDMI全新win7 64系统赠送一套全新aoc游戏键鼠到手插电即用！',0,19,77,4,'skyhunter',1,10,1),(74,'2017-11-15 10:41:53.593754','开心社团',0,'','hello world',0,16,1,1,'15754310683',1,4,8),(75,'2017-11-15 11:13:48.676594','法国环境',1,'180000','符合国家级',0,56,5,1,'15754310683',1,10,8),(77,'2017-11-15 11:15:48.496775','找小哥哥带上王者',0,'','找一个玩王者荣耀的小哥哥带我上王者！',0,5,8,1,'15104422601',1,14,7),(78,'2017-11-15 11:20:20.094070','程序员鼓励师',1,'15000','jlu 软工实践一组招程序员鼓励师一名，要求形象好气质佳，待遇优厚',0,1,5,1,'12345678912',1,17,7),(79,'2017-11-15 11:20:26.891005','范红玉寻男',0,'','小范寻男',0,4,1,1,'18607789888',1,13,8),(80,'2017-11-15 11:37:40.175588','阿发分',0,'','阿发分',0,5,1,1,'15754310702',1,4,5),(104,'2017-11-16 09:53:59.724201','转发《吉林省安全监管局关于开展2018年安全生产重特大事故防治关键技术科技项目征集工作的通知》',2,'科学技术处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=转发《吉林省安全监管局关于开展2018年安全生产重特大事故防治关键技术科技项目征集工作的通知》&id=4697433&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=科学技术处',0,0,100000000,0,'',1,2,4),(105,'2017-11-16 09:53:59.735281','关于第三十三期学生入党积极分子培训班上课的通知',2,'党委组织部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于第三十三期学生入党积极分子培训班上课的通知&id=4698216&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=党委组织部',0,0,100000000,0,'',1,2,4),(106,'2017-11-16 09:53:59.741297','关于填报2016年三大检索收录论文信息的通知',2,'科学技术处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于填报2016年三大检索收录论文信息的通知&id=4698221&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=科学技术处',0,0,100000000,0,'',1,2,4),(107,'2017-11-16 09:53:59.747356','转发《2018年度国家自然科学基金委员会与以色列科学基金会合作研究项目指南》的通知',2,'科学技术处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=转发《2018年度国家自然科学基金委员会与以色列科学基金会合作研究项目指南》的通知&id=4700596&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=科学技术处',0,0,100000000,0,'',1,2,4),(108,'2017-11-16 09:53:59.759424','转发《关于征集科普成果参加2018年澳门科技活动周暨科普成果展的通知》',2,'科学技术处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=转发《关于征集科普成果参加2018年澳门科技活动周暨科普成果展的通知》&id=4700739&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=科学技术处',0,0,100000000,0,'',1,2,4),(109,'2017-11-16 09:53:59.764471','吉林省高等学校名师工作室推荐项目公示',2,'教务处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=吉林省高等学校名师工作室推荐项目公示&id=4700843&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=教务处',0,0,100000000,0,'',1,2,4),(110,'2017-11-16 09:53:59.770459','关于核对2016—2017学年吉林大学本（专）科生国家奖助学金财务放款信息的通知',2,'学生工作部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于核对2016—2017学年吉林大学本（专）科生国家奖助学金财务放款信息的通知&id=4700917&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=学生工作部',0,0,100000000,0,'',1,2,4),(111,'2017-11-16 09:53:59.775466','关于开展吉林大学哲学社会科学研究优秀成果奖(2017)评奖工作的通知',2,'社会科学处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于开展吉林大学哲学社会科学研究优秀成果奖(2017)评奖工作的通知&id=4701223&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=社会科学处',0,0,100000000,0,'',1,2,4),(112,'2017-11-16 09:53:59.780520','关于开展2016年和2017年专业技术职务聘任工作的通知',2,'人力资源和社会保障处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于开展2016年和2017年专业技术职务聘任工作的通知&id=4701310&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=人力资源和社会保障处',0,0,100000000,0,'',1,2,4),(113,'2017-11-16 09:53:59.786496','2017年度“博爱奖学金”拟推荐候选人名单公示',2,'学生工作部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=2017年度“博爱奖学金”拟推荐候选人名单公示&id=4701414&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=学生工作部',0,0,100000000,0,'',1,2,4),(114,'2017-11-16 09:53:59.792513','关于公示2017年“心知”新生助学金拟资助人选的通知',2,'生命科学学院','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于公示2017年“心知”新生助学金拟资助人选的通知&id=4701917&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=生命科学学院',0,0,100000000,0,'',1,2,4),(115,'2017-11-16 09:53:59.797525','关于举办吉林大学第二十七届“先锋论坛”大学生辩论赛四强赛的通知',2,'团委','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于举办吉林大学第二十七届“先锋论坛”大学生辩论赛四强赛的通知&id=4701974&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=团委',0,0,100000000,0,'',1,2,4),(116,'2017-11-16 09:53:59.802040','关于做好2018年“优秀本科生国际交流项目” 立项工作的通知',2,'教务处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于做好2018年“优秀本科生国际交流项目” 立项工作的通知&id=4702293&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=教务处',0,0,100000000,0,'',1,2,4),(117,'2017-11-16 09:53:59.807582','2017年度“南航十分关爱励学金”拟推荐候选人名单公示',2,'学生工作部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=2017年度“南航十分关爱励学金”拟推荐候选人名单公示&id=4702662&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=学生工作部',0,0,100000000,0,'',1,2,4),(118,'2017-11-16 09:53:59.813142','2017年度“博爱助学金”拟推荐候选人名单公示',2,'学生工作部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=2017年度“博爱助学金”拟推荐候选人名单公示&id=4702736&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=学生工作部',0,0,100000000,0,'',1,2,4),(119,'2017-11-16 09:53:59.817189','关于在本科生中评选2017年度“海拉奖学金”的通知',2,'学生工作部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于在本科生中评选2017年度“海拉奖学金”的通知&id=4702850&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=学生工作部',0,0,100000000,0,'',1,2,4),(120,'2017-11-16 09:53:59.822200','关于举办“喜庆十九大  青春建新功\"系列活动（十一）——吉林大学党团主题知识竞赛的通知',2,'团委','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于举办“喜庆十九大  青春建新功\"系列活动（十一）——吉林大学党团主题知识竞赛的通知&id=4703642&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=团委',0,0,100000000,0,'',1,2,4),(121,'2017-11-16 09:53:59.827231','关于成立吉林大学第七届本(专)科教学督导组的决定',2,'教务处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于成立吉林大学第七届本(专)科教学督导组的决定&id=4704251&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=教务处',0,0,100000000,0,'',1,2,4),(122,'2017-11-16 09:53:59.833341','关于聘任吉林大学第七届本科教学学生协理员的决定',2,'教务处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于聘任吉林大学第七届本科教学学生协理员的决定&id=4704330&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=教务处',0,0,100000000,0,'',1,2,4),(123,'2017-11-16 09:53:59.838327','关于公布吉林大学2017年博士研究生兼职辅导员学生工作研究种子基金项目立项名单的通知',2,'学生工作部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于公布吉林大学2017年博士研究生兼职辅导员学生工作研究种子基金项目立项名单的通知&id=4704827&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=学生工作部',0,0,100000000,0,'',1,2,4),(124,'2017-11-16 09:53:59.844336','关于举办第三届吉林大学“喜庆十九大共筑中国梦”主题合唱比赛决赛的通知',2,'党委宣传部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于举办第三届吉林大学“喜庆十九大共筑中国梦”主题合唱比赛决赛的通知&id=4705047&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=党委宣传部',0,0,100000000,0,'',1,2,4),(125,'2017-11-16 09:53:59.849349','关于新民校区基础楼变电所的停电通知',2,'资产管理与后勤处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于新民校区基础楼变电所的停电通知&id=4705147&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=资产管理与后勤处',0,0,100000000,0,'',1,2,4),(126,'2017-11-16 09:53:59.855365','关于评选2017年研究生“海拉奖学金”的通知',2,'研究生院','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于评选2017年研究生“海拉奖学金”的通知&id=4705335&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=研究生院',0,0,100000000,0,'',1,2,4),(127,'2017-11-16 09:53:59.860378','关于提醒2017年12月至2018年4月任期届满党支部按期换届的通知',2,'党委组织部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于提醒2017年12月至2018年4月任期届满党支部按期换届的通知&id=4705410&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=党委组织部',0,0,100000000,0,'',1,2,4),(128,'2017-11-16 09:53:59.866395','关于对2016年度教学、科研单位公用房使用定额测算的通知',2,'资产管理与后勤处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于对2016年度教学、科研单位公用房使用定额测算的通知&id=4705542&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=资产管理与后勤处',0,0,100000000,0,'',1,2,4),(129,'2017-11-16 09:53:59.872412','关于做好2017年度部门决算有关工作的通知',2,'财务处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于做好2017年度部门决算有关工作的通知&id=4662215&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=财务处',0,0,100000000,0,'',1,2,4),(130,'2017-11-16 09:53:59.878427','关于编制2018-2019年项目支出规划和2018年单位预算的通知',2,'财务处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于编制2018-2019年项目支出规划和2018年单位预算的通知&id=4565019&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=财务处',0,0,100000000,0,'',1,2,4),(131,'2017-11-16 09:53:59.883440','关于印发《中共吉林大学委员会关于深入学习宣传贯彻党的十九大精神的意见》的通知',2,'党委办公室','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于印发《中共吉林大学委员会关于深入学习宣传贯彻党的十九大精神的意见》的通知&id=4671859&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=党委办公室',0,0,100000000,0,'',1,2,4),(132,'2017-11-16 09:53:59.888527','关于开展2017年度单位银行账户年检及备案工作的通知',2,'财务处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于开展2017年度单位银行账户年检及备案工作的通知&id=4684440&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=财务处',0,0,100000000,0,'',1,2,4),(133,'2017-11-16 09:53:59.894543','关于开展A类代理人员试用期考核及签订岗位聘用合同书的通知',2,'人力资源和社会保障处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于开展A类代理人员试用期考核及签订岗位聘用合同书的通知&id=4668741&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=人力资源和社会保障处',0,0,100000000,0,'',1,2,4),(134,'2017-11-16 12:05:56.684933','关于第十六届台湾学生“北国风情”冬令营志愿者面试的通知',2,'国际合作与交流处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于第十六届台湾学生“北国风情”冬令营志愿者面试的通知&id=4706066&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=国际合作与交流处',0,0,100000000,0,'',1,2,4),(149,'2017-11-17 02:17:25.909257','关于举办“喜庆十九大  青春建新功”系列活动（十一）——吉林大学党团主题知识竞赛的通知',2,'团委','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于举办“喜庆十九大  青春建新功”系列活动（十一）——吉林大学党团主题知识竞赛的通知&id=4703642&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=团委',0,0,100000000,0,'',1,2,4),(150,'2017-11-17 02:17:25.921287','关于转发《教育部办公厅关于进一步加强教育部主管社会组织管理工作的通知》的通知',2,'校长办公室','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于转发《教育部办公厅关于进一步加强教育部主管社会组织管理工作的通知》的通知&id=4704057&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=校长办公室',0,0,100000000,0,'',1,2,4),(151,'2017-11-17 02:17:25.929266','关于印发《吉林大学教师考核工作实施办法》的通知',2,'人力资源和社会保障处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于印发《吉林大学教师考核工作实施办法》的通知&id=4704983&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=人力资源和社会保障处',0,0,100000000,0,'',1,2,4),(152,'2017-11-17 02:17:25.944556','关于印发《吉林大学教职工年度考核工作实施办法 （教师以外系列）》的通知',2,'人力资源和社会保障处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于印发《吉林大学教职工年度考核工作实施办法 （教师以外系列）》的通知&id=4707369&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=人力资源和社会保障处',0,0,100000000,0,'',1,2,4),(153,'2017-11-17 02:17:25.952383','关于举办2017年“女性学课堂”系列讲座第八讲的通知',2,'妇委会','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于举办2017年“女性学课堂”系列讲座第八讲的通知&id=4707416&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=妇委会',0,0,100000000,0,'',1,2,4),(154,'2017-11-17 02:17:25.958417','关于校部机关教职工第九届乒乓球比赛日程安排的通知',2,'机关党委','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于校部机关教职工第九届乒乓球比赛日程安排的通知&id=4707425&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=机关党委',0,0,100000000,0,'',1,2,4),(155,'2017-11-17 02:17:25.965436','关于组织学生观看第三届吉林大学“喜庆十九大共筑中国梦”主题合唱比赛决赛的通知',2,'学生工作部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于组织学生观看第三届吉林大学“喜庆十九大共筑中国梦”主题合唱比赛决赛的通知&id=4707764&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=学生工作部',0,0,100000000,0,'',1,2,4),(156,'2017-11-17 02:17:25.971477','关于举办学生工作干部学习党的十九大精神专题报告 （第二场）暨学生党支部书记培训班专题辅导讲座的通知',2,'学生工作部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于举办学生工作干部学习党的十九大精神专题报告 （第二场）暨学生党支部书记培训班专题辅导讲座的通知&id=4708076&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=学生工作部',0,0,100000000,0,'',1,2,4),(157,'2017-11-17 02:58:13.928699','关于开展2017年度博士研究生指导教师选聘工作的通知',2,'研究生院','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于开展2017年度博士研究生指导教师选聘工作的通知&id=4709111&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=研究生院',0,0,100000000,0,'',1,2,4),(159,'2017-11-17 03:28:09.896702','关于仪器设备拟报废处置的公告（2017-11）',2,'实验室与设备管理处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于仪器设备拟报废处置的公告（2017-11）&id=4709720&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=实验室与设备管理处',0,0,100000000,0,'',1,2,4),(162,'2017-11-17 05:30:04.245826','关于开展2017年吉林大学朝阳校区“建寝强青年，筑梦兴中华”寝室文化节的通知',2,'北区综合办公室','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于开展2017年吉林大学朝阳校区“建寝强青年，筑梦兴中华”寝室文化节的通知&id=4709633&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=北区综合办公室',0,0,100000000,0,'',1,2,4),(164,'2017-11-17 09:40:10.861471','关于网上直播第三届吉林大学“喜庆十九大 共筑中国梦”主题合唱比赛决赛的通知',2,'党委宣传部','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于网上直播第三届吉林大学“喜庆十九大 共筑中国梦”主题合唱比赛决赛的通知&id=4711670&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=党委宣传部',0,0,100000000,0,'',1,2,4),(165,'2017-11-17 09:40:10.876538','食品科学与工程学院2017年招聘海外博士启事',2,'食品科学与工程学院','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=食品科学与工程学院2017年招聘海外博士启事&id=4712095&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=食品科学与工程学院',0,0,100000000,0,'',1,2,4),(166,'2017-11-17 09:40:10.882028','关于公布吉林大学2017年就业创业工作研究课题立项结果的通知',2,'学生就业创业指导与服务中心','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于公布吉林大学2017年就业创业工作研究课题立项结果的通知&id=4712440&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=学生就业创业指导与服务中心',0,0,100000000,0,'',1,2,4),(168,'2017-11-17 10:31:56.865238','关于组织我校学生参加“韩国光云大学2018冬季韩语短期交流项目”的通知',2,'国际合作与交流处','https://oa.jlu.edu.cn/defaultroot/PortalInformation!getInformation.action?title=关于组织我校学生参加“韩国光云大学2018冬季韩语短期交流项目”的通知&id=4712978&categoryName=校内通知&channelName=校内通知&fromflag=login&channelId=179577&orgname=国际合作与交流处',0,0,100000000,0,'',1,2,4),(169,'2017-11-17 12:05:03.327964','iphonex出售',1,'5000','谢绝还价',1,15,1,1,'15754310709',1,10,1),(170,'2017-11-17 12:06:29.527989','求购小猫',1,'11111','求购小猫',1,6,1,1,'15754310702',1,11,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_university`
--

LOCK TABLES `public_university` WRITE;
/*!40000 ALTER TABLE `public_university` DISABLE KEYS */;
INSERT INTO `public_university` VALUES (1,'未知','未知','未知',0),(2,'吉林大学','吉林省','长春市',5),(3,'东北师大','吉林省','长春市',0),(4,'长春理工大学','吉林省','长春市',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_userdetail`
--

LOCK TABLES `public_userdetail` WRITE;
/*!40000 ALTER TABLE `public_userdetail` DISABLE KEYS */;
INSERT INTO `public_userdetail` VALUES (1,'21141620',0,'风雪客',2,1),(2,NULL,0,NULL,2,4),(3,'21141620',2,'陈天霸',2,5),(4,NULL,0,NULL,2,6),(5,'',2,'',2,7),(6,'',1,'',2,8);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_userlikepost`
--

LOCK TABLES `public_userlikepost` WRITE;
/*!40000 ALTER TABLE `public_userlikepost` DISABLE KEYS */;
INSERT INTO `public_userlikepost` VALUES (8,74,7),(6,3,8);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_userphonenum`
--

LOCK TABLES `public_userphonenum` WRITE;
/*!40000 ALTER TABLE `public_userphonenum` DISABLE KEYS */;
INSERT INTO `public_userphonenum` VALUES (1,'15754310709',1),(2,'15754310702',5),(3,'15754310683',8),(4,'15104422601',7);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_userqq`
--

LOCK TABLES `public_userqq` WRITE;
/*!40000 ALTER TABLE `public_userqq` DISABLE KEYS */;
INSERT INTO `public_userqq` VALUES (1,'2440734460',1),(2,'2440734460',5),(3,'',8),(4,'836725807',7);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_userwechat`
--

LOCK TABLES `public_userwechat` WRITE;
/*!40000 ALTER TABLE `public_userwechat` DISABLE KEYS */;
INSERT INTO `public_userwechat` VALUES (1,'skyhunter',1),(2,'skyhunter',5),(3,'',8),(4,'',7);
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

-- Dump completed on 2017-11-18  9:32:05
