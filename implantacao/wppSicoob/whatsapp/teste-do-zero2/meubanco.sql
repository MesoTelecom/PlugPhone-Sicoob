-- MySQL dump 10.14  Distrib 5.5.64-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: asteriskcdrdb
-- ------------------------------------------------------
-- Server version	5.5.64-MariaDB

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
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1620897 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=4433 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logs_pausa`
--

DROP TABLE IF EXISTS `logs_pausa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs_pausa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ramal` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fila` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `motivo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `datahora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `despausa` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=2296 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=72675 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=21437 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
-- Table structure for table `meso_api`
--

DROP TABLE IF EXISTS `meso_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_api` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idligacao` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idagente` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grupo` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_ramal` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_solicitante` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datahora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `duracao` int(11) DEFAULT NULL,
  `dcontext` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=811 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=55590 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=21273 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_consulta`
--

DROP TABLE IF EXISTS `meso_consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_consulta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `solicitante` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `teleatendete` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `consultado` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datahora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_cpf`
--

DROP TABLE IF EXISTS `meso_cpf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_cpf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpf` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uniqueid` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datahora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=495954 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=996 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=117675 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_detalhe_sainte`
--

DROP TABLE IF EXISTS `meso_detalhe_sainte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_detalhe_sainte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datahora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uniqueid` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tronco` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `solicitantenome` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `solicitante` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `teleatendente` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dialend` datetime DEFAULT '0000-00-00 00:00:00',
  `inicioligacao` datetime DEFAULT '0000-00-00 00:00:00',
  `terminoligacao` datetime DEFAULT '0000-00-00 00:00:00',
  `grupo` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=269549 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_discagem`
--

DROP TABLE IF EXISTS `meso_discagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_discagem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exten` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nome` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_efetiva`
--

DROP TABLE IF EXISTS `meso_efetiva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_efetiva` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `solicitante` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `teleatendete` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `consultado` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datahora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=23745 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
-- Table structure for table `meso_formulario`
--

DROP TABLE IF EXISTS `meso_formulario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_formulario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rgcpf` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contato` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `endereco` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `solicitacao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_gravacao`
--

DROP TABLE IF EXISTS `meso_gravacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_gravacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniqueid` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datahora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_grupo`
--

DROP TABLE IF EXISTS `meso_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_grupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grupo` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descricao` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stat1` int(11) DEFAULT '0',
  `stat2` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_info`
--

DROP TABLE IF EXISTS `meso_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `atendente` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pin` int(11) DEFAULT NULL,
  `chamador` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rgcpf` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contato` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `endereco` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `solicitacao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uniqueid` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datahora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_informa`
--

DROP TABLE IF EXISTS `meso_informa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_informa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chamador` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `atendente` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uniqueid1` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uniqueid2` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `canal1` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `canal2` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datahora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2215 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=23300 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=1314 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=997 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_mealing`
--

DROP TABLE IF EXISTS `meso_mealing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_mealing` (
  `ano` int(11) DEFAULT NULL,
  `orgao` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processo` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `liquidacao` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valor_da_face` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credor` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `documento` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idade` int(11) DEFAULT NULL,
  `renda` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefone` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `atendeu` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reagendar` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interesse` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `negociar` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `obs` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=45381 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=44936 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=27368 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_operadores_realtime`
--

DROP TABLE IF EXISTS `meso_operadores_realtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_operadores_realtime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nome` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pin` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ramal` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fila` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stat` int(11) DEFAULT NULL,
  `estado` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT 'deslogado',
  `totaliga` int(11) DEFAULT '0',
  `totalloga` int(11) DEFAULT '0',
  `totaligaentrante` int(11) DEFAULT '0',
  `totaligasainte` int(11) DEFAULT '0',
  `yealink` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grupo` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=1496 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
-- Table structure for table `meso_perfil_usuarios`
--

DROP TABLE IF EXISTS `meso_perfil_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_perfil_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
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
-- Table structure for table `meso_protocolo`
--

DROP TABLE IF EXISTS `meso_protocolo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_protocolo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `protocolo` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uniqueid` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
-- Table structure for table `meso_relatorio_logado`
--

DROP TABLE IF EXISTS `meso_relatorio_logado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_relatorio_logado` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ramal` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pin` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fila` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dhlogin` datetime DEFAULT NULL,
  `dhlogout` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_relatorio_logado_total`
--

DROP TABLE IF EXISTS `meso_relatorio_logado_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_relatorio_logado_total` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ramal` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pin` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fila` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dhlogin` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=625 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=23743 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
-- Table structure for table `meso_tronco`
--

DROP TABLE IF EXISTS `meso_tronco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_tronco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nometronco` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datahora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mensagem` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `statuspeer` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=640240 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meso_ura`
--

DROP TABLE IF EXISTS `meso_ura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_ura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opcao` int(11) DEFAULT '0',
  `escolhas` int(11) DEFAULT '0',
  `datahora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-10 15:24:05
