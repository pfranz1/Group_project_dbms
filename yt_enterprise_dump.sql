-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: yt_enterprise
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `ID` int NOT NULL,
  `CustomerID` int DEFAULT NULL,
  `ShirtID` int DEFAULT NULL,
  `DateAdded` date DEFAULT NULL,
  `CartStatus` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_cart_customer` (`CustomerID`),
  KEY `fk_cart_shirt` (`ShirtID`),
  CONSTRAINT `fk_cart_customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`ID`),
  CONSTRAINT `fk_cart_shirt` FOREIGN KEY (`ShirtID`) REFERENCES `shirt` (`ShirtID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,1,1,'2023-11-20','Added'),(2,2,2,'2023-11-21','Added'),(3,3,3,'2023-11-22','Removed'),(4,4,4,'2023-11-23','Added'),(5,5,5,'2023-11-24','Removed');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `ID` int NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Ali Khan','ali@example.com','123 Main St, Anytown, USA'),(2,'Sarah Miller','sarah@example.com','456 Elm St, Another Town, USA'),(3,'Judy Brown','judy@example.com','789 Oak St, Some City, USA'),(4,'Max Johnson','max@example.com','234 Maple Ave, Somewhere, USA'),(5,'Kendal Wilson','kendal@example.com','567 Pine Rd, Anywhere, USA'),(6,'Priya Sharma','priya@example.com','789 Cedar Ln, Elsewhere, USA');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_purchase`
--

DROP TABLE IF EXISTS `customer_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_purchase` (
  `CustomerID` int NOT NULL,
  `PurchaseID` int NOT NULL,
  PRIMARY KEY (`CustomerID`,`PurchaseID`),
  KEY `PurchaseID` (`PurchaseID`),
  CONSTRAINT `customer_purchase_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`ID`),
  CONSTRAINT `customer_purchase_ibfk_2` FOREIGN KEY (`PurchaseID`) REFERENCES `purchase` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_purchase`
--

LOCK TABLES `customer_purchase` WRITE;
/*!40000 ALTER TABLE `customer_purchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_shirt_purchase`
--

DROP TABLE IF EXISTS `customer_shirt_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_shirt_purchase` (
  `CustomerID` int NOT NULL,
  `ShirtID` int NOT NULL,
  `PurchaseID` int NOT NULL,
  PRIMARY KEY (`CustomerID`,`ShirtID`,`PurchaseID`),
  KEY `ShirtID` (`ShirtID`),
  KEY `PurchaseID` (`PurchaseID`),
  CONSTRAINT `customer_shirt_purchase_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`ID`),
  CONSTRAINT `customer_shirt_purchase_ibfk_2` FOREIGN KEY (`ShirtID`) REFERENCES `shirt` (`ShirtID`),
  CONSTRAINT `customer_shirt_purchase_ibfk_3` FOREIGN KEY (`PurchaseID`) REFERENCES `purchase` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_shirt_purchase`
--

LOCK TABLES `customer_shirt_purchase` WRITE;
/*!40000 ALTER TABLE `customer_shirt_purchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_shirt_purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase` (
  `ID` int NOT NULL,
  `ShirtID` int DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  `PurchaseDate` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_purchase_shirt` (`ShirtID`),
  KEY `fk_purchase_customer` (`CustomerID`),
  CONSTRAINT `fk_purchase_customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`ID`),
  CONSTRAINT `fk_purchase_shirt` FOREIGN KEY (`ShirtID`) REFERENCES `shirt` (`ShirtID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES (1,1,1,'2023-11-01'),(2,2,2,'2023-11-02'),(3,3,3,'2023-11-03'),(4,4,4,'2023-11-04'),(5,5,5,'2023-11-05');
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quality_control`
--

DROP TABLE IF EXISTS `quality_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quality_control` (
  `QualityControlID` int NOT NULL,
  `ShirtID` int DEFAULT NULL,
  `InspectionDate` date DEFAULT NULL,
  `QualityRating` int DEFAULT NULL,
  `QualityIssues` text,
  PRIMARY KEY (`QualityControlID`),
  KEY `ShirtID` (`ShirtID`),
  CONSTRAINT `quality_control_ibfk_1` FOREIGN KEY (`ShirtID`) REFERENCES `shirt` (`ShirtID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quality_control`
--

LOCK TABLES `quality_control` WRITE;
/*!40000 ALTER TABLE `quality_control` DISABLE KEYS */;
INSERT INTO `quality_control` VALUES (1,1,'2023-11-01',5,'No issues found during inspection'),(2,2,'2023-11-02',4,'Minor stitching issue detected'),(3,1,'2023-11-03',3,'Slight color fading'),(4,3,'2023-11-04',5,'Perfect quality, no issues'),(5,2,'2023-11-05',2,'Major quality problem, return required');
/*!40000 ALTER TABLE `quality_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quality_control_shirt`
--

DROP TABLE IF EXISTS `quality_control_shirt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quality_control_shirt` (
  `QualityControlID` int NOT NULL,
  `ShirtID` int NOT NULL,
  PRIMARY KEY (`QualityControlID`,`ShirtID`),
  KEY `ShirtID` (`ShirtID`),
  CONSTRAINT `quality_control_shirt_ibfk_1` FOREIGN KEY (`QualityControlID`) REFERENCES `quality_control` (`QualityControlID`),
  CONSTRAINT `quality_control_shirt_ibfk_2` FOREIGN KEY (`ShirtID`) REFERENCES `shirt` (`ShirtID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quality_control_shirt`
--

LOCK TABLES `quality_control_shirt` WRITE;
/*!40000 ALTER TABLE `quality_control_shirt` DISABLE KEYS */;
/*!40000 ALTER TABLE `quality_control_shirt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `returned`
--

DROP TABLE IF EXISTS `returned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `returned` (
  `ReturnID` int NOT NULL,
  `ShirtID` int DEFAULT NULL,
  `ReturnDate` date DEFAULT NULL,
  `ReasonForReturn` text,
  `ActionTaken` text,
  PRIMARY KEY (`ReturnID`),
  KEY `ShirtID` (`ShirtID`),
  CONSTRAINT `returned_ibfk_1` FOREIGN KEY (`ShirtID`) REFERENCES `shirt` (`ShirtID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returned`
--

LOCK TABLES `returned` WRITE;
/*!40000 ALTER TABLE `returned` DISABLE KEYS */;
INSERT INTO `returned` VALUES (1,1,'2023-11-10','Wrong size received','Replacement sent'),(2,3,'2023-11-12','Defective product','Refund issued'),(3,2,'2023-11-14','Color mismatch','Replacement sent'),(4,1,'2023-11-16','Not as described','Refund issued'),(5,4,'2023-11-18','Wrong item received','Replacement sent');
/*!40000 ALTER TABLE `returned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `returned_items_shirt`
--

DROP TABLE IF EXISTS `returned_items_shirt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `returned_items_shirt` (
  `ReturnID` int NOT NULL,
  `ShirtID` int NOT NULL,
  PRIMARY KEY (`ReturnID`,`ShirtID`),
  KEY `ShirtID` (`ShirtID`),
  CONSTRAINT `returned_items_shirt_ibfk_1` FOREIGN KEY (`ReturnID`) REFERENCES `returned` (`ReturnID`),
  CONSTRAINT `returned_items_shirt_ibfk_2` FOREIGN KEY (`ShirtID`) REFERENCES `shirt` (`ShirtID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returned_items_shirt`
--

LOCK TABLES `returned_items_shirt` WRITE;
/*!40000 ALTER TABLE `returned_items_shirt` DISABLE KEYS */;
/*!40000 ALTER TABLE `returned_items_shirt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shirt`
--

DROP TABLE IF EXISTS `shirt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shirt` (
  `ShirtID` int NOT NULL,
  `Size` varchar(10) DEFAULT NULL,
  `Color` varchar(20) DEFAULT NULL,
  `Deadline` date DEFAULT NULL,
  `YouTuberID` int DEFAULT NULL,
  `DesignPercentage` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`ShirtID`),
  KEY `fk_youtuber` (`YouTuberID`),
  CONSTRAINT `fk_youtuber` FOREIGN KEY (`YouTuberID`) REFERENCES `youtuber` (`YouTuberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shirt`
--

LOCK TABLES `shirt` WRITE;
/*!40000 ALTER TABLE `shirt` DISABLE KEYS */;
INSERT INTO `shirt` VALUES (1,'Medium','Blue','2023-11-10',1,50.50),(2,'Large','Red','2023-11-15',2,60.00),(3,'Small','Green','2023-11-12',3,45.50),(4,'XL','Black','2023-11-18',1,55.00),(5,'Medium','White','2023-11-14',2,70.50);
/*!40000 ALTER TABLE `shirt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shirt_cart`
--

DROP TABLE IF EXISTS `shirt_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shirt_cart` (
  `ShirtID` int NOT NULL,
  `CartID` int NOT NULL,
  PRIMARY KEY (`ShirtID`,`CartID`),
  KEY `CartID` (`CartID`),
  CONSTRAINT `shirt_cart_ibfk_1` FOREIGN KEY (`ShirtID`) REFERENCES `shirt` (`ShirtID`),
  CONSTRAINT `shirt_cart_ibfk_2` FOREIGN KEY (`CartID`) REFERENCES `cart` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shirt_cart`
--

LOCK TABLES `shirt_cart` WRITE;
/*!40000 ALTER TABLE `shirt_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shirt_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shirt_purchase`
--

DROP TABLE IF EXISTS `shirt_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shirt_purchase` (
  `ShirtID` int NOT NULL,
  `PurchaseID` int NOT NULL,
  PRIMARY KEY (`ShirtID`,`PurchaseID`),
  KEY `PurchaseID` (`PurchaseID`),
  CONSTRAINT `shirt_purchase_ibfk_1` FOREIGN KEY (`ShirtID`) REFERENCES `shirt` (`ShirtID`),
  CONSTRAINT `shirt_purchase_ibfk_2` FOREIGN KEY (`PurchaseID`) REFERENCES `purchase` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shirt_purchase`
--

LOCK TABLES `shirt_purchase` WRITE;
/*!40000 ALTER TABLE `shirt_purchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `shirt_purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `youtuber`
--

DROP TABLE IF EXISTS `youtuber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `youtuber` (
  `YouTuberID` int NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Channel` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`YouTuberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `youtuber`
--

LOCK TABLES `youtuber` WRITE;
/*!40000 ALTER TABLE `youtuber` DISABLE KEYS */;
INSERT INTO `youtuber` VALUES (1,'YouTubeStar1','Channel1'),(2,'YouTubeStar2','Channel2'),(3,'YouTubeStar3','Channel3'),(4,'YouTubeStar4','Channel4'),(5,'YouTubeStar5','Channel5');
/*!40000 ALTER TABLE `youtuber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `youtuber_endorsement`
--

DROP TABLE IF EXISTS `youtuber_endorsement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `youtuber_endorsement` (
  `YouTuberID` int NOT NULL,
  `ShirtID` int NOT NULL,
  PRIMARY KEY (`YouTuberID`,`ShirtID`),
  KEY `ShirtID` (`ShirtID`),
  CONSTRAINT `youtuber_endorsement_ibfk_1` FOREIGN KEY (`YouTuberID`) REFERENCES `youtuber` (`YouTuberID`),
  CONSTRAINT `youtuber_endorsement_ibfk_2` FOREIGN KEY (`ShirtID`) REFERENCES `shirt` (`ShirtID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `youtuber_endorsement`
--

LOCK TABLES `youtuber_endorsement` WRITE;
/*!40000 ALTER TABLE `youtuber_endorsement` DISABLE KEYS */;
/*!40000 ALTER TABLE `youtuber_endorsement` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-12 12:02:06
