-- MySQL dump 10.13  Distrib 8.0.31, for macos12.6 (x86_64)
--
-- Host: elixir-xir-57.cfdvijddkwak.ap-southeast-2.rds.amazonaws.com    Database: xcelerate
-- ------------------------------------------------------
-- Server version	5.7.38-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 */
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `action_feedback`
--

-- DROP TABLE IF EXISTS `action_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `action_feedback` (
  `action_id` int(11) NOT NULL,
  `quality_rating_id` int(11) NOT NULL,
  `reason` varchar(1024) DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` int(11) DEFAULT NULL,
  `UPDATED_DATE` timestamp NULL DEFAULT NULL,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`action_id`),
  KEY `action_feedback_fk2` (`quality_rating_id`),
  CONSTRAINT `action_feedback_fk1` FOREIGN KEY (`action_id`) REFERENCES `actions` (`actionId`),
  CONSTRAINT `action_feedback_fk2` FOREIGN KEY (`quality_rating_id`) REFERENCES `quality_rating` (`quality_rating_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `action_questionary_answer`
--

-- DROP TABLE IF EXISTS `action_questionary_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `action_questionary_answer` (
  `action_questionary_answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `action_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `answer_text` varchar(512) DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` int(11) DEFAULT NULL,
  `UPDATED_DATE` timestamp NULL DEFAULT NULL,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`action_questionary_answer_id`),
  UNIQUE KEY `action_questionary_answer_uk1` (`action_id`,`answer_id`),
  KEY `action_questionary_answer_fk1` (`action_id`),
  KEY `action_questionary_answer_fk2` (`answer_id`),
  CONSTRAINT `action_questionary_answer_fk1` FOREIGN KEY (`action_id`) REFERENCES `actions` (`actionId`),
  CONSTRAINT `action_questionary_answer_fk2` FOREIGN KEY (`answer_id`) REFERENCES `questionary_answer` (`questionary_answer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `actioncode_file`
--

-- DROP TABLE IF EXISTS `actioncode_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actioncode_file` (
  `actioncode_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` int(11) NOT NULL,
  `actioncode_id` int(11) NOT NULL,
  `frequency_type_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `action_id` int(11) DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` int(11) DEFAULT NULL,
  `UPDATED_DATE` timestamp NULL DEFAULT NULL,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`actioncode_file_id`),
  UNIQUE KEY `actioncode_file_uk1` (`file_id`,`actioncode_id`),
  KEY `actioncode_file_fk2` (`actioncode_id`),
  KEY `actioncode_file_fk3` (`frequency_type_id`),
  KEY `actioncode_file_fk4` (`action_id`),
  CONSTRAINT `actioncode_file_fk1` FOREIGN KEY (`file_id`) REFERENCES `files` (`fileId`),
  CONSTRAINT `actioncode_file_fk2` FOREIGN KEY (`actioncode_id`) REFERENCES `actioncodes` (`actcId`),
  CONSTRAINT `actioncode_file_fk3` FOREIGN KEY (`frequency_type_id`) REFERENCES `frequency_type` (`frequency_type_id`),
  CONSTRAINT `actioncode_file_fk4` FOREIGN KEY (`action_id`) REFERENCES `actions` (`actionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `actioncode_priority`
--

-- DROP TABLE IF EXISTS `actioncode_priority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actioncode_priority` (
  `actioncode_id` int(11) NOT NULL,
  `p_0` int(11) NOT NULL,
  `p_7` int(11) NOT NULL,
  `p_14` int(11) NOT NULL,
  `p_21` int(11) NOT NULL,
  PRIMARY KEY (`actioncode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `actioncode_service`
--

-- DROP TABLE IF EXISTS `actioncode_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actioncode_service` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` int(11) DEFAULT NULL,
  `UPDATED_DATE` timestamp NULL DEFAULT NULL,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`service_id`),
  UNIQUE KEY `actioncode_service_uk1` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `actioncodes`
--

-- DROP TABLE IF EXISTS `actioncodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actioncodes` (
  `actcId` int(11) NOT NULL AUTO_INCREMENT,
  `actcCode` varchar(30) NOT NULL,
  `actcDefaultNotation` varchar(255) DEFAULT NULL,
  `actcType` int(11) NOT NULL,
  `actcActive` bit(1) DEFAULT NULL,
  `actcDirect` int(11) DEFAULT NULL,
  `actcTemplateId` int(11) DEFAULT NULL,
  `actcWorkGroupId` int(11) DEFAULT NULL,
  `TP_STATUS_ID` int(11) DEFAULT NULL,
  `REC_STATUS_ID` int(11) DEFAULT NULL,
  `BILLABLE` char(1) NOT NULL DEFAULT 'N',
  `fixed_rate` decimal(19,2) DEFAULT NULL,
  `allow_feedback` char(1) NOT NULL DEFAULT 'N',
  `send_feedback` char(1) NOT NULL DEFAULT 'N',
  `rejectable` char(1) NOT NULL DEFAULT 'N',
  `actcRestricted` bit(1) NOT NULL DEFAULT b'0',
  `date_closed_delay` char(1) NOT NULL DEFAULT 'N',
  `date_closed_delay_advice` int(11) NOT NULL DEFAULT '0',
  `auto_complete` char(1) NOT NULL DEFAULT 'N',
  `questionary_id` int(11) DEFAULT NULL,
  `file_type_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `attach_documents` char(1) NOT NULL DEFAULT 'N',
  `outcome_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`actcId`),
  UNIQUE KEY `ACTIONCODES_UK1` (`actcCode`),
  KEY `ACTIONCODES_FK1` (`TP_STATUS_ID`),
  KEY `ACTIONCODES_FK2` (`REC_STATUS_ID`),
  KEY `actioncodes_fk3` (`questionary_id`),
  KEY `actioncodes_idx1` (`BILLABLE`),
  KEY `actioncodes_fk4` (`file_type_id`),
  KEY `actioncodes_fk5` (`client_id`),
  KEY `actioncodes_fk6` (`outcome_id`),
  KEY `actioncodes_fk7` (`service_id`),
  CONSTRAINT `ACTIONCODES_FK1` FOREIGN KEY (`TP_STATUS_ID`) REFERENCES `tpstatus` (`statusId`),
  CONSTRAINT `ACTIONCODES_FK2` FOREIGN KEY (`REC_STATUS_ID`) REFERENCES `rec_status` (`REC_STATUS_ID`),
  CONSTRAINT `actioncodes_fk3` FOREIGN KEY (`questionary_id`) REFERENCES `questionary` (`questionary_id`),
  CONSTRAINT `actioncodes_fk4` FOREIGN KEY (`file_type_id`) REFERENCES `file_type` (`file_type_id`),
  CONSTRAINT `actioncodes_fk5` FOREIGN KEY (`client_id`) REFERENCES `clients` (`clientId`),
  CONSTRAINT `actioncodes_fk6` FOREIGN KEY (`outcome_id`) REFERENCES `actionoutcomes` (`outId`),
  CONSTRAINT `actioncodes_fk7` FOREIGN KEY (`service_id`) REFERENCES `actioncode_service` (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `actionoutcomes`
--

-- DROP TABLE IF EXISTS `actionoutcomes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actionoutcomes` (
  `outId` int(11) NOT NULL AUTO_INCREMENT,
  `outName` varchar(100) DEFAULT NULL,
  `outFixed` bit(1) NOT NULL,
  PRIMARY KEY (`outId`),
  UNIQUE KEY `actionoutcomes_uk1` (`outName`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `actions`
--

-- DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actions` (
  `actionId` int(11) NOT NULL AUTO_INCREMENT,
  `actionCreatedBy` int(11) DEFAULT NULL,
  `actionDueDate` datetime NOT NULL,
  `actionCodeId` int(11) DEFAULT NULL,
  `actionNotation` text,
  `actionOutcomeId` int(11) DEFAULT NULL,
  `actionDateCompleted` datetime DEFAULT NULL,
  `actionCompletedBy` int(11) DEFAULT NULL,
  `actionLetterId` int(11) DEFAULT NULL,
  `actionFileId` int(11) DEFAULT NULL,
  `actionWorkGroupId` int(11) DEFAULT NULL,
  `actionDestination` varchar(255) DEFAULT NULL,
  `actionSubject` varchar(255) DEFAULT NULL,
  `LOGICALLY_DELETED` char(1) DEFAULT NULL,
  `BILLABLE_UNIT` int(11) DEFAULT NULL,
  `INVOICE_ID` int(11) DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` int(11) DEFAULT NULL,
  `UPDATED_DATE` timestamp NULL DEFAULT NULL,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  `BILLING_NOTE` text,
  `BILLABLE_AMOUNT` decimal(19,2) DEFAULT NULL,
  `BILLABLE_GST_AMOUNT` decimal(19,2) DEFAULT NULL,
  `BILLING_USER_AMOUNT` decimal(19,2) DEFAULT NULL,
  `EXCLUDE_FROM_INVOICE` char(1) DEFAULT NULL,
  `DEFER_FROM_INVOICE` char(1) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `claimed_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`actionId`),
  KEY `ACTIONS_FK3` (`actionWorkGroupId`),
  KEY `ACTIONS_FK4` (`actionCreatedBy`),
  KEY `ACTIONS_FK5` (`actionCompletedBy`),
  KEY `ACTIONS_FK6` (`actionLetterId`),
  KEY `ACTIONS_FK7` (`actionOutcomeId`),
  KEY `ACTIONS_FK8` (`INVOICE_ID`),
  KEY `actions_fk9` (`document_id`),
  KEY `ACTIONS_IDX3` (`actionDateCompleted`,`actionCompletedBy`),
  KEY `ACTIONS_IDX4` (`CREATED_DATE`,`CREATED_BY`),
  KEY `actions_fk2` (`actionCodeId`),
  KEY `actions_idx1` (`EXCLUDE_FROM_INVOICE`),
  KEY `ACTIONS_IDX5` (`actionFileId`),
  KEY `ACTIONS_IDX6` (`actionDateCompleted`),
  KEY `actions_fk10` (`parent_id`),
  CONSTRAINT `ACTIONS_FK3` FOREIGN KEY (`actionWorkGroupId`) REFERENCES `workgroups` (`wgroupId`),
  CONSTRAINT `ACTIONS_FK4` FOREIGN KEY (`actionCreatedBy`) REFERENCES `users` (`userId`),
  CONSTRAINT `ACTIONS_FK5` FOREIGN KEY (`actionCompletedBy`) REFERENCES `users` (`userId`),
  CONSTRAINT `ACTIONS_FK6` FOREIGN KEY (`actionLetterId`) REFERENCES `letters` (`letterId`),
  CONSTRAINT `ACTIONS_FK7` FOREIGN KEY (`actionOutcomeId`) REFERENCES `actionoutcomes` (`outId`),
  CONSTRAINT `ACTIONS_FK8` FOREIGN KEY (`INVOICE_ID`) REFERENCES `invoices` (`invoiceId`),
  CONSTRAINT `actions_fk1` FOREIGN KEY (`actionFileId`) REFERENCES `files` (`fileId`),
  CONSTRAINT `actions_fk10` FOREIGN KEY (`parent_id`) REFERENCES `actions` (`actionId`),
  CONSTRAINT `actions_fk2` FOREIGN KEY (`actionCodeId`) REFERENCES `actioncodes` (`actcId`),
  CONSTRAINT `actions_fk9` FOREIGN KEY (`document_id`) REFERENCES `document` (`document_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `actiontransitions`
--

-- DROP TABLE IF EXISTS `actiontransitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actiontransitions` (
  `acttId` int(11) NOT NULL AUTO_INCREMENT,
  `acttCodeId` int(11) DEFAULT NULL,
  `acttOutcomeId` int(11) DEFAULT NULL,
  `acttNextCodeId` int(11) NOT NULL,
  `acttNextDueDays` int(11) DEFAULT NULL,
  `next_due_days_cron` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`acttId`),
  UNIQUE KEY `actiontransitions_uk1` (`acttCodeId`,`acttOutcomeId`,`acttNextCodeId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `addresses`
--

-- DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `addressId` int(11) NOT NULL AUTO_INCREMENT,
  `addressStreet1` varchar(255) DEFAULT NULL,
  `addressStreet2` varchar(255) DEFAULT NULL,
  `addressSuburb` varchar(200) DEFAULT NULL,
  `addressState` varchar(50) DEFAULT NULL,
  `addressPostcode` varchar(20) DEFAULT NULL,
  `STATE_ID` int(11) NOT NULL DEFAULT '1',
  `datawash` char(1) DEFAULT NULL,
  `link_address_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`addressId`),
  KEY `ADDRESSES_FK1` (`STATE_ID`),
  KEY `addresses_fk2` (`link_address_id`),
  CONSTRAINT `ADDRESSES_FK1` FOREIGN KEY (`STATE_ID`) REFERENCES `state` (`STATE_ID`),
  CONSTRAINT `addresses_fk2` FOREIGN KEY (`link_address_id`) REFERENCES `addresses` (`addressId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `audit_type`
--

-- DROP TABLE IF EXISTS `audit_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_type` (
  `audit_type_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`audit_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bank_client`
--

-- DROP TABLE IF EXISTS `bank_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_client` (
  `bank_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  PRIMARY KEY (`bank_id`,`client_id`),
  KEY `bank_client_fk2` (`client_id`),
  CONSTRAINT `bank_client_fk1` FOREIGN KEY (`bank_id`) REFERENCES `banks` (`bankId`),
  CONSTRAINT `bank_client_fk2` FOREIGN KEY (`client_id`) REFERENCES `clients` (`clientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bank_errors`
--

-- DROP TABLE IF EXISTS `bank_errors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_errors` (
  `errorId` int(11) NOT NULL AUTO_INCREMENT,
  `errorDate` date DEFAULT NULL,
  `errorBankId` int(11) DEFAULT NULL,
  `errorAmount` decimal(19,2) NOT NULL DEFAULT '0.00',
  `errorType` int(11) DEFAULT NULL,
  `errorDatePresented` date DEFAULT NULL,
  `EXPLANATION` text,
  `CREATED_BY` int(11) DEFAULT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` int(11) DEFAULT NULL,
  `UPDATED_DATE` timestamp NULL DEFAULT NULL,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`errorId`),
  KEY `BANK_ERRORS_FK1` (`errorBankId`),
  CONSTRAINT `BANK_ERRORS_FK1` FOREIGN KEY (`errorBankId`) REFERENCES `banks` (`bankId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bankdeposits`
--

-- DROP TABLE IF EXISTS `bankdeposits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bankdeposits` (
  `depositId` int(11) NOT NULL AUTO_INCREMENT,
  `depositDate` date DEFAULT NULL,
  `depositNumber` varchar(50) DEFAULT NULL,
  `depositBankId` int(11) DEFAULT NULL,
  `depositAmount` float(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`depositId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bankreconciliations`
--

-- DROP TABLE IF EXISTS `bankreconciliations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bankreconciliations` (
  `bankRecId` int(11) NOT NULL AUTO_INCREMENT,
  `bankRecBankId` int(11) DEFAULT NULL,
  `bankRecDate` date DEFAULT NULL,
  `bankRecSysBalance` decimal(19,2) DEFAULT NULL,
  `bankRecBankBalance` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`bankRecId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bankrecpresented`
--

-- DROP TABLE IF EXISTS `bankrecpresented`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bankrecpresented` (
  `stateId` int(11) NOT NULL AUTO_INCREMENT,
  `bankRecId` int(11) NOT NULL,
  `paymentId` int(11) NOT NULL,
  `paymentType` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`stateId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bankrecunpresented`
--

-- DROP TABLE IF EXISTS `bankrecunpresented`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bankrecunpresented` (
  `stateId` int(11) NOT NULL AUTO_INCREMENT,
  `bankRecId` int(11) NOT NULL,
  `paymentId` int(11) NOT NULL,
  `paymentType` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`stateId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `banks`
--

-- DROP TABLE IF EXISTS `banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banks` (
  `bankId` int(11) NOT NULL AUTO_INCREMENT,
  `bankName` varchar(255) DEFAULT NULL,
  `bankBalance` decimal(19,2) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `BSB` varchar(10) DEFAULT NULL,
  `ACCOUNT_NAME` varchar(255) DEFAULT NULL,
  `ACCOUNT_NUMBER` varchar(50) DEFAULT NULL,
  `NEXT_CHEQUE_NO` int(11) NOT NULL DEFAULT '100000',
  `CREATED_BY` int(11) DEFAULT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` int(11) DEFAULT NULL,
  `UPDATED_DATE` timestamp NULL DEFAULT NULL,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  `next_eft_no` int(11) DEFAULT NULL,
  `account_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`bankId`),
  UNIQUE KEY `banks_uk1` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `billing_action`
--

-- DROP TABLE IF EXISTS `billing_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing_action` (
  `ACTION_CODE_ID` int(11) NOT NULL,
  `CLIENT_ID` int(11) NOT NULL,
  `BILLING_AMOUNT` decimal(19,2) NOT NULL DEFAULT '0.00',
  `GST_FREE` bit(1) DEFAULT b'0',
  PRIMARY KEY (`ACTION_CODE_ID`,`CLIENT_ID`),
  KEY `BILLING_INFO_ACTION_FK2` (`CLIENT_ID`),
  CONSTRAINT `BILLING_ACTION_FK1` FOREIGN KEY (`ACTION_CODE_ID`) REFERENCES `actioncodes` (`actcId`),
  CONSTRAINT `BILLING_ACTION_FK2` FOREIGN KEY (`CLIENT_ID`) REFERENCES `clients` (`clientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `billing_client`
--

-- DROP TABLE IF EXISTS `billing_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing_client` (
  `feeId` int(11) NOT NULL AUTO_INCREMENT,
  `feeBillingInfoId` int(11) DEFAULT NULL,
  `feeFlat` bit(1) NOT NULL,
  `feeValue` decimal(19,2) NOT NULL DEFAULT '0.00',
  `feeTPStatus` int(11) DEFAULT NULL,
  `FILE_STATUS` int(11) DEFAULT NULL,
  PRIMARY KEY (`feeId`),
  KEY `BILLINGINFOFEES_FK1` (`feeBillingInfoId`),
  CONSTRAINT `BILLING_CLIENT_FK1` FOREIGN KEY (`feeBillingInfoId`) REFERENCES `billing_info_client` (`billingId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `billing_file`
--

-- DROP TABLE IF EXISTS `billing_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing_file` (
  `feeId` int(11) NOT NULL AUTO_INCREMENT,
  `feeFlat` bit(1) NOT NULL,
  `feeValue` decimal(19,2) NOT NULL DEFAULT '0.00',
  `hold_funds` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`feeId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `billing_info_client`
--

-- DROP TABLE IF EXISTS `billing_info_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing_info_client` (
  `billingId` int(11) NOT NULL AUTO_INCREMENT,
  `billingMethod` varchar(50) DEFAULT NULL,
  `billingRecoveredLimit` decimal(19,2) DEFAULT NULL,
  `billingClientPaysSearches` bit(1) DEFAULT NULL,
  `billingClientPaysLegal` bit(1) DEFAULT NULL,
  `billingLegalLimit` decimal(19,2) DEFAULT NULL,
  `billingLegalNotes` text,
  `billingIncludeCheque` bit(1) NOT NULL,
  `DSCNT_INTNL` decimal(19,2) DEFAULT NULL,
  `DSCNT_CLNT` decimal(19,2) DEFAULT NULL,
  `DEDUCT_FEES` char(1) NOT NULL DEFAULT 'N',
  `BILLING_PHOTOCOPY` decimal(19,2) DEFAULT NULL,
  `BILLING_FAX` decimal(19,2) DEFAULT NULL,
  `BILLING_PHONE_CALL` decimal(19,2) DEFAULT NULL,
  `billing_parent_action` char(1) NOT NULL DEFAULT 'N',
  `billing_parent_commission` char(1) NOT NULL DEFAULT 'N',
  `eft` char(1) NOT NULL DEFAULT 'N',
  `eft_bank_id` int(11) DEFAULT NULL,
  `event_no_required` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`billingId`),
  KEY `billing_info_client_fk1` (`eft_bank_id`),
  CONSTRAINT `billing_info_client_fk1` FOREIGN KEY (`eft_bank_id`) REFERENCES `eft_banks` (`bankId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `billing_user`
--

-- DROP TABLE IF EXISTS `billing_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing_user` (
  `USER_ID` int(11) NOT NULL,
  `CLIENT_ID` int(11) NOT NULL,
  `BILLING_AMOUNT` decimal(19,2) NOT NULL DEFAULT '0.00',
  `GST_FREE` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`USER_ID`,`CLIENT_ID`),
  KEY `BILLING_USER_FK2` (`CLIENT_ID`),
  CONSTRAINT `BILLING_USER_FK1` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`userId`),
  CONSTRAINT `BILLING_USER_FK2` FOREIGN KEY (`CLIENT_ID`) REFERENCES `clients` (`clientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_review`
--

-- DROP TABLE IF EXISTS `business_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_review` (
  `business_review_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` int(11) NOT NULL,
  `weekday` int(1) NOT NULL,
  `part_day` decimal(4,2) NOT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` int(11) DEFAULT NULL,
  `UPDATED_DATE` timestamp NULL DEFAULT NULL,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`business_review_id`),
  UNIQUE KEY `business_review_uk1` (`file_id`,`weekday`),
  CONSTRAINT `business_review_fk1` FOREIGN KEY (`file_id`) REFERENCES `files` (`fileId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `causeofloss`
--

-- DROP TABLE IF EXISTS `causeofloss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `causeofloss` (
  `lossId` int(11) NOT NULL AUTO_INCREMENT,
  `lossDebtTypeId` int(11) DEFAULT NULL,
  `lossAddressId` int(11) DEFAULT NULL,
  `lossDate` date DEFAULT NULL,
  `LOSS_TYPE_ID` int(11) DEFAULT NULL,
  `LOSS_DESC_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`lossId`),
  KEY `CAUSE_OF_LOSS_FK1` (`LOSS_TYPE_ID`),
  KEY `CAUSE_OF_LOSS_FK2` (`LOSS_DESC_ID`),
  CONSTRAINT `CAUSE_OF_LOSS_FK1` FOREIGN KEY (`LOSS_TYPE_ID`) REFERENCES `loss_type` (`LOSS_TYPE_ID`),
  CONSTRAINT `CAUSE_OF_LOSS_FK2` FOREIGN KEY (`LOSS_DESC_ID`) REFERENCES `loss_desc` (`LOSS_DESC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cheques`
--

-- DROP TABLE IF EXISTS `cheques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cheques` (
  `chequeId` int(11) NOT NULL AUTO_INCREMENT,
  `chequeBankId` int(11) DEFAULT NULL,
  `chequeDate` date DEFAULT NULL,
  `chequeType` int(11) NOT NULL,
  `chequeAmount` decimal(19,2) NOT NULL DEFAULT '0.00',
  `chequeDatePrinted` datetime DEFAULT NULL,
  `chequePayee` varchar(255) DEFAULT NULL,
  `chequeNumber` int(11) DEFAULT NULL,
  `chequeCancelReason` text,
  `chequeDateCanceled` datetime DEFAULT NULL,
  `chequeDatePresented` date DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` int(11) DEFAULT NULL,
  `UPDATED_DATE` timestamp NULL DEFAULT NULL,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  `CHEQUE_FEE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`chequeId`),
  KEY `CHEQUES_FK1` (`chequeBankId`),
  KEY `CHEQUES_FK2` (`CHEQUE_FEE_ID`),
  CONSTRAINT `CHEQUES_FK1` FOREIGN KEY (`chequeBankId`) REFERENCES `banks` (`bankId`),
  CONSTRAINT `CHEQUES_FK2` FOREIGN KEY (`CHEQUE_FEE_ID`) REFERENCES `cheques` (`chequeId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_notification`
--

-- DROP TABLE IF EXISTS `client_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_notification` (
  `client_id` int(11) NOT NULL,
  `close_file_advice` char(1) NOT NULL DEFAULT 'Y',
  `write_off_advice` char(1) NOT NULL DEFAULT 'Y',
  `new_file_notification` char(1) NOT NULL DEFAULT 'N',
  `close_file_advice_rule` varchar(512) DEFAULT NULL,
  `write_off_advice_rule` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`client_id`),
  CONSTRAINT `client_notification_fk1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`clientId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clientcontacts`
--

-- DROP TABLE IF EXISTS `clientcontacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientcontacts` (
  `contactId` int(11) NOT NULL,
  `contactOrder` int(9) NOT NULL DEFAULT '0',
  `contactClientId` int(11) DEFAULT NULL,
  `contactPosition` varchar(255) DEFAULT NULL,
  `contactPostalAddressId` int(11) DEFAULT NULL,
  `contactType` int(11) DEFAULT NULL,
  PRIMARY KEY (`contactId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clientinvoices`
--

-- DROP TABLE IF EXISTS `clientinvoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientinvoices` (
  `invoiceId` int(11) NOT NULL AUTO_INCREMENT,
  `invoiceClientId` int(11) DEFAULT NULL,
  `invoiceDateCreated` date DEFAULT NULL,
  `invoiceAmount` decimal(19,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`invoiceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clients`
--

-- DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `clientId` int(11) NOT NULL AUTO_INCREMENT,
  `clientName` varchar(255) DEFAULT NULL,
  `clientTradingName` varchar(255) DEFAULT NULL,
  `clientHowTrading` varchar(255) DEFAULT NULL,
  `clientABN` varchar(255) DEFAULT NULL,
  `clientACN` varchar(255) DEFAULT NULL,
  `clientCreatedBy` int(11) DEFAULT NULL,
  `clientCreatedDate` datetime DEFAULT NULL,
  `clientState` varchar(255) DEFAULT NULL,
  `clientOfficeName` varchar(255) DEFAULT NULL,
  `clientOfficeAddressId` int(11) DEFAULT NULL,
  `clientDefaultPOL` varchar(255) DEFAULT NULL,
  `clientDefaultLetterId` int(11) DEFAULT NULL,
  `clientPrimaryContactId` int(11) DEFAULT NULL,
  `clientBillingId` int(11) DEFAULT NULL,
  `initial_action_code_id` int(11) DEFAULT NULL,
  `email_disabled` char(1) NOT NULL DEFAULT 'N',
  `parent_client_id` int(11) DEFAULT NULL,
  `email_from` varchar(50) DEFAULT NULL,
  `repayment_updates` char(1) NOT NULL DEFAULT 'N',
  `exportable` char(1) NOT NULL DEFAULT 'N',
  `system_code` varchar(10) DEFAULT NULL,
  `supplier_code` varchar(10) DEFAULT NULL,
  `tier2_client_id` int(11) DEFAULT NULL,
  `alt_client_id` varchar(50) DEFAULT NULL,
  `file_reference_pattern` varchar(50) DEFAULT NULL,
  `file_overdue_kpi` int(11) NOT NULL DEFAULT '0',
  `file_qa_kpi` int(11) NOT NULL DEFAULT '20',
  `directory_template_id` int(11) DEFAULT NULL,
  `file_type_id` int(11) DEFAULT NULL,
  `organisation_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`clientId`),
  UNIQUE KEY `clients_uk1` (`organisation_id`),
  KEY `CLIENTS_FK1` (`clientBillingId`),
  KEY `clients_fk3` (`initial_action_code_id`),
  KEY `clients_fk2` (`parent_client_id`),
  KEY `clients_fk4` (`tier2_client_id`),
  KEY `clients_idx1` (`clientBillingId`),
  KEY `clients_fk5` (`directory_template_id`),
  KEY `clients_fk6` (`file_type_id`),
  CONSTRAINT `CLIENTS_FK1` FOREIGN KEY (`clientBillingId`) REFERENCES `billing_info_client` (`billingId`),
  CONSTRAINT `clients_fk2` FOREIGN KEY (`parent_client_id`) REFERENCES `clients` (`clientId`),
  CONSTRAINT `clients_fk3` FOREIGN KEY (`initial_action_code_id`) REFERENCES `actioncodes` (`actcId`),
  CONSTRAINT `clients_fk4` FOREIGN KEY (`tier2_client_id`) REFERENCES `clients` (`clientId`),
  CONSTRAINT `clients_fk5` FOREIGN KEY (`directory_template_id`) REFERENCES `templates` (`tempId`),
  CONSTRAINT `clients_fk6` FOREIGN KEY (`file_type_id`) REFERENCES `file_type` (`file_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clientusers`
--

-- DROP TABLE IF EXISTS `clientusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientusers` (
  `userId` int(11) NOT NULL,
  `clientId` int(11) NOT NULL,
  `paid` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`userId`,`clientId`),
  KEY `CLIENTUSERS_FK1` (`clientId`),
  CONSTRAINT `CLIENTUSERS_FK1` FOREIGN KEY (`clientId`) REFERENCES `clients` (`clientId`),
  CONSTRAINT `CLIENTUSERS_FK2` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `closecodes`
--

-- DROP TABLE IF EXISTS `closecodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `closecodes` (
  `closeId` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(20) DEFAULT NULL,
  `DESCRIPTION` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`closeId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `config`
--

-- DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config` (
  `configKey` varchar(50) NOT NULL DEFAULT '',
  `configValue` varchar(255) NOT NULL,
  `env` varchar(32) DEFAULT NULL,
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `config_uk1` (`configKey`,`env`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contacts`
--

-- DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `contactId` int(11) NOT NULL AUTO_INCREMENT,
  `contactSalutation` varchar(255) DEFAULT NULL,
  `contactInitials` varchar(255) DEFAULT NULL,
  `contactFirstName` varchar(255) DEFAULT NULL,
  `contactLastName` varchar(255) DEFAULT NULL,
  `contactEmail` varchar(255) DEFAULT NULL,
  `contactPhone` varchar(255) DEFAULT NULL,
  `contactFax` varchar(255) DEFAULT NULL,
  `contactMobile` varchar(255) DEFAULT NULL,
  `contactWorkPhone` varchar(255) DEFAULT NULL,
  `contactAddressId` int(11) DEFAULT NULL,
  `POSTAL_ADDRESS_ID` int(11) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  `datawash` char(1) DEFAULT NULL,
  `link_contact_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`contactId`),
  KEY `contacts_fk1` (`link_contact_id`),
  CONSTRAINT `contacts_fk1` FOREIGN KEY (`link_contact_id`) REFERENCES `contacts` (`contactId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contacttypes`
--

-- DROP TABLE IF EXISTS `contacttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacttypes` (
  `ctypeId` int(11) NOT NULL,
  `ctypeName` varchar(100) DEFAULT NULL,
  `ctypeAmount` int(11) DEFAULT NULL,
  PRIMARY KEY (`ctypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `country`
--

-- DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `country_id` char(2) NOT NULL,
  `country_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dashboard`
--

-- DROP TABLE IF EXISTS `dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard` (
  `dashboard_id` int(11) NOT NULL AUTO_INCREMENT,
  `dashboard_date` date NOT NULL,
  `dashboard_data` text,
  `dashboard_valid` char(1) NOT NULL DEFAULT 'N',
  `CREATED_BY` int(11) DEFAULT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` int(11) DEFAULT NULL,
  `UPDATED_DATE` timestamp NULL DEFAULT NULL,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dashboard_id`),
  UNIQUE KEY `dashboard_uk1` (`dashboard_date`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbversion`
--

-- DROP TABLE IF EXISTS `dbversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbversion` (
  `DBVERSION` varchar(32) NOT NULL,
  `PREV_DBVERSION` varchar(32) DEFAULT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`DBVERSION`),
  KEY `DBVERSION_FK1` (`PREV_DBVERSION`),
  CONSTRAINT `DBVERSION_FK1` FOREIGN KEY (`PREV_DBVERSION`) REFERENCES `dbversion` (`DBVERSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `debtor`
--

-- DROP TABLE IF EXISTS `debtor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `debtor` (
  `DEBTOR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFERENCE` varchar(50) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `CLIENT_ID` int(11) NOT NULL,
  `CONTACT_ID` int(11) NOT NULL,
  `CREATED_BY` int(11) NOT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` int(11) DEFAULT NULL,
  `UPDATED_DATE` timestamp NULL DEFAULT NULL,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  `LEGAL_NAME` varchar(255) DEFAULT NULL,
  `TRADING_NAME` varchar(255) DEFAULT NULL,
  `ABN` varchar(20) DEFAULT NULL,
  `ACN` varchar(20) DEFAULT NULL,
  `NOTES` text,
  `LEGAL_TYPE_ID` int(11) DEFAULT NULL,
  `DEBT_TYPE_ID` int(11) DEFAULT NULL,
  `LOGICALLY_DELETED` char(1) DEFAULT NULL,
  PRIMARY KEY (`DEBTOR_ID`),
  KEY `DEBTOR_FK2` (`CONTACT_ID`),
  KEY `DEBTOR_FK3` (`LEGAL_TYPE_ID`),
  KEY `DEBTOR_FK4` (`DEBT_TYPE_ID`),
  KEY `DEBTOR_FK1` (`CLIENT_ID`),
  CONSTRAINT `DEBTOR_FK1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `clients` (`clientId`),
  CONSTRAINT `DEBTOR_FK2` FOREIGN KEY (`CONTACT_ID`) REFERENCES `contacts` (`contactId`),
  CONSTRAINT `DEBTOR_FK3` FOREIGN KEY (`LEGAL_TYPE_ID`) REFERENCES `legal_type` (`LEGAL_TYPE_ID`),
  CONSTRAINT `DEBTOR_FK4` FOREIGN KEY (`DEBT_TYPE_ID`) REFERENCES `debttypes` (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `debttypes`
--

-- DROP TABLE IF EXISTS `debttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `debttypes` (
  `typeId` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(50) DEFAULT NULL,
  `typeInsuredDetails` bit(1) DEFAULT NULL,
  `typeTPP` bit(1) DEFAULT NULL,
  `typeTPO` bit(1) DEFAULT NULL,
  `typeTPI` bit(1) DEFAULT NULL,
  `POLICE_REPORT` char(1) NOT NULL DEFAULT 'Y',
  `pol` char(1) NOT NULL DEFAULT 'Y',
  `workgroup_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `disbursement`
--

-- DROP TABLE IF EXISTS `disbursement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disbursement` (
  `DISBURSEMENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DISBURSEMENT_TYPE` int(11) NOT NULL,
  `DISBURSEMENT_DATE` date DEFAULT NULL,
  `DISBURSEMENT_AMOUNT` decimal(19,2) NOT NULL DEFAULT '0.00',
  `DISBURSEMENT_GST` decimal(19,2) NOT NULL DEFAULT '0.00',
  `DISBURSEMENT_NUMBER` varchar(50) DEFAULT NULL,
  `DISBURSEMENT_EXPLANATION` text,
  `SUPPLIER_ID` int(11) DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` int(11) DEFAULT NULL,
  `UPDATED_DATE` timestamp NULL DEFAULT NULL,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  `document_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`DISBURSEMENT_ID`),
  KEY `disbursement_fk1` (`SUPPLIER_ID`),
  KEY `disbursement_fk2` (`document_id`),
  CONSTRAINT `disbursement_fk1` FOREIGN KEY (`SUPPLIER_ID`) REFERENCES `suppliers` (`supplierId`),
  CONSTRAINT `disbursement_fk2` FOREIGN KEY (`document_id`) REFERENCES `document` (`document_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `document`
--

-- DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document` (
  `document_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `content` mediumblob NOT NULL,
  `content_type` varchar(128) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` timestamp NULL DEFAULT NULL,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`document_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eft_banks`
--

-- DROP TABLE IF EXISTS `eft_banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eft_banks` (
  `bankId` int(11) NOT NULL AUTO_INCREMENT,
  `bankName` varchar(255) DEFAULT NULL,
  `bankBalance` decimal(19,2) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `BSB` varchar(10) DEFAULT NULL,
  `ACCOUNT_NAME` varchar(255) DEFAULT NULL,
  `ACCOUNT_NUMBER` varchar(50) DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` int(11) DEFAULT NULL,
  `UPDATED_DATE` timestamp NULL DEFAULT NULL,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  `account_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`bankId`),
  UNIQUE KEY `eft_banks_uk1` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expect_rec`
--

-- DROP TABLE IF EXISTS `expect_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expect_rec` (
  `EXPECT_REC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `EXPECT_DATE` date DEFAULT NULL,
  `EXPECT_AMOUNT` float(10,2) DEFAULT NULL,
  `RECEIVED_BY` int(11) DEFAULT NULL,
  `RECEIVED_DATE` date DEFAULT NULL,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`EXPECT_REC_ID`),
  KEY `EXPECT_REC_FK1` (`RECEIVED_BY`),
  CONSTRAINT `EXPECT_REC_FK1` FOREIGN KEY (`RECEIVED_BY`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `file_contact`
--

-- DROP TABLE IF EXISTS `file_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_contact` (
  `contactId` int(11) NOT NULL,
  `fileId` int(11) NOT NULL,
  `contactPosition` varchar(255) DEFAULT NULL,
  `contactType` int(11) DEFAULT NULL,
  `companyName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`contactId`),
  KEY `file_contact_fk1` (`fileId`),
  CONSTRAINT `file_contact_fk1` FOREIGN KEY (`fileId`) REFERENCES `files` (`fileId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `file_property`
--

-- DROP TABLE IF EXISTS `file_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_property` (
  `file_property_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` int(11) NOT NULL,
  `prop_key` varchar(64) NOT NULL,
  `prop_desc` varchar(128) DEFAULT NULL,
  `prop_value` varchar(256) DEFAULT NULL,
  `prop_fixed` char(1) NOT NULL DEFAULT 'Y',
  `CREATED_BY` int(11) DEFAULT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` int(11) DEFAULT NULL,
  `UPDATED_DATE` timestamp NULL DEFAULT NULL,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`file_property_id`),
  UNIQUE KEY `file_property_uk1` (`file_id`,`prop_key`),
  CONSTRAINT `file_property_fk1` FOREIGN KEY (`file_id`) REFERENCES `files` (`fileId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `file_type`
--

-- DROP TABLE IF EXISTS `file_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_type` (
  `file_type_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `background_color` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`file_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `file_type_mapping`
--

-- DROP TABLE IF EXISTS `file_type_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_type_mapping` (
  `file_type_mapping_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_type_id` int(11) NOT NULL,
  `debt_type_id` int(11) NOT NULL,
  `loss_type_id` int(11) NOT NULL,
  `loss_desc_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`file_type_mapping_id`),
  UNIQUE KEY `file_type_mapping_uk1` (`debt_type_id`,`loss_type_id`,`loss_desc_id`),
  KEY `file_type_mapping_fk1` (`file_type_id`),
  KEY `file_type_mapping_fk3` (`loss_type_id`),
  KEY `file_type_mapping_fk4` (`loss_desc_id`),
  CONSTRAINT `file_type_mapping_fk1` FOREIGN KEY (`file_type_id`) REFERENCES `file_type` (`file_type_id`),
  CONSTRAINT `file_type_mapping_fk2` FOREIGN KEY (`debt_type_id`) REFERENCES `debttypes` (`typeId`),
  CONSTRAINT `file_type_mapping_fk3` FOREIGN KEY (`loss_type_id`) REFERENCES `loss_type` (`LOSS_TYPE_ID`),
  CONSTRAINT `file_type_mapping_fk4` FOREIGN KEY (`loss_desc_id`) REFERENCES `loss_desc` (`LOSS_DESC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `files`
--

-- DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `fileId` int(11) NOT NULL AUTO_INCREMENT,
  `fileClientId` int(11) DEFAULT NULL,
  `fileClientContactId` int(11) DEFAULT NULL,
  `fileContactId` int(11) DEFAULT NULL,
  `fileAgentId` int(11) DEFAULT NULL,
  `fileReference` varchar(50) DEFAULT NULL,
  `fileCauseLossId` int(11) DEFAULT NULL,
  `fileInsuredDetailsId` int(11) DEFAULT NULL,
  `fileTPD` int(11) DEFAULT NULL,
  `fileTPP` int(11) DEFAULT NULL,
  `fileTPO` int(11) DEFAULT NULL,
  `fileTPI` int(11) DEFAULT NULL,
  `fileTPR` int(11) DEFAULT NULL,
  `filePoliceReportId` int(11) DEFAULT NULL,
  `fileDateReceived` date DEFAULT NULL,
  `fileAmountClaimed` decimal(19,2) NOT NULL DEFAULT '0.00',
  `fileAmountEstimated` decimal(19,2) NOT NULL DEFAULT '0.00',
  `fileAmountRecovered` decimal(19,2) NOT NULL DEFAULT '0.00',
  `fileTrustBalance` decimal(19,2) NOT NULL DEFAULT '0.00',
  `fileMotorcare` bit(1) NOT NULL DEFAULT b'0',
  `fileStatus` int(11) NOT NULL,
  `fileWorkGroupId` int(11) NOT NULL,
  `fileTPStatusId` int(11) DEFAULT NULL,
  `fileBillingFeeId` int(11) DEFAULT NULL,
  `INCIDENT_DETAILS_ID` int(11) DEFAULT NULL,
  `REC_STATUS_ID` int(11) DEFAULT NULL,
  `EXPECT_REC_ID` int(11) DEFAULT NULL,
  `LEGALS_COMMENCED` char(1) NOT NULL DEFAULT 'N',
  `DEBTOR_ID` int(11) DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` int(11) DEFAULT NULL,
  `UPDATED_DATE` timestamp NULL DEFAULT NULL,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  `BILLING_USER_ID` int(11) DEFAULT NULL,
  `jurisdiction_id` int(11) DEFAULT NULL,
  `max_hourly_rate` decimal(19,2) DEFAULT NULL,
  `parent_file_id` int(11) DEFAULT NULL,
  `amount_insured_loss` decimal(19,2) DEFAULT NULL,
  `amount_uninsured_loss` decimal(19,2) DEFAULT NULL,
  `amount_insured_excess` decimal(19,2) DEFAULT NULL,
  `amount_gst_recover` decimal(19,2) DEFAULT NULL,
  `trade_practices_action` char(1) NOT NULL DEFAULT 'N',
  `date_closed` datetime DEFAULT NULL,
  `date_opened` datetime DEFAULT NULL,
  `rec_status_updated_date` timestamp NULL DEFAULT NULL,
  `rec_status_updated_by` int(11) DEFAULT NULL,
  `event_no` varchar(50) DEFAULT NULL,
  `amount_target` decimal(19,2) DEFAULT NULL,
  `date_closed_final` datetime DEFAULT NULL,
  `date_archived` datetime DEFAULT NULL,
  `amount_owing` decimal(19,2) DEFAULT NULL,
  `date_stage2` datetime DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `team_leader_id` int(11) DEFAULT NULL,
  `account_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`fileId`),
  UNIQUE KEY `FILES_UK1` (`fileReference`),
  UNIQUE KEY `files_uk2` (`account_id`),
  KEY `FILES_FK1` (`INCIDENT_DETAILS_ID`),
  KEY `FILES_FK2` (`REC_STATUS_ID`),
  KEY `FILES_FK3` (`EXPECT_REC_ID`),
  KEY `FILES_FK4` (`fileClientId`),
  KEY `FILES_IDX1` (`fileWorkGroupId`),
  KEY `USERS_FK5` (`fileAgentId`),
  KEY `FILES_FK6` (`fileBillingFeeId`),
  KEY `FILES_FK8` (`fileTPStatusId`),
  KEY `FILES_FK9` (`DEBTOR_ID`),
  KEY `FILES_FK11` (`fileTPD`),
  KEY `FILES_FK12` (`BILLING_USER_ID`),
  KEY `files_fk13` (`jurisdiction_id`),
  KEY `FILES_FK10` (`parent_file_id`),
  KEY `files_idx4` (`fileStatus`),
  KEY `FILES_FK14` (`manager_id`),
  KEY `FILES_FK15` (`team_leader_id`),
  CONSTRAINT `FILES_FK1` FOREIGN KEY (`INCIDENT_DETAILS_ID`) REFERENCES `incident_details` (`INCIDENT_DETAILS_ID`),
  CONSTRAINT `FILES_FK10` FOREIGN KEY (`parent_file_id`) REFERENCES `files` (`fileId`),
  CONSTRAINT `FILES_FK11` FOREIGN KEY (`fileTPD`) REFERENCES `tpdebtors` (`tpdId`),
  CONSTRAINT `FILES_FK12` FOREIGN KEY (`BILLING_USER_ID`) REFERENCES `users` (`userId`),
  CONSTRAINT `FILES_FK14` FOREIGN KEY (`manager_id`) REFERENCES `users` (`userId`),
  CONSTRAINT `FILES_FK15` FOREIGN KEY (`team_leader_id`) REFERENCES `users` (`userId`),
  CONSTRAINT `FILES_FK2` FOREIGN KEY (`REC_STATUS_ID`) REFERENCES `rec_status` (`REC_STATUS_ID`),
  CONSTRAINT `FILES_FK3` FOREIGN KEY (`EXPECT_REC_ID`) REFERENCES `expect_rec` (`EXPECT_REC_ID`),
  CONSTRAINT `FILES_FK4` FOREIGN KEY (`fileClientId`) REFERENCES `clients` (`clientId`),
  CONSTRAINT `FILES_FK6` FOREIGN KEY (`fileBillingFeeId`) REFERENCES `billing_file` (`feeId`),
  CONSTRAINT `FILES_FK7` FOREIGN KEY (`fileWorkGroupId`) REFERENCES `workgroups` (`wgroupId`),
  CONSTRAINT `FILES_FK8` FOREIGN KEY (`fileTPStatusId`) REFERENCES `tpstatus` (`statusId`),
  CONSTRAINT `FILES_FK9` FOREIGN KEY (`DEBTOR_ID`) REFERENCES `debtor` (`DEBTOR_ID`),
  CONSTRAINT `USERS_FK5` FOREIGN KEY (`fileAgentId`) REFERENCES `users` (`userId`),
  CONSTRAINT `files_fk13` FOREIGN KEY (`jurisdiction_id`) REFERENCES `state` (`STATE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `files_aud`
--

-- DROP TABLE IF EXISTS `files_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files_aud` (
  `fileId` int(11) NOT NULL,
  `fileClientId` int(11) DEFAULT NULL,
  `fileClientContactId` int(11) DEFAULT NULL,
  `fileContactId` int(11) DEFAULT NULL,
  `fileAgentId` int(11) DEFAULT NULL,
  `fileReference` varchar(50) DEFAULT NULL,
  `fileCauseLossId` int(11) DEFAULT NULL,
  `fileInsuredName` varchar(100) DEFAULT NULL,
  `fileInsuredDetailsId` int(11) DEFAULT NULL,
  `fileTPD` int(11) DEFAULT NULL,
  `fileTPP` int(11) DEFAULT NULL,
  `fileTPO` int(11) DEFAULT NULL,
  `fileTPI` int(11) DEFAULT NULL,
  `fileTPR` int(11) DEFAULT NULL,
  `filePoliceReportId` int(11) DEFAULT NULL,
  `fileDateReceived` date DEFAULT NULL,
  `fileAmountClaimed` decimal(19,2) DEFAULT NULL,
  `fileAmountEstimated` decimal(19,2) DEFAULT NULL,
  `fileAmountRecovered` decimal(19,2) DEFAULT NULL,
  `fileTrustBalance` decimal(19,2) DEFAULT NULL,
  `fileMotorcare` bit(1) DEFAULT NULL,
  `fileStatus` int(11) DEFAULT NULL,
  `fileWorkGroupId` int(11) DEFAULT NULL,
  `fileTPStatusId` int(11) DEFAULT NULL,
  `fileBillingFeeId` int(11) DEFAULT NULL,
  `INCIDENT_DETAILS_ID` int(11) DEFAULT NULL,
  `REC_STATUS_ID` int(11) DEFAULT NULL,
  `EXPECT_REC_ID` int(11) DEFAULT NULL,
  `LEGALS_COMMENCED` char(1) DEFAULT NULL,
  `DEBTOR_ID` int(11) DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `CREATED_DATE` timestamp NULL DEFAULT NULL,
  `UPDATED_BY` int(11) DEFAULT NULL,
  `UPDATED_DATE` timestamp NULL DEFAULT NULL,
  `LOCK_VERSION` int(11) DEFAULT NULL,
  `BILLING_USER_ID` int(11) DEFAULT NULL,
  `jurisdiction_id` int(11) DEFAULT NULL,
  `max_hourly_rate` decimal(19,2) DEFAULT NULL,
  `parent_file_id` int(11) DEFAULT NULL,
  `amount_insured_loss` decimal(19,2) DEFAULT NULL,
  `amount_uninsured_loss` decimal(19,2) DEFAULT NULL,
  `amount_insured_excess` decimal(19,2) DEFAULT NULL,
  `amount_gst_recover` decimal(19,2) DEFAULT NULL,
  `trade_practices_action` char(1) DEFAULT NULL,
  `date_closed` datetime DEFAULT NULL,
  `date_opened` datetime DEFAULT NULL,
  `rec_status_updated_date` timestamp NULL DEFAULT NULL,
  `rec_status_updated_by` int(11) DEFAULT NULL,
  `event_no` varchar(50) DEFAULT NULL,
  `amount_target` decimal(19,2) DEFAULT NULL,
  `date_closed_final` datetime DEFAULT NULL,
  `date_archived` datetime DEFAULT NULL,
  `amount_owing` decimal(19,2) DEFAULT NULL,
  `rev_id` int(11) NOT NULL,
  `rev_type` tinyint(4) NOT NULL,
  `date_stage2` datetime DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `team_leader_id` int(11) DEFAULT NULL,
  `account_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`fileId`,`rev_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `filesuppliers`
--

-- DROP TABLE IF EXISTS `filesuppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filesuppliers` (
  `fileId` int(11) NOT NULL,
  `supplierId` int(11) NOT NULL,
  `SORT_ORDER` int(11) NOT NULL DEFAULT '0',
  `SUPPLIER_FILE_REFERENCE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`fileId`,`supplierId`),
  KEY `FILE_SUPPLIERS_FK2` (`supplierId`),
  CONSTRAINT `FILE_SUPPLIERS_FK1` FOREIGN KEY (`fileId`) REFERENCES `files` (`fileId`),
  CONSTRAINT `FILE_SUPPLIERS_FK2` FOREIGN KEY (`supplierId`) REFERENCES `suppliers` (`supplierId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `frequency_type`
--

-- DROP TABLE IF EXISTS `frequency_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frequency_type` (
  `frequency_type_id` int(11) NOT NULL,
  `description` varchar(64) NOT NULL,
  `cron` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`frequency_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gst_type`
--

-- DROP TABLE IF EXISTS `gst_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gst_type` (
  `gst_type_id` int(11) NOT NULL,
  `name` varchar(10) NOT NULL,
  `description` varchar(50) NOT NULL,
  `gst` decimal(19,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`gst_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hibernate_sequences`
--

-- DROP TABLE IF EXISTS `hibernate_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(32) NOT NULL,
  `next_val` int(11) NOT NULL,
  PRIMARY KEY (`sequence_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `import_file`
--

-- DROP TABLE IF EXISTS `import_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `import_file` (
  `import_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` char(1) DEFAULT NULL,
  `status_description` varchar(2048) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` int(11) DEFAULT NULL,
  `UPDATED_DATE` timestamp NULL DEFAULT NULL,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`import_file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incident_details`
--

-- DROP TABLE IF EXISTS `incident_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incident_details` (
  `INCIDENT_DETAILS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `INCIDENT_DATE` datetime NOT NULL,
  `LOCATION` varchar(250) DEFAULT NULL,
  `DESCRIPTION` text,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`INCIDENT_DETAILS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info_request`
--

-- DROP TABLE IF EXISTS `info_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info_request` (
  `info_request_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` int(11) NOT NULL,
  `notation` text NOT NULL,
  `who_from` varchar(255) NOT NULL,
  `date_requested` date NOT NULL,
  `date_received` date DEFAULT NULL,
  `LOGICALLY_DELETED` char(1) DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` int(11) DEFAULT NULL,
  `UPDATED_DATE` timestamp NULL DEFAULT NULL,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`info_request_id`),
  KEY `info_request_fk1` (`file_id`),
  KEY `info_request_idx1` (`who_from`),
  CONSTRAINT `info_request_fk1` FOREIGN KEY (`file_id`) REFERENCES `files` (`fileId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `insureddetails`
--

-- DROP TABLE IF EXISTS `insureddetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insureddetails` (
  `insdetId` int(11) NOT NULL AUTO_INCREMENT,
  `insdetContactId` int(11) DEFAULT NULL,
  `LICENCE_NUMBER` varchar(20) DEFAULT NULL,
  `REGO_NUMBER` varchar(20) DEFAULT NULL,
  `VEHICLE_MAKE` varchar(64) DEFAULT NULL,
  `VEHICLE_MODEL` varchar(64) DEFAULT NULL,
  `LOSS_DESCRIPTION` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`insdetId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoices`
--

-- DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `invoiceId` int(11) NOT NULL AUTO_INCREMENT,
  `invoiceClientId` int(11) DEFAULT NULL,
  `invoiceDate` datetime DEFAULT NULL,
  `invoiceAmount` decimal(19,2) NOT NULL DEFAULT '0.00',
  `invoiceFee` decimal(19,2) NOT NULL DEFAULT '0.00',
  `invoiceAuthorisedBy` int(11) DEFAULT NULL,
  `invoiceDateAuthorised` datetime DEFAULT NULL,
  `invoiceFileId` int(11) DEFAULT NULL,
  `invoiceCCFee` decimal(19,2) NOT NULL DEFAULT '0.00',
  `invoiceGST` decimal(19,2) NOT NULL DEFAULT '0.00',
  `invoiceBillingFeeId` int(11) DEFAULT NULL,
  `invoiceChequeId` int(11) DEFAULT NULL,
  `FEE_FLAT` char(1) DEFAULT NULL,
  `AMOUNT_RECOVERED` decimal(19,2) NOT NULL DEFAULT '0.00',
  `invoice_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`invoiceId`),
  UNIQUE KEY `invoices_uk1` (`invoice_id`),
  KEY `INVOICES_FK1` (`invoiceBillingFeeId`),
  KEY `INVOICES_FK2` (`invoiceClientId`),
  KEY `INVOICES_FK3` (`invoiceAuthorisedBy`),
  KEY `INVOICES_FK4` (`invoiceFileId`),
  KEY `INVOICES_FK5` (`invoiceChequeId`),
  CONSTRAINT `INVOICES_FK1` FOREIGN KEY (`invoiceBillingFeeId`) REFERENCES `billing_file` (`feeId`),
  CONSTRAINT `INVOICES_FK2` FOREIGN KEY (`invoiceClientId`) REFERENCES `clients` (`clientId`),
  CONSTRAINT `INVOICES_FK3` FOREIGN KEY (`invoiceAuthorisedBy`) REFERENCES `users` (`userId`),
  CONSTRAINT `INVOICES_FK4` FOREIGN KEY (`invoiceFileId`) REFERENCES `files` (`fileId`),
  CONSTRAINT `INVOICES_FK5` FOREIGN KEY (`invoiceChequeId`) REFERENCES `cheques` (`chequeId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `journals`
--

-- DROP TABLE IF EXISTS `journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journals` (
  `journalId` int(11) NOT NULL AUTO_INCREMENT,
  `journalDate` date DEFAULT NULL,
  `journalAmount` decimal(19,2) NOT NULL DEFAULT '0.00',
  `journalExplanation` text,
  `journalStatus` int(11) NOT NULL,
  `journalFromFileId` int(11) DEFAULT NULL,
  `journalToFileId` int(11) DEFAULT NULL,
  `journalCreatedBy` int(11) DEFAULT NULL,
  `journalAuthorisedBy` int(11) DEFAULT NULL,
  `journalDateAuthorised` date DEFAULT NULL,
  `PAYEE` varchar(100) DEFAULT NULL,
  `BANK_ID` int(11) DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` int(11) DEFAULT NULL,
  `UPDATED_DATE` timestamp NULL DEFAULT NULL,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`journalId`),
  KEY `JOURNALS_FK1` (`BANK_ID`),
  CONSTRAINT `JOURNALS_FK1` FOREIGN KEY (`BANK_ID`) REFERENCES `banks` (`bankId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `legal_type`
--

-- DROP TABLE IF EXISTS `legal_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `legal_type` (
  `LEGAL_TYPE_ID` int(11) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`LEGAL_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `letters`
--

-- DROP TABLE IF EXISTS `letters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `letters` (
  `letterId` int(11) NOT NULL AUTO_INCREMENT,
  `letterName` varchar(255) DEFAULT NULL,
  `letterBody` text,
  PRIMARY KEY (`letterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `links`
--

-- DROP TABLE IF EXISTS `links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `links` (
  `links_id` int(11) NOT NULL AUTO_INCREMENT,
  `links_title` varchar(255) DEFAULT NULL,
  `links_date` date DEFAULT NULL,
  `links_date_end` date DEFAULT NULL,
  `links_text` text NOT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` int(11) DEFAULT NULL,
  `UPDATED_DATE` timestamp NULL DEFAULT NULL,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`links_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `loss_desc`
--

-- DROP TABLE IF EXISTS `loss_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loss_desc` (
  `LOSS_DESC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` varchar(50) NOT NULL,
  `CREATED_BY` int(11) NOT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  `action_code_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`LOSS_DESC_ID`),
  KEY `LOSS_DESC_FK1` (`CREATED_BY`),
  KEY `loss_desc_fk2` (`action_code_id`),
  CONSTRAINT `LOSS_DESC_FK1` FOREIGN KEY (`CREATED_BY`) REFERENCES `users` (`userId`),
  CONSTRAINT `loss_desc_fk2` FOREIGN KEY (`action_code_id`) REFERENCES `actioncodes` (`actcId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `loss_type`
--

-- DROP TABLE IF EXISTS `loss_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loss_type` (
  `LOSS_TYPE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` varchar(50) NOT NULL,
  `CREATED_BY` int(11) NOT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`LOSS_TYPE_ID`),
  KEY `LOSS_TYPE_FK1` (`CREATED_BY`),
  CONSTRAINT `LOSS_TYPE_FK1` FOREIGN KEY (`CREATED_BY`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `news`
--

-- DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_title` varchar(255) DEFAULT NULL,
  `news_date` date NOT NULL,
  `news_date_end` date DEFAULT NULL,
  `news_text` text NOT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` int(11) DEFAULT NULL,
  `UPDATED_DATE` timestamp NULL DEFAULT NULL,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notes`
--

-- DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `noteId` int(11) NOT NULL AUTO_INCREMENT,
  `noteDate` datetime DEFAULT NULL,
  `noteCreatedBy` int(11) DEFAULT NULL,
  `noteText` text,
  `noteFileId` int(11) DEFAULT NULL,
  PRIMARY KEY (`noteId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pol_documents`
--

-- DROP TABLE IF EXISTS `pol_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pol_documents` (
  `poldocId` int(11) NOT NULL AUTO_INCREMENT,
  `poldocName` varchar(255) DEFAULT NULL,
  `poldocSign` char(1) NOT NULL DEFAULT '+',
  PRIMARY KEY (`poldocId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pol_type_docs`
--

-- DROP TABLE IF EXISTS `pol_type_docs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pol_type_docs` (
  `poltId` int(11) NOT NULL,
  `poldocId` int(11) NOT NULL,
  PRIMARY KEY (`poltId`,`poldocId`),
  KEY `POL_TYPE_DOCS_FK2` (`poldocId`),
  CONSTRAINT `POL_TYPE_DOCS_FK1` FOREIGN KEY (`poltId`) REFERENCES `pol_types` (`poltId`),
  CONSTRAINT `POL_TYPE_DOCS_FK2` FOREIGN KEY (`poldocId`) REFERENCES `pol_documents` (`poldocId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pol_types`
--

-- DROP TABLE IF EXISTS `pol_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pol_types` (
  `poltId` int(11) NOT NULL AUTO_INCREMENT,
  `poltName` varchar(255) DEFAULT NULL,
  `poltActive` bit(1) NOT NULL,
  PRIMARY KEY (`poltId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `policereports`
--

-- DROP TABLE IF EXISTS `policereports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `policereports` (
  `policeRepId` int(11) NOT NULL AUTO_INCREMENT,
  `policeRepNumber` varchar(50) DEFAULT NULL,
  `policeRepOfficerName` varchar(50) DEFAULT NULL,
  `policeRepStationName` varchar(50) DEFAULT NULL,
  `policeRepStationPhone` varchar(20) DEFAULT NULL,
  `policeRepStationFax` varchar(20) DEFAULT NULL,
  `policeRepStationEmail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`policeRepId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proof_of_loss`
--

-- DROP TABLE IF EXISTS `proof_of_loss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proof_of_loss` (
  `polId` int(11) NOT NULL AUTO_INCREMENT,
  `polFileId` int(11) NOT NULL,
  `polType` int(11) DEFAULT NULL,
  `POL_COMPLETED` char(1) NOT NULL DEFAULT 'N',
  `AMOUNT_OK` char(1) NOT NULL DEFAULT 'N',
  `ASSESSOR_OK` char(1) DEFAULT NULL,
  `QUOTE_OK` char(1) DEFAULT NULL,
  `INVOICE_OK` char(1) DEFAULT NULL,
  `PAV_OK` char(1) DEFAULT NULL,
  `SALVAGE_OK` char(1) DEFAULT NULL,
  `TOW_INVOICE_OK` char(1) DEFAULT NULL,
  `UPDATED_BY` int(11) NOT NULL,
  `UPDATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  `DEMURRAGE_OK` char(1) DEFAULT NULL,
  PRIMARY KEY (`polId`),
  KEY `PROOF_OF_LOSS_FK2` (`polType`),
  KEY `PROOF_OF_LOSS_FK3` (`UPDATED_BY`),
  KEY `PROOF_OF_LOSS_IDX1` (`polFileId`),
  KEY `PROOF_OF_LOSS_IDX2` (`UPDATED_DATE`),
  CONSTRAINT `PROOF_OF_LOSS_FK1` FOREIGN KEY (`polFileId`) REFERENCES `files` (`fileId`),
  CONSTRAINT `PROOF_OF_LOSS_FK2` FOREIGN KEY (`polType`) REFERENCES `pol_types` (`poltId`),
  CONSTRAINT `PROOF_OF_LOSS_FK3` FOREIGN KEY (`UPDATED_BY`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proof_of_loss_docs`
--

-- DROP TABLE IF EXISTS `proof_of_loss_docs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proof_of_loss_docs` (
  `docId` int(11) NOT NULL AUTO_INCREMENT,
  `docPOL` int(11) DEFAULT NULL,
  `docType` int(11) DEFAULT NULL,
  `docSubtotal` decimal(19,2) DEFAULT NULL,
  `docGST` decimal(19,2) DEFAULT NULL,
  `docSupplier` varchar(255) DEFAULT NULL,
  `docNotes` text,
  PRIMARY KEY (`docId`),
  KEY `PROOF_OF_LOSS_DOCS_FK1` (`docPOL`),
  KEY `PROOF_OF_LOSS_DOCS_FK2` (`docType`),
  CONSTRAINT `PROOF_OF_LOSS_DOCS_FK1` FOREIGN KEY (`docPOL`) REFERENCES `proof_of_loss` (`polId`),
  CONSTRAINT `PROOF_OF_LOSS_DOCS_FK2` FOREIGN KEY (`docType`) REFERENCES `pol_documents` (`poldocId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `public_holiday`
--

-- DROP TABLE IF EXISTS `public_holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `public_holiday` (
  `PUBLIC_HOLIDAY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `START_DATE` date NOT NULL,
  `END_DATE` date NOT NULL,
  `STATE` varchar(3) DEFAULT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` int(11) DEFAULT NULL,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`PUBLIC_HOLIDAY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quality_rating`
--

-- DROP TABLE IF EXISTS `quality_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quality_rating` (
  `quality_rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `active` char(1) NOT NULL DEFAULT 'Y',
  `CREATED_BY` int(11) DEFAULT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` int(11) DEFAULT NULL,
  `UPDATED_DATE` timestamp NULL DEFAULT NULL,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  `priority` int(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`quality_rating_id`),
  UNIQUE KEY `quality_rating_uk1` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `question_type`
--

-- DROP TABLE IF EXISTS `question_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_type` (
  `question_type_id` int(11) NOT NULL,
  `question_type_name` varchar(100) NOT NULL,
  PRIMARY KEY (`question_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `questionary`
--

-- DROP TABLE IF EXISTS `questionary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionary` (
  `questionary_id` int(11) NOT NULL,
  `questionary_name` varchar(255) NOT NULL,
  `questionary_description` varchar(512) DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` int(11) DEFAULT NULL,
  `UPDATED_DATE` timestamp NULL DEFAULT NULL,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  `questionary_optional` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`questionary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `questionary_answer`
--

-- DROP TABLE IF EXISTS `questionary_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionary_answer` (
  `questionary_answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `next_question_id` int(11) DEFAULT NULL,
  `answer_order` int(11) DEFAULT NULL,
  `answer_name` varchar(512) DEFAULT NULL,
  `answer_record_reason` char(1) NOT NULL DEFAULT 'N',
  `answer_spel` varchar(512) DEFAULT NULL,
  `outcome_id` int(11) DEFAULT NULL,
  `answer_description` varchar(512) DEFAULT NULL,
  `answer_definition` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`questionary_answer_id`),
  KEY `questionary_answer_fk1` (`question_id`),
  KEY `questionary_answer_fk2` (`next_question_id`),
  KEY `questionary_answer_fk3` (`outcome_id`),
  CONSTRAINT `questionary_answer_fk1` FOREIGN KEY (`question_id`) REFERENCES `questionary_question` (`questionary_question_id`),
  CONSTRAINT `questionary_answer_fk2` FOREIGN KEY (`next_question_id`) REFERENCES `questionary_question` (`questionary_question_id`),
  CONSTRAINT `questionary_answer_fk3` FOREIGN KEY (`outcome_id`) REFERENCES `actionoutcomes` (`outId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `questionary_question`
--

-- DROP TABLE IF EXISTS `questionary_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionary_question` (
  `questionary_question_id` int(11) NOT NULL AUTO_INCREMENT,
  `questionary_id` int(11) NOT NULL,
  `question_order` int(11) NOT NULL,
  `question_type_id` int(11) NOT NULL,
  `question_name` varchar(255) NOT NULL,
  `question_description` varchar(512) DEFAULT NULL,
  `tab_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`questionary_question_id`),
  KEY `questionary_question_fk1` (`question_type_id`),
  KEY `questionary_question_fk2` (`questionary_id`),
  KEY `questionary_question_fk3` (`tab_id`),
  CONSTRAINT `questionary_question_fk1` FOREIGN KEY (`question_type_id`) REFERENCES `question_type` (`question_type_id`),
  CONSTRAINT `questionary_question_fk2` FOREIGN KEY (`questionary_id`) REFERENCES `questionary` (`questionary_id`),
  CONSTRAINT `questionary_question_fk3` FOREIGN KEY (`tab_id`) REFERENCES `questionary_tab` (`questionary_tab_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `questionary_tab`
--

-- DROP TABLE IF EXISTS `questionary_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionary_tab` (
  `questionary_tab_id` int(11) NOT NULL AUTO_INCREMENT,
  `questionary_id` int(11) NOT NULL,
  `tab_order` int(11) NOT NULL,
  `tab_name` varchar(255) NOT NULL,
  `tab_description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`questionary_tab_id`),
  KEY `questionary_tab_fk1` (`questionary_id`),
  CONSTRAINT `questionary_tab_fk1` FOREIGN KEY (`questionary_id`) REFERENCES `questionary` (`questionary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rec_status`
--

-- DROP TABLE IF EXISTS `rec_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rec_status` (
  `REC_STATUS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REC_STATUS_NAME` varchar(50) NOT NULL,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`REC_STATUS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `receipts`
--

-- DROP TABLE IF EXISTS `receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipts` (
  `receiptId` int(11) NOT NULL,
  `receiptBankId` int(11) DEFAULT NULL,
  `receiptDate` date DEFAULT NULL,
  `receiptType` int(11) NOT NULL,
  `receiptAmount` decimal(19,2) NOT NULL DEFAULT '0.00',
  `receiptDatePrinted` datetime DEFAULT NULL,
  `receiptPayee` varchar(255) DEFAULT NULL,
  `receiptChequeNumber` varchar(20) DEFAULT NULL,
  `receiptDepositId` int(11) DEFAULT NULL,
  `receiptDatePresented` date DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` int(11) DEFAULT NULL,
  `UPDATED_DATE` timestamp NULL DEFAULT NULL,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`receiptId`),
  KEY `RECEIPTS_FK1` (`receiptBankId`),
  CONSTRAINT `RECEIPTS_FK1` FOREIGN KEY (`receiptBankId`) REFERENCES `banks` (`bankId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `repayment`
--

-- DROP TABLE IF EXISTS `repayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repayment` (
  `REPAYMENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FILE_ID` int(11) NOT NULL,
  `INITIAL_AMOUNT` decimal(19,2) NOT NULL DEFAULT '0.00',
  `FEE` decimal(19,2) NOT NULL DEFAULT '0.00',
  `INITIAL_DATE` date DEFAULT NULL,
  `START_DATE` date DEFAULT NULL,
  `AMOUNT` decimal(19,2) NOT NULL DEFAULT '0.00',
  `FREQUENCY` int(11) NOT NULL,
  `FREQUENCY_TYPE` int(11) NOT NULL,
  `COMMENT` text,
  `PAYMENT_METHOD` int(11) NOT NULL,
  `PAYMENT_REFERENCE` varchar(64) DEFAULT NULL,
  `SIGNED_AGREE` bit(1) DEFAULT NULL,
  `STOP_REMINDER` bit(1) DEFAULT NULL,
  `NEXT_ID` int(11) DEFAULT NULL,
  `CREATED_BY` int(11) NOT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  `AMOUNT_OWING` decimal(19,2) NOT NULL DEFAULT '0.00',
  `STOP_OVERDUE` bit(1) DEFAULT NULL,
  PRIMARY KEY (`REPAYMENT_ID`),
  KEY `REPAYMENT_FK1` (`FILE_ID`),
  KEY `REPAYMENT_FK2` (`CREATED_BY`),
  KEY `REPAYMENT_FK3` (`NEXT_ID`),
  CONSTRAINT `REPAYMENT_FK1` FOREIGN KEY (`FILE_ID`) REFERENCES `files` (`fileId`),
  CONSTRAINT `REPAYMENT_FK2` FOREIGN KEY (`CREATED_BY`) REFERENCES `users` (`userId`),
  CONSTRAINT `REPAYMENT_FK3` FOREIGN KEY (`NEXT_ID`) REFERENCES `repayment` (`REPAYMENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `repayment_schedule`
--

-- DROP TABLE IF EXISTS `repayment_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repayment_schedule` (
  `REPAYMENT_SCHEDULE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REPAYMENT_ID` int(11) NOT NULL,
  `DUE_DATE` date NOT NULL,
  `AMOUNT` decimal(19,2) NOT NULL DEFAULT '0.00',
  `PAID_DATE` date DEFAULT NULL,
  `PAID_AMOUNT` decimal(19,2) NOT NULL DEFAULT '0.00',
  `CREATED_BY` int(11) NOT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`REPAYMENT_SCHEDULE_ID`),
  KEY `REPAYMENT_SCHEDULE_FK1` (`REPAYMENT_ID`),
  KEY `REPAYMENT_SCHEDULE_FK2` (`CREATED_BY`),
  CONSTRAINT `REPAYMENT_SCHEDULE_FK1` FOREIGN KEY (`REPAYMENT_ID`) REFERENCES `repayment` (`REPAYMENT_ID`),
  CONSTRAINT `REPAYMENT_SCHEDULE_FK2` FOREIGN KEY (`CREATED_BY`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revinfo`
--

-- DROP TABLE IF EXISTS `revinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revinfo` (
  `rev_id` int(11) NOT NULL AUTO_INCREMENT,
  `rev_tstmp` bigint(20) NOT NULL,
  PRIMARY KEY (`rev_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `securitygroups`
--

-- DROP TABLE IF EXISTS `securitygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `securitygroups` (
  `groupId` int(11) NOT NULL AUTO_INCREMENT,
  `groupName` varchar(50) DEFAULT NULL,
  `file_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`groupId`),
  UNIQUE KEY `securitygroups_uk1` (`file_type_id`),
  CONSTRAINT `securitygroups_fk1` FOREIGN KEY (`file_type_id`) REFERENCES `file_type` (`file_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `state`
--

-- DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `STATE_ID` int(11) NOT NULL,
  `STATE` varchar(10) NOT NULL,
  `COUNTRY` char(2) DEFAULT NULL,
  `STATUTE_BARRED_MONTHS` int(11) NOT NULL,
  PRIMARY KEY (`STATE_ID`),
  KEY `state_fk1` (`COUNTRY`),
  CONSTRAINT `state_fk1` FOREIGN KEY (`COUNTRY`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supplier_service`
--

-- DROP TABLE IF EXISTS `supplier_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier_service` (
  `supplier_service_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `myob_inventory_type` varchar(10) DEFAULT NULL,
  `myob_account_number` int(11) NOT NULL,
  `gst_type_id` int(11) NOT NULL,
  `active` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`supplier_service_id`),
  KEY `supplier_service_fk1` (`gst_type_id`),
  CONSTRAINT `supplier_service_fk1` FOREIGN KEY (`gst_type_id`) REFERENCES `gst_type` (`gst_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supplierinvoices`
--

-- DROP TABLE IF EXISTS `supplierinvoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplierinvoices` (
  `invoiceId` int(11) NOT NULL AUTO_INCREMENT,
  `invoiceSupplierId` int(11) DEFAULT NULL,
  `invoiceNumber` varchar(50) DEFAULT NULL,
  `invoiceFileId` int(11) NOT NULL,
  `invoiceDescription` text,
  `invoiceSubtotal` decimal(19,2) NOT NULL DEFAULT '0.00',
  `invoiceGST` decimal(19,2) NOT NULL DEFAULT '0.00',
  `invoiceAuthorisedBy` int(11) DEFAULT NULL,
  `invoiceWhoPays` int(11) DEFAULT NULL,
  `invoiceDateExported` datetime DEFAULT NULL,
  `invoiceDateEntered` datetime DEFAULT NULL,
  `invoiceEnteredBy` int(11) DEFAULT NULL,
  `invoiceClientInvoiceId` int(11) DEFAULT NULL,
  `INVOICE_DATE` date DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`invoiceId`),
  UNIQUE KEY `invoiceNumber` (`invoiceSupplierId`,`invoiceNumber`),
  KEY `SUPPLIERINVOICES_FK2` (`invoiceFileId`),
  KEY `SUPPLIERINVOICES_FK3` (`invoiceAuthorisedBy`),
  KEY `SUPPLIERINVOICES_FK4` (`invoiceEnteredBy`),
  KEY `supplierinvoices_fk5` (`document_id`),
  CONSTRAINT `SUPPLIERINVOICES_FK1` FOREIGN KEY (`invoiceSupplierId`) REFERENCES `suppliers` (`supplierId`),
  CONSTRAINT `SUPPLIERINVOICES_FK2` FOREIGN KEY (`invoiceFileId`) REFERENCES `files` (`fileId`),
  CONSTRAINT `SUPPLIERINVOICES_FK3` FOREIGN KEY (`invoiceAuthorisedBy`) REFERENCES `users` (`userId`),
  CONSTRAINT `SUPPLIERINVOICES_FK4` FOREIGN KEY (`invoiceEnteredBy`) REFERENCES `users` (`userId`),
  CONSTRAINT `supplierinvoices_fk5` FOREIGN KEY (`document_id`) REFERENCES `document` (`document_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `suppliers`
--

-- DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `supplierId` int(11) NOT NULL AUTO_INCREMENT,
  `supplierName` varchar(50) DEFAULT NULL,
  `supplierTradingName` varchar(50) DEFAULT NULL,
  `supplierHowTrading` int(11) NOT NULL,
  `supplierABN` varchar(50) DEFAULT NULL,
  `supplierACN` varchar(50) DEFAULT NULL,
  `supplierTypeId` int(11) DEFAULT NULL,
  `supplierPrimaryContactId` int(11) DEFAULT NULL,
  `supplierPayableContactId` int(11) DEFAULT NULL,
  `supplierAddressId` int(11) DEFAULT NULL,
  `supplierPostalAddressId` int(11) DEFAULT NULL,
  `supplierCreatedBy` int(11) DEFAULT NULL,
  `supplierDateCreated` datetime DEFAULT NULL,
  `supplier_service_id` int(11) DEFAULT NULL,
  `myob_card_name` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`supplierId`),
  KEY `suppliers_fk1` (`supplier_service_id`),
  CONSTRAINT `suppliers_fk1` FOREIGN KEY (`supplier_service_id`) REFERENCES `supplier_service` (`supplier_service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `suppliertypes`
--

-- DROP TABLE IF EXISTS `suppliertypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliertypes` (
  `suptId` int(11) NOT NULL AUTO_INCREMENT,
  `suptName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`suptId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supplierusers`
--

-- DROP TABLE IF EXISTS `supplierusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplierusers` (
  `userId` int(11) NOT NULL,
  `supplierId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`supplierId`),
  KEY `SUPPLIER_USERS_FK2` (`supplierId`),
  CONSTRAINT `SUPPLIER_USERS_FK1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`),
  CONSTRAINT `SUPPLIER_USERS_FK2` FOREIGN KEY (`supplierId`) REFERENCES `suppliers` (`supplierId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_access`
--

-- DROP TABLE IF EXISTS `system_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_access` (
  `SECURITY_GROUP_ID` int(11) NOT NULL,
  `SYSTEM_FUNCTION_ID` int(11) NOT NULL,
  PRIMARY KEY (`SECURITY_GROUP_ID`,`SYSTEM_FUNCTION_ID`),
  KEY `SYSTEM_ACCESS_FK2` (`SYSTEM_FUNCTION_ID`),
  CONSTRAINT `SYSTEM_ACCESS_FK1` FOREIGN KEY (`SECURITY_GROUP_ID`) REFERENCES `securitygroups` (`groupId`),
  CONSTRAINT `SYSTEM_ACCESS_FK2` FOREIGN KEY (`SYSTEM_FUNCTION_ID`) REFERENCES `system_function` (`SYSTEM_FUNCTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_function`
--

-- DROP TABLE IF EXISTS `system_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_function` (
  `SYSTEM_FUNCTION_ID` int(11) NOT NULL,
  `MODULE` varchar(50) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `QUERY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SYSTEM_FUNCTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templates`
--

-- DROP TABLE IF EXISTS `templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `templates` (
  `tempId` int(11) NOT NULL AUTO_INCREMENT,
  `tempType` int(11) NOT NULL,
  `tempName` varchar(255) DEFAULT NULL,
  `tempBody` text,
  `tempContentType` varchar(128) DEFAULT NULL,
  `TEMP_CONTENT` mediumblob,
  `internal` char(1) NOT NULL DEFAULT 'Y',
  `content_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`tempId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tpdebtors`
--

-- DROP TABLE IF EXISTS `tpdebtors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tpdebtors` (
  `tpdId` int(11) NOT NULL AUTO_INCREMENT,
  `tpdContactId` int(11) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `LEGAL_NAME` varchar(255) DEFAULT NULL,
  `TRADING_NAME` varchar(255) DEFAULT NULL,
  `ABN` varchar(20) DEFAULT NULL,
  `ACN` varchar(20) DEFAULT NULL,
  `next_tpd_id` int(11) DEFAULT NULL,
  `bank_details` varchar(512) DEFAULT NULL,
  `fileAmountClaimed` decimal(19,2) DEFAULT NULL,
  `fileAmountEstimated` decimal(19,2) DEFAULT NULL,
  `file_id` int(11) DEFAULT NULL,
  `tpp_id` int(11) DEFAULT NULL,
  `tpo_id` int(11) DEFAULT NULL,
  `tpi_id` int(11) DEFAULT NULL,
  `tpr_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`tpdId`),
  KEY `tpdContactId` (`tpdContactId`),
  KEY `tpdebtors_fk1` (`next_tpd_id`),
  KEY `tpdebtors_fk2` (`file_id`),
  KEY `tpdebtors_fk3` (`tpp_id`),
  KEY `tpdebtors_fk4` (`tpo_id`),
  KEY `tpdebtors_fk5` (`tpi_id`),
  KEY `tpdebtors_fk6` (`tpr_id`),
  CONSTRAINT `tpdebtors_fk1` FOREIGN KEY (`next_tpd_id`) REFERENCES `tpdebtors` (`tpdId`),
  CONSTRAINT `tpdebtors_fk2` FOREIGN KEY (`file_id`) REFERENCES `files` (`fileId`),
  CONSTRAINT `tpdebtors_fk3` FOREIGN KEY (`tpp_id`) REFERENCES `tpproperties` (`tppId`),
  CONSTRAINT `tpdebtors_fk4` FOREIGN KEY (`tpo_id`) REFERENCES `tpowners` (`tpoId`),
  CONSTRAINT `tpdebtors_fk5` FOREIGN KEY (`tpi_id`) REFERENCES `tpinsurers` (`tpiId`),
  CONSTRAINT `tpdebtors_fk6` FOREIGN KEY (`tpr_id`) REFERENCES `tprepresentatives` (`tprId`),
  CONSTRAINT `tpdebtors_ibfk_1` FOREIGN KEY (`tpdContactId`) REFERENCES `contacts` (`contactId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tpi`
--

-- DROP TABLE IF EXISTS `tpi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tpi` (
  `tpiId` int(11) NOT NULL AUTO_INCREMENT,
  `tpiName` varchar(50) DEFAULT NULL,
  `CONTACT_PHONE` varchar(255) DEFAULT NULL,
  `CONTACT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`tpiId`),
  UNIQUE KEY `tpi_uk1` (`tpiName`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tpinsurers`
--

-- DROP TABLE IF EXISTS `tpinsurers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tpinsurers` (
  `tpiId` int(11) NOT NULL AUTO_INCREMENT,
  `tpiTPI` int(11) DEFAULT NULL,
  `tpiContactId` int(11) DEFAULT NULL,
  `tpiPolicyNumber` varchar(100) DEFAULT NULL,
  `tpiClaimNumber` varchar(100) DEFAULT NULL,
  `tpd_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`tpiId`),
  KEY `TPINSURERS_FK1` (`tpiTPI`),
  KEY `TPINSURERS_FK2` (`tpiContactId`),
  KEY `tpinsurers_fk3` (`tpd_id`),
  CONSTRAINT `TPINSURERS_FK1` FOREIGN KEY (`tpiTPI`) REFERENCES `tpi` (`tpiId`),
  CONSTRAINT `TPINSURERS_FK2` FOREIGN KEY (`tpiContactId`) REFERENCES `contacts` (`contactId`),
  CONSTRAINT `tpinsurers_fk3` FOREIGN KEY (`tpd_id`) REFERENCES `tpdebtors` (`tpdId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tpowners`
--

-- DROP TABLE IF EXISTS `tpowners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tpowners` (
  `tpoId` int(11) NOT NULL AUTO_INCREMENT,
  `tpoContactId` int(11) DEFAULT NULL,
  `tpoName` varchar(100) DEFAULT NULL,
  `tpoCompanyName` varchar(100) DEFAULT NULL,
  `tpd_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`tpoId`),
  KEY `tpowners_fk1` (`tpd_id`),
  CONSTRAINT `tpowners_fk1` FOREIGN KEY (`tpd_id`) REFERENCES `tpdebtors` (`tpdId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tpproperties`
--

-- DROP TABLE IF EXISTS `tpproperties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tpproperties` (
  `tppId` int(11) NOT NULL AUTO_INCREMENT,
  `tppLicenceNumber` varchar(20) DEFAULT NULL,
  `tppRegoNumber` varchar(20) DEFAULT NULL,
  `tppVehicleMake` varchar(50) DEFAULT NULL,
  `tppVehicleModel` varchar(50) DEFAULT NULL,
  `tpd_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`tppId`),
  KEY `tpproperties_fk1` (`tpd_id`),
  CONSTRAINT `tpproperties_fk1` FOREIGN KEY (`tpd_id`) REFERENCES `tpdebtors` (`tpdId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tprepresentatives`
--

-- DROP TABLE IF EXISTS `tprepresentatives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tprepresentatives` (
  `tprId` int(11) NOT NULL AUTO_INCREMENT,
  `tprContactId` int(11) DEFAULT NULL,
  `tprName` varchar(50) DEFAULT NULL,
  `tpd_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`tprId`),
  KEY `tprepresentatives_fk1` (`tpd_id`),
  CONSTRAINT `tprepresentatives_fk1` FOREIGN KEY (`tpd_id`) REFERENCES `tpdebtors` (`tpdId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tpstatus`
--

-- DROP TABLE IF EXISTS `tpstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tpstatus` (
  `statusId` int(11) NOT NULL AUTO_INCREMENT,
  `statusName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`statusId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaction_type`
--

-- DROP TABLE IF EXISTS `transaction_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_type` (
  `TRANSACTION_TYPE_ID` int(11) NOT NULL,
  `FACTOR` int(11) NOT NULL DEFAULT '1',
  `CODE` varchar(32) DEFAULT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  PRIMARY KEY (`TRANSACTION_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transactions`
--

-- DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `transId` int(11) NOT NULL AUTO_INCREMENT,
  `transFileId` int(11) DEFAULT NULL,
  `transExplanation` text,
  `transAmount` decimal(19,2) NOT NULL DEFAULT '0.00',
  `transType` int(11) NOT NULL,
  `transDate` date NOT NULL,
  `transOwnerId` int(11) DEFAULT NULL,
  `transOwnerType` varchar(50) DEFAULT NULL,
  `transInvoiceId` int(11) DEFAULT NULL,
  `transGST` decimal(19,2) NOT NULL DEFAULT '0.00',
  `transFee` decimal(19,2) NOT NULL DEFAULT '0.00',
  `RECOVERED_BY` varchar(10) DEFAULT NULL,
  `JOURNALLED` char(1) NOT NULL DEFAULT 'N',
  `CREATED_BY` int(11) DEFAULT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` int(11) DEFAULT NULL,
  `UPDATED_DATE` timestamp NULL DEFAULT NULL,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  `REVERSE_ID` int(11) DEFAULT NULL,
  `UNITS` int(11) DEFAULT NULL,
  `UNIT_PRICE` decimal(19,2) DEFAULT NULL,
  `exclude_from_invoice` char(1) DEFAULT NULL,
  `defer_from_invoice` char(1) DEFAULT NULL,
  `gst_type_id` int(11) DEFAULT NULL,
  `supplier_service_id` int(11) DEFAULT NULL,
  `bank_transaction_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`transId`),
  UNIQUE KEY `transactions_uk1` (`bank_transaction_id`),
  KEY `TRANSACTIONS_FK1` (`transFileId`),
  KEY `TRANSACTIONS_FK2` (`transType`),
  KEY `TRANSACTIONS_FK3` (`transInvoiceId`),
  KEY `TRANSACTIONS_IDX1` (`transOwnerType`),
  KEY `TRANSACTIONS_FK4` (`REVERSE_ID`),
  KEY `transactions_fk5` (`gst_type_id`),
  KEY `transactions_fk6` (`supplier_service_id`),
  KEY `transactions_idx4` (`transDate`),
  KEY `transactions_idx5` (`transOwnerId`,`transOwnerType`),
  CONSTRAINT `TRANSACTIONS_FK1` FOREIGN KEY (`transFileId`) REFERENCES `files` (`fileId`),
  CONSTRAINT `TRANSACTIONS_FK2` FOREIGN KEY (`transType`) REFERENCES `transaction_type` (`TRANSACTION_TYPE_ID`),
  CONSTRAINT `TRANSACTIONS_FK3` FOREIGN KEY (`transInvoiceId`) REFERENCES `invoices` (`invoiceId`),
  CONSTRAINT `TRANSACTIONS_FK4` FOREIGN KEY (`REVERSE_ID`) REFERENCES `transactions` (`transId`),
  CONSTRAINT `transactions_fk5` FOREIGN KEY (`gst_type_id`) REFERENCES `gst_type` (`gst_type_id`),
  CONSTRAINT `transactions_fk6` FOREIGN KEY (`supplier_service_id`) REFERENCES `supplier_service` (`supplier_service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_audit`
--

-- DROP TABLE IF EXISTS `user_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_audit` (
  `user_audit_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `audit_type_id` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`user_audit_id`),
  UNIQUE KEY `user_audit_uk1` (`user_id`,`audit_type_id`,`created_date`),
  KEY `user_audit_fk2` (`audit_type_id`),
  CONSTRAINT `user_audit_fk1` FOREIGN KEY (`user_id`) REFERENCES `users` (`userId`),
  CONSTRAINT `user_audit_fk2` FOREIGN KEY (`audit_type_id`) REFERENCES `audit_type` (`audit_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_device`
--

-- DROP TABLE IF EXISTS `user_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_device` (
  `user_device_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `device` varchar(128) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_device_id`),
  UNIQUE KEY `user_device_uk1` (`user_id`,`device`),
  CONSTRAINT `user_device_fk1` FOREIGN KEY (`user_id`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_notification`
--

-- DROP TABLE IF EXISTS `user_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_notification` (
  `userId` int(11) NOT NULL,
  `close_file_advice` char(1) NOT NULL DEFAULT 'Y',
  `write_off_advice` char(1) NOT NULL DEFAULT 'Y',
  `close_file_advice_rule` varchar(512) DEFAULT NULL,
  `write_off_advice_rule` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `USER_NOTIFICATION_FK1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_type`
--

-- DROP TABLE IF EXISTS `user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_type` (
  `USER_TYPE_ID` int(11) NOT NULL,
  `USER_TYPE_NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`USER_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_workgroup`
--

-- DROP TABLE IF EXISTS `user_workgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_workgroup` (
  `USER_ID` int(11) NOT NULL,
  `WORKGROUP_ID` int(11) NOT NULL,
  `WORKGROUP_RESPONSIBLE` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`USER_ID`,`WORKGROUP_ID`),
  KEY `USER_WORKGROUP_FK2` (`WORKGROUP_ID`),
  CONSTRAINT `USER_WORKGROUP_FK1` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`userId`),
  CONSTRAINT `USER_WORKGROUP_FK2` FOREIGN KEY (`WORKGROUP_ID`) REFERENCES `workgroups` (`wgroupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `useractivities`
--

-- DROP TABLE IF EXISTS `useractivities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `useractivities` (
  `activityId` int(11) NOT NULL AUTO_INCREMENT,
  `activityType` int(11) DEFAULT NULL,
  `activityDate` datetime DEFAULT NULL,
  `activityUserId` int(11) DEFAULT NULL,
  PRIMARY KEY (`activityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

-- DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userLogin` varchar(50) DEFAULT NULL,
  `userPassword` varchar(50) DEFAULT NULL,
  `userName` varchar(100) DEFAULT NULL,
  `userEmail` varchar(100) DEFAULT NULL,
  `userPhone` varchar(20) DEFAULT NULL,
  `userSecurityGroupId` int(11) NOT NULL,
  `userType` int(11) NOT NULL,
  `userPasswordExpireDate` date DEFAULT NULL,
  `userStatus` int(11) DEFAULT '1',
  `PARENT_USER_ID` int(11) DEFAULT NULL,
  `DEFAULT_RATE` decimal(19,2) DEFAULT NULL,
  `BUDGET_UNITS` int(11) DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` int(11) DEFAULT NULL,
  `UPDATED_DATE` timestamp NULL DEFAULT NULL,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  `userCreatedBy` int(11) DEFAULT NULL,
  `userCreatedDate` datetime DEFAULT NULL,
  `report_schedule` text,
  `country` char(2) DEFAULT NULL,
  `password_encrypted` char(1) NOT NULL DEFAULT 'N',
  `ftp_username_host` varchar(100) DEFAULT NULL,
  `ftp_pathname` varchar(100) DEFAULT NULL,
  `ssh_identity` varchar(100) DEFAULT NULL,
  `alt_user_id` varchar(50) DEFAULT NULL,
  `user_initials` char(3) DEFAULT NULL,
  `email_alt` varchar(100) DEFAULT NULL,
  `idp` char(1) NOT NULL DEFAULT 'N',
  `mfa` char(1) NOT NULL DEFAULT 'N',
  `user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `users_uk1` (`userLogin`),
  UNIQUE KEY `users_uk2` (`user_id`),
  KEY `USERS_FK1` (`userSecurityGroupId`),
  KEY `USERS_FK4` (`PARENT_USER_ID`),
  KEY `users_fk6` (`country`),
  CONSTRAINT `USERS_FK1` FOREIGN KEY (`userSecurityGroupId`) REFERENCES `securitygroups` (`groupId`),
  CONSTRAINT `USERS_FK4` FOREIGN KEY (`PARENT_USER_ID`) REFERENCES `users` (`userId`),
  CONSTRAINT `users_fk6` FOREIGN KEY (`country`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `witnesses`
--

-- DROP TABLE IF EXISTS `witnesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `witnesses` (
  `witnessId` int(11) NOT NULL AUTO_INCREMENT,
  `witnessFileId` int(11) DEFAULT NULL,
  `witnessContactId` int(11) DEFAULT NULL,
  PRIMARY KEY (`witnessId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `woauth_limit`
--

-- DROP TABLE IF EXISTS `woauth_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `woauth_limit` (
  `WOAUTH_LIMIT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `LIMIT_MIN` int(11) NOT NULL,
  `LIMIT_MAX` int(11) DEFAULT NULL,
  `SECURITY_GROUP_ID` int(11) NOT NULL,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`WOAUTH_LIMIT_ID`),
  KEY `WOAUTH_LIMIT_FK1` (`SECURITY_GROUP_ID`),
  CONSTRAINT `WOAUTH_LIMIT_FK1` FOREIGN KEY (`SECURITY_GROUP_ID`) REFERENCES `securitygroups` (`groupId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wodata`
--

-- DROP TABLE IF EXISTS `wodata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wodata` (
  `WODATA_ID` int(11) NOT NULL AUTO_INCREMENT,
  `WO_TYPE` varchar(10) NOT NULL DEFAULT 'WO',
  `FILE_ID` int(11) NOT NULL,
  `WO_DATE` date NOT NULL,
  `WO_AMOUNT` decimal(19,2) NOT NULL DEFAULT '0.00',
  `REASON` text NOT NULL,
  `REQUESTED_BY` int(11) NOT NULL,
  `REQUESTED_DATE` date NOT NULL,
  `AUTHORISED_BY` int(11) DEFAULT NULL,
  `AUTHORISED_DATE` date DEFAULT NULL,
  `STATUS` char(1) DEFAULT NULL,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  `CLOSE_CODE_ID` int(11) DEFAULT NULL,
  `parent_wodata_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`WODATA_ID`),
  KEY `WODATA_FK1` (`FILE_ID`),
  KEY `WODATA_FK2` (`REQUESTED_BY`),
  KEY `WODATA_FK3` (`AUTHORISED_BY`),
  KEY `WODATA_FK4` (`CLOSE_CODE_ID`),
  CONSTRAINT `WODATA_FK1` FOREIGN KEY (`FILE_ID`) REFERENCES `files` (`fileId`),
  CONSTRAINT `WODATA_FK2` FOREIGN KEY (`REQUESTED_BY`) REFERENCES `users` (`userId`),
  CONSTRAINT `WODATA_FK3` FOREIGN KEY (`AUTHORISED_BY`) REFERENCES `users` (`userId`),
  CONSTRAINT `WODATA_FK4` FOREIGN KEY (`CLOSE_CODE_ID`) REFERENCES `closecodes` (`closeId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wodata_action`
--

-- DROP TABLE IF EXISTS `wodata_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wodata_action` (
  `WODATA_ACTION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `WO_TYPE` varchar(10) NOT NULL DEFAULT 'WO',
  `ACTION_CODE` varchar(20) NOT NULL,
  `ACTION_NOTATION` varchar(250) NOT NULL,
  `LOCK_VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`WODATA_ACTION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wodata_action_taken`
--

-- DROP TABLE IF EXISTS `wodata_action_taken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wodata_action_taken` (
  `WODATA_ID` int(11) NOT NULL,
  `WODATA_ACTION_ID` int(11) NOT NULL,
  PRIMARY KEY (`WODATA_ID`,`WODATA_ACTION_ID`),
  KEY `WODATA_ACTION_TAKEN_FK2` (`WODATA_ACTION_ID`),
  CONSTRAINT `WODATA_ACTION_TAKEN_FK1` FOREIGN KEY (`WODATA_ID`) REFERENCES `wodata` (`WODATA_ID`),
  CONSTRAINT `WODATA_ACTION_TAKEN_FK2` FOREIGN KEY (`WODATA_ACTION_ID`) REFERENCES `wodata_action` (`WODATA_ACTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workgroups`
--

-- DROP TABLE IF EXISTS `workgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workgroups` (
  `wgroupId` int(11) NOT NULL AUTO_INCREMENT,
  `wgroupName` varchar(100) DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `date_closed_delay` char(1) NOT NULL DEFAULT 'N',
  `date_closed_delay_advice` int(11) NOT NULL DEFAULT '0',
  `background_color` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`wgroupId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 */;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-22 11:04:03

-- ----------------------------------------------------------------------------
-- Routine getActionPriority
-- ----------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION `getActionPriority`(action_id INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE days, p_0, p_7, p_14, p_21 INT;
    SELECT DATEDIFF(a.actionDueDate, CURDATE()), p.p_0, p.p_7, p.p_14, p.p_21 INTO days, p_0, p_7, p_14, p_21
        FROM actions a, actioncode_priority p
        WHERE a.actionId = action_id AND p.actioncode_id = a.actionCodeId;
    CASE
        WHEN days > 21 THEN
            RETURN p_21;
        WHEN days > 14 THEN
            RETURN p_14;
        WHEN days > 7 THEN
            RETURN p_7;
        ELSE
            RETURN p_0;
    END CASE;
END$$
DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine getBillingAmount
-- ----------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION `getBillingAmount`(
    action_id INT,
    action_code_id INT,
    action_file_id INT) RETURNS decimal(19,2)
    DETERMINISTIC
BEGIN
    DECLARE result DECIMAL(19,2);
    DECLARE c INT;
    DECLARE client_id INT;
        SELECT f.fileClientId INTO client_id FROM files f WHERE f.fileId = action_file_id;
        SELECT COUNT(*) INTO c FROM billing_action WHERE ACTION_CODE_ID = action_code_id AND CLIENT_ID = client_id;
    IF c > 0 THEN
        SELECT BILLING_AMOUNT INTO result FROM billing_action WHERE ACTION_CODE_ID = action_code_id AND CLIENT_ID = client_id LIMIT 1;
        ELSE
            SET result = NULL;
        END IF;
    RETURN result;
END$$
DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine getBillingGstAmount
-- ----------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION `getBillingGstAmount`(
    action_id INT,
    action_code_id INT,
    action_file_id INT) RETURNS decimal(19,2)
    DETERMINISTIC
BEGIN
    DECLARE result DECIMAL(19,2);
    DECLARE c INT;

        SELECT COUNT(*) INTO c FROM billing_action WHERE ACTION_CODE_ID = action_code_id AND CLIENT_ID = client_id;
    IF c > 0 THEN
        SELECT IF(GST_FREE, 0, BILLING_AMOUNT) INTO result FROM billing_action WHERE ACTION_CODE_ID = action_code_id AND CLIENT_ID = client_id LIMIT 1;
        ELSE
            SET result = NULL;
        END IF;

    RETURN result / 10;
END$$
DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine getChequeId
-- ----------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION `getChequeId`(cheque_type INT, cheque_date DATE, bank_id INT, cheque_payee varchar(50), cheque_number INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE cheque_id INT;
    SELECT chequeId INTO cheque_id
        FROM cheques
        WHERE chequeType = cheque_type AND chequeDate = cheque_date AND chequeBankId = bank_id AND chequePayee = cheque_payee AND chequeNumber = cheque_number;
    RETURN cheque_id;
END$$
DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine getCompletedActions
-- ----------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION `getCompletedActions`(file_id INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE result INT;
    SELECT COUNT(actionId) INTO result FROM actions WHERE actionDateCompleted IS NOT NULL AND actionFileId = file_id;
    RETURN result;
END$$
DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine getCompletedActions4Client
-- ----------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION `getCompletedActions4Client`(client_id INT, file_status INT, date_start DATE, date_end DATE) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE result INT;
    IF (file_status IS NULL) THEN
        SELECT COUNT(actionId) INTO result
        FROM actions INNER JOIN files ON (fileId = actionFileId)
        WHERE fileClientId = client_id AND actionDateCompleted IS NOT NULL
            AND (date_start IS NULL OR fileDateReceived >= date_start)
            AND (date_end IS NULL OR fileDateReceived <= date_end);
    END IF;
    IF (file_status = 1) THEN
        SELECT COUNT(actionId) INTO result
        FROM actions INNER JOIN files ON (fileId = actionFileId)
        WHERE fileStatus = 1 AND fileClientId = client_id AND actionDateCompleted IS NOT NULL
            AND (date_start IS NULL OR fileDateReceived >= date_start)
            AND (date_end IS NULL OR fileDateReceived <= date_end);
    END IF;
    IF (file_status = 2) THEN
        SELECT COUNT(actionId) INTO result
        FROM actions INNER JOIN files ON (fileId = actionFileId)
        WHERE fileStatus = 2 AND fileClientId = client_id AND actionDateCompleted IS NOT NULL
            AND (date_start IS NULL OR fileDateReceived >= date_start)
            AND (date_end IS NULL OR fileDateReceived <= date_end);
    END IF;
    RETURN result;
END$$
DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine getFileAverageDaysOpen4Client
-- ----------------------------------------------------------------------------
DELIMITER $$

CREATE FUNCTION `getFileAverageDaysOpen4Client`(client_id INT, file_status INT, date_start DATE, date_end DATE) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE result INT;
    IF (file_status IS NULL) THEN
        SELECT SUM(DATEDIFF(IF(fileStatus = 1, CURDATE(), WO_DATE), fileDateReceived)) div COUNT(fileId) INTO result
        FROM files LEFT OUTER JOIN wodata ON (fileId = FILE_ID)
        WHERE fileClientId = client_id
            AND (date_start IS NULL OR fileDateReceived >= date_start)
            AND (date_end IS NULL OR fileDateReceived <= date_end);
    END IF;
    IF (file_status = 1) THEN
        SELECT SUM(DATEDIFF(CURDATE(), fileDateReceived)) div COUNT(fileId) INTO result
        FROM files
        WHERE fileStatus = 1 AND fileClientId = client_id
            AND (date_start IS NULL OR fileDateReceived >= date_start)
            AND (date_end IS NULL OR fileDateReceived <= date_end);
    END IF;
    IF (file_status = 2) THEN
        SELECT SUM(DATEDIFF(WO_DATE, fileDateReceived)) div COUNT(fileId) INTO result
        FROM files LEFT OUTER JOIN wodata ON (fileId = FILE_ID)
        WHERE fileStatus = 2 AND fileClientId = client_id
            AND (date_start IS NULL OR fileDateReceived >= date_start)
            AND (date_end IS NULL OR fileDateReceived <= date_end);
    END IF;
    RETURN result;
END$$
DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine getNextAction
-- ----------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION `getNextAction`(file_id INT, column_name VARCHAR(64)) RETURNS varchar(512) CHARSET latin1
    DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(512);
    CASE column_name
      WHEN "actionDueDate" THEN
            SELECT actionDueDate INTO result FROM actions WHERE actionFileId = file_id AND actionDateCompleted IS NULL AND LOGICALLY_DELETED IS NULL ORDER BY actionDueDate LIMIT 1;
      WHEN "actionNotation" THEN
            SELECT SUBSTRING(actionNotation, 1, 512) INTO result FROM actions WHERE actionFileId = file_id AND actionDateCompleted IS NULL AND LOGICALLY_DELETED IS NULL ORDER BY actionDueDate LIMIT 1;
        
    END CASE;
    RETURN result;
END$$
DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine getOpeningBalance
-- ----------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION `getOpeningBalance`(
    fileId INT,
    transTo DATE) RETURNS float
    DETERMINISTIC
BEGIN
    DECLARE openingBalance FLOAT;
    SELECT
        IFNULL(SUM(transAmount * FACTOR), 0) INTO openingBalance
    FROM
        transactions
            INNER JOIN transaction_type ON (transType = TRANSACTION_TYPE_ID)
    WHERE
        (transType IN (1,2,3,4,5,6,7,8,9,10,14,15,16,17,21,22) AND transDate < transTo)
        AND (transFileId = fileId)
    LIMIT 1;
    RETURN openingBalance;
END$$
DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine getOwnerBank
-- ----------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION `getOwnerBank`(ownerId INT, ownerType VARCHAR(50)) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE bankId INT;
    IF (ownerType = 'cheque') THEN
      SELECT c.chequeBankId INTO bankId
      FROM cheques c
      WHERE (c.chequeId = ownerId)
      LIMIT 1;
    END IF;
    IF (ownerType = 'receipt') THEN
      SELECT r.receiptBankId INTO bankId
      FROM receipts r
      WHERE (r.receiptId = ownerId)
      LIMIT 1;
    END IF;
    IF (ownerType = 'journal') THEN
      SELECT j.BANK_ID INTO bankId
      FROM journals j
      WHERE (j.journalId = ownerId)
      LIMIT 1;
    END IF;
    RETURN bankId;
END$$
DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine getRecoveredAmount
-- ----------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION `getRecoveredAmount`(
    transFrom DATE,
    transTo DATE,
    fileReceivedFrom DATE,
    fileReceivedTo DATE,
    clientId VARCHAR(255),
    workGroupId INT) RETURNS decimal(19,2)
    DETERMINISTIC
BEGIN
    DECLARE recovered DECIMAL(19,2);
    IF ((transFrom IS NULL) OR (transTo IS NULL)) THEN
      RETURN 0;
    END IF;
    SELECT
        IFNULL(SUM(transAmount * FACTOR), 0) INTO recovered
    FROM
        transactions t
            INNER JOIN transaction_type ON (transType = TRANSACTION_TYPE_ID)
    WHERE
        (transType IN (1,2,3,4,5,6,7,8,13,14,15,16,17) AND transDate >= transFrom AND transDate < transTo)
        AND (transFileId IN (
            SELECT fileId FROM files
            WHERE
                (fileClientId IN (clientId))
                AND (workGroupId IS NULL OR fileWorkGroupId = workGroupId)
                AND (fileDateReceived >= fileReceivedFrom AND fileDateReceived < fileReceivedTo))
        )
    LIMIT 1;
    RETURN recovered;
END$$
DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine getSupplierCosts4Client
-- ----------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION `getSupplierCosts4Client`(client_id INT, file_status INT, date_start DATE, date_end DATE, workgroup_id INT) RETURNS decimal(19,2)
    DETERMINISTIC
BEGIN
    DECLARE result DECIMAL(19,2);
    IF (file_status IS NULL) THEN
        SELECT IFNULL(SUM(invoiceSubtotal), 0) INTO result
        FROM supplierinvoices INNER JOIN files ON (fileId = invoiceFileId)
        WHERE fileClientId = client_id
            AND (date_start IS NULL OR fileDateReceived >= date_start)
            AND (date_end IS NULL OR fileDateReceived <= date_end)
            AND (workgroup_id IS NULL OR fileWorkGroupId = workgroup_id);
    END IF;
    IF (file_status = 1) THEN
        SELECT IFNULL(SUM(invoiceSubtotal), 0) INTO result
        FROM supplierinvoices INNER JOIN files ON (fileId = invoiceFileId)
        WHERE fileStatus = 1 AND fileClientId = client_id
            AND (date_start IS NULL OR fileDateReceived >= date_start)
            AND (date_end IS NULL OR fileDateReceived <= date_end)
            AND (workgroup_id IS NULL OR fileWorkGroupId = workgroup_id);
    END IF;
    IF (file_status = 2) THEN
        SELECT IFNULL(SUM(invoiceSubtotal), 0) INTO result
        FROM supplierinvoices INNER JOIN files ON (fileId = invoiceFileId)
        WHERE fileStatus = 2 AND fileClientId = client_id
            AND (date_start IS NULL OR fileDateReceived >= date_start)
            AND (date_end IS NULL OR fileDateReceived <= date_end)
            AND (workgroup_id IS NULL OR fileWorkGroupId = workgroup_id);
    END IF;
    RETURN result;
END$$
DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine getTrustBalance
-- ----------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION `getTrustBalance`(file_id INT, bank_id INT, to_date DATE, to_date_rch DATE) RETURNS decimal(19,2)
    DETERMINISTIC
BEGIN
    DECLARE trust_balance DECIMAL(19,2);
    DECLARE file_id_2 INT;
    SELECT fileId INTO file_id_2 FROM files WHERE fileId = file_id;
    IF (file_id_2 > 0) THEN
        SELECT
            IFNULL(SUM(t.transAmount * tt.FACTOR), 0) INTO trust_balance
        FROM
            transactions t
                INNER JOIN transaction_type tt ON (t.transType = tt.TRANSACTION_TYPE_ID)
        WHERE   (t.RECOVERED_BY IS NULL)
            AND (t.transFileId = file_id)
            AND (to_date IS NULL OR t.transDate <= to_date)
            AND (bank_id IS NULL OR getOwnerBank(t.transOwnerId, t.transOwnerType) = bank_id)
            AND ((t.transType IN (1,3,4,5,6,7,8,9,10,14,15,16,17,21,22,30,31,32,33,36,37,38,39))
              OR (t.transType IN (2) AND (to_date_rch IS NULL OR t.transDate <= to_date_rch)));
    END IF;
    RETURN trust_balance;
END$$
DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine getWorkingDays
-- ----------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION `getWorkingDays`(date_end DATE, date_start DATE) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE days INT;
    SELECT DATEDIFF(date_end, date_start) * 5 / 7 INTO days;
    RETURN days;
END$$
DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine updateBillingFile
-- ----------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION `updateBillingFile`(file_id INT, fee_flat INT, fee_value INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE fee_id INT;
    DECLARE file_id_2 INT;
    SELECT fileId INTO file_id_2 FROM files WHERE fileId = file_id;
    IF (file_id_2 > 0) THEN
        SELECT fileBillingFeeId INTO fee_id FROM files WHERE fileId = file_id;
        IF (fee_id IS NULL) THEN
            INSERT INTO billing_file (feeFlat, feeValue) VALUES (fee_flat, fee_value);
            SELECT MAX(feeId) INTO fee_id FROM billing_file;
            UPDATE files SET fileBillingFeeId = fee_id WHERE fileId = file_id;
        ELSE
            UPDATE billing_file SET feeFlat = fee_flat, feeValue = fee_value WHERE feeId = fee_id;
        END IF;
    END IF;
    RETURN fee_id;
END$$
DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine getLastReceiptDate
-- ----------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION `getLastReceiptDate`(
    fileId INT) RETURNS DATE
    DETERMINISTIC
BEGIN
    DECLARE result DATE;
    SELECT
        transDate INTO result
    FROM
        transactions
    WHERE
        transFileId = fileId AND transOwnerType = 'receipt'
    ORDER BY transDate DESC
    LIMIT 1;
    RETURN result;
END$$
DELIMITER ;

DELIMITER $$
DROP FUNCTION IF EXISTS getLastCompletedAction$$
CREATE FUNCTION getLastCompletedAction(file_id INT, column_name VARCHAR(64))
 RETURNS varchar(512)
 DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(512);
    CASE column_name
      WHEN "actionDateCompleted" THEN
            SELECT actionDateCompleted INTO result FROM actions WHERE actionFileId = file_id AND actionDateCompleted IS NOT NULL AND LOGICALLY_DELETED IS NULL ORDER BY actionId DESC LIMIT 1;
      WHEN "actionDueDate" THEN
            SELECT actionDueDate INTO result FROM actions WHERE actionFileId = file_id AND actionDateCompleted IS NOT NULL AND LOGICALLY_DELETED IS NULL ORDER BY actionId DESC LIMIT 1;
      WHEN "actionNotation" THEN
            SELECT SUBSTRING(actionNotation, 1, 512) INTO result FROM actions WHERE actionFileId = file_id AND actionDateCompleted IS NOT NULL AND LOGICALLY_DELETED IS NULL ORDER BY actionId DESC LIMIT 1;
    END CASE;
    RETURN result;
END$$
DROP FUNCTION IF EXISTS getLastChequeDate$$
CREATE FUNCTION getLastChequeDate(fileId INT)
 RETURNS date
 DETERMINISTIC
BEGIN
    DECLARE result DATE;
    SELECT
        transDate INTO result
    FROM
        transactions
    WHERE
        transFileId = fileId AND transOwnerType = 'cheque'
    ORDER BY transDate DESC
    LIMIT 1;
    RETURN result;
END$$
DROP FUNCTION IF EXISTS getLastInvoiceDate$$
CREATE FUNCTION getLastInvoiceDate(fileId INT)
 RETURNS date
 DETERMINISTIC
BEGIN
    DECLARE result DATE;
    SELECT
        transDate INTO result
    FROM
        transactions
    WHERE
        transFileId = fileId AND transInvoiceId IS NOT NULL
    ORDER BY transInvoiceId DESC
    LIMIT 1;
    RETURN result;
END$$
DELIMITER ;
