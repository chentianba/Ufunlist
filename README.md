# Ufunlist
Software Engineering Practice: This is a copy of craiglist(www.craiglist.com)

HOW TO configure the developing environment?
    windows:
//        1. please install mysql5.7;
//        2. add {your install directory}/bin into PATH, for example: E:\mysql5.7\bin\;
//        3. enter the console by 'WIN+R' and 'cmd', input 'mysql -u username -p';
//        4. input your password;
//        5. create database whose name is 'ufunlist' by command 'create database ufunlist;';
//        6. use ufunlist;
//        7. source *.sql (note: database name conflict)
//        8. modify /Ufunlist/settings.py according to your database
//        9. configure email setting
//        9. python manage.py runserver
//        10. that's ok ^_^ Have fun!!!
数据库设计：
public_university | CREATE TABLE `public_university` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(48) NOT NULL,
  `province` varchar(32) NOT NULL,
  `city` varchar(32) NOT NULL,
  `regstunum` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 

public_userdetail | CREATE TABLE `public_userdetail` (
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 

public_log | CREATE TABLE `public_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip` char(39) NOT NULL,
  `action` int(10) unsigned NOT NULL,
  `time` datetime(6) NOT NULL,
  `userid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `public_log_userid_id_4c713757_fk_auth_user_id` (`userid_id`),
  CONSTRAINT `public_log_userid_id_4c713757_fk_auth_user_id` FOREIGN KEY (`userid_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8

public_category | CREATE TABLE `public_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(48) NOT NULL,
  `isforum` tinyint(1) NOT NULL,
  `parentid_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `public_category_parentid_id_eedd4a6e_fk_public_category_id` (`parentid_id`),
  CONSTRAINT `public_category_parentid_id_eedd4a6e_fk_public_category_id` FOREIGN KEY (`parentid_id`) REFERENCES `public_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8

public_post | CREATE TABLE `public_post` (
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
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 

public_forumpost | CREATE TABLE `public_forumpost` (
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8

 public_picture | CREATE TABLE `public_picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(48) NOT NULL,
  `path` varchar(64) NOT NULL,
  `postid_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `public_picture_postid_id_path_name_7d8fe82a_uniq` (`postid_id`,`path`,`name`),
  CONSTRAINT `public_picture_postid_id_0ccbd9f9_fk_public_post_id` FOREIGN KEY (`postid_id`) REFERENCES `public_post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8

public_userlikepost | CREATE TABLE `public_userlikepost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postid_id` bigint(20) NOT NULL,
  `userid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `public_userlikepost_userid_id_postid_id_928d50b3_uniq` (`userid_id`,`postid_id`),
  KEY `public_userlikepost_postid_id_2534f939_fk_public_post_id` (`postid_id`),
  CONSTRAINT `public_userlikepost_postid_id_2534f939_fk_public_post_id` FOREIGN KEY (`postid_id`) REFERENCES `public_post` (`id`),
  CONSTRAINT `public_userlikepost_userid_id_c4d6c71a_fk_auth_user_id` FOREIGN KEY (`userid_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

public_userphonenum | CREATE TABLE `public_userphonenum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phonenum` varchar(32) NOT NULL,
  `userid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid_id` (`userid_id`),
  CONSTRAINT `public_userphonenum_userid_id_51243fad_fk_auth_user_id` FOREIGN KEY (`userid_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8

public_useremail | CREATE TABLE `public_useremail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `userid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid_id` (`userid_id`),
  CONSTRAINT `public_useremail_userid_id_258d8dca_fk_auth_user_id` FOREIGN KEY (`userid_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 

public_userqq | CREATE TABLE `public_userqq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qq` varchar(32) NOT NULL,
  `userid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid_id` (`userid_id`),
  CONSTRAINT `public_userqq_userid_id_05c49074_fk_auth_user_id` FOREIGN KEY (`userid_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 

public_userwechat | CREATE TABLE `public_userwechat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wechat` varchar(48) NOT NULL,
  `userid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid_id` (`userid_id`),
  CONSTRAINT `public_userwechat_userid_id_d4bdce70_fk_auth_user_id` FOREIGN KEY (`userid_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8

开发环境：
1. windows10操作系统
2. mysql 5.7(community)
3. python3.6
4. django 1.11
5. 代码编辑器: sublime text 3
6. 前端bootstrap库

