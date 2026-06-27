-- MySQL dump 10.13  Distrib 8.0.44, for macos15 (arm64)
--
-- Host: localhost    Database: medical_db
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `doctor_id` int NOT NULL,
  `patient_id` int DEFAULT NULL,
  `date_time` datetime NOT NULL,
  `status` varchar(20) DEFAULT 'AVAILABLE',
  PRIMARY KEY (`id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (1,4,6,'2025-11-22 10:30:00','BOOKED'),(2,4,6,'2025-11-26 12:30:00','BOOKED'),(3,4,6,'2026-02-28 00:00:00','BOOKED');
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `user_id` int NOT NULL,
  `specialty` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (4,'Cardiologist'),(894,'Οφθαλμίατρος');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `user_id` int NOT NULL,
  `amka` varchar(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `amka` (`amka`),
  CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (6,'27272727'),(2,'28282828'),(7,'ZAP');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(256) NOT NULL,
  `salt` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=895 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9',NULL,'Super','Admin','ADMIN'),(2,'doc1','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4',NULL,'Doctoras','Doctoridis','PATIENT'),(4,'giatros1','44432afc977dc150ca2890b4aaf5a474bf64ba30c96e2e16bee821ff2a5f1e31',NULL,'Kwstas','Papadopoulos','DOCTOR'),(5,'asthenis1','48e01b77ea2e8f24ad230af76b8fa4c327ed3e620c9303c92cdb762852f17241',NULL,'Antwnis','Mpardanis','PATIENT'),(6,'antwnis1','35a92d47aeefaf966d82bd595652b14fbbdb6295935b6130ceeabedad2c453d3',NULL,'Antwnis','Mpardanis','PATIENT'),(7,'ZAP','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(8,'c:/Windows/system.ini','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(9,'c:\\Windows\\system.ini','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(10,'/etc/passwd','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(11,'/','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(12,'../../../../../../../../../../../../../../../../','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(13,'c:/','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(14,'c:\\','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(15,'WEB-INF/web.xml','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(16,'WEB-INF\\web.xml','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(17,'/WEB-INF/web.xml','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(18,'\\WEB-INF\\web.xml','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(19,'thishouldnotexistandhopefullyitwillnot','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(74,'http://www.google.com/','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(75,'http://www.google.com:80/','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(76,'http://www.google.com','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(77,'http://www.google.com/search?q=ZAP','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(78,'http://www.google.com:80/search?q=ZAP','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(79,'www.google.com/','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(80,'www.google.com:80/','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(81,'www.google.com','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(82,'www.google.com/search?q=ZAP','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(83,'www.google.com:80/search?q=ZAP','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(124,'() { :;}; /bin/sleep 15','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(131,'3121288149429827321.owasp.org','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(132,'https://3121288149429827321.owasp.org','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(133,'https://3121288149429827321%2eowasp%2eorg','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(134,'5;URL=\'https://3121288149429827321.owasp.org\'','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(135,'URL=\'http://3121288149429827321.owasp.org\'','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(136,'https://3121288149429827321.owasp.org/?ZAP','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(137,'5;URL=\'https://3121288149429827321.owasp.org/?ZAP\'','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(138,'https://\\3121288149429827321.owasp.org','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(139,'http://\\3121288149429827321.owasp.org','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(176,'<!--#EXEC cmd=\"ls /\"-->','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(177,'\"><!--#EXEC cmd=\"ls /\"--><','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(178,'<!--#EXEC cmd=\"dir \\\"-->','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(179,'\"><!--#EXEC cmd=\"dir \\\"--><','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(196,'0W45pz4p','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(197,'ZAP0W45pz4p','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(198,'\'\"<scrIpt>alert(1);</scRipt>','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(200,'\'\"<img src=x onerror=prompt()>','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(221,'zApPX0sS','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(227,'\'','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(228,'ZAP\'','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(229,'\"','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(230,'ZAP\"','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(231,';','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(232,'ZAP;','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(233,'\'(','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(234,'ZAP\'(','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(237,'ZAP AND 1=1 -- ','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(238,'ZAP AND 1=2 -- ','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(239,'ZAP OR 1=1 -- ','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(240,'ZAP\' AND \'1\'=\'1\' -- ','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(241,'ZAP\' AND \'1\'=\'2\' -- ','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(242,'ZAP\' OR \'1\'=\'1\' -- ','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(243,'ZAP UNION ALL select NULL -- ','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(244,'ZAP\' UNION ALL select NULL -- ','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(245,'ZAP\" UNION ALL select NULL -- ','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(246,'ZAP) UNION ALL select NULL -- ','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(247,'ZAP\') UNION ALL select NULL -- ','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(337,'ZAP / sleep(15) ','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(338,'ZAP\' / sleep(15) / \'','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(339,'ZAP\" / sleep(15) / \"','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(340,'ZAP and 0 in (select sleep(15) ) -- ','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(341,'ZAP\' and 0 in (select sleep(15) ) -- ','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(342,'ZAP\" and 0 in (select sleep(15) ) -- ','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(343,'ZAP where 0 in (select sleep(15) ) -- ','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(344,'ZAP\' where 0 in (select sleep(15) ) -- ','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(345,'ZAP\" where 0 in (select sleep(15) ) -- ','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(346,'ZAP or 0 in (select sleep(15) ) -- ','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(387,'\"java.lang.Thread.sleep\"(15000)','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(388,'ZAP / \"java.lang.Thread.sleep\"(15000) ','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(389,'ZAP\' / \"java.lang.Thread.sleep\"(15000) / \'','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(390,'ZAP\" / \"java.lang.Thread.sleep\"(15000) / \"','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(419,'(DBMS_SESSION.SLEEP(15))','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(420,'ZAP / (DBMS_SESSION.SLEEP(15)) ','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(421,'ZAP\' / (DBMS_SESSION.SLEEP(15)) / \'','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(422,'ZAP\" / (DBMS_SESSION.SLEEP(15)) / \"','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(423,'ZAP and exists (DBMS_SESSION.SLEEP(15)) -- ','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(454,'ZAP WAITFOR DELAY \'0:0:15\' -- ','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(455,'ZAP\' WAITFOR DELAY \'0:0:15\' -- ','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(456,'ZAP\" WAITFOR DELAY \'0:0:15\' -- ','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(457,'ZAP) WAITFOR DELAY \'0:0:15\' -- ','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(458,'ZAP) \' WAITFOR DELAY \'0:0:15\' -- ','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(459,'ZAP) \" WAITFOR DELAY \'0:0:15\' -- ','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(460,'ZAP)) WAITFOR DELAY \'0:0:15\' -- ','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(461,'ZAP)) \' WAITFOR DELAY \'0:0:15\' -- ','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(462,'ZAP)) \" WAITFOR DELAY \'0:0:15\' -- ','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(463,'ZAP) WAITFOR DELAY \'0:0:15\' (','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(505,'\"+response.write(847,816*340,679)+\"','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(506,'+response.write({0}*{1})+','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(507,'response.write(847,816*340,679)','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(530,'cat /etc/passwd','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(531,'ZAP&cat /etc/passwd&','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(532,'ZAP;cat /etc/passwd;','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(533,'ZAP\"&cat /etc/passwd&\"','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(534,'ZAP\";cat /etc/passwd;\"','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(535,'ZAP\'&cat /etc/passwd&\'','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(536,'ZAP\';cat /etc/passwd;\'','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(537,'type %SYSTEMROOT%\\win.ini','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(538,'ZAP&type %SYSTEMROOT%\\win.ini','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(539,'ZAP|type %SYSTEMROOT%\\win.ini','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(540,'ZAP\"&type %SYSTEMROOT%\\win.ini&\"','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(541,'ZAP\"|type %SYSTEMROOT%\\win.ini','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(542,'ZAP\'&type %SYSTEMROOT%\\win.ini&\'','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(543,'ZAP\'|type %SYSTEMROOT%\\win.ini','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(544,'get-help','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(545,'ZAP;get-help','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(546,'ZAP\";get-help','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(547,'ZAP\';get-help','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(548,'ZAP;get-help #','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(625,'\"\'','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(626,'<!--','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(627,']]>','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(640,'zj 6984*5833 zj','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(641,'zj{2429*6378}zj','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(642,'zj${7927*6997}zj','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(643,'zj#{6191*3712}zj','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(644,'zj{#2508*4384}zj','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(645,'zj{@8174*3251}zj','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(646,'zj{{3663*6982}}zj','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(647,'zj{{=5987*2701}}zj','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(648,'zj<%=9241*4176%>zj','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(649,'zj#set($x=2806*7239)${x}zj','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(650,'zj<p th:text=\"${4550*4065}\"></p>zj','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(651,'zj{{96720|add:58630}}zj','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(652,'zj{{print \"7121\" \"9345\"}}zj','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(707,'<%=%x(sleep 15)%>','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(708,'#{%x(sleep 15)}','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(709,'{system(\"sleep 15\")}','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(740,'ZAP&sleep 15.0&','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(741,'ZAP;sleep 15.0;','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(742,'ZAP\"&sleep 15.0&\"','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(743,'ZAP\";sleep 15.0;\"','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(744,'ZAP\'&sleep 15.0&\'','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(745,'ZAP\';sleep 15.0;\'','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(746,'ZAP&timeout /T 15.0','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(747,'ZAP|timeout /T 15.0','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(748,'ZAP\"&timeout /T 15.0&\"','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(749,'ZAP\"|timeout /T 15.0','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(750,'ZAP\'&timeout /T 15.0&\'','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(751,'ZAP\'|timeout /T 15.0','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(752,'ZAP;start-sleep -s 15.0','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(753,'ZAP\";start-sleep -s 15.0','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(754,'ZAP\';start-sleep -s 15.0','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(755,'ZAP;start-sleep -s 15.0 #','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(846,'','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(847,'@','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(848,'+','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(850,'|','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(876,'<','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(877,'system-property(\'xsl:vendor\')/>','94f173f4b39c02cbc426a652756eab754b9c2c67bd9c3b4efcbbc90edea005a4',NULL,'ZAP','ZAP','PATIENT'),(894,'Iatros1','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f',NULL,'Iatros','Iatropoulos','DOCTOR');
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

-- Dump completed on 2026-01-17  5:49:48
