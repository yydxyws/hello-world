-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (arm64)
--
-- Host: localhost    Database: shop
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `会员信息表`
--

DROP TABLE IF EXISTS `会员信息表`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `会员信息表` (
  `会员编号` int NOT NULL AUTO_INCREMENT,
  `姓名` text NOT NULL,
  `密码` char(20) NOT NULL,
  `电话` text,
  `积分` int DEFAULT NULL,
  PRIMARY KEY (`会员编号`),
  UNIQUE KEY `会员编号索引` (`会员编号`)
) ENGINE=InnoDB AUTO_INCREMENT=100004 DEFAULT CHARSET=gb2312;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `会员信息表`
--

LOCK TABLES `会员信息表` WRITE;
/*!40000 ALTER TABLE `会员信息表` DISABLE KEYS */;
INSERT INTO `会员信息表` VALUES (100000,'李刚','223456','13029579891',0),(100001,'陈明','323456','13019579891',1),(100002,'陈志','423456','13719579891',2000),(100003,'张力','523456','13729579891',666);
/*!40000 ALTER TABLE `会员信息表` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `会员订单视图`
--

DROP TABLE IF EXISTS `会员订单视图`;
/*!50001 DROP VIEW IF EXISTS `会员订单视图`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `会员订单视图` AS SELECT 
 1 AS `会员编号`,
 1 AS `姓名`,
 1 AS `订单编号`,
 1 AS `订单状态`,
 1 AS `商品编号`,
 1 AS `购买数量`,
 1 AS `订单日期`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `会员购物车视图`
--

DROP TABLE IF EXISTS `会员购物车视图`;
/*!50001 DROP VIEW IF EXISTS `会员购物车视图`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `会员购物车视图` AS SELECT 
 1 AS `会员编号`,
 1 AS `姓名`,
 1 AS `购物车编号`,
 1 AS `商品编号`,
 1 AS `商品数量`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `商品信息表`
--

DROP TABLE IF EXISTS `商品信息表`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `商品信息表` (
  `商品编号` int NOT NULL,
  `名称` text NOT NULL,
  `价格` decimal(8,2) DEFAULT NULL,
  `上架数量` int NOT NULL,
  `销售商` text,
  PRIMARY KEY (`商品编号`),
  UNIQUE KEY `商品编号索引` (`商品编号`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `商品信息表`
--

LOCK TABLES `商品信息表` WRITE;
/*!40000 ALTER TABLE `商品信息表` DISABLE KEYS */;
INSERT INTO `商品信息表` VALUES (100005,'香烟',35.00,20,'中南海'),(100010,'毛台',400.00,20,'贵酒集团'),(102002,'huaweiPro30',4999.00,25,'菊厂'),(200010,'炸鸡',25.00,100,'金拱门'),(200011,'辣椒酱',12.20,20,'老干爹'),(200014,'饼干',5.50,40,'轻食'),(201002,'方便面',2.50,100,'康帅傅'),(303001,'羽绒服',300.00,30,'波4登'),(400055,'手机',1999.00,30,'大米');
/*!40000 ALTER TABLE `商品信息表` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `库存信息表`
--

DROP TABLE IF EXISTS `库存信息表`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `库存信息表` (
  `库存编号` int NOT NULL AUTO_INCREMENT,
  `商品编号` int NOT NULL,
  `库存数量` int NOT NULL,
  `名称` text NOT NULL,
  `价格` decimal(8,2) DEFAULT NULL,
  `销售商` text,
  `进价` decimal(8,2) DEFAULT NULL,
  `雇员编号` int NOT NULL,
  `进货日期` datetime NOT NULL,
  PRIMARY KEY (`库存编号`),
  KEY `FK_库存信息表_REFRENCE_商品信息表` (`商品编号`),
  KEY `FK_库存信息表_REFRENCE_雇员信息表` (`雇员编号`),
  CONSTRAINT `FK_库存信息表_REFRENCE_商品信息表` FOREIGN KEY (`商品编号`) REFERENCES `商品信息表` (`商品编号`),
  CONSTRAINT `FK_库存信息表_REFRENCE_雇员信息表` FOREIGN KEY (`雇员编号`) REFERENCES `雇员信息表` (`雇员编号`)
) ENGINE=InnoDB AUTO_INCREMENT=1000002 DEFAULT CHARSET=gb2312;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `库存信息表`
--

LOCK TABLES `库存信息表` WRITE;
/*!40000 ALTER TABLE `库存信息表` DISABLE KEYS */;
INSERT INTO `库存信息表` VALUES (1000000,100010,100,'毛台',400.00,'贵酒集团',200.00,10000,'2023-02-12 19:56:09');
/*!40000 ALTER TABLE `库存信息表` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `订单信息表`
--

DROP TABLE IF EXISTS `订单信息表`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `订单信息表` (
  `订单编号` int NOT NULL AUTO_INCREMENT,
  `会员编号` int NOT NULL,
  `订单日期` datetime NOT NULL,
  `最后总价` decimal(8,2) NOT NULL,
  `订单状态` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`订单编号`),
  KEY `FK_订单信息表_REFRENCE_会员信息表` (`会员编号`),
  CONSTRAINT `FK_订单信息表_REFRENCE_会员信息表` FOREIGN KEY (`会员编号`) REFERENCES `会员信息表` (`会员编号`)
) ENGINE=InnoDB AUTO_INCREMENT=1000000 DEFAULT CHARSET=gb2312;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `订单信息表`
--

LOCK TABLES `订单信息表` WRITE;
/*!40000 ALTER TABLE `订单信息表` DISABLE KEYS */;
/*!40000 ALTER TABLE `订单信息表` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `订单详情表`
--

DROP TABLE IF EXISTS `订单详情表`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `订单详情表` (
  `订单编号` int NOT NULL,
  `商品编号` int NOT NULL,
  `购买数量` int NOT NULL,
  `价格` decimal(8,2) DEFAULT NULL,
  KEY `FK_订单详情表_REFRENCE_商品信息表` (`商品编号`),
  KEY `FK_订单详情表_REFRENCE_订单信息表` (`订单编号`),
  CONSTRAINT `FK_订单详情表_REFRENCE_商品信息表` FOREIGN KEY (`商品编号`) REFERENCES `商品信息表` (`商品编号`),
  CONSTRAINT `FK_订单详情表_REFRENCE_订单信息表` FOREIGN KEY (`订单编号`) REFERENCES `订单信息表` (`订单编号`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `订单详情表`
--

LOCK TABLES `订单详情表` WRITE;
/*!40000 ALTER TABLE `订单详情表` DISABLE KEYS */;
/*!40000 ALTER TABLE `订单详情表` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `购物车信息表`
--

DROP TABLE IF EXISTS `购物车信息表`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `购物车信息表` (
  `购物车编号` int NOT NULL AUTO_INCREMENT,
  `会员编号` int NOT NULL,
  `当前总价` decimal(8,2) NOT NULL,
  PRIMARY KEY (`购物车编号`),
  KEY `FK_购物车信息表_REFRENCE_会员信息表` (`会员编号`),
  CONSTRAINT `FK_购物车信息表_REFRENCE_会员信息表` FOREIGN KEY (`会员编号`) REFERENCES `会员信息表` (`会员编号`)
) ENGINE=InnoDB AUTO_INCREMENT=1000000 DEFAULT CHARSET=gb2312;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `购物车信息表`
--

LOCK TABLES `购物车信息表` WRITE;
/*!40000 ALTER TABLE `购物车信息表` DISABLE KEYS */;
/*!40000 ALTER TABLE `购物车信息表` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `购物车详情表`
--

DROP TABLE IF EXISTS `购物车详情表`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `购物车详情表` (
  `购物车编号` int NOT NULL,
  `商品编号` int NOT NULL,
  `商品数量` int NOT NULL,
  `价格` decimal(8,2) DEFAULT NULL,
  KEY `FK_购物车详情表_REFRENCE_商品信息表` (`商品编号`),
  KEY `FK_购物车详情表_REFRENCE_购物车信息表` (`购物车编号`),
  CONSTRAINT `FK_购物车详情表_REFRENCE_商品信息表` FOREIGN KEY (`商品编号`) REFERENCES `商品信息表` (`商品编号`),
  CONSTRAINT `FK_购物车详情表_REFRENCE_购物车信息表` FOREIGN KEY (`购物车编号`) REFERENCES `购物车信息表` (`购物车编号`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `购物车详情表`
--

LOCK TABLES `购物车详情表` WRITE;
/*!40000 ALTER TABLE `购物车详情表` DISABLE KEYS */;
/*!40000 ALTER TABLE `购物车详情表` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `销售情况视图`
--

DROP TABLE IF EXISTS `销售情况视图`;
/*!50001 DROP VIEW IF EXISTS `销售情况视图`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `销售情况视图` AS SELECT 
 1 AS `商品编号`,
 1 AS `购买数量`,
 1 AS `订单日期`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `雇员信息表`
--

DROP TABLE IF EXISTS `雇员信息表`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `雇员信息表` (
  `雇员编号` int NOT NULL AUTO_INCREMENT,
  `雇员姓名` text NOT NULL,
  `雇员密码` char(20) NOT NULL,
  `雇员电话` text,
  `工资` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`雇员编号`),
  UNIQUE KEY `雇员编号索引` (`雇员编号`)
) ENGINE=InnoDB AUTO_INCREMENT=10002 DEFAULT CHARSET=gb2312;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `雇员信息表`
--

LOCK TABLES `雇员信息表` WRITE;
/*!40000 ALTER TABLE `雇员信息表` DISABLE KEYS */;
INSERT INTO `雇员信息表` VALUES (10000,'张三','hhjbjkdsjkhbj','110',2500.00),(10001,'李四','dbhvhj','120',3000.00);
/*!40000 ALTER TABLE `雇员信息表` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `会员订单视图`
--

/*!50001 DROP VIEW IF EXISTS `会员订单视图`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `会员订单视图` (`会员编号`,`姓名`,`订单编号`,`订单状态`,`商品编号`,`购买数量`,`订单日期`) AS select `订单信息表`.`会员编号` AS `会员编号`,`会员信息表`.`姓名` AS `姓名`,`订单信息表`.`订单编号` AS `订单编号`,`订单信息表`.`订单状态` AS `订单状态`,`订单详情表`.`商品编号` AS `商品编号`,`订单详情表`.`购买数量` AS `购买数量`,`订单信息表`.`订单日期` AS `订单日期` from ((`订单信息表` join `会员信息表`) join `订单详情表`) where ((`订单信息表`.`会员编号` = `会员信息表`.`会员编号`) and (`订单信息表`.`订单编号` = `订单详情表`.`订单编号`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `会员购物车视图`
--

/*!50001 DROP VIEW IF EXISTS `会员购物车视图`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `会员购物车视图` (`会员编号`,`姓名`,`购物车编号`,`商品编号`,`商品数量`) AS select `购物车信息表`.`会员编号` AS `会员编号`,`会员信息表`.`姓名` AS `姓名`,`购物车信息表`.`购物车编号` AS `购物车编号`,`购物车详情表`.`商品编号` AS `商品编号`,`购物车详情表`.`商品数量` AS `商品数量` from ((`购物车信息表` join `会员信息表`) join `购物车详情表`) where ((`购物车信息表`.`会员编号` = `会员信息表`.`会员编号`) and (`购物车信息表`.`购物车编号` = `购物车详情表`.`购物车编号`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `销售情况视图`
--

/*!50001 DROP VIEW IF EXISTS `销售情况视图`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `销售情况视图` (`商品编号`,`购买数量`,`订单日期`) AS select `订单详情表`.`商品编号` AS `商品编号`,`订单详情表`.`购买数量` AS `购买数量`,`订单信息表`.`订单日期` AS `订单日期` from (`订单信息表` join `订单详情表`) where ((`订单信息表`.`订单状态` = 'y') and (`订单信息表`.`订单编号` = `订单详情表`.`订单编号`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-12 20:15:54
