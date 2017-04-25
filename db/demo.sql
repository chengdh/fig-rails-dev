-- MySQL dump 10.13  Distrib 5.6.24, for osx10.10 (x86_64)
--
-- Host: 127.0.0.1    Database: guodiantou_development
-- ------------------------------------------------------
-- Server version	5.5.51

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
-- Table structure for table `cux_demand_platform_headers_a`
--

DROP TABLE IF EXISTS `cux_demand_platform_headers_a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cux_demand_platform_headers_a` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apply_number` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ou_name` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `org_id` int(11) DEFAULT NULL,
  `apply_date` datetime DEFAULT NULL,
  `apply_source` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apply_deparment` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applier_user` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apply_type` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` text COLLATE utf8_unicode_ci,
  `project_number` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `project_name` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `task_name` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `task_number` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `urge_flag` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute1` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wip_entity_id` int(11) DEFAULT NULL,
  `wip_entity_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bugdet_total` decimal(15,2) DEFAULT '0.00',
  `bugdet_demand_total` decimal(15,2) DEFAULT '0.00',
  `header_bugdet` decimal(15,2) DEFAULT '0.00',
  `bugdet_balance` decimal(15,2) DEFAULT '0.00',
  `actual_cost` decimal(15,2) DEFAULT '0.00',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `wf_itemkey` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cux_demand_platform_headers_a`
--

LOCK TABLES `cux_demand_platform_headers_a` WRITE;
/*!40000 ALTER TABLE `cux_demand_platform_headers_a` DISABLE KEYS */;
INSERT INTO `cux_demand_platform_headers_a` VALUES (1,'123456','平顶山电厂',1,'2017-01-01 00:00:00','DE000001','运行部','张三丰','需求计划','备注','PROJ0001','电厂二期改造项目',NULL,NULL,'0','13626222222',1,'WIP00001',1000.00,1000.00,900.00,0.00,900.00,'2017-04-21 07:28:26','2017-04-21 07:28:26','1766');
/*!40000 ALTER TABLE `cux_demand_platform_headers_a` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cux_demand_platform_lines_a`
--

DROP TABLE IF EXISTS `cux_demand_platform_lines_a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cux_demand_platform_lines_a` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cux_demand_id` int(11) DEFAULT NULL,
  `line_type` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apply_number` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_number` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_description` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_spec` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_price` decimal(15,2) DEFAULT '0.00',
  `demand_quantiry` decimal(15,2) DEFAULT '0.00',
  `line_bugdet` decimal(15,2) DEFAULT '0.00',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cux_demand_platform_lines_a`
--

LOCK TABLES `cux_demand_platform_lines_a` WRITE;
/*!40000 ALTER TABLE `cux_demand_platform_lines_a` DISABLE KEYS */;
INSERT INTO `cux_demand_platform_lines_a` VALUES (1,1,'需求计划','DE000001','ITEM0001',1,'测试物料','29mmx20mm',100.00,10.00,1000.00,'2017-04-21 07:28:26','2017-04-21 07:28:26'),(2,1,'需求计划','DE000001','ITEM0002',1,'测试物料2','29mmx20mm',10.00,9.00,90.00,'2017-04-21 07:28:26','2017-04-21 07:28:26');
/*!40000 ALTER TABLE `cux_demand_platform_lines_a` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cux_posa_item_activity_his_a`
--

