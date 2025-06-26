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
-- Table structure for table `meu_teste`
--

DROP TABLE IF EXISTS `meu_teste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meu_teste` (
  `mensagem` varchar(2) DEFAULT NULL,
  `datahora` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meu_teste`
--

LOCK TABLES `meu_teste` WRITE;
/*!40000 ALTER TABLE `meu_teste` DISABLE KEYS */;
INSERT INTO `meu_teste` VALUES ('a','2024-08-10 00:00:00'),('a','2024-08-20 00:00:00'),('a','2024-08-30 00:00:00'),('a','2024-08-31 00:00:00'),('a','2024-09-10 00:00:00'),('a','2024-09-20 00:00:00'),('a','2024-09-30 00:00:00'),('a','2024-10-10 00:00:00'),('a','2024-10-20 00:00:00'),('a','2024-10-30 00:00:00'),('a','2024-10-31 00:00:00'),('a','2024-11-10 00:00:00'),('a','2024-11-20 00:00:00'),('a','2024-11-30 00:00:00'),('a','2024-12-10 00:00:00'),('a','2024-12-20 00:00:00'),('a','2024-12-30 00:00:00'),('a','2024-12-31 00:00:00'),('a','2025-01-10 00:00:00'),('a','2025-01-20 00:00:00'),('a','2025-01-30 00:00:00'),('a','2025-01-31 00:00:00');
/*!40000 ALTER TABLE `meu_teste` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-30 10:55:57
