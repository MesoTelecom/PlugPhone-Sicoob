-- MySQL dump 10.14  Distrib 5.5.68-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: asteriskcdrdb
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
-- Table structure for table `cdr`
--

DROP TABLE IF EXISTS `cdr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdr` (
  `calldate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `clid` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `src` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `dst` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `dcontext` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `channel` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `dstchannel` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lastapp` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lastdata` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `duration` int(11) NOT NULL DEFAULT '0',
  `billsec` int(11) NOT NULL DEFAULT '0',
  `disposition` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `amaflags` int(11) NOT NULL DEFAULT '0',
  `accountcode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `uniqueid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `userfield` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `recordingfile` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cnum` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cnam` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `outbound_cnum` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `outbound_cnam` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `dst_cnam` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `did` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  KEY `IDX_UNIQUEID` (`uniqueid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cel`
--

DROP TABLE IF EXISTS `cel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventtype` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `eventtime` datetime NOT NULL,
  `cid_name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cid_num` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cid_ani` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cid_rdnis` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cid_dnid` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exten` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `context` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channame` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `appname` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `appdata` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amaflags` int(11) NOT NULL,
  `accountcode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uniqueid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `linkedid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peer` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userdeftype` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `eventextra` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userfield` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniqueid_index` (`uniqueid`),
  KEY `linkedid_index` (`linkedid`)
) ENGINE=InnoDB AUTO_INCREMENT=1620439 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ramal` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fila` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `motivo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `datahora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4397 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_abandon`
--

DROP TABLE IF EXISTS `meso_abandon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_abandon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privilege` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fila` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uniqueid` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `originalposition` int(11) DEFAULT NULL,
  `holdtime` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datahora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2291 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_agent_called`
--

DROP TABLE IF EXISTS `meso_agent_called`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_agent_called` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `privilege` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fila` int(11) NOT NULL,
  `agentcalled` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agentname` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channelcalling` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `destinationchannel` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `calleridnum` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `calleridname` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connectedlinenum` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connectedlinename` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `context` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prioridade` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uniqueid` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `datahora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72659 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_agent_called_rt`
--

DROP TABLE IF EXISTS `meso_agent_called_rt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_agent_called_rt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `privilege` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fila` int(11) NOT NULL,
  `agentcalled` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agentname` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channelcalling` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `destinationchannel` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `calleridnum` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `calleridname` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connectedlinenum` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connectedlinename` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `context` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prioridade` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uniqueid` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dataHora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71814 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_agent_complete`
--

DROP TABLE IF EXISTS `meso_agent_complete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_agent_complete` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privilege` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fila` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uniqueid` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `membername` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calleridnum` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calleridname` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connectedlinenum` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connectedlinename` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `holdtime` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `talktime` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datahora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21425 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_agent_connect`
--

DROP TABLE IF EXISTS `meso_agent_connect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_agent_connect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `privilege` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fila` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uniqueid` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `canal` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menbronome` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempoespera` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bridgedchannel` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ringtime` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `connectedlinename` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connectedlinenum` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calleridname` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calleridnum` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datahora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21426 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_attended_transfer`
--
/*
DROP TABLE IF EXISTS `meso_attended_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_attended_transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privilege` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `result` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origtransfererchannel` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origtransfererchannelstate` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origtransfererchannelstatedesc` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origtransferercalleridnum` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origtransferercalleridname` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origtransfererconnectedlinenum` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origtransfererconnectedlinename` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origtransfererlanguage` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origtransfereraccountcode` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origtransferercontext` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origtransfererexten` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origtransfererpriority` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origtransfereruniqueid` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origtransfererlinkedid` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origbridgeuniqueid` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origbridgetype` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origbridgetechnology` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origbridgecreator` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origbridgename` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origbridgenumchannels` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origbridgevideosourcemode` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondtransfererchannel` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondtransfererchannelstate` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondtransfererchannelstatedesc` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondtransferercalleridnum` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondtransferercalleridname` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondtransfererconnectedlinenum` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondtransfererconnectedlinename` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondtransfererlanguage` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondtransfereraccountcode` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondtransferercontext` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondtransfererexten` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondtransfererpriority` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondtransfereruniqueid` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondtransfererlinkedid` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondbridgeuniqueid` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondbridgetype` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondbridgetechnology` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondbridgecreator` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondbridgename` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondbridgenumchannels` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondbridgevideosourcemode` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereechannel` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereechannelstate` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereechannelstatedesc` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereecalleridnum` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereecalleridname` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereeconnectedlinenum` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereeconnectedlinename` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereelanguage` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereeaccountcode` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereecontext` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereeexten` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereepriority` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereeuniqueid` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereelinkedid` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfertargetchannel` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfertargetchannelstate` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfertargetchannelstatedesc` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfertargetcalleridnum` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfertargetcalleridname` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfertargetconnectedlinenum` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfertargetconnectedlinename` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfertargetlanguage` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfertargetaccountcode` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfertargetcontext` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfertargetexten` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfertargetpriority` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfertargetuniqueid` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfertargetlinkedid` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isexternal` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desttype` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `destbridgeuniqueid` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datahora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
*/
--
-- Table structure for table `meso_blindtransfer`
--

DROP TABLE IF EXISTS `meso_blindtransfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_blindtransfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privilege` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `result` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfererchannel` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfererchannelstate` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transferercalleridnum` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transferercalleridname` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfererconnectedlinenum` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfererconnectedlinename` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfererlanguage` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereraccountcode` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transferercontext` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfererexten` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfererpriority` int(11) DEFAULT NULL,
  `transfereruniqueid` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfererlinkedid` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereechannel` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereechannelstate` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereechannelstatedesc` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereecalleridnum` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereecalleridname` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereeconnectedlinenum` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereeconnectedlinename` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereelanguage` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereeaccountcode` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereecontext` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereeexten` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereepriority` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereeuniqueid` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereelinkedid` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bridgeuniqueid` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bridgetype` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bridgetechnology` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bridgecreator` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bridgename` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bridgenumchannels` int(11) DEFAULT NULL,
  `bridgevideosourcemode` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isexternal` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `context` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datahora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1595 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_bridge`
--

DROP TABLE IF EXISTS `meso_bridge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_bridge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `privilege` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bridgeuniqueid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bridgetype` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bridgetechnology` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bridgecreator` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bridgename` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bridgenumchannels` int(11) DEFAULT NULL,
  `bridgevideosourcemode` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channelstate` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channelstatedesc` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calleridnum` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calleridname` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connectedlinenum` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connectedlinename` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linguagem` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountcode` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `context` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exten` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prioridade` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uniqueid` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedid` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datachamada` date DEFAULT NULL,
  `iniciochamada` time DEFAULT NULL,
  `terminochamada` time DEFAULT '00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55566 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_call_connected_rt`
--

DROP TABLE IF EXISTS `meso_call_connected_rt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_call_connected_rt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `privilege` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fila` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uniqueid` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `canal` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menbronome` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempoespera` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bridgedchannel` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ringtime` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `datahora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21261 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_desliga`
--

DROP TABLE IF EXISTS `meso_desliga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_desliga` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privilege` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uniqueid` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calleridnum` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calleridname` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connectedlinenum` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connectedlinename` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountcode` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causa` bigint(20) DEFAULT NULL,
  `causatxt` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datahora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=495868 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_desloga_fila`
--

DROP TABLE IF EXISTS `meso_desloga_fila`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_desloga_fila` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fila` bigint(20) DEFAULT NULL,
  `localizacao` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `membername` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datahora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=950 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_detalhe`
--

DROP TABLE IF EXISTS `meso_detalhe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_detalhe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datahora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uniqueid` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duracao` int(11) DEFAULT NULL,
  `fila` int(11) DEFAULT NULL,
  `holdtime` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tronco` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `solicitante` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `teleatendente` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razao` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117658 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_dial`
--

DROP TABLE IF EXISTS `meso_dial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_dial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `privilege` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channelstate` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channelstatedesc` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calleridnum` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calleridname` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connectedlinenum` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connectedlinename` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linguagem` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountcode` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `context` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exten` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prioridade` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uniqueid` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedid` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `destchannel` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `destchannelstate` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `destchannelstatedesc` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `destcalleridnum` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `destcalleridname` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `destlanguage` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `destaccountcode` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `destcontext` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `destexten` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `destpriority` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `destuniqueid` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `destlinkedid` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dialstring` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dialstatus` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iniciochamada` datetime DEFAULT NULL,
  `terminochamada` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=269530 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_entrar`
--

DROP TABLE IF EXISTS `meso_entrar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_entrar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privilege` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calleridnum` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calleridname` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connectedlinenum` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connectedlinename` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fila` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `conta` int(11) DEFAULT NULL,
  `uniqueid` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datahora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23728 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_estoque`
--

DROP TABLE IF EXISTS `meso_estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_estoque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `diaatual` date DEFAULT NULL,
  `tempoatual` time DEFAULT NULL,
  `ramalvendedor` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nomevendedor` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cliente` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pedido` varchar(280) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `situacao` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21394 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_fluxo_ligacao`
--

DROP TABLE IF EXISTS `meso_fluxo_ligacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_fluxo_ligacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hora` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` int(11) DEFAULT '0',
  `data` datetime DEFAULT NULL,
  `datahora` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_form`
--

DROP TABLE IF EXISTS `meso_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_form` (
  `atendente` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pin` int(11) DEFAULT NULL,
  `chamador` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uniqueid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `datahora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_form_insert`
--

DROP TABLE IF EXISTS `meso_form_insert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_form_insert` (
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rgcpf` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contato` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `endereco` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `solicitacao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uniqueid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `datahora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_join_rt`
--

DROP TABLE IF EXISTS `meso_join_rt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_join_rt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privilege` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calleridnum` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calleridname` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connectedlinenum` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connectedlinename` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fila` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `conta` int(11) DEFAULT NULL,
  `uniqueid` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datahora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23283 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_ligacoes`
--

DROP TABLE IF EXISTS `meso_ligacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_ligacoes` (
  `fila` int(11) NOT NULL,
  `uniqueid` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channelcalling` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `calleridnum` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `calleridname` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `datahora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_logado`
--

DROP TABLE IF EXISTS `meso_logado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_logado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ramal` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pin` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fila` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dia` int(11) DEFAULT NULL,
  `mes` int(11) DEFAULT NULL,
  `ano` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1289 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_login_fila`
--

DROP TABLE IF EXISTS `meso_login_fila`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_login_fila` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privilege` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fila` bigint(20) DEFAULT NULL,
  `localizacao` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `membername` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stateinterface` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `membership` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `penalty` int(11) DEFAULT NULL,
  `callstaken` int(11) DEFAULT NULL,
  `lastcall` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `pausado` int(11) DEFAULT NULL,
  `uniqueid` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datahora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `desloga` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=975 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_music_on_hold`
--

DROP TABLE IF EXISTS `meso_music_on_hold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_music_on_hold` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privilege` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uniqueid` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datainicio` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `datatermino` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45364 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_music_on_hold_rt`
--

DROP TABLE IF EXISTS `meso_music_on_hold_rt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_music_on_hold_rt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privilege` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uniqueid` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datainicio` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `datatermino` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44919 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_operadores`
--

DROP TABLE IF EXISTS `meso_operadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_operadores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pin` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fila` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stat` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_operadores_em_ligacao`
--

DROP TABLE IF EXISTS `meso_operadores_em_ligacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_operadores_em_ligacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bridgestate` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `canal1` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `canal2` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uniqueid1` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uniqueid2` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `callerid1` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `callerid2` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27356 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_operadores_rt`
--

DROP TABLE IF EXISTS `meso_operadores_rt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_operadores_rt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pin` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ramal` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fila` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stat` int(11) DEFAULT NULL,
  `estado` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totaloga` int(11) DEFAULT '0',
  `totaliga` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_pausa_fila`
--

DROP TABLE IF EXISTS `meso_pausa_fila`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_pausa_fila` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privilege` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fila` bigint(20) DEFAULT NULL,
  `localizacao` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `membername` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pausado` int(11) DEFAULT NULL,
  `datahora` datetime DEFAULT NULL,
  `despausado` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1491 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_pausado`
--

DROP TABLE IF EXISTS `meso_pausado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_pausado` (
  `ramal` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pin` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fila` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_pesquisa`
--

DROP TABLE IF EXISTS `meso_pesquisa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_pesquisa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operador` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cliente` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pergunta1` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pergunta2` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datahora` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=383 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_ramais`
--

DROP TABLE IF EXISTS `meso_ramais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_ramais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ramal_fisico` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ramal_virtual` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fila` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stat` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_sair`
--

DROP TABLE IF EXISTS `meso_sair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_sair` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privilege` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fila` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conta` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `uniqueid` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datahora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23726 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_scripts`
--

DROP TABLE IF EXISTS `meso_scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_scripts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fila` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `titulo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `texto` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_transf_consult`
--

DROP TABLE IF EXISTS `meso_transf_consult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_transf_consult` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privilege` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `result` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfererchannel` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfererchannelstate` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transferercalleridnum` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transferercalleridname` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfererconnectedlinenum` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfererconnectedlinename` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfererlanguage` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereraccountcode` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transferercontext` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfererexten` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfererpriority` int(11) DEFAULT NULL,
  `transfereruniqueid` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfererlinkedid` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereechannel` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereechannelstate` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereechannelstatedesc` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereecalleridnum` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereecalleridname` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereeconnectedlinenum` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereeconnectedlinename` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereelanguage` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereeaccountcode` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereecontext` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereeexten` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereepriority` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereeuniqueid` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfereelinkedid` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bridgeuniqueid` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bridgetype` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bridgetechnology` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bridgecreator` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bridgename` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bridgenumchannels` int(11) DEFAULT NULL,
  `bridgevideosourcemode` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isexternal` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `context` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datahora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4225 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_usuariologin`
--

DROP TABLE IF EXISTS `meso_usuariologin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_usuariologin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-20 16:54:18