DROP TABLE IF EXISTS `cux_posa_item_activity_his_a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cux_posa_item_activity_his_a` (
  `submit_by_org_id` int(11) DEFAULT NULL,
  `submit_by_org_name` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `submit_schedule_type` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `submit_schedule_yqmj` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `submit_org_level` int(11) DEFAULT NULL,
  `submit_from` int(11) DEFAULT NULL,
  `response_message` text COLLATE utf8_unicode_ci,
  `submit_date` datetime DEFAULT NULL,
  `item_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_key` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activity_result_code` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `result_name` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assigned_user` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `full_name` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notification_id` int(11) DEFAULT NULL,
  `begin_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cux_posa_item_activity_his_a`
--

LOCK TABLES `cux_posa_item_activity_his_a` WRITE;
/*!40000 ALTER TABLE `cux_posa_item_activity_his_a` DISABLE KEYS */;
INSERT INTO `cux_posa_item_activity_his_a` VALUES (1,'提交机构','计划类型','计划来源',1,1,'回应信息','2017-04-22 09:27:10','CUXPOSA','1766','ACTIVITY_RESULT_CODE','RESULT_NAME','用户名','FULL_NAME',191747,'2017-01-01 00:00:00','2017-12-01 00:00:00','2017-04-22 09:27:10','2017-04-22 09:27:10');
/*!40000 ALTER TABLE `cux_posa_item_activity_his_a` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cux_soa_attached_doc_v`
--

DROP TABLE IF EXISTS `cux_soa_attached_doc_v`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cux_soa_attached_doc_v` (
  `seq_num` int(11) DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `datatype_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `datatype_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `table_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pk1_column` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cux_soa_attached_doc_v`
--

LOCK TABLES `cux_soa_attached_doc_v` WRITE;
/*!40000 ALTER TABLE `cux_soa_attached_doc_v` DISABLE KEYS */;
INSERT INTO `cux_soa_attached_doc_v` VALUES (1,'filename.doc','短文本','短文本',1,1,'cux_demand_platform_headers','1','2017-04-22 10:18:39','2017-04-22 10:18:39'),(2,'filename.doc','长文本','长文本',2,2,'cux_demand_platform_headers','1','2017-04-22 10:18:39','2017-04-22 10:18:39'),(3,'filename.doc','二进制','大文件',9,3,'cux_demand_platform_headers','1','2017-04-22 10:18:39','2017-04-22 10:18:39'),(1,'filename.doc','短文本','短文本',1,11,'cux_transaction_headers_all','99','2017-04-22 11:30:52','2017-04-22 11:30:52'),(2,'filename.doc','长文本','长文本',2,12,'cux_transaction_headers_all','99','2017-04-22 11:30:52','2017-04-22 11:30:52'),(3,'filename.doc','二进制','大文件',9,13,'cux_transaction_headers_all','99','2017-04-22 11:30:52','2017-04-22 11:30:52');
/*!40000 ALTER TABLE `cux_soa_attached_doc_v` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cux_tran_activity_history_a`
--

DROP TABLE IF EXISTS `cux_tran_activity_history_a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cux_tran_activity_history_a` (
  `response_message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activity_result_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `result_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assigned_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notification_id` int(11) DEFAULT NULL,
  `begin_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cux_tran_activity_history_a`
--

LOCK TABLES `cux_tran_activity_history_a` WRITE;
/*!40000 ALTER TABLE `cux_tran_activity_history_a` DISABLE KEYS */;
INSERT INTO `cux_tran_activity_history_a` VALUES ('领料单回应信息','CUXTRAN','1764','activity_result_code','活动','用户名','员工',191749,'2017-04-22 11:27:29','2018-01-01 00:00:00','2017-04-22 11:27:29','2017-04-22 11:27:29');
/*!40000 ALTER TABLE `cux_tran_activity_history_a` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cux_transaction_headers_all_a`
--

DROP TABLE IF EXISTS `cux_transaction_headers_all_a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cux_transaction_headers_all_a` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `require_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `require_deparment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `require_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `require_person` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `require_person_id` int(11) DEFAULT NULL,
  `require_date` datetime DEFAULT NULL,
  `last_update_date` datetime DEFAULT NULL,
  `last_update_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_update_login` int(11) DEFAULT NULL,
  `require_status_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `require_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `require_type_id` int(11) DEFAULT NULL,
  `wip_entity_id` int(11) DEFAULT NULL,
  `categorie` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` text COLLATE utf8_unicode_ci,
  `trans_deparment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wf_itemkey` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bugdet_balance` decimal(15,2) DEFAULT NULL,
  `header_bugdet` decimal(15,2) DEFAULT NULL,
  `bugdet_demand_total` decimal(15,2) DEFAULT NULL,
  `bugdet_total` decimal(15,2) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `segment1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `project_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `business_type` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cux_transaction_headers_all_a`
--

LOCK TABLES `cux_transaction_headers_all_a` WRITE;
/*!40000 ALTER TABLE `cux_transaction_headers_all_a` DISABLE KEYS */;
INSERT INTO `cux_transaction_headers_all_a` VALUES (99,'REQ0000001','二车间','审批中','申请人',1,'2017-02-21 14:34:00','2017-02-21 14:34:00','1','2017-02-21 14:34:00',1,1,'STATUS_CODE_001','REQ',1,1,'需求计划','这是一个备注','二车间','1764',1000.00,1000.00,1000.00,1000.00,1,'生产工序改造项目','生产工序改造项目','PROJECT_TYPE','2017-04-21 07:24:30','2017-04-21 07:24:30','NORMAL');
/*!40000 ALTER TABLE `cux_transaction_headers_all_a` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cux_transaction_lines_all_a`
--

DROP TABLE IF EXISTS `cux_transaction_lines_all_a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cux_transaction_lines_all_a` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `require_id` int(11) DEFAULT NULL,
  `line_number` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `inventory_item_id` int(11) DEFAULT NULL,
  `item_spc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uom` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subinventory` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `required_qty` decimal(15,2) DEFAULT NULL,
  `project_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `task_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apply_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apply_line_num` int(11) DEFAULT NULL,
  `apply_qty` decimal(15,2) DEFAULT NULL,
  `item_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_dec` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL,
  `expense_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cost` decimal(15,2) DEFAULT NULL,
  `wip_entity_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operation_seq_num` int(11) DEFAULT NULL,
  `canceled_qty` decimal(15,2) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cux_transaction_lines_all_a`
--

LOCK TABLES `cux_transaction_lines_all_a` WRITE;
/*!40000 ALTER TABLE `cux_transaction_lines_all_a` DISABLE KEYS */;
INSERT INTO `cux_transaction_lines_all_a` VALUES (1,99,1,1,1,'直径20mm膨胀螺栓','个','1',100.00,'PROJ_NUM_0001','TASK_NUM_0001','APPLY_NUM_00001',0,100.00,'ITEM_00001','20mm膨胀螺栓','备注',1,1,'EXPENSE_TYPE',1000.00,'工序2',1,0.00,'2017-04-21 07:25:28','2017-04-21 07:25:28'),(2,99,2,1,1,'膨胀剂','个','1',200.00,'PROJ_NUM_0001','TASK_NUM_0001','APPLY_NUM_00001',0,100.00,'ITEM_00002','膨胀剂','备注',1,1,'EXPENSE_TYPE',2000.00,'工序1',2,0.00,'2017-04-21 07:25:28','2017-04-21 07:25:28');
/*!40000 ALTER TABLE `cux_transaction_lines_all_a` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fnd_documents_long_text`
--

DROP TABLE IF EXISTS `fnd_documents_long_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fnd_documents_long_text` (
  `media_id` int(11) DEFAULT NULL,
  `app_source_version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `long_text` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fnd_documents_long_text`
--

LOCK TABLES `fnd_documents_long_text` WRITE;
/*!40000 ALTER TABLE `fnd_documents_long_text` DISABLE KEYS */;
INSERT INTO `fnd_documents_long_text` VALUES (2,'app version','这是一个长长长的文本','2017-04-22 10:24:39','2017-04-22 10:24:39'),(12,'app version','这是一个长长长的文本','2017-04-22 11:33:22','2017-04-22 11:33:22');
/*!40000 ALTER TABLE `fnd_documents_long_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fnd_documents_short_text`
--

DROP TABLE IF EXISTS `fnd_documents_short_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fnd_documents_short_text` (
  `media_id` int(11) DEFAULT NULL,
  `short_text` text COLLATE utf8_unicode_ci,
  `app_source_version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fnd_documents_short_text`
--

LOCK TABLES `fnd_documents_short_text` WRITE;
/*!40000 ALTER TABLE `fnd_documents_short_text` DISABLE KEYS */;
INSERT INTO `fnd_documents_short_text` VALUES (1,'这是一个短文本','app version','2017-04-22 10:23:10','2017-04-22 10:23:10'),(11,'这是一个短文本','app version','2017-04-22 11:31:30','2017-04-22 11:31:30'),(11,'这是一个短文本','app version','2017-04-22 11:33:22','2017-04-22 11:33:22');
/*!40000 ALTER TABLE `fnd_documents_short_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fnd_lob`
--

DROP TABLE IF EXISTS `fnd_lob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fnd_lob` (
  `file_id` int(11) NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_data` longtext COLLATE utf8_unicode_ci,
  `upload_date` datetime DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `program_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `program_tag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oracle_charset` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fnd_lob`
--

LOCK TABLES `fnd_lob` WRITE;
/*!40000 ALTER TABLE `fnd_lob` DISABLE KEYS */;
INSERT INTO `fnd_lob` VALUES (3,'blob.docx','docx','data:image/png;base64,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','2017-04-22 10:30:51','2019-01-01 00:00:00','program name','program tag','en','zh.UTF16','utf8','2017-04-22 10:30:51','2017-04-22 10:30:51'),(13,'blob.docx','docx','data:image/png;base64,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','2017-04-22 11:34:25','2019-01-01 00:00:00','program name','program tag','en','zh.UTF16','utf8','2017-04-22 11:34:25','2017-04-22 11:34:25');
/*!40000 ALTER TABLE `fnd_lob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maximo_msgs`
--

DROP TABLE IF EXISTS `maximo_msgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maximo_msgs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `ordersource` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordercode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordertypename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordertype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordertaskname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordertaskid` int(11) DEFAULT NULL,
  `ordertitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orderuserid` int(11) DEFAULT NULL,
  `orderusername` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordertime` datetime DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maximo_msgs`
--

LOCK TABLES `maximo_msgs` WRITE;
/*!40000 ALTER TABLE `maximo_msgs` DISABLE KEYS */;
/*!40000 ALTER TABLE `maximo_msgs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orgs`
--

DROP TABLE IF EXISTS `orgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orgs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `address` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `org_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `order_by` int(11) DEFAULT '1',
  `note` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `manager` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orgs`
--

LOCK TABLES `orgs` WRITE;
/*!40000 ALTER TABLE `orgs` DISABLE KEYS */;
/*!40000 ALTER TABLE `orgs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_system_function_operates`
--

DROP TABLE IF EXISTS `role_system_function_operates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_system_function_operates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `system_function_operate_id` int(11) DEFAULT NULL,
  `is_select` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_role_system_function_operates_on_role_id` (`role_id`),
  KEY `fk_rails_fad876bc59` (`system_function_operate_id`),
  CONSTRAINT `fk_rails_60898fd41e` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `fk_rails_fad876bc59` FOREIGN KEY (`system_function_operate_id`) REFERENCES `system_function_operates` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_system_function_operates`
--

LOCK TABLES `role_system_function_operates` WRITE;
/*!40000 ALTER TABLE `role_system_function_operates` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_system_function_operates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `order_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20150504084410'),('20150504153457'),('20160123023232'),('20160123035325'),('20160124033538'),('20160124121632'),('20160124121949'),('20160124122419'),('20160124122956'),('20160124123401'),('20160124123928'),('20160124124419'),('20160124130731'),('20160212053002'),('20160212054536'),('20160212054718'),('20170213032149'),('20170213034503'),('20170214125832'),('20170217063524'),('20170217084349'),('20170219004959'),('20170219080239'),('20170226010035'),('20170226011044'),('20170412042553'),('20170414031542'),('20170417064138'),('20170419011002'),('20170419014246'),('20170419020511'),('20170419020841'),('20170419021535');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_function_groups`
--

DROP TABLE IF EXISTS `system_function_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_function_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `order_by` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_function_groups`
--

LOCK TABLES `system_function_groups` WRITE;
/*!40000 ALTER TABLE `system_function_groups` DISABLE KEYS */;
INSERT INTO `system_function_groups` VALUES (1,'系统设置',1,NULL,NULL,'2017-04-19 03:27:28','2017-04-19 03:27:28');
/*!40000 ALTER TABLE `system_function_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_function_operates`
--

DROP TABLE IF EXISTS `system_function_operates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_function_operates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `system_function_id` int(11) DEFAULT NULL,
  `function_obj` text COLLATE utf8_unicode_ci,
  `is_active` tinyint(1) DEFAULT '1',
  `order_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_system_function_operates_on_system_function_id` (`system_function_id`),
  CONSTRAINT `fk_rails_14d24e0a38` FOREIGN KEY (`system_function_id`) REFERENCES `system_functions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_function_operates`
--

LOCK TABLES `system_function_operates` WRITE;
/*!40000 ALTER TABLE `system_function_operates` DISABLE KEYS */;
INSERT INTO `system_function_operates` VALUES (1,'新建',1,'---\n:subject: Role\n:action: :create\n:conditions: \n',1,NULL,'2017-04-19 03:27:28','2017-04-19 03:27:28'),(2,'修改',1,'---\n:subject: Role\n:action: :update\n:conditions: \n',1,NULL,'2017-04-19 03:27:28','2017-04-19 03:27:28'),(3,'删除',1,'---\n:subject: Role\n:action: :destroy\n:conditions: \n',1,NULL,'2017-04-19 03:27:28','2017-04-19 03:27:28'),(4,'新建',2,'---\n:subject: Org\n:action: :create\n:conditions: \n',1,NULL,'2017-04-19 03:27:28','2017-04-19 03:27:28'),(5,'修改',2,'---\n:subject: Org\n:action: :update\n:conditions: \n',1,NULL,'2017-04-19 03:27:28','2017-04-19 03:27:28'),(6,'删除',2,'---\n:subject: Org\n:action: :destroy\n:conditions: \n',1,NULL,'2017-04-19 03:27:29','2017-04-19 03:27:29'),(7,'新建',3,'---\n:subject: User\n:action: :create\n:conditions: \n',1,NULL,'2017-04-19 03:27:29','2017-04-19 03:27:29'),(8,'修改',3,'---\n:subject: User\n:action: :update\n:conditions: \n',1,NULL,'2017-04-19 03:27:29','2017-04-19 03:27:29'),(9,'删除',3,'---\n:subject: User\n:action: :destroy\n:conditions: \n',1,NULL,'2017-04-19 03:27:29','2017-04-19 03:27:29');
/*!40000 ALTER TABLE `system_function_operates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_functions`
--

DROP TABLE IF EXISTS `system_functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_functions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `order_by` int(11) DEFAULT NULL,
  `system_function_group_id` int(11) DEFAULT NULL,
  `default_action` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_system_functions_on_system_function_group_id` (`system_function_group_id`),
  CONSTRAINT `fk_rails_ad63c55c35` FOREIGN KEY (`system_function_group_id`) REFERENCES `system_function_groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_functions`
--

LOCK TABLES `system_functions` WRITE;
/*!40000 ALTER TABLE `system_functions` DISABLE KEYS */;
INSERT INTO `system_functions` VALUES (1,'角色管理',1,NULL,1,'roles_path','2017-04-19 03:27:28','2017-04-19 03:27:28'),(2,'机构管理',1,NULL,1,'orgs_path','2017-04-19 03:27:28','2017-04-19 03:27:28'),(3,'用户管理',1,NULL,1,'users_path','2017-04-19 03:27:29','2017-04-19 03:27:29');
/*!40000 ALTER TABLE `system_functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_orgs`
--

DROP TABLE IF EXISTS `user_orgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_orgs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `org_id` int(11) DEFAULT NULL,
  `is_select` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_orgs_on_user_id` (`user_id`),
  KEY `index_user_orgs_on_org_id` (`org_id`),
  CONSTRAINT `fk_rails_62334ee0d7` FOREIGN KEY (`org_id`) REFERENCES `orgs` (`id`),
  CONSTRAINT `fk_rails_fedbf1579a` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_orgs`
--

LOCK TABLES `user_orgs` WRITE;
/*!40000 ALTER TABLE `user_orgs` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_orgs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `is_select` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_roles_on_user_id` (`user_id`),
  KEY `index_user_roles_on_role_id` (`role_id`),
  CONSTRAINT `fk_rails_318345354e` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_3369e0d5fc` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `touch_man` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `default_org_id` int(11) DEFAULT NULL,
  `default_role_id` int(11) DEFAULT NULL,
  `real_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  KEY `index_users_on_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wf_notifications_a`
--

DROP TABLE IF EXISTS `wf_notifications_a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wf_notifications_a` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_type` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_user` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_user` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` text COLLATE utf8_unicode_ci,
  `item_key` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `begin_date` date DEFAULT NULL,
  `fuser_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=191750 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wf_notifications_a`
--

LOCK TABLES `wf_notifications_a` WRITE;
/*!40000 ALTER TABLE `wf_notifications_a` DISABLE KEYS */;
INSERT INTO `wf_notifications_a` VALUES (191747,'CUXPOSA','OPEN',NULL,'陈建勋','需求计划待审批审批','1766','2017-04-19 03:28:08','2017-04-19 03:28:08','2014-04-15',3492),(191749,'CUXTRAN','OPEN',NULL,'陈建勋','领料计划待审批','1764','2017-04-19 03:28:10','2017-04-19 03:28:10','2014-04-15',3492);
/*!40000 ALTER TABLE `wf_notifications_a` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-24 14:02:13
