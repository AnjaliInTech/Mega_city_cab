-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: db_megacity
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `rides`
--

DROP TABLE IF EXISTS `rides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rides` (
  `id` int NOT NULL AUTO_INCREMENT,
  `start_location` varchar(255) NOT NULL,
  `end_location` varchar(255) NOT NULL,
  `customer_username` varchar(255) NOT NULL,
  `rider_username` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `length_of_ride` double DEFAULT NULL,
  `ride_status` enum('REQUESTED','ASSIGNED','ACCEPTED','IN_PROGRESS','COMPLETED','CANCELLED') DEFAULT 'REQUESTED',
  `vehicle_type` enum('CAR','VAN','BUS') DEFAULT NULL,
  `vehicle_plate_number` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `ride_started_at` datetime DEFAULT NULL,
  `ride_ended_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rides`
--

LOCK TABLES `rides` WRITE;
/*!40000 ALTER TABLE `rides` DISABLE KEYS */;
INSERT INTO `rides` VALUES (2,'colombo','jaffna','customer','dilu',2250.00,15,'ASSIGNED','VAN','GH2065','0745689269',NULL,NULL,'2025-03-11 08:47:50'),(4,'colombo','Matale','customer',NULL,3000.00,20,'REQUESTED','VAN',NULL,NULL,NULL,NULL,'2025-03-12 08:58:08'),(5,'colombo','Matale','customer',NULL,4000.00,20,'REQUESTED','BUS',NULL,NULL,NULL,NULL,'2025-03-12 09:01:33'),(6,'Eppawala','Thalawa','customer',NULL,2250.00,15,'REQUESTED','VAN',NULL,NULL,NULL,NULL,'2025-03-12 18:14:33'),(7,'Eppawala','Thalawa','customer',NULL,6000.00,30,'REQUESTED','BUS',NULL,NULL,NULL,NULL,'2025-03-12 18:16:48'),(8,'Kandy','galle','customer','rider',5000.00,50,'ASSIGNED','CAR','45789656','0785678345',NULL,NULL,'2025-03-12 18:17:50'),(9,'Negombo','Malabe','arif',NULL,3000.00,30,'REQUESTED','CAR',NULL,NULL,NULL,NULL,'2025-03-14 16:21:33');
/*!40000 ALTER TABLE `rides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `nic` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('customer','rider','admin') NOT NULL,
  `vehicle_type` varchar(50) DEFAULT NULL,
  `vehicle_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nic` (`nic`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','562314','123asddf','02356891','admin123','admin123','admin',NULL,NULL),(2,'Customer','895623V','assdwr','0562389456','customer','customer123','customer',NULL,''),(3,'Customer1','89562356V','assdwrsdd','0564389456','customer1','customer1','customer',NULL,''),(4,'rider','568952476v','abbbb','0785678345','rider','rider123','rider','Car','45789656'),(5,'Diluka shehan','199756238','Kandy','0745689269','dilu','dilu','rider','Van','GH2065'),(6,'Danushika Arif','20035645v','Kalaniya','0758926123','arif','arif','customer',NULL,'');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-14 23:18:40
