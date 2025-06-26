-- MySQL dump 10.19  Distrib 10.3.39-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: asteriskcdrdb
-- ------------------------------------------------------
-- Server version	10.3.39-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
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
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a`
--

DROP TABLE IF EXISTS `a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a` (
  `id` int(11) DEFAULT NULL,
  `nome` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a`
--

LOCK TABLES `a` WRITE;
/*!40000 ALTER TABLE `a` DISABLE KEYS */;
/*!40000 ALTER TABLE `a` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdr`
--

DROP TABLE IF EXISTS `cdr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdr` (
  `calldate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `clid` varchar(80) NOT NULL DEFAULT '',
  `src` varchar(80) NOT NULL DEFAULT '',
  `dst` varchar(80) NOT NULL DEFAULT '',
  `dcontext` varchar(80) NOT NULL DEFAULT '',
  `channel` varchar(80) NOT NULL DEFAULT '',
  `dstchannel` varchar(80) NOT NULL DEFAULT '',
  `lastapp` varchar(80) NOT NULL DEFAULT '',
  `lastdata` varchar(80) NOT NULL DEFAULT '',
  `duration` int(11) NOT NULL DEFAULT 0,
  `billsec` int(11) NOT NULL DEFAULT 0,
  `disposition` varchar(45) NOT NULL DEFAULT '',
  `amaflags` int(11) NOT NULL DEFAULT 0,
  `accountcode` varchar(20) NOT NULL DEFAULT '',
  `uniqueid` varchar(32) NOT NULL DEFAULT '',
  `userfield` varchar(255) NOT NULL DEFAULT '',
  `recordingfile` varchar(255) NOT NULL DEFAULT '',
  `cnum` varchar(40) NOT NULL DEFAULT '',
  `cnam` varchar(40) NOT NULL DEFAULT '',
  `outbound_cnum` varchar(40) NOT NULL DEFAULT '',
  `outbound_cnam` varchar(40) NOT NULL DEFAULT '',
  `dst_cnam` varchar(40) NOT NULL DEFAULT '',
  `did` varchar(50) NOT NULL DEFAULT '',
  `grupo` varchar(40) DEFAULT NULL,
  KEY `IDX_UNIQUEID` (`uniqueid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdr`
--

LOCK TABLES `cdr` WRITE;
/*!40000 ALTER TABLE `cdr` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cel`
--

DROP TABLE IF EXISTS `cel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventtype` varchar(30) NOT NULL,
  `eventtime` datetime NOT NULL,
  `cid_name` varchar(80) NOT NULL,
  `cid_num` varchar(80) NOT NULL,
  `cid_ani` varchar(80) NOT NULL,
  `cid_rdnis` varchar(80) NOT NULL,
  `cid_dnid` varchar(80) NOT NULL,
  `exten` varchar(80) NOT NULL,
  `context` varchar(80) NOT NULL,
  `channame` varchar(80) NOT NULL,
  `appname` varchar(80) NOT NULL,
  `appdata` varchar(80) NOT NULL,
  `amaflags` int(11) NOT NULL,
  `accountcode` varchar(20) NOT NULL,
  `uniqueid` varchar(32) NOT NULL,
  `linkedid` varchar(32) NOT NULL,
  `peer` varchar(80) NOT NULL,
  `userdeftype` varchar(255) NOT NULL,
  `eventextra` varchar(255) NOT NULL,
  `userfield` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniqueid_index` (`uniqueid`),
  KEY `linkedid_index` (`linkedid`)
) ENGINE=InnoDB AUTO_INCREMENT=21621 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cel`
--

LOCK TABLES `cel` WRITE;
/*!40000 ALTER TABLE `cel` DISABLE KEYS */;
/*!40000 ALTER TABLE `cel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `pk_idestado` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`pk_idestado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(50) NOT NULL,
  `ramal` varchar(50) NOT NULL,
  `fila` varchar(20) NOT NULL,
  `motivo` varchar(20) NOT NULL,
  `datahora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1249 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs_pausa`
--

DROP TABLE IF EXISTS `logs_pausa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs_pausa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(50) NOT NULL,
  `ramal` varchar(50) NOT NULL,
  `fila` varchar(20) NOT NULL,
  `motivo` varchar(20) NOT NULL,
  `datahora` timestamp NOT NULL DEFAULT current_timestamp(),
  `despausa` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs_pausa`
--

LOCK TABLES `logs_pausa` WRITE;
/*!40000 ALTER TABLE `logs_pausa` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs_pausa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_abandon`
--

DROP TABLE IF EXISTS `meso_abandon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_abandon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(40) DEFAULT NULL,
  `privilege` varchar(40) DEFAULT NULL,
  `fila` varchar(40) DEFAULT NULL,
  `channel` varchar(40) DEFAULT NULL,
  `uniqueid` varchar(40) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `originalposition` int(11) DEFAULT NULL,
  `holdtime` varchar(40) DEFAULT NULL,
  `dataHora` timestamp NOT NULL DEFAULT current_timestamp(),
  `stat` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_abandon`
--

LOCK TABLES `meso_abandon` WRITE;
/*!40000 ALTER TABLE `meso_abandon` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_abandon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_agent_called`
--

DROP TABLE IF EXISTS `meso_agent_called`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_agent_called` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(40) NOT NULL,
  `privilege` varchar(40) DEFAULT NULL,
  `fila` int(11) NOT NULL,
  `agentcalled` varchar(40) NOT NULL,
  `agentname` varchar(40) NOT NULL,
  `channelcalling` varchar(40) NOT NULL,
  `destinationchannel` varchar(40) NOT NULL,
  `calleridnum` varchar(40) NOT NULL,
  `calleridname` varchar(40) NOT NULL,
  `connectedlinenum` varchar(40) NOT NULL,
  `connectedlinename` varchar(40) NOT NULL,
  `context` varchar(40) DEFAULT NULL,
  `extension` varchar(40) DEFAULT NULL,
  `prioridade` varchar(40) NOT NULL,
  `uniqueid` varchar(40) NOT NULL,
  `dataHora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_agent_called`
--

LOCK TABLES `meso_agent_called` WRITE;
/*!40000 ALTER TABLE `meso_agent_called` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_agent_called` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_agent_called_rt`
--

DROP TABLE IF EXISTS `meso_agent_called_rt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_agent_called_rt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(40) NOT NULL,
  `privilege` varchar(40) DEFAULT NULL,
  `fila` int(11) NOT NULL,
  `agentcalled` varchar(40) NOT NULL,
  `agentname` varchar(40) NOT NULL,
  `channelcalling` varchar(40) NOT NULL,
  `destinationchannel` varchar(40) NOT NULL,
  `calleridnum` varchar(40) NOT NULL,
  `calleridname` varchar(40) NOT NULL,
  `connectedlinenum` varchar(40) NOT NULL,
  `connectedlinename` varchar(40) NOT NULL,
  `context` varchar(40) DEFAULT NULL,
  `extension` varchar(40) DEFAULT NULL,
  `prioridade` varchar(40) NOT NULL,
  `uniqueid` varchar(40) NOT NULL,
  `dataHora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_agent_called_rt`
--

LOCK TABLES `meso_agent_called_rt` WRITE;
/*!40000 ALTER TABLE `meso_agent_called_rt` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_agent_called_rt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_agent_complete`
--

DROP TABLE IF EXISTS `meso_agent_complete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_agent_complete` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(40) DEFAULT NULL,
  `privilege` varchar(40) DEFAULT NULL,
  `fila` varchar(40) DEFAULT NULL,
  `uniqueid` varchar(40) DEFAULT NULL,
  `channel` varchar(40) DEFAULT NULL,
  `member` varchar(40) DEFAULT NULL,
  `membername` varchar(40) DEFAULT NULL,
  `holdtime` varchar(40) DEFAULT NULL,
  `talktime` varchar(40) DEFAULT NULL,
  `reason` varchar(40) DEFAULT NULL,
  `dataHora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3629 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_agent_complete`
--

LOCK TABLES `meso_agent_complete` WRITE;
/*!40000 ALTER TABLE `meso_agent_complete` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_agent_complete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_agent_connect`
--

DROP TABLE IF EXISTS `meso_agent_connect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_agent_connect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(40) NOT NULL,
  `privilege` varchar(40) DEFAULT NULL,
  `fila` varchar(40) NOT NULL,
  `uniqueid` varchar(40) NOT NULL,
  `canal` varchar(40) NOT NULL,
  `member` varchar(40) NOT NULL,
  `menbroNome` varchar(40) NOT NULL,
  `tempoEspera` varchar(40) NOT NULL,
  `bridgedchannel` varchar(40) NOT NULL,
  `ringtime` varchar(40) NOT NULL DEFAULT '0',
  `DataHora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3603 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_agent_connect`
--

LOCK TABLES `meso_agent_connect` WRITE;
/*!40000 ALTER TABLE `meso_agent_connect` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_agent_connect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_api`
--

DROP TABLE IF EXISTS `meso_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_api` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idligacao` varchar(40) DEFAULT NULL,
  `idagente` varchar(40) DEFAULT NULL,
  `grupo` varchar(40) DEFAULT NULL,
  `num_ramal` varchar(10) DEFAULT NULL,
  `num_solicitante` varchar(20) DEFAULT NULL,
  `datahora` timestamp NOT NULL DEFAULT current_timestamp(),
  `duracao` int(11) DEFAULT NULL,
  `dcontext` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=814 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_api`
--

LOCK TABLES `meso_api` WRITE;
/*!40000 ALTER TABLE `meso_api` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_blindtransfer`
--

DROP TABLE IF EXISTS `meso_blindtransfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_blindtransfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(80) DEFAULT NULL,
  `privilege` varchar(80) DEFAULT NULL,
  `result` varchar(80) DEFAULT NULL,
  `transfererchannel` varchar(80) DEFAULT NULL,
  `transfererchannelstate` varchar(80) DEFAULT NULL,
  `transferercalleridnum` varchar(80) DEFAULT NULL,
  `transferercalleridname` varchar(80) DEFAULT NULL,
  `transfererconnectedlinenum` varchar(80) DEFAULT NULL,
  `transfererconnectedlinename` varchar(80) DEFAULT NULL,
  `transfererlanguage` varchar(80) DEFAULT NULL,
  `transfereraccountcode` varchar(80) DEFAULT NULL,
  `transferercontext` varchar(80) DEFAULT NULL,
  `transfererexten` varchar(80) DEFAULT NULL,
  `transfererpriority` int(11) DEFAULT NULL,
  `transfereruniqueid` varchar(50) DEFAULT NULL,
  `transfererlinkedid` varchar(50) DEFAULT NULL,
  `transfereechannel` varchar(50) DEFAULT NULL,
  `transfereechannelstate` varchar(80) DEFAULT NULL,
  `transfereechannelstatedesc` varchar(80) DEFAULT NULL,
  `transfereecalleridnum` varchar(80) DEFAULT NULL,
  `transfereecalleridname` varchar(80) DEFAULT NULL,
  `transfereeconnectedlinenum` varchar(80) DEFAULT NULL,
  `transfereeconnectedlinename` varchar(80) DEFAULT NULL,
  `transfereelanguage` varchar(80) DEFAULT NULL,
  `transfereeaccountcode` varchar(80) DEFAULT NULL,
  `transfereecontext` varchar(80) DEFAULT NULL,
  `transfereeexten` varchar(80) DEFAULT NULL,
  `transfereepriority` varchar(80) DEFAULT NULL,
  `transfereeuniqueid` varchar(80) DEFAULT NULL,
  `transfereelinkedid` varchar(80) DEFAULT NULL,
  `bridgeuniqueid` varchar(80) DEFAULT NULL,
  `bridgetype` varchar(80) DEFAULT NULL,
  `bridgetechnology` varchar(80) DEFAULT NULL,
  `bridgecreator` varchar(80) DEFAULT NULL,
  `bridgename` varchar(80) DEFAULT NULL,
  `bridgenumchannels` int(11) DEFAULT NULL,
  `bridgevideosourcemode` varchar(80) DEFAULT NULL,
  `isexternal` varchar(80) DEFAULT NULL,
  `context` varchar(80) DEFAULT NULL,
  `extension` varchar(80) DEFAULT NULL,
  `datahora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_blindtransfer`
--

LOCK TABLES `meso_blindtransfer` WRITE;
/*!40000 ALTER TABLE `meso_blindtransfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_blindtransfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_bridge`
--

DROP TABLE IF EXISTS `meso_bridge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_bridge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(40) NOT NULL,
  `privilege` varchar(40) DEFAULT NULL,
  `bridgestate` varchar(40) NOT NULL,
  `bridgetype` varchar(40) DEFAULT NULL,
  `canal1` varchar(40) NOT NULL,
  `canal2` varchar(40) NOT NULL,
  `uniqueid1` varchar(40) NOT NULL,
  `uniqueid2` varchar(40) NOT NULL,
  `callerid1` varchar(40) NOT NULL,
  `callerid2` varchar(40) NOT NULL,
  `datachamada` date DEFAULT NULL,
  `iniciochamada` time DEFAULT NULL,
  `terminochamada` time DEFAULT '00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6744 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_bridge`
--

LOCK TABLES `meso_bridge` WRITE;
/*!40000 ALTER TABLE `meso_bridge` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_bridge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_call_connected_rt`
--

DROP TABLE IF EXISTS `meso_call_connected_rt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_call_connected_rt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(80) NOT NULL,
  `privilege` varchar(80) DEFAULT NULL,
  `fila` varchar(80) NOT NULL,
  `uniqueid` varchar(80) NOT NULL,
  `canal` varchar(80) NOT NULL,
  `member` varchar(80) NOT NULL,
  `menbronome` varchar(80) NOT NULL,
  `tempoespera` varchar(80) NOT NULL,
  `bridgedchannel` varchar(80) NOT NULL,
  `ringtime` varchar(80) NOT NULL DEFAULT '0',
  `datahora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_call_connected_rt`
--

LOCK TABLES `meso_call_connected_rt` WRITE;
/*!40000 ALTER TABLE `meso_call_connected_rt` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_call_connected_rt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_consulta`
--

DROP TABLE IF EXISTS `meso_consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_consulta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `solicitante` varchar(40) DEFAULT NULL,
  `teleatendete` varchar(40) DEFAULT NULL,
  `consultado` varchar(40) DEFAULT NULL,
  `estado` varchar(60) DEFAULT NULL,
  `datahora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_consulta`
--

LOCK TABLES `meso_consulta` WRITE;
/*!40000 ALTER TABLE `meso_consulta` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_cpf`
--

DROP TABLE IF EXISTS `meso_cpf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_cpf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpf` varchar(11) DEFAULT NULL,
  `channel` varchar(40) DEFAULT NULL,
  `uniqueid` varchar(30) DEFAULT NULL,
  `datahora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_cpf`
--

LOCK TABLES `meso_cpf` WRITE;
/*!40000 ALTER TABLE `meso_cpf` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_cpf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_desliga`
--

DROP TABLE IF EXISTS `meso_desliga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_desliga` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(40) DEFAULT NULL,
  `privilege` varchar(40) DEFAULT NULL,
  `channel` varchar(40) DEFAULT NULL,
  `uniqueid` varchar(40) DEFAULT NULL,
  `calleridnum` varchar(40) DEFAULT NULL,
  `calleridname` varchar(40) DEFAULT NULL,
  `connectedlinenum` varchar(40) DEFAULT NULL,
  `connectedlinename` varchar(40) DEFAULT NULL,
  `accountcode` varchar(40) DEFAULT NULL,
  `causa` bigint(20) DEFAULT NULL,
  `causatxt` varchar(40) DEFAULT NULL,
  `dataHora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37916 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_desliga`
--

LOCK TABLES `meso_desliga` WRITE;
/*!40000 ALTER TABLE `meso_desliga` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_desliga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_desloga_fila`
--

DROP TABLE IF EXISTS `meso_desloga_fila`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_desloga_fila` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(40) DEFAULT NULL,
  `fila` bigint(20) DEFAULT NULL,
  `localizacao` varchar(40) DEFAULT NULL,
  `membername` varchar(40) DEFAULT NULL,
  `dataHora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_desloga_fila`
--

LOCK TABLES `meso_desloga_fila` WRITE;
/*!40000 ALTER TABLE `meso_desloga_fila` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_desloga_fila` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_detalhe`
--

DROP TABLE IF EXISTS `meso_detalhe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_detalhe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datahora` timestamp NOT NULL DEFAULT current_timestamp(),
  `uniqueid` varchar(40) DEFAULT NULL,
  `duracao` int(11) DEFAULT NULL,
  `holdtime` varchar(40) DEFAULT NULL,
  `tronco` varchar(40) DEFAULT NULL,
  `solicitante` varchar(40) DEFAULT NULL,
  `teleatendente` varchar(40) DEFAULT NULL,
  `estado` varchar(40) DEFAULT NULL,
  `fila` varchar(40) DEFAULT NULL,
  `reason` varchar(40) DEFAULT NULL,
  `grupo` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=767 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_detalhe`
--

LOCK TABLES `meso_detalhe` WRITE;
/*!40000 ALTER TABLE `meso_detalhe` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_detalhe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_detalhe_sainte`
--

DROP TABLE IF EXISTS `meso_detalhe_sainte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_detalhe_sainte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datahora` timestamp NOT NULL DEFAULT current_timestamp(),
  `uniqueid` varchar(80) DEFAULT NULL,
  `tronco` varchar(80) DEFAULT NULL,
  `solicitantenome` varchar(80) DEFAULT NULL,
  `solicitante` varchar(80) DEFAULT NULL,
  `teleatendente` varchar(80) DEFAULT NULL,
  `estado` varchar(80) DEFAULT NULL,
  `dialend` datetime DEFAULT '0000-00-00 00:00:00',
  `inicioligacao` datetime DEFAULT '0000-00-00 00:00:00',
  `terminoligacao` datetime DEFAULT '0000-00-00 00:00:00',
  `grupo` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_detalhe_sainte`
--

LOCK TABLES `meso_detalhe_sainte` WRITE;
/*!40000 ALTER TABLE `meso_detalhe_sainte` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_detalhe_sainte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_dial`
--

DROP TABLE IF EXISTS `meso_dial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_dial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(40) NOT NULL,
  `privilege` varchar(40) NOT NULL,
  `subevent` varchar(40) NOT NULL,
  `channel` varchar(40) NOT NULL,
  `destination` varchar(40) NOT NULL,
  `calleridnum` varchar(40) NOT NULL,
  `calleridname` varchar(40) NOT NULL,
  `connectedlinenum` varchar(40) NOT NULL,
  `connectedlinename` varchar(40) NOT NULL,
  `uniqueid` varchar(40) NOT NULL,
  `datauniqueid` varchar(40) DEFAULT NULL,
  `dialstring` varchar(40) DEFAULT NULL,
  `dialstatus` varchar(40) DEFAULT NULL,
  `InicioChamada` datetime DEFAULT NULL,
  `terminoChamada` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5635 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_dial`
--

LOCK TABLES `meso_dial` WRITE;
/*!40000 ALTER TABLE `meso_dial` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_dial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_discagem`
--

DROP TABLE IF EXISTS `meso_discagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_discagem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exten` varchar(40) DEFAULT NULL,
  `nome` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_discagem`
--

LOCK TABLES `meso_discagem` WRITE;
/*!40000 ALTER TABLE `meso_discagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_discagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_efetiva`
--

DROP TABLE IF EXISTS `meso_efetiva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_efetiva` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `solicitante` varchar(40) DEFAULT NULL,
  `teleatendete` varchar(40) DEFAULT NULL,
  `consultado` varchar(40) DEFAULT NULL,
  `estado` varchar(60) DEFAULT NULL,
  `datahora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_efetiva`
--

LOCK TABLES `meso_efetiva` WRITE;
/*!40000 ALTER TABLE `meso_efetiva` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_efetiva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_entrar`
--

DROP TABLE IF EXISTS `meso_entrar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_entrar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(40) DEFAULT NULL,
  `privilege` varchar(40) DEFAULT NULL,
  `channel` varchar(40) DEFAULT NULL,
  `calleridnum` varchar(40) DEFAULT NULL,
  `calleridname` varchar(40) DEFAULT NULL,
  `connectedlinenum` varchar(40) DEFAULT NULL,
  `connectedlinename` varchar(40) DEFAULT NULL,
  `fila` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `conta` int(11) DEFAULT NULL,
  `uniqueid` varchar(40) DEFAULT NULL,
  `DataHora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4775 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_entrar`
--

LOCK TABLES `meso_entrar` WRITE;
/*!40000 ALTER TABLE `meso_entrar` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_entrar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_estado`
--

DROP TABLE IF EXISTS `meso_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_estado` (
  `pk_idestado` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`pk_idestado`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_estado`
--

LOCK TABLES `meso_estado` WRITE;
/*!40000 ALTER TABLE `meso_estado` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_estoque`
--

DROP TABLE IF EXISTS `meso_estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_estoque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datahora` timestamp NOT NULL DEFAULT current_timestamp(),
  `uniqueid` varchar(40) DEFAULT NULL,
  `duracao` int(11) DEFAULT NULL,
  `holdtime` varchar(40) DEFAULT NULL,
  `tronco` varchar(40) DEFAULT NULL,
  `solicitante` varchar(40) DEFAULT NULL,
  `teleatendente` varchar(40) DEFAULT NULL,
  `estado` varchar(40) DEFAULT NULL,
  `fila` varchar(40) DEFAULT NULL,
  `reason` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=935 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_estoque`
--

LOCK TABLES `meso_estoque` WRITE;
/*!40000 ALTER TABLE `meso_estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_finaliza`
--

DROP TABLE IF EXISTS `meso_finaliza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_finaliza` (
  `idFinaliza` int(11) NOT NULL AUTO_INCREMENT,
  `idMealing` int(11) DEFAULT NULL,
  `idOportunidade` int(11) DEFAULT NULL,
  `idPlataforma` int(11) DEFAULT NULL,
  `idAnalista` int(11) DEFAULT NULL,
  `idEspecialista` int(11) DEFAULT NULL,
  `observacao` mediumtext DEFAULT NULL,
  `estado` varchar(40) DEFAULT NULL,
  `dataInicio` datetime DEFAULT NULL,
  `dataFim` datetime DEFAULT NULL,
  PRIMARY KEY (`idFinaliza`),
  KEY `idMealing` (`idMealing`),
  KEY `idOportunidade` (`idOportunidade`),
  KEY `idPlataforma` (`idPlataforma`),
  KEY `idEspecialista` (`idEspecialista`),
  CONSTRAINT `meso_finaliza_ibfk_1` FOREIGN KEY (`idMealing`) REFERENCES `meso_mealing` (`idMealing`),
  CONSTRAINT `meso_finaliza_ibfk_2` FOREIGN KEY (`idOportunidade`) REFERENCES `meso_oportunidade` (`idOportunidade`),
  CONSTRAINT `meso_finaliza_ibfk_3` FOREIGN KEY (`idPlataforma`) REFERENCES `meso_plataforma` (`idPlatarforma`),
  CONSTRAINT `meso_finaliza_ibfk_4` FOREIGN KEY (`idEspecialista`) REFERENCES `meso_usuariologin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_finaliza`
--

LOCK TABLES `meso_finaliza` WRITE;
/*!40000 ALTER TABLE `meso_finaliza` DISABLE KEYS */;
INSERT INTO `meso_finaliza` VALUES (25,15944,145,1,NULL,26,'é só sucesso','aprovado','2024-08-30 11:31:38','2024-08-30 11:32:39');
/*!40000 ALTER TABLE `meso_finaliza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_fluxo_ligacao`
--

DROP TABLE IF EXISTS `meso_fluxo_ligacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_fluxo_ligacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hora` varchar(40) DEFAULT NULL,
  `total` int(11) DEFAULT 0,
  `datahora` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_fluxo_ligacao`
--

LOCK TABLES `meso_fluxo_ligacao` WRITE;
/*!40000 ALTER TABLE `meso_fluxo_ligacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_fluxo_ligacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_form`
--

DROP TABLE IF EXISTS `meso_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_form` (
  `atendente` varchar(10) DEFAULT NULL,
  `pin` int(11) DEFAULT NULL,
  `chamador` varchar(20) DEFAULT NULL,
  `uniqueid` varchar(50) NOT NULL DEFAULT '',
  `datahora` timestamp NOT NULL DEFAULT current_timestamp(),
  `contato` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_form`
--

LOCK TABLES `meso_form` WRITE;
/*!40000 ALTER TABLE `meso_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_form_insert`
--

DROP TABLE IF EXISTS `meso_form_insert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_form_insert` (
  `nome` varchar(50) DEFAULT NULL,
  `rgcpf` varchar(50) DEFAULT NULL,
  `contato` varchar(50) DEFAULT NULL,
  `endereco` varchar(50) DEFAULT NULL,
  `solicitacao` varchar(200) DEFAULT NULL,
  `uniqueid` varchar(50) NOT NULL DEFAULT '',
  `datahora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_form_insert`
--

LOCK TABLES `meso_form_insert` WRITE;
/*!40000 ALTER TABLE `meso_form_insert` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_form_insert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_formulario`
--

DROP TABLE IF EXISTS `meso_formulario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_formulario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) DEFAULT NULL,
  `rgcpf` varchar(100) DEFAULT NULL,
  `contato` varchar(100) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `solicitacao` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_formulario`
--

LOCK TABLES `meso_formulario` WRITE;
/*!40000 ALTER TABLE `meso_formulario` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_formulario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_gravacao`
--

DROP TABLE IF EXISTS `meso_gravacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_gravacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniqueid` varchar(40) DEFAULT NULL,
  `link` varchar(40) DEFAULT NULL,
  `datahora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_gravacao`
--

LOCK TABLES `meso_gravacao` WRITE;
/*!40000 ALTER TABLE `meso_gravacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_gravacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_grupo`
--

DROP TABLE IF EXISTS `meso_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_grupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grupo` varchar(40) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `stat1` int(11) DEFAULT 0,
  `stat2` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_grupo`
--

LOCK TABLES `meso_grupo` WRITE;
/*!40000 ALTER TABLE `meso_grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_info`
--

DROP TABLE IF EXISTS `meso_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `atendente` varchar(10) DEFAULT NULL,
  `pin` int(11) DEFAULT NULL,
  `chamador` varchar(20) DEFAULT NULL,
  `rgcpf` varchar(50) DEFAULT NULL,
  `contato` varchar(50) DEFAULT NULL,
  `endereco` varchar(50) DEFAULT NULL,
  `solicitacao` varchar(200) DEFAULT NULL,
  `uniqueid` varchar(25) DEFAULT NULL,
  `datahora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_info`
--

LOCK TABLES `meso_info` WRITE;
/*!40000 ALTER TABLE `meso_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_informa`
--

DROP TABLE IF EXISTS `meso_informa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_informa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chamador` varchar(40) DEFAULT NULL,
  `atendente` varchar(40) DEFAULT NULL,
  `uniqueid1` varchar(40) DEFAULT NULL,
  `uniqueid2` varchar(40) DEFAULT NULL,
  `canal1` varchar(40) DEFAULT NULL,
  `canal2` varchar(40) DEFAULT NULL,
  `datahora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2215 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_informa`
--

LOCK TABLES `meso_informa` WRITE;
/*!40000 ALTER TABLE `meso_informa` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_informa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_join_rt`
--

DROP TABLE IF EXISTS `meso_join_rt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_join_rt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(40) DEFAULT NULL,
  `privilege` varchar(40) DEFAULT NULL,
  `channel` varchar(40) DEFAULT NULL,
  `calleridnum` varchar(40) DEFAULT NULL,
  `calleridname` varchar(40) DEFAULT NULL,
  `connectedlinenum` varchar(40) DEFAULT NULL,
  `connectedlinename` varchar(40) DEFAULT NULL,
  `fila` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `conta` int(11) DEFAULT NULL,
  `uniqueid` varchar(40) DEFAULT NULL,
  `datahora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_join_rt`
--

LOCK TABLES `meso_join_rt` WRITE;
/*!40000 ALTER TABLE `meso_join_rt` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_join_rt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_ligacoes`
--

DROP TABLE IF EXISTS `meso_ligacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_ligacoes` (
  `fila` int(11) NOT NULL,
  `uniqueid` varchar(40) NOT NULL,
  `channelcalling` varchar(40) NOT NULL,
  `calleridnum` varchar(40) NOT NULL,
  `calleridname` varchar(40) NOT NULL,
  `datahora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_ligacoes`
--

LOCK TABLES `meso_ligacoes` WRITE;
/*!40000 ALTER TABLE `meso_ligacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_ligacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_logado`
--

DROP TABLE IF EXISTS `meso_logado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_logado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ramal` varchar(20) NOT NULL,
  `pin` varchar(50) NOT NULL,
  `fila` varchar(50) DEFAULT NULL,
  `dia` int(11) DEFAULT NULL,
  `mes` int(11) DEFAULT NULL,
  `ano` varchar(20) DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_logado`
--

LOCK TABLES `meso_logado` WRITE;
/*!40000 ALTER TABLE `meso_logado` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_logado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_login_fila`
--

DROP TABLE IF EXISTS `meso_login_fila`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_login_fila` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(40) DEFAULT NULL,
  `privilege` varchar(40) DEFAULT NULL,
  `fila` bigint(20) DEFAULT NULL,
  `localizacao` varchar(40) DEFAULT NULL,
  `membername` varchar(40) DEFAULT NULL,
  `stateinterface` varchar(40) DEFAULT NULL,
  `membership` varchar(40) DEFAULT NULL,
  `penalty` int(11) DEFAULT NULL,
  `callstaken` int(11) DEFAULT NULL,
  `lastcall` varchar(40) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `pausado` int(11) DEFAULT NULL,
  `uniqueid` varchar(40) DEFAULT NULL,
  `dataHora` timestamp NOT NULL DEFAULT current_timestamp(),
  `desloga` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_login_fila`
--

LOCK TABLES `meso_login_fila` WRITE;
/*!40000 ALTER TABLE `meso_login_fila` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_login_fila` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_mealing`
--

DROP TABLE IF EXISTS `meso_mealing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_mealing` (
  `idMealing` int(11) NOT NULL AUTO_INCREMENT,
  `ano` int(11) DEFAULT NULL,
  `orgao` varchar(100) DEFAULT NULL,
  `processo` varchar(100) DEFAULT NULL,
  `liquidacao` varchar(100) DEFAULT NULL,
  `valor_da_face` varchar(20) DEFAULT NULL,
  `credor` varchar(100) DEFAULT NULL,
  `documento` varchar(100) DEFAULT NULL,
  `idade` int(11) DEFAULT NULL,
  `renda` varchar(100) DEFAULT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `idAgente` int(11) DEFAULT NULL,
  `datahora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idMealing`),
  KEY `idAgente` (`idAgente`),
  CONSTRAINT `meso_mealing_ibfk_1` FOREIGN KEY (`idAgente`) REFERENCES `meso_usuariologin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17092 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_mealing`
--

LOCK TABLES `meso_mealing` WRITE;
/*!40000 ALTER TABLE `meso_mealing` DISABLE KEYS */;
INSERT INTO `meso_mealing` VALUES (15944,2025,'MUNICÍPIO DE CACHOEIRA DOURADA','5001096-06.2021.8.13.0126','2022-08-01','0.00','Matheus Avelino','056.260.642-49',76,'R$ 8.123,16','Alimentar','5531993171915',27,'2024-07-26 15:34:59'),(15945,2025,'MUNICÍPIO DE BELO HORIZONTE','7003099-02.2022.8.13.0456','2023-03-15','500.00','Maria Silva','123.456.789-10',34,'R$ 5.000,00','Trabalhista','5531998765432',27,'2024-07-27 13:45:30'),(15946,2025,'MUNICÍPIO DE SÃO PAULO','8005067-05.2021.8.26.0001','2022-12-20','1200.50','José Almeida','987.654.321-00',45,'R$ 10.000,00','Previdenciário','5531987654321',27,'2024-07-28 17:20:10'),(15947,2025,'MUNICÍPIO DE RIO DE JANEIRO','6002078-07.2021.8.19.0002','2023-05-10','750.75','Ana Souza','321.654.987-22',58,'R$ 7.500,00','Administrativo','5531976543210',27,'2024-07-29 12:30:45'),(15948,2025,'MUNICÍPIO DE CURITIBA','9001088-04.2021.8.16.0003','2023-07-01','200.00','Carlos Pereira','654.321.987-33',67,'R$ 3.500,00','Cível','5531965432109',27,'2024-07-30 14:15:25'),(15949,2025,'MUNICÍPIO DE PORTO ALEGRE','4002099-03.2022.8.21.0004','2023-02-18','950.00','Fernanda Lima','333.222.111-44',38,'R$ 6.200,00','Tributário','5531954321098',27,'2024-07-31 11:05:12'),(15950,2025,'MUNICÍPIO DE RECIFE','3005078-09.2021.8.17.0005','2023-01-10','600.00','João Costa','111.333.222-55',29,'R$ 4.800,00','Consumidor','5531943210987',27,'2024-07-31 15:45:55'),(15951,2025,'MUNICÍPIO DE SALVADOR','2001089-01.2021.8.05.0006','2022-10-05','300.00','Beatriz Oliveira','222.111.333-66',42,'R$ 6.700,00','Ambiental','5531932109876',27,'2024-07-31 18:20:20'),(15952,2025,'MUNICÍPIO DE FORTALEZA','1002099-02.2021.8.06.0007','2023-04-21','1050.00','Roberto Santos','444.555.666-77',53,'R$ 9.100,00','Penal','5531921098765',27,'2024-07-31 19:35:40'),(15953,2025,'MUNICÍPIO DE MANAUS','5006078-06.2021.8.04.0008','2023-06-10','850.00','Mariana Duarte','777.888.999-88',61,'R$ 7.900,00','Internacional','5531910987654',27,'2024-07-31 21:10:25'),(15954,2025,'MUNICÍPIO DE FLORIANÓPOLIS','4001088-03.2021.8.24.0009','2022-11-25','650.00','Lucas Martins','888.999.000-99',35,'R$ 5.300,00','Administrativo','5531909876543',27,'2024-07-31 22:50:55'),(15955,2025,'MUNICÍPIO DE BRASÍLIA','3007099-04.2022.8.07.0010','2023-08-15','1300.00','Paula Souza','999.000.111-22',47,'R$ 8.600,00','Trabalhista','5531898765432',27,'2024-08-01 00:05:30'),(15956,2025,'MUNICÍPIO DE VITÓRIA','2002089-05.2021.8.08.0011','2022-09-05','400.00','Felipe Araújo','555.666.777-33',39,'R$ 6.000,00','Previdenciário','5531887654321',27,'2024-08-01 01:25:45'),(15957,2025,'MUNICÍPIO DE GOIÂNIA','1003099-06.2021.8.09.0012','2023-07-30','700.00','Camila Freitas','111.222.333-44',31,'R$ 4.900,00','Alimentar','5531876543210',27,'2024-08-01 02:50:05'),(15958,2025,'MUNICÍPIO DE SÃO LUIS','6001088-07.2021.8.10.0013','2023-12-20','250.00','Rafael Lima','666.777.888-55',55,'R$ 7.200,00','Penal','5531865432109',27,'2024-08-01 04:15:30'),(15959,2025,'MUNICÍPIO DE CAMPO GRANDE','5005099-08.2021.8.11.0014','2023-11-10','950.00','Tatiana Silva','333.444.555-66',48,'R$ 9.800,00','Cível','5531854321098',27,'2024-08-01 05:30:45'),(15960,2025,'MUNICÍPIO DE JOÃO PESSOA','4004089-09.2021.8.15.0015','2022-07-05','100.00','Pedro Santos','222.333.444-77',26,'R$ 3.400,00','Consumidor','5531843210987',27,'2024-08-01 06:45:50'),(15961,2025,'MUNICÍPIO DE NATAL','3006088-10.2021.8.16.0016','2022-06-15','1500.00','Larissa Costa','111.222.555-88',41,'R$ 8.200,00','Ambiental','5531832109876',27,'2024-08-01 07:55:25');
/*!40000 ALTER TABLE `meso_mealing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_music_on_hold`
--

DROP TABLE IF EXISTS `meso_music_on_hold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_music_on_hold` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(40) DEFAULT NULL,
  `privilege` varchar(40) DEFAULT NULL,
  `estado` varchar(40) DEFAULT NULL,
  `channel` varchar(40) DEFAULT NULL,
  `uniqueid` varchar(40) DEFAULT NULL,
  `class` varchar(40) DEFAULT NULL,
  `dataInicio` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `dataTermino` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7845 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_music_on_hold`
--

LOCK TABLES `meso_music_on_hold` WRITE;
/*!40000 ALTER TABLE `meso_music_on_hold` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_music_on_hold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_music_on_hold_rt`
--

DROP TABLE IF EXISTS `meso_music_on_hold_rt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_music_on_hold_rt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(40) DEFAULT NULL,
  `privilege` varchar(40) DEFAULT NULL,
  `estado` varchar(40) DEFAULT NULL,
  `channel` varchar(40) DEFAULT NULL,
  `uniqueid` varchar(40) DEFAULT NULL,
  `class` varchar(40) DEFAULT NULL,
  `datainicio` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `datatermino` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_music_on_hold_rt`
--

LOCK TABLES `meso_music_on_hold_rt` WRITE;
/*!40000 ALTER TABLE `meso_music_on_hold_rt` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_music_on_hold_rt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_observacao`
--

DROP TABLE IF EXISTS `meso_observacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_observacao` (
  `idObservacao` int(11) NOT NULL AUTO_INCREMENT,
  `observacao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idObservacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_observacao`
--

LOCK TABLES `meso_observacao` WRITE;
/*!40000 ALTER TABLE `meso_observacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_observacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_operadores`
--

DROP TABLE IF EXISTS `meso_operadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_operadores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(40) NOT NULL,
  `pin` varchar(40) NOT NULL,
  `ramal` varchar(40) DEFAULT NULL,
  `fila` varchar(40) NOT NULL,
  `stat` int(11) DEFAULT NULL,
  `estado` varchar(40) DEFAULT 'deslogado',
  `totalloga` int(11) DEFAULT 0,
  `totaliga` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_operadores`
--

LOCK TABLES `meso_operadores` WRITE;
/*!40000 ALTER TABLE `meso_operadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_operadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_operadores_em_ligacao`
--

DROP TABLE IF EXISTS `meso_operadores_em_ligacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_operadores_em_ligacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bridgestate` varchar(40) NOT NULL,
  `canal1` varchar(40) NOT NULL,
  `canal2` varchar(40) NOT NULL,
  `uniqueid1` varchar(40) NOT NULL,
  `uniqueid2` varchar(40) NOT NULL,
  `callerid1` varchar(40) NOT NULL,
  `callerid2` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=355 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_operadores_em_ligacao`
--

LOCK TABLES `meso_operadores_em_ligacao` WRITE;
/*!40000 ALTER TABLE `meso_operadores_em_ligacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_operadores_em_ligacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_operadores_realtime`
--

DROP TABLE IF EXISTS `meso_operadores_realtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_operadores_realtime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(40) DEFAULT NULL,
  `nome` varchar(80) NOT NULL,
  `pin` varchar(40) NOT NULL,
  `ramal` varchar(40) DEFAULT NULL,
  `fila` varchar(40) NOT NULL,
  `stat` int(11) DEFAULT NULL,
  `estado` varchar(40) DEFAULT 'deslogado',
  `totaliga` int(11) DEFAULT 0,
  `totalloga` int(11) DEFAULT 0,
  `totaligaentrante` int(11) DEFAULT 0,
  `totaligasainte` int(11) DEFAULT 0,
  `yealink` varchar(20) DEFAULT NULL,
  `grupo` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_operadores_realtime`
--

LOCK TABLES `meso_operadores_realtime` WRITE;
/*!40000 ALTER TABLE `meso_operadores_realtime` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_operadores_realtime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_operadores_rt`
--

DROP TABLE IF EXISTS `meso_operadores_rt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_operadores_rt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(40) NOT NULL,
  `pin` varchar(40) NOT NULL,
  `ramal` varchar(20) DEFAULT NULL,
  `fila` varchar(40) NOT NULL,
  `stat` int(11) DEFAULT NULL,
  `estado` varchar(40) DEFAULT NULL,
  `totalloga` int(11) DEFAULT 0,
  `totaliga` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_operadores_rt`
--

LOCK TABLES `meso_operadores_rt` WRITE;
/*!40000 ALTER TABLE `meso_operadores_rt` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_operadores_rt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_oportunidade`
--

DROP TABLE IF EXISTS `meso_oportunidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_oportunidade` (
  `idOportunidade` int(11) NOT NULL AUTO_INCREMENT,
  `idMealing` int(11) DEFAULT NULL,
  `idAnalista` int(11) DEFAULT NULL,
  `idPlataforma` int(11) DEFAULT NULL,
  `atendeu` int(11) DEFAULT 0,
  `reagenda` int(11) DEFAULT 0,
  `interesse` int(11) DEFAULT 0,
  `negociar` int(11) DEFAULT 0,
  `observacao` mediumtext DEFAULT NULL,
  `estado` varchar(40) DEFAULT NULL,
  `dataInicio` timestamp NOT NULL DEFAULT current_timestamp(),
  `dataFim` datetime DEFAULT NULL,
  PRIMARY KEY (`idOportunidade`),
  KEY `idPlataforma` (`idPlataforma`),
  KEY `idMealing` (`idMealing`),
  CONSTRAINT `meso_oportunidade_ibfk_1` FOREIGN KEY (`idPlataforma`) REFERENCES `meso_plataforma` (`idPlatarforma`),
  CONSTRAINT `meso_oportunidade_ibfk_2` FOREIGN KEY (`idMealing`) REFERENCES `meso_mealing` (`idMealing`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_oportunidade`
--

LOCK TABLES `meso_oportunidade` WRITE;
/*!40000 ALTER TABLE `meso_oportunidade` DISABLE KEYS */;
INSERT INTO `meso_oportunidade` VALUES (145,15944,27,1,1,0,1,0,'é só sucesso','aprovado','2024-08-30 14:29:09','2024-08-30 11:31:00');
/*!40000 ALTER TABLE `meso_oportunidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_pausa_fila`
--

DROP TABLE IF EXISTS `meso_pausa_fila`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_pausa_fila` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(80) DEFAULT NULL,
  `privilege` varchar(80) DEFAULT NULL,
  `fila` bigint(20) DEFAULT NULL,
  `localizacao` varchar(80) DEFAULT NULL,
  `membername` varchar(80) DEFAULT NULL,
  `pausado` int(11) DEFAULT NULL,
  `datahora` datetime DEFAULT NULL,
  `despausado` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1500 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_pausa_fila`
--

LOCK TABLES `meso_pausa_fila` WRITE;
/*!40000 ALTER TABLE `meso_pausa_fila` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_pausa_fila` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_pausado`
--

DROP TABLE IF EXISTS `meso_pausado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_pausado` (
  `ramal` varchar(50) NOT NULL,
  `pin` varchar(50) NOT NULL,
  `fila` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_pausado`
--

LOCK TABLES `meso_pausado` WRITE;
/*!40000 ALTER TABLE `meso_pausado` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_pausado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_perfil_usuarios`
--

DROP TABLE IF EXISTS `meso_perfil_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_perfil_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_perfil_usuarios`
--

LOCK TABLES `meso_perfil_usuarios` WRITE;
/*!40000 ALTER TABLE `meso_perfil_usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_perfil_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_pesquisa`
--

DROP TABLE IF EXISTS `meso_pesquisa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_pesquisa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operador` varchar(45) DEFAULT NULL,
  `cliente` varchar(45) DEFAULT NULL,
  `pergunta1` varchar(10) DEFAULT NULL,
  `pergunta2` varchar(10) DEFAULT NULL,
  `datahora` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_pesquisa`
--

LOCK TABLES `meso_pesquisa` WRITE;
/*!40000 ALTER TABLE `meso_pesquisa` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_pesquisa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_plataforma`
--

DROP TABLE IF EXISTS `meso_plataforma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_plataforma` (
  `idPlatarforma` int(11) NOT NULL AUTO_INCREMENT,
  `platarforma` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idPlatarforma`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_plataforma`
--

LOCK TABLES `meso_plataforma` WRITE;
/*!40000 ALTER TABLE `meso_plataforma` DISABLE KEYS */;
INSERT INTO `meso_plataforma` VALUES (1,'whatsapp'),(2,'telefone');
/*!40000 ALTER TABLE `meso_plataforma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_protocolo`
--

DROP TABLE IF EXISTS `meso_protocolo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_protocolo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `protocolo` varchar(40) DEFAULT NULL,
  `uniqueid` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_protocolo`
--

LOCK TABLES `meso_protocolo` WRITE;
/*!40000 ALTER TABLE `meso_protocolo` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_protocolo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_ramais`
--

DROP TABLE IF EXISTS `meso_ramais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_ramais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ramal_fisico` varchar(5) DEFAULT NULL,
  `ramal_virtual` varchar(5) DEFAULT NULL,
  `fila` varchar(20) DEFAULT NULL,
  `stat` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_ramais`
--

LOCK TABLES `meso_ramais` WRITE;
/*!40000 ALTER TABLE `meso_ramais` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_ramais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_relatorio_logado`
--

DROP TABLE IF EXISTS `meso_relatorio_logado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_relatorio_logado` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ramal` varchar(20) DEFAULT NULL,
  `pin` varchar(50) DEFAULT NULL,
  `fila` varchar(50) DEFAULT NULL,
  `dhlogin` datetime DEFAULT NULL,
  `dhlogout` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_relatorio_logado`
--

LOCK TABLES `meso_relatorio_logado` WRITE;
/*!40000 ALTER TABLE `meso_relatorio_logado` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_relatorio_logado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_relatorio_logado_total`
--

DROP TABLE IF EXISTS `meso_relatorio_logado_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_relatorio_logado_total` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ramal` varchar(20) DEFAULT NULL,
  `pin` varchar(50) DEFAULT NULL,
  `fila` varchar(50) DEFAULT NULL,
  `dhlogin` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_relatorio_logado_total`
--

LOCK TABLES `meso_relatorio_logado_total` WRITE;
/*!40000 ALTER TABLE `meso_relatorio_logado_total` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_relatorio_logado_total` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_sair`
--

DROP TABLE IF EXISTS `meso_sair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_sair` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(80) DEFAULT NULL,
  `privilege` varchar(80) DEFAULT NULL,
  `channel` varchar(80) DEFAULT NULL,
  `fila` varchar(80) DEFAULT NULL,
  `conta` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `uniqueid` varchar(80) DEFAULT NULL,
  `datahora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23759 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_sair`
--

LOCK TABLES `meso_sair` WRITE;
/*!40000 ALTER TABLE `meso_sair` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_sair` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_scripts`
--

DROP TABLE IF EXISTS `meso_scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_scripts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fila` varchar(50) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `texto` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_scripts`
--

LOCK TABLES `meso_scripts` WRITE;
/*!40000 ALTER TABLE `meso_scripts` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_scripts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_telefone`
--

DROP TABLE IF EXISTS `meso_telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_telefone` (
  `pk_idtelefone` int(11) NOT NULL AUTO_INCREMENT,
  `telefone` varchar(30) DEFAULT NULL,
  `fk_idagente` int(11) DEFAULT NULL,
  PRIMARY KEY (`pk_idtelefone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_telefone`
--

LOCK TABLES `meso_telefone` WRITE;
/*!40000 ALTER TABLE `meso_telefone` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_transf_consult`
--

DROP TABLE IF EXISTS `meso_transf_consult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_transf_consult` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(80) DEFAULT NULL,
  `privilege` varchar(80) DEFAULT NULL,
  `result` varchar(80) DEFAULT NULL,
  `transfererchannel` varchar(80) DEFAULT NULL,
  `transfererchannelstate` varchar(80) DEFAULT NULL,
  `transferercalleridnum` varchar(80) DEFAULT NULL,
  `transferercalleridname` varchar(80) DEFAULT NULL,
  `transfererconnectedlinenum` varchar(80) DEFAULT NULL,
  `transfererconnectedlinename` varchar(80) DEFAULT NULL,
  `transfererlanguage` varchar(80) DEFAULT NULL,
  `transfereraccountcode` varchar(80) DEFAULT NULL,
  `transferercontext` varchar(80) DEFAULT NULL,
  `transfererexten` varchar(80) DEFAULT NULL,
  `transfererpriority` int(11) DEFAULT NULL,
  `transfereruniqueid` varchar(50) DEFAULT NULL,
  `transfererlinkedid` varchar(50) DEFAULT NULL,
  `transfereechannel` varchar(50) DEFAULT NULL,
  `transfereechannelstate` varchar(80) DEFAULT NULL,
  `transfereechannelstatedesc` varchar(80) DEFAULT NULL,
  `transfereecalleridnum` varchar(80) DEFAULT NULL,
  `transfereecalleridname` varchar(80) DEFAULT NULL,
  `transfereeconnectedlinenum` varchar(80) DEFAULT NULL,
  `transfereeconnectedlinename` varchar(80) DEFAULT NULL,
  `transfereelanguage` varchar(80) DEFAULT NULL,
  `transfereeaccountcode` varchar(80) DEFAULT NULL,
  `transfereecontext` varchar(80) DEFAULT NULL,
  `transfereeexten` varchar(80) DEFAULT NULL,
  `transfereepriority` varchar(80) DEFAULT NULL,
  `transfereeuniqueid` varchar(80) DEFAULT NULL,
  `transfereelinkedid` varchar(80) DEFAULT NULL,
  `bridgeuniqueid` varchar(80) DEFAULT NULL,
  `bridgetype` varchar(80) DEFAULT NULL,
  `bridgetechnology` varchar(80) DEFAULT NULL,
  `bridgecreator` varchar(80) DEFAULT NULL,
  `bridgename` varchar(80) DEFAULT NULL,
  `bridgenumchannels` int(11) DEFAULT NULL,
  `bridgevideosourcemode` varchar(80) DEFAULT NULL,
  `isexternal` varchar(80) DEFAULT NULL,
  `context` varchar(80) DEFAULT NULL,
  `extension` varchar(80) DEFAULT NULL,
  `datahora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4227 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_transf_consult`
--

LOCK TABLES `meso_transf_consult` WRITE;
/*!40000 ALTER TABLE `meso_transf_consult` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_transf_consult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_tronco`
--

DROP TABLE IF EXISTS `meso_tronco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_tronco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nometronco` varchar(40) DEFAULT NULL,
  `status` varchar(40) DEFAULT NULL,
  `datahora` timestamp NOT NULL DEFAULT current_timestamp(),
  `mensagem` varchar(200) DEFAULT NULL,
  `statuspeer` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_tronco`
--

LOCK TABLES `meso_tronco` WRITE;
/*!40000 ALTER TABLE `meso_tronco` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_tronco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_ura`
--

DROP TABLE IF EXISTS `meso_ura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_ura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opcao` int(11) DEFAULT 0,
  `escolhas` int(11) DEFAULT 0,
  `datahora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_ura`
--

LOCK TABLES `meso_ura` WRITE;
/*!40000 ALTER TABLE `meso_ura` DISABLE KEYS */;
/*!40000 ALTER TABLE `meso_ura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meso_usuariologin`
--

DROP TABLE IF EXISTS `meso_usuariologin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meso_usuariologin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meso_usuariologin`
--

LOCK TABLES `meso_usuariologin` WRITE;
/*!40000 ALTER TABLE `meso_usuariologin` DISABLE KEYS */;
INSERT INTO `meso_usuariologin` VALUES (24,'admin','79c277715edeb77cfd0ae1b50053c8f0','Gestor'),(25,'tester','cc03e747a6afbbcbf8be7668acfebee5','Gestor'),(26,'lucas-Meso','79c277715edeb77cfd0ae1b50053c8f0','Especialista'),(27,'matheus-Meso','79c277715edeb77cfd0ae1b50053c8f0','Analista');
/*!40000 ALTER TABLE `meso_usuariologin` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-30 11:41:29
