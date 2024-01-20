-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: mysqlproject
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `CAT_ID` int NOT NULL,
  `CAT_NAME` varchar(20) NOT NULL,
  PRIMARY KEY (`CAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Books'),(2,'Games'),(3,'Groceries'),(4,'Electronics'),(5,'Clothes');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CUS_ID` int NOT NULL,
  `CUS_NAME` varchar(20) DEFAULT NULL,
  `CUS_PHONE` varchar(10) NOT NULL,
  `CUS_CITY` varchar(30) NOT NULL,
  `CUS_GENDER` char(1) DEFAULT NULL,
  PRIMARY KEY (`CUS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Aakash','9999999999','Delhi','M'),(2,'Aman','9785463215','Noida','M'),(3,'Neha','9999999999','Mumbai','F'),(4,'Megha','9994562399','Kolkata','F'),(5,'Pulkit','7895999999','Lucknow','M');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `ORD_ID` int NOT NULL,
  `ORD_AMOUNT` int NOT NULL,
  `ORD_DATE` date NOT NULL,
  `CUS_ID` int DEFAULT NULL,
  `PRICING_ID` int DEFAULT NULL,
  PRIMARY KEY (`ORD_ID`),
  KEY `CUS_ID` (`CUS_ID`),
  KEY `PRICING_ID` (`PRICING_ID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CUS_ID`) REFERENCES `customer` (`CUS_ID`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`PRICING_ID`) REFERENCES `supplier_pricing` (`PRICING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (101,1500,'2021-10-06',2,1),(102,1000,'2021-10-12',3,5),(103,30000,'2021-10-16',5,2),(104,1500,'2021-10-05',1,1),(105,3000,'2021-10-16',4,3),(106,1450,'2021-10-18',1,9),(107,789,'2021-10-01',3,7),(108,780,'2021-10-07',5,6),(109,3000,'2021-10-10',5,3),(110,2500,'2021-10-10',2,4),(111,1000,'2021-10-15',4,5),(112,789,'2021-10-16',4,7),(113,31000,'2021-10-16',1,8),(114,1000,'2021-10-16',3,5),(115,3000,'2021-10-16',5,3),(116,99,'2021-10-17',2,14);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `PRO_ID` int NOT NULL,
  `PRO_NAME` varchar(20) NOT NULL DEFAULT 'Dummy',
  `PRO_DESC` varchar(60) DEFAULT NULL,
  `CAT_ID` int DEFAULT NULL,
  PRIMARY KEY (`PRO_ID`),
  KEY `CAT_ID` (`CAT_ID`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`CAT_ID`) REFERENCES `category` (`CAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'GTA V','Windows 7 and above with i5 processor and 8GB RAM',2),(2,'TSHIRT','SIZE-L with Black, Blue and White variations',5),(3,'ROG LAPTOP','Windows 10 with 15-inch screen, i7 processor, 1TB SSD',4),(4,'OATS','Highly Nutritious from Nestle',3),(5,'HARRY POTTER','Best Collection of all time by J.K Rowling',1),(6,'MILK','1L Toned Milk',3),(7,'Boat Earphones','1.5Meter long Dolby Atmos',4),(8,'Jeans','Stretchable Denim Jeans with various sizes and color',5),(9,'Project IGI','Compatible with Windows 7 and above',2),(10,'Hoodie','Black GUCCI for 13 yrs and above',5),(11,'Rich Dad Poor Dad','Written by Robert Kiyosaki',1),(12,'Train Your Brain','By Shireen Stephen',1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `RAT_ID` int NOT NULL,
  `ORD_ID` int DEFAULT NULL,
  `RAT_RATSTARS` int NOT NULL,
  PRIMARY KEY (`RAT_ID`),
  KEY `ORD_ID` (`ORD_ID`),
  CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`ORD_ID`) REFERENCES `orders` (`ORD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,101,4),(2,102,3),(3,103,1),(4,104,2),(5,105,4),(6,106,3),(7,107,4),(8,108,4),(9,109,3),(10,110,5),(11,111,3),(12,112,4),(13,113,2),(14,114,1),(15,115,1),(16,116,0);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `SUPP_ID` int NOT NULL,
  `SUPP_NAME` varchar(50) NOT NULL,
  `SUPP_CITY` varchar(50) NOT NULL,
  `SUPP_PHONE` varchar(50) NOT NULL,
  PRIMARY KEY (`SUPP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Rajesh Retails','Delhi','1234567890'),(2,'Appario Ltd','Mumbai','2589631470'),(3,'Knome products','Bangalore','9785462315'),(4,'Bansal Retails','Kochi','8975463285'),(5,'Mittal Ltd','Lucknow','7898456532');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_pricing`
--

DROP TABLE IF EXISTS `supplier_pricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier_pricing` (
  `PRICING_ID` int NOT NULL,
  `PRO_ID` int DEFAULT NULL,
  `SUPP_ID` int DEFAULT NULL,
  `SUPP_PRICE` int DEFAULT '0',
  PRIMARY KEY (`PRICING_ID`),
  KEY `PRO_ID` (`PRO_ID`),
  KEY `SUPP_ID` (`SUPP_ID`),
  CONSTRAINT `supplier_pricing_ibfk_1` FOREIGN KEY (`PRO_ID`) REFERENCES `product` (`PRO_ID`),
  CONSTRAINT `supplier_pricing_ibfk_2` FOREIGN KEY (`SUPP_ID`) REFERENCES `supplier` (`SUPP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_pricing`
--

LOCK TABLES `supplier_pricing` WRITE;
/*!40000 ALTER TABLE `supplier_pricing` DISABLE KEYS */;
INSERT INTO `supplier_pricing` VALUES (1,1,2,1500),(2,3,5,30000),(3,5,1,3000),(4,2,3,2500),(5,4,1,1000),(6,12,2,780),(7,12,4,789),(8,3,1,31000),(9,1,5,1450),(10,4,2,999),(11,7,3,549),(12,7,4,529),(13,6,2,105),(14,6,1,99),(15,2,5,2999),(16,5,2,2999);
/*!40000 ALTER TABLE `supplier_pricing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mysqlproject'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-20 23:37:02
