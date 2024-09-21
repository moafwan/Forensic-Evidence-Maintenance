CREATE DATABASE  IF NOT EXISTS `dbmsmini` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbmsmini`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: dbmsmini
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `cases`
--

DROP TABLE IF EXISTS `cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cases` (
  `case_id` int NOT NULL,
  PRIMARY KEY (`case_id`),
  CONSTRAINT `cases_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `suspecttable` (`CASE_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases`
--

LOCK TABLES `cases` WRITE;
/*!40000 ALTER TABLE `cases` DISABLE KEYS */;
INSERT INTO `cases` VALUES (5),(17),(19),(21),(24),(25),(26),(27),(28),(29),(99),(299),(9988);
/*!40000 ALTER TABLE `cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evidence`
--

DROP TABLE IF EXISTS `evidence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evidence` (
  `cid` int DEFAULT NULL,
  `eid` int NOT NULL,
  `about_evidence` varchar(50) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evidence`
--

LOCK TABLES `evidence` WRITE;
/*!40000 ALTER TABLE `evidence` DISABLE KEYS */;
INSERT INTO `evidence` VALUES (2,1,'found  blood stains on floor','989876765'),(3,2,'found  blood stains on floor','989876765'),(1,3,'found hand marks ','99888899'),(1,8,'saw him fighting on street, and got some photos','9698517898'),(29,20,'found hand marks ','99888899'),(21,21,'found fingerprints on door handle','9686717816'),(29,29,'found hand marks ','989876765'),(1,99,'broken window','999999999'),(9876,987,'broken window','9686717816'),(1,990,'broken window','999999999'),(99,9900,'broken window','9686717816'),(9988,9988,'broken window','989876765');
/*!40000 ALTER TABLE `evidence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `officer`
--

DROP TABLE IF EXISTS `officer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `officer` (
  `officer_id` int NOT NULL AUTO_INCREMENT,
  `officername` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`officer_id`),
  UNIQUE KEY `username` (`officername`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `officer`
--

LOCK TABLES `officer` WRITE;
/*!40000 ALTER TABLE `officer` DISABLE KEYS */;
INSERT INTO `officer` VALUES (1,'officer','officer123');
/*!40000 ALTER TABLE `officer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suspecttable`
--

DROP TABLE IF EXISTS `suspecttable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suspecttable` (
  `CASE_ID` int NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `ADDRESS` varchar(50) DEFAULT NULL,
  `AADHAR_ID` varchar(20) NOT NULL,
  `CRIME` varchar(20) NOT NULL,
  `CRIME_DATE` date NOT NULL,
  PRIMARY KEY (`CASE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suspecttable`
--

LOCK TABLES `suspecttable` WRITE;
/*!40000 ALTER TABLE `suspecttable` DISABLE KEYS */;
INSERT INTO `suspecttable` VALUES (5,'affffffww','yourhome','1234444444','ragging','2021-01-15'),(17,'max','india,karnataka ,bangalore','aadhar:7877878','robbery','2024-03-01'),(19,'kamy','karnataka,mysore','aadhar:7877878','robbery','2024-03-16'),(21,'max','india,karnataka ,bangalore','aadhar:7877878','robbery','2024-03-01'),(24,'airrack','bangalore','78787878','murder','2024-03-20'),(25,'airrack','bangalore','78787878','murder','2024-03-20'),(26,'airrack','bangalore','78787878','murder','2024-03-20'),(27,'airrack','bangalore','78787878','murder','2024-03-20'),(28,'airrack','bangalore','78787878','murder','2024-03-20'),(29,'airrack','bangalore','78787878','murder','2024-03-20'),(99,'aiiran','bangaolroe','78787878','robbery','2024-03-29'),(299,'airrack','bangalore','78787878','murder','2024-03-20'),(9988,'ksi','london est.','998874322','fight','2024-07-17');
/*!40000 ALTER TABLE `suspecttable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'admin','admin123');
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

-- Dump completed on 2024-09-21 15:38:43
