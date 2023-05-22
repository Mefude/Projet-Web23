-- MySQL dump 10.13  Distrib 8.0.31, for macos12.6 (x86_64)
--
-- Host: localhost    Database: ProjetWeb
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `IdItem` int NOT NULL AUTO_INCREMENT,
  `TitleItem` varchar(40) DEFAULT NULL,
  `PriceItem` float DEFAULT NULL,
  `IdItem_category` int DEFAULT NULL,
  PRIMARY KEY (`IdItem`),
  UNIQUE KEY `TitleItem` (`TitleItem`),
  KEY `IdItem_category` (`IdItem_category`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`IdItem_category`) REFERENCES `items_category` (`IdItem_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items_category`
--

DROP TABLE IF EXISTS `items_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items_category` (
  `IdItem_category` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`IdItem_category`),
  UNIQUE KEY `CategoryName` (`CategoryName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_category`
--

LOCK TABLES `items_category` WRITE;
/*!40000 ALTER TABLE `items_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `items_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `IdOrder` int NOT NULL AUTO_INCREMENT,
  `IdUser` int DEFAULT NULL,
  `IdStatus` int DEFAULT NULL,
  `IdPayment_details` int DEFAULT NULL,
  PRIMARY KEY (`IdOrder`),
  KEY `IdUser` (`IdUser`),
  KEY `IdStatus` (`IdStatus`),
  KEY `IdPayment_details` (`IdPayment_details`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`IdUser`) REFERENCES `users` (`IdUser`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`IdStatus`) REFERENCES `statuts` (`IdStatus`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`IdPayment_details`) REFERENCES `payment_details` (`IdPayment_details`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_items`
--

DROP TABLE IF EXISTS `orders_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_items` (
  `IdOrder_items` int NOT NULL AUTO_INCREMENT,
  `Price` float DEFAULT NULL,
  `IdOrder` int DEFAULT NULL,
  `IdItem` int DEFAULT NULL,
  PRIMARY KEY (`IdOrder_items`),
  KEY `IdOrder` (`IdOrder`),
  KEY `IdItem` (`IdItem`),
  CONSTRAINT `orders_items_ibfk_1` FOREIGN KEY (`IdOrder`) REFERENCES `orders` (`IdOrder`),
  CONSTRAINT `orders_items_ibfk_2` FOREIGN KEY (`IdItem`) REFERENCES `items` (`IdItem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_items`
--

LOCK TABLES `orders_items` WRITE;
/*!40000 ALTER TABLE `orders_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_details`
--

DROP TABLE IF EXISTS `payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_details` (
  `IdPayment_details` int NOT NULL AUTO_INCREMENT,
  `Amount` float DEFAULT NULL,
  PRIMARY KEY (`IdPayment_details`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_details`
--

LOCK TABLES `payment_details` WRITE;
/*!40000 ALTER TABLE `payment_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `IdRole` int NOT NULL AUTO_INCREMENT,
  `NameRole` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`IdRole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuts`
--

DROP TABLE IF EXISTS `statuts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statuts` (
  `IdStatus` int NOT NULL AUTO_INCREMENT,
  `NameStatus` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`IdStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuts`
--

LOCK TABLES `statuts` WRITE;
/*!40000 ALTER TABLE `statuts` DISABLE KEYS */;
/*!40000 ALTER TABLE `statuts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `IdUser` int NOT NULL AUTO_INCREMENT,
  `LoginUser` varchar(25) DEFAULT NULL,
  `PasswordUser` varchar(32) DEFAULT NULL,
  `PhoneNumber` varchar(25) DEFAULT NULL,
  `IdRole` int DEFAULT NULL,
  PRIMARY KEY (`IdUser`),
  UNIQUE KEY `LoginUser` (`LoginUser`),
  UNIQUE KEY `PhoneNumber` (`PhoneNumber`),
  KEY `IdRole` (`IdRole`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`IdRole`) REFERENCES `roles` (`IdRole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_adress`
--

DROP TABLE IF EXISTS `users_adress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_adress` (
  `IdUser_adress` int NOT NULL AUTO_INCREMENT,
  `AdressLine` varchar(50) DEFAULT NULL,
  `AdressLine2` varchar(50) DEFAULT NULL,
  `City` varchar(40) DEFAULT NULL,
  `PostCode` varchar(8) DEFAULT NULL,
  `Country` varchar(20) DEFAULT NULL,
  `IdUser` int DEFAULT NULL,
  PRIMARY KEY (`IdUser_adress`),
  KEY `IdUser` (`IdUser`),
  CONSTRAINT `users_adress_ibfk_1` FOREIGN KEY (`IdUser`) REFERENCES `users` (`IdUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_adress`
--

LOCK TABLES `users_adress` WRITE;
/*!40000 ALTER TABLE `users_adress` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_adress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_payment`
--

DROP TABLE IF EXISTS `users_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_payment` (
  `IdUser_payment` int NOT NULL AUTO_INCREMENT,
  `PaymentType` varchar(25) DEFAULT NULL,
  `Provider` varchar(25) DEFAULT NULL,
  `AccountNumber` int DEFAULT NULL,
  `IdUser` int DEFAULT NULL,
  PRIMARY KEY (`IdUser_payment`),
  UNIQUE KEY `AccountNumber` (`AccountNumber`),
  KEY `IdUser` (`IdUser`),
  CONSTRAINT `users_payment_ibfk_1` FOREIGN KEY (`IdUser`) REFERENCES `users` (`IdUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_payment`
--

LOCK TABLES `users_payment` WRITE;
/*!40000 ALTER TABLE `users_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_payment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-24 18:27:06
