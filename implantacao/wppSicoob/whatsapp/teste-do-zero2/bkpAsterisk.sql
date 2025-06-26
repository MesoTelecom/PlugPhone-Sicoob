-- MySQL dump 10.14  Distrib 5.5.68-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: asterisk
-- ------------------------------------------------------
-- Server version	5.5.68-MariaDB

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `variable` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`variable`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `alldestinations`
--

DROP TABLE IF EXISTS `alldestinations`;
/*!50001 DROP VIEW IF EXISTS `alldestinations`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `alldestinations` (
  `extension` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `context` tinyint NOT NULL,
  `type` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ampusers`
--

DROP TABLE IF EXISTS `ampusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ampusers` (
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_sha1` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `extension_low` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `extension_high` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deptname` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sections` blob NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcement`
--

DROP TABLE IF EXISTS `announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement` (
  `announcement_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recording_id` int(11) DEFAULT NULL,
  `allow_skip` int(11) DEFAULT NULL,
  `post_dest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_ivr` tinyint(1) NOT NULL DEFAULT '0',
  `noanswer` tinyint(1) NOT NULL DEFAULT '0',
  `repeat_msg` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tts_lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en-US',
  `tts_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`announcement_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `backup`
--

DROP TABLE IF EXISTS `backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `immortal` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci,
  `email` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `backup_cache`
--

DROP TABLE IF EXISTS `backup_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_cache` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `manifest` longtext COLLATE utf8mb4_unicode_ci,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `backup_details`
--

DROP TABLE IF EXISTS `backup_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_details` (
  `backup_id` int(11) NOT NULL,
  `key` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `index` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `backup_items`
--

DROP TABLE IF EXISTS `backup_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_items` (
  `backup_id` int(11) NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` text COLLATE utf8mb4_unicode_ci,
  `exclude` text COLLATE utf8mb4_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `backup_old`
--

DROP TABLE IF EXISTS `backup_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_old` (
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `voicemail` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recordings` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `configurations` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cdr` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fop` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minutes` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hours` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `days` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `months` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weekdays` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `command` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ftpuser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ftppass` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ftphost` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ftpdir` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sshuser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sshkey` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sshhost` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sshdir` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emailaddr` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emailmaxsize` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emailmaxtype` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `include` blob,
  `exclude` blob,
  `sudo` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remotesshhost` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remotesshuser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remotesshkey` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remoterestore` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `overwritebackup` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `backup_server_details`
--

DROP TABLE IF EXISTS `backup_server_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_server_details` (
  `server_id` int(11) NOT NULL,
  `key` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `backup_servers`
--

DROP TABLE IF EXISTS `backup_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_servers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `readonly` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `immortal` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `backup_template_details`
--

DROP TABLE IF EXISTS `backup_template_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_template_details` (
  `template_id` int(11) NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` text COLLATE utf8mb4_unicode_ci,
  `exclude` text COLLATE utf8mb4_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `backup_templates`
--

DROP TABLE IF EXISTS `backup_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `immortal` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `callback`
--

DROP TABLE IF EXISTS `callback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `callback` (
  `callback_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `callbacknum` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `destination` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sleep` int(11) DEFAULT NULL,
  `deptname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`callback_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `callrecording`
--

DROP TABLE IF EXISTS `callrecording`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `callrecording` (
  `callrecording_id` int(11) NOT NULL AUTO_INCREMENT,
  `callrecording_mode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`callrecording_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `callrecording_module`
--

DROP TABLE IF EXISTS `callrecording_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `callrecording_module` (
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cidnum` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `callrecording` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cidlookup`
--

DROP TABLE IF EXISTS `cidlookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cidlookup` (
  `cidlookup_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sourcetype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cache` tinyint(1) NOT NULL DEFAULT '0',
  `deptname` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_host` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_port` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_username` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_password` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_query` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mysql_host` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mysql_dbname` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mysql_query` text COLLATE utf8mb4_unicode_ci,
  `mysql_username` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mysql_password` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mysql_charset` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opencnam_account_sid` varchar(34) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opencnam_auth_token` varchar(34) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cidlookup_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cidlookup_incoming`
--

DROP TABLE IF EXISTS `cidlookup_incoming`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cidlookup_incoming` (
  `cidlookup_id` int(11) NOT NULL,
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cidnum` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cronmanager`
--

DROP TABLE IF EXISTS `cronmanager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cronmanager` (
  `module` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `time` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `freq` int(11) NOT NULL DEFAULT '0',
  `lasttime` int(11) NOT NULL DEFAULT '0',
  `command` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`module`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `custom_destinations`
--

DROP TABLE IF EXISTS `custom_destinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_destinations` (
  `custom_dest` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`custom_dest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `custom_extensions`
--

DROP TABLE IF EXISTS `custom_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_extensions` (
  `custom_exten` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`custom_exten`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customcontexts_contexts`
--

DROP TABLE IF EXISTS `customcontexts_contexts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customcontexts_contexts` (
  `context` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `dialrules` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faildestination` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featurefaildestination` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `failpin` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `failpincdr` tinyint(1) NOT NULL DEFAULT '0',
  `featurefailpin` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featurefailpincdr` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`context`),
  UNIQUE KEY `description` (`description`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customcontexts_contexts_list`
--

DROP TABLE IF EXISTS `customcontexts_contexts_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customcontexts_contexts_list` (
  `context` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`context`),
  UNIQUE KEY `description` (`description`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customcontexts_includes`
--

DROP TABLE IF EXISTS `customcontexts_includes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customcontexts_includes` (
  `context` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `include` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timegroupid` int(11) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `userules` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`context`,`include`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customcontexts_includes_list`
--

DROP TABLE IF EXISTS `customcontexts_includes_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customcontexts_includes_list` (
  `context` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `include` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `missing` tinyint(1) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`context`,`include`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customcontexts_module`
--

DROP TABLE IF EXISTS `customcontexts_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customcontexts_module` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customerdb`
--

DROP TABLE IF EXISTS `customerdb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerdb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addr1` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addr2` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `did` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dahdi`
--

DROP TABLE IF EXISTS `dahdi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dahdi` (
  `id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-1',
  `keyword` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `data` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `flags` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dahdichandids`
--

DROP TABLE IF EXISTS `dahdichandids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dahdichandids` (
  `channel` int(11) NOT NULL DEFAULT '0',
  `description` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `did` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`channel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `daynight`
--

DROP TABLE IF EXISTS `daynight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daynight` (
  `ext` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dmode` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dest` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ext`,`dmode`,`dest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devices` (
  `id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tech` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `dial` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `devicetype` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_cid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tech` (`tech`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dialplaninjection_commands`
--

DROP TABLE IF EXISTS `dialplaninjection_commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dialplaninjection_commands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `injectionid` int(11) NOT NULL DEFAULT '0',
  `command` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dialplaninjection_commands_list`
--

DROP TABLE IF EXISTS `dialplaninjection_commands_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dialplaninjection_commands_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `command` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `info` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=MyISAM AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dialplaninjection_dialplaninjections`
--

DROP TABLE IF EXISTS `dialplaninjection_dialplaninjections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dialplaninjection_dialplaninjections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `destination` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exten` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dialplaninjection_module`
--

DROP TABLE IF EXISTS `dialplaninjection_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dialplaninjection_module` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `disa`
--

DROP TABLE IF EXISTS `disa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disa` (
  `disa_id` int(11) NOT NULL AUTO_INCREMENT,
  `displayname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pin` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cid` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `context` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `digittimeout` int(11) DEFAULT NULL,
  `resptimeout` int(11) DEFAULT NULL,
  `needconf` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hangup` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keepcid` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`disa_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynroute`
--

DROP TABLE IF EXISTS `dynroute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynroute` (
  `dynroute_id` int(11) NOT NULL AUTO_INCREMENT,
  `displayname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sourcetype` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mysql_host` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mysql_dbname` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mysql_query` text COLLATE utf8mb4_unicode_ci,
  `mysql_username` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mysql_password` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `odbc_func` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `odbc_query` text COLLATE utf8mb4_unicode_ci,
  `url_query` text COLLATE utf8mb4_unicode_ci,
  `agi_query` text COLLATE utf8mb4_unicode_ci,
  `agi_var_name_res` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `astvar_query` text COLLATE utf8mb4_unicode_ci,
  `enable_dtmf_input` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeout` int(11) DEFAULT NULL,
  `announcement_id` int(11) DEFAULT NULL,
  `chan_var_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chan_var_name_res` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`dynroute_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynroute_dests`
--

DROP TABLE IF EXISTS `dynroute_dests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynroute_dests` (
  `dynroute_id` int(11) NOT NULL,
  `selection` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_dest` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'n',
  `dest` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extensions`
--

DROP TABLE IF EXISTS `extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extensions` (
  `context` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `extension` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `priority` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `application` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `args` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descr` text COLLATE utf8mb4_unicode_ci,
  `flags` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`context`,`extension`,`priority`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fax_details`
--

DROP TABLE IF EXISTS `fax_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fax_details` (
  `key` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(510) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fax_incoming`
--

DROP TABLE IF EXISTS `fax_incoming`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fax_incoming` (
  `cidnum` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detection` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detectionwait` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `destination` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `legacy_email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fax_users`
--

DROP TABLE IF EXISTS `fax_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fax_users` (
  `user` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faxenabled` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faxemail` text COLLATE utf8mb4_unicode_ci,
  `faxattachformat` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `featurecodes`
--

DROP TABLE IF EXISTS `featurecodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `featurecodes` (
  `modulename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `featurename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `defaultcode` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customcode` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '0',
  `providedest` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`modulename`,`featurename`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `findmefollow`
--

DROP TABLE IF EXISTS `findmefollow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `findmefollow` (
  `grpnum` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `strategy` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grptime` smallint(6) NOT NULL,
  `grppre` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grplist` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `annmsg_id` int(11) DEFAULT NULL,
  `postdest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dring` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remotealert_id` int(11) DEFAULT NULL,
  `needsconf` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `toolate_id` int(11) DEFAULT NULL,
  `pre_ring` smallint(6) NOT NULL DEFAULT '0',
  `ringing` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`grpnum`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gabcast`
--

DROP TABLE IF EXISTS `gabcast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gabcast` (
  `ext` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channbr` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pin` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ext`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globals`
--

DROP TABLE IF EXISTS `globals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globals` (
  `variable` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`variable`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iax`
--

DROP TABLE IF EXISTS `iax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iax` (
  `id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-1',
  `keyword` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `data` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flags` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iaxsettings`
--

DROP TABLE IF EXISTS `iaxsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iaxsettings` (
  `keyword` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `data` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `seq` tinyint(1) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`keyword`,`seq`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incoming`
--

DROP TABLE IF EXISTS `incoming`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incoming` (
  `cidnum` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `destination` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faxexten` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faxemail` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` tinyint(1) DEFAULT NULL,
  `wait` int(2) DEFAULT NULL,
  `privacyman` tinyint(1) DEFAULT NULL,
  `alertinfo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ringing` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mohclass` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `description` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grppre` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delay_answer` int(2) DEFAULT NULL,
  `pricid` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pmmaxretries` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pmminlength` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `indications_zonelist`
--

DROP TABLE IF EXISTS `indications_zonelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indications_zonelist` (
  `name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conf` blob,
  PRIMARY KEY (`iso`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventorydb`
--

DROP TABLE IF EXISTS `inventorydb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventorydb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empnum` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `empname` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `building` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `floor` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `room` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `section` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cubicle` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desk` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exten` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phusername` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phpassword` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mac` varchar(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `distdate` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pbxbox` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extrainfo` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issabelpbx_log`
--

DROP TABLE IF EXISTS `issabelpbx_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issabelpbx_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `section` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` enum('error','warning','debug','devel-debug') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'error',
  `status` int(11) NOT NULL DEFAULT '0',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`,`level`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issabelpbx_settings`
--

DROP TABLE IF EXISTS `issabelpbx_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issabelpbx_settings` (
  `keyword` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` tinyint(1) DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `defaultval` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `readonly` tinyint(1) DEFAULT '0',
  `hidden` tinyint(1) DEFAULT '0',
  `category` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emptyok` tinyint(1) DEFAULT '1',
  `sortorder` int(11) DEFAULT '0',
  PRIMARY KEY (`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ivr_details`
--

DROP TABLE IF EXISTS `ivr_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ivr_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `announcement` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `directdial` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invalid_loops` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invalid_retry_recording` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invalid_destination` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invalid_recording` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `retvm` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeout_time` int(11) DEFAULT NULL,
  `timeout_recording` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeout_retry_recording` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeout_destination` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeout_loops` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeout_append_announce` tinyint(1) NOT NULL DEFAULT '1',
  `invalid_append_announce` tinyint(1) NOT NULL DEFAULT '1',
  `timeout_ivr_ret` tinyint(1) NOT NULL DEFAULT '0',
  `invalid_ivr_ret` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ivr_entries`
--

DROP TABLE IF EXISTS `ivr_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ivr_entries` (
  `ivr_id` int(11) NOT NULL,
  `selection` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dest` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ivr_ret` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `language_incoming`
--

DROP TABLE IF EXISTS `language_incoming`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language_incoming` (
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cidnum` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logfile_logfiles`
--

DROP TABLE IF EXISTS `logfile_logfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logfile_logfiles` (
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `debug` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dtmf` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `error` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notice` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verbose` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warning` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `security` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logfile_settings`
--

DROP TABLE IF EXISTS `logfile_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logfile_settings` (
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `manager_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deny` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `write` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`manager_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `managersettings`
--

DROP TABLE IF EXISTS `managersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `managersettings` (
  `keyword` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `data` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `seq` tinyint(1) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`keyword`,`seq`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meetme`
--

DROP TABLE IF EXISTS `meetme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetme` (
  `exten` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userpin` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adminpin` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `joinmsg_id` int(11) DEFAULT NULL,
  `music` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `users` tinyint(4) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `miscapps`
--

DROP TABLE IF EXISTS `miscapps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miscapps` (
  `miscapps_id` int(11) NOT NULL AUTO_INCREMENT,
  `ext` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`miscapps_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `miscdests`
--

DROP TABLE IF EXISTS `miscdests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miscdests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `destdial` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `module_xml`
--

DROP TABLE IF EXISTS `module_xml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_xml` (
  `id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'xml',
  `time` int(11) NOT NULL DEFAULT '0',
  `data` mediumblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modulename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `module` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `level` int(11) NOT NULL DEFAULT '0',
  `display_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extended_text` blob NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `reset` tinyint(4) NOT NULL DEFAULT '0',
  `candelete` tinyint(4) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`module`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `outbound_route_patterns`
--

DROP TABLE IF EXISTS `outbound_route_patterns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outbound_route_patterns` (
  `route_id` int(11) NOT NULL,
  `match_pattern_prefix` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `match_pattern_pass` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `match_cid` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `prepend_digits` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`route_id`,`match_pattern_prefix`,`match_pattern_pass`,`match_cid`,`prepend_digits`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `outbound_route_sequence`
--

DROP TABLE IF EXISTS `outbound_route_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outbound_route_sequence` (
  `route_id` int(11) NOT NULL,
  `seq` int(11) NOT NULL,
  PRIMARY KEY (`route_id`,`seq`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `outbound_route_trunks`
--

DROP TABLE IF EXISTS `outbound_route_trunks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outbound_route_trunks` (
  `route_id` int(11) NOT NULL,
  `trunk_id` int(11) NOT NULL,
  `seq` int(11) NOT NULL,
  PRIMARY KEY (`route_id`,`trunk_id`,`seq`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `outbound_routes`
--

DROP TABLE IF EXISTS `outbound_routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outbound_routes` (
  `route_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `outcid` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `outcid_mode` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_route` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `intracompany_route` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mohclass` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_group_id` int(11) DEFAULT NULL,
  `dest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`route_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `outroutemsg`
--

DROP TABLE IF EXISTS `outroutemsg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outroutemsg` (
  `keyword` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `data` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paging_autoanswer`
--

DROP TABLE IF EXISTS `paging_autoanswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paging_autoanswer` (
  `useragent` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `var` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `setting` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`useragent`,`var`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paging_config`
--

DROP TABLE IF EXISTS `paging_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paging_config` (
  `page_group` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `force_page` int(1) NOT NULL,
  `duplex` int(1) NOT NULL DEFAULT '0',
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`page_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paging_groups`
--

DROP TABLE IF EXISTS `paging_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paging_groups` (
  `page_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ext` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`page_number`,`ext`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parkplus`
--

DROP TABLE IF EXISTS `parkplus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parkplus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `defaultlot` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `parkext` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `parkpos` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `numslots` int(11) NOT NULL DEFAULT '4',
  `parkingtime` int(11) NOT NULL DEFAULT '45',
  `parkedmusicclass` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `generatefc` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `generatehints` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `findslot` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'first',
  `parkedplay` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'both',
  `parkedcalltransfers` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'caller',
  `parkedcallreparking` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'caller',
  `alertinfo` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cidpp` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `autocidpp` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `announcement_id` int(11) DEFAULT NULL,
  `comebacktoorigin` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `dest` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'app-blackhole,hangup,1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `phpagiconf`
--

DROP TABLE IF EXISTS `phpagiconf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpagiconf` (
  `phpagiid` int(11) NOT NULL AUTO_INCREMENT,
  `debug` tinyint(1) DEFAULT NULL,
  `error_handler` tinyint(1) DEFAULT NULL,
  `err_email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hostname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tempdir` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `festival_text2wave` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asman_server` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asman_port` int(11) NOT NULL,
  `asman_user` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asman_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cepstral_swift` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cepstral_voice` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setuid` tinyint(1) DEFAULT NULL,
  `basedir` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`phpagiid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pinset_usage`
--

DROP TABLE IF EXISTS `pinset_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pinset_usage` (
  `pinsets_id` int(11) NOT NULL,
  `dispname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `foreign_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`dispname`,`foreign_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pinsets`
--

DROP TABLE IF EXISTS `pinsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pinsets` (
  `pinsets_id` int(11) NOT NULL AUTO_INCREMENT,
  `passwords` longtext COLLATE utf8mb4_unicode_ci,
  `description` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addtocdr` tinyint(1) DEFAULT NULL,
  `deptname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`pinsets_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pjsipsettings`
--

DROP TABLE IF EXISTS `pjsipsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pjsipsettings` (
  `keyword` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `data` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `seq` tinyint(1) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`keyword`,`seq`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queueprio`
--

DROP TABLE IF EXISTS `queueprio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queueprio` (
  `queueprio_id` int(11) NOT NULL AUTO_INCREMENT,
  `queue_priority` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`queueprio_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queues_config`
--

DROP TABLE IF EXISTS `queues_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queues_config` (
  `extension` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `descr` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `grppre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alertinfo` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ringing` tinyint(1) NOT NULL DEFAULT '0',
  `maxwait` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ivr_id` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `dest` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cwignore` tinyint(1) NOT NULL DEFAULT '0',
  `qregex` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agentannounce_id` int(11) DEFAULT NULL,
  `joinannounce_id` int(11) DEFAULT NULL,
  `queuewait` tinyint(1) DEFAULT '0',
  `use_queue_context` tinyint(1) DEFAULT '0',
  `togglehint` tinyint(1) DEFAULT '0',
  `qnoanswer` tinyint(1) DEFAULT '0',
  `callconfirm` tinyint(1) DEFAULT '0',
  `callconfirm_id` int(11) DEFAULT NULL,
  `monitor_type` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monitor_heard` int(11) DEFAULT NULL,
  `monitor_spoken` int(11) DEFAULT NULL,
  `callback_id` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `destcontinue` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`extension`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queues_details`
--

DROP TABLE IF EXISTS `queues_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queues_details` (
  `id` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-1',
  `keyword` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `data` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `flags` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`keyword`,`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recordings`
--

DROP TABLE IF EXISTS `recordings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recordings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `displayname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` blob,
  `description` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcode` tinyint(1) DEFAULT '0',
  `fcode_pass` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ringgroups`
--

DROP TABLE IF EXISTS `ringgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ringgroups` (
  `grpnum` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `strategy` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grptime` smallint(6) NOT NULL,
  `grppre` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grplist` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `annmsg_id` int(11) DEFAULT NULL,
  `postdest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alertinfo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remotealert_id` int(11) DEFAULT NULL,
  `needsconf` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `toolate_id` int(11) DEFAULT NULL,
  `ringing` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cwignore` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cfignore` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cpickup` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recording` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'dontcare',
  PRIMARY KEY (`grpnum`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `setcid`
--

DROP TABLE IF EXISTS `setcid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setcid` (
  `cid_id` int(11) NOT NULL AUTO_INCREMENT,
  `cid_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cid_num` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variables` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`cid_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sip`
--

DROP TABLE IF EXISTS `sip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sip` (
  `id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-1',
  `keyword` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `data` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flags` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sipsettings`
--

DROP TABLE IF EXISTS `sipsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sipsettings` (
  `keyword` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `data` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `seq` tinyint(1) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`keyword`,`seq`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timeconditions`
--

DROP TABLE IF EXISTS `timeconditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeconditions` (
  `timeconditions_id` int(11) NOT NULL AUTO_INCREMENT,
  `displayname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `truegoto` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `falsegoto` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deptname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_hint` tinyint(1) DEFAULT '0',
  `priority` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`timeconditions_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timegroups_details`
--

DROP TABLE IF EXISTS `timegroups_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timegroups_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timegroupid` int(11) NOT NULL DEFAULT '0',
  `time` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timegroups_groups`
--

DROP TABLE IF EXISTS `timegroups_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timegroups_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `display` (`description`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trunk_dialpatterns`
--

DROP TABLE IF EXISTS `trunk_dialpatterns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trunk_dialpatterns` (
  `trunkid` int(11) NOT NULL DEFAULT '0',
  `match_pattern_prefix` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `match_pattern_pass` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `prepend_digits` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `seq` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`trunkid`,`match_pattern_prefix`,`match_pattern_pass`,`prepend_digits`,`seq`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trunks`
--

DROP TABLE IF EXISTS `trunks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trunks` (
  `trunkid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tech` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `outcid` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `keepcid` varchar(4) COLLATE utf8_unicode_ci DEFAULT 'off',
  `maxchans` varchar(6) COLLATE utf8_unicode_ci DEFAULT '',
  `failscript` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dialoutprefix` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `channelid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `usercontext` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `disabled` varchar(4) COLLATE utf8_unicode_ci DEFAULT 'off',
  `continue` varchar(4) COLLATE utf8_unicode_ci DEFAULT 'off',
  PRIMARY KEY (`trunkid`,`tech`,`channelid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `extension` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `voicemail` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ringtimer` int(3) DEFAULT NULL,
  `noanswer` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recording` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `outboundcid` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sipname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mohclass` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `noanswer_cid` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `busy_cid` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `chanunavail_cid` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `noanswer_dest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `busy_dest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `chanunavail_dest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `estado` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT 'deslogado',
  `totalloga` int(11) DEFAULT '0',
  `totaliga` int(11) DEFAULT '0',
  `fila` int(11) DEFAULT '0',
  PRIMARY KEY (`extension`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vmblast`
--

DROP TABLE IF EXISTS `vmblast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vmblast` (
  `grpnum` int(11) NOT NULL,
  `description` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `audio_label` int(11) NOT NULL DEFAULT '-1',
  `password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`grpnum`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vmblast_groups`
--

DROP TABLE IF EXISTS `vmblast_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vmblast_groups` (
  `grpnum` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ext` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`grpnum`,`ext`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voicemail_admin`
--

DROP TABLE IF EXISTS `voicemail_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voicemail_admin` (
  `variable` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`variable`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `writequeuelog`
--

DROP TABLE IF EXISTS `writequeuelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `writequeuelog` (
  `qlog_id` int(11) NOT NULL AUTO_INCREMENT,
  `qlog_description` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qlog_uniqueid` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qlog_queue` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qlog_agent` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qlog_event` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qlog_extra` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`qlog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `alldestinations`
--

/*!50001 DROP TABLE IF EXISTS `alldestinations`*/;
/*!50001 DROP VIEW IF EXISTS `alldestinations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `alldestinations` AS select `users`.`extension` AS `extension`,`users`.`name` AS `name`,'from-did-direct' AS `context`,'extension' AS `type` from `users` union select `queues_config`.`extension` AS `extension`,`queues_config`.`descr` AS `descr`,'ext-queues' AS `context`,'queue' AS `type` from `queues_config` union select `ringgroups`.`grpnum` AS `grpnum`,`ringgroups`.`description` AS `description`,'ext-group' AS `context`,'ringgroup' AS `type` from `ringgroups` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-09 11:20:52
