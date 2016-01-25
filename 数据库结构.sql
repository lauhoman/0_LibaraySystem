CREATE DATABASE  IF NOT EXISTS `bookmis` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bookmis`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: bookmis
-- ------------------------------------------------------
-- Server version	5.5.36

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `userID` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`userID`,`password`),
  UNIQUE KEY `userID_UNIQUE` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('root','950609');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_category`
--

DROP TABLE IF EXISTS `book_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_category` (
  `category_id` varchar(5) NOT NULL DEFAULT '',
  `category` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_category`
--

LOCK TABLES `book_category` WRITE;
/*!40000 ALTER TABLE `book_category` DISABLE KEYS */;
INSERT INTO `book_category` VALUES ('ca01','计算机'),('ca02','农林'),('ca03','医学'),('ca04','科普'),('ca05','通信'),('ca06','建筑');
/*!40000 ALTER TABLE `book_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `book_id` varchar(5) NOT NULL,
  `book_name` varchar(50) NOT NULL,
  `author` varchar(20) DEFAULT NULL,
  `publishing` varchar(20) DEFAULT NULL,
  `category_id` varchar(5) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `date_in` date DEFAULT NULL,
  `quantity_in` int(11) NOT NULL,
  `quantity_out` int(11) NOT NULL,
  `quantity_loss` int(11) NOT NULL,
  PRIMARY KEY (`book_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES ('b001','图像处理','王一','北京大学出版社','ca01',21,'2010-03-07',10,3,0),('b002','苏州园林艺术','李白','清华大学出版社','ca06',40,'2010-05-17',8,2,0),('b003','神奇的宇宙','刘立','清华大学出版社','ca04',18,'2009-12-09',5,0,0),('b004','通讯原理','张扬','邮电出版社','ca05',38,'2010-02-23',11,1,0),('b005','肿瘤防治','李小明','人民卫生出版社','ca03',16,'2009-04-05',4,0,1),('b006','海参养殖技术','王平','中国农业出版社','ca02',11,'2010-08-01',3,1,0),('b007','操作系统','陈东','武汉大学出版社','ca01',32,'2010-06-13',8,0,0),('b008','微积分','kaka','北交大出版社','ca01',16,'2015-12-21',1,0,0),('b009','线性代数','ddd','北交大出版社','ca04',44,'2015-12-21',4,1,0);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrow`
--

DROP TABLE IF EXISTS `borrow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrow` (
  `reader_id` varchar(5) NOT NULL,
  `book_id` varchar(5) NOT NULL,
  `date_borrow` date NOT NULL,
  `date_return` date DEFAULT NULL,
  `loss` char(2) NOT NULL,
  PRIMARY KEY (`reader_id`,`book_id`),
  KEY `book_id` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrow`
--

LOCK TABLES `borrow` WRITE;
/*!40000 ALTER TABLE `borrow` DISABLE KEYS */;
INSERT INTO `borrow` VALUES ('r001','b001','2010-08-02','2010-09-02','否'),('r001','b002','2010-08-02','2010-09-02','否'),('r001','b003','2010-06-24','2010-08-24','否'),('r001','b004','2015-12-08','2015-12-09','否'),('r001','b006','2010-08-02','2015-12-09','否'),('r001','b008','2015-12-21',NULL,'否'),('r002','b005','2015-12-08','2015-12-09','是'),('r002','b006','2010-07-09','2010-08-09','否'),('r002','b008','2015-12-21','2015-12-21','否'),('r004','b001','2010-08-02','2010-11-02','否'),('r004','b002','2010-08-10','2010-09-10','否'),('r004','b003','2010-08-02','2010-11-02','否'),('r004','b006','2010-08-10','2010-09-10','否'),('r005','b001','2015-06-24','2015-07-24','否'),('r005','b009','2015-12-21',NULL,'否'),('r006','b001','2010-08-10','2010-09-10','否'),('r006','b004','2015-11-12','2015-12-09','否'),('r009','b008','2015-12-21','2015-12-21','否'),('r111','b004','2015-12-21',NULL,'否');
/*!40000 ALTER TABLE `borrow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loss_card`
--

DROP TABLE IF EXISTS `loss_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loss_card` (
  `reader_id` varchar(5) NOT NULL,
  `reader_name` varchar(20) DEFAULT NULL,
  `sex` char(2) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `card_name` varchar(8) DEFAULT NULL,
  `card_id` varchar(18) DEFAULT NULL,
  `level` varchar(6) DEFAULT NULL,
  `day` date DEFAULT NULL,
  `password` varchar(45) DEFAULT '123456',
  PRIMARY KEY (`reader_id`),
  KEY `level_idx` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loss_card`
--

LOCK TABLES `loss_card` WRITE;
/*!40000 ALTER TABLE `loss_card` DISABLE KEYS */;
INSERT INTO `loss_card` VALUES ('r001','李铭','男','1988-03-07','62127790','13671100110','身份证','230106198803070178','普通','2010-08-01','123456'),('r002','刘晓铭','男','1990-08-09','84778123','13671007896','身份证','210103199008094326','普通','2010-08-10','123456');
/*!40000 ALTER TABLE `loss_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_level`
--

DROP TABLE IF EXISTS `member_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_level` (
  `level` varchar(6) NOT NULL,
  `days` smallint(6) NOT NULL,
  `numbers` smallint(6) NOT NULL,
  `fee` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_level`
--

LOCK TABLES `member_level` WRITE;
/*!40000 ALTER TABLE `member_level` DISABLE KEYS */;
INSERT INTO `member_level` VALUES ('普通',30,2,20),('金卡',90,5,100),('银卡',60,3,50);
/*!40000 ALTER TABLE `member_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `readers`
--

DROP TABLE IF EXISTS `readers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `readers` (
  `reader_id` varchar(5) NOT NULL,
  `reader_name` varchar(20) DEFAULT NULL,
  `sex` char(2) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `card_name` varchar(8) DEFAULT NULL,
  `card_id` varchar(18) DEFAULT NULL,
  `level` varchar(6) DEFAULT NULL,
  `day` date DEFAULT NULL,
  `password` varchar(45) DEFAULT '123456',
  PRIMARY KEY (`reader_id`),
  KEY `level_idx` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `readers`
--

LOCK TABLES `readers` WRITE;
/*!40000 ALTER TABLE `readers` DISABLE KEYS */;
INSERT INTO `readers` VALUES ('r003','李明','男','2001-02-21','84900581','13901020111','身份证','230106200102216634','普通','2010-08-10','123456'),('r004','张鹰','女','1970-11-12','83151118','13812669002','身份证','440301199506094118','金卡','2010-08-10','123456'),('r005','刘竟静','女','1999-10-07','83151117','13756705671','身份证','230106199910070766','普通','2010-08-10','123456'),('r006','刘成刚','男','1995-05-18','88764245','13683304305','身份证','230106199005180842','银卡','2010-08-10','123456'),('r007','王铭','男','2001-09-24','52345614','13901229706','身份证','230106200109247092','普通','2010-08-10','123456'),('r008','宣明尼','女','1998-08-25','52573253','15851327667','身份证','230106199808258261','普通','2010-08-10','123456'),('r009','柳红利','女','1995-06-09','52682823','15810034321','身份证','230106199707095578','普通','2010-08-10','123456');
/*!40000 ALTER TABLE `readers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-23 20:31:43
