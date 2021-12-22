-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: daugiatructuyen
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `idAdmin` int NOT NULL AUTO_INCREMENT,
  `nameAdmin` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`idAdmin`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','123');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auction`
--

DROP TABLE IF EXISTS `auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auction` (
  `idUser` int NOT NULL,
  `idProduct` int NOT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `priceBidder` int NOT NULL,
  PRIMARY KEY (`idProduct`,`idUser`),
  KEY `id_product_idx` (`idProduct`),
  KEY `idBidder_idx` (`idUser`),
  CONSTRAINT `idProduct` FOREIGN KEY (`idProduct`) REFERENCES `products` (`idProduct`),
  CONSTRAINT `idUser` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auction`
--

LOCK TABLES `auction` WRITE;
/*!40000 ALTER TABLE `auction` DISABLE KEYS */;
/*!40000 ALTER TABLE `auction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `idCategory` int NOT NULL AUTO_INCREMENT,
  `nameCategory` varchar(100) NOT NULL,
  PRIMARY KEY (`idCategory`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Phone'),(2,'Laptop'),(3,'Tablet'),(4,'Camera'),(5,'Perfume');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `idUser` int NOT NULL,
  `permission` int NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  PRIMARY KEY (`idUser`),
  KEY `idUser_idx` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (70,1,'2021-12-21','2021-12-28');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `idProduct` int NOT NULL AUTO_INCREMENT,
  `idCategory` int NOT NULL,
  `nameProduct` varchar(100) NOT NULL,
  `price` int NOT NULL,
  `detail` varchar(500) NOT NULL,
  `quantity` int NOT NULL,
  `priceStep` int NOT NULL,
  `image` text,
  `createdDate` datetime DEFAULT NULL,
  `timeRemaining` datetime DEFAULT NULL,
  `bidder` varchar(45) DEFAULT NULL,
  `timeInserted` int DEFAULT NULL,
  PRIMARY KEY (`idProduct`),
  KEY `id_category_idx` (`idCategory`),
  CONSTRAINT `id_category` FOREIGN KEY (`idCategory`) REFERENCES `categories` (`idCategory`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,'Iphone 12 64GB',1000000,'a',2,100000,NULL,'2021-12-21 00:00:00','2021-12-21 00:00:00','phuc',100),(2,1,'Samsung A32',700000,'a',1,50000,NULL,'2021-12-21 00:00:00','2021-12-21 00:00:00','tram',210),(3,1,'Vivo Y20',50000,'a',3,25000,NULL,'2021-12-21 00:00:00','2021-12-21 00:00:00','nhut',150),(4,1,'Iphone 13 Pro Max',3000000,'a',1,100000,NULL,'2021-12-21 00:00:00','2021-12-21 00:00:00','huy',350),(5,1,'Oppo Reno 5',900000,'a',2,50000,NULL,'2021-12-21 00:00:00','2021-12-21 00:00:00','phuc',100),(6,2,'Laptop MSI Modern 14 B10MW 636VN',1500000,'a',1,150000,NULL,'2021-12-21 00:00:00','2021-12-21 00:00:00','tram',16),(7,2,'Laptop Dell Inspiron N3501 i5 1135G7',1300000,'a',1,200000,NULL,'2021-12-21 00:00:00','2021-12-21 00:00:00','nhut',34),(8,3,'Samsung Galaxy Tab A7 Lite',350000,'a',2,150000,NULL,'2021-12-21 00:00:00','2021-12-21 00:00:00','huy',56),(9,4,'Camera Sony Handy ',2500000,'a',1,250000,NULL,'2021-12-21 00:00:00','2021-12-21 00:00:00','phuc',37),(10,4,'Camera Canon',3000000,'a',1,350000,NULL,'2021-12-21 00:00:00','2021-12-21 00:00:00','tram',12),(11,5,'Nước hoa Coco Chanel',300000,'a',2,50000,NULL,'2021-12-21 00:00:00','2021-12-21 00:00:00','nhut',56),(12,5,'Nước hoa Charme Luxury',150000,'a',3,50000,NULL,'2021-12-21 00:00:00','2021-12-21 00:00:00','huy',67);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `idUser` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `dob` datetime NOT NULL,
  `point` int NOT NULL,
  `role` int NOT NULL,
  `queue` int NOT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (70,'hoangphuc','$2a$12$mx.L7fi/lGSg4eOAjG4/gOIAr8xA1Ry3EXZ3KOXXjTPoHlhXopPb2','Nguyen Hoang Phuc','ngphuc.2808@gmail.com','585/40/4 Nguyen Thi Thap','2001-08-28 00:00:00',0,1,1),(71,'hoangphuc2','$2a$12$tOju187wFSKeSZiLeBZoB.zp/4AF0MGs9KazCB7JwKP8T1mxYjFeu','Nguyen Hoang Phuc','ngphuc@gmail.com','585/40/4 Nguyen Thi Thap','2001-08-28 00:00:00',0,0,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `updatePermission` AFTER UPDATE ON `users` FOR EACH ROW BEGIN
    IF  new.queue > 0 THEN INSERT INTO permission (idUser, permission, startDate, endDate) VALUES (new.idUser, new.queue, curdate(), curdate() + interval 7 day);
	ELSE DELETE FROM permission WHERE permission.idUser = new.idUser;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'daugiatructuyen'
--

--
-- Dumping routines for database 'daugiatructuyen'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-22 18:42:30
