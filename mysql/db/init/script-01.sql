-- ----------------------------------------------------------------------------
-- Migrated Schema: elixirdb
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- Schema elixirdb
-- ----------------------------------------------------------------------------
-- DROP SCHEMA IF EXISTS `elixirdb` ;
-- CREATE SCHEMA IF NOT EXISTS `elixirdb` ;
-- USE `elixirdb`;

-- ----------------------------------------------------------------------------
-- Table action_feedback
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `action_feedback` (
  `action_id` INT(11) NOT NULL,
  `quality_rating_id` INT(11) NOT NULL,
  `reason` VARCHAR(1024) NULL DEFAULT NULL,
  `CREATED_BY` INT(11) NULL DEFAULT NULL,
  `CREATED_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` INT(11) NULL DEFAULT NULL,
  `UPDATED_DATE` TIMESTAMP NULL DEFAULT NULL,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`action_id`),
  INDEX `action_feedback_fk2` (`quality_rating_id` ASC),
  CONSTRAINT `action_feedback_fk1`
    FOREIGN KEY (`action_id`)
    REFERENCES `actions` (`actionId`),
  CONSTRAINT `action_feedback_fk2`
    FOREIGN KEY (`quality_rating_id`)
    REFERENCES `quality_rating` (`quality_rating_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table action_questionary_answer
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `action_questionary_answer` (
  `action_questionary_answer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `action_id` INT(11) NOT NULL,
  `answer_id` INT(11) NOT NULL,
  `answer_text` VARCHAR(512) NULL DEFAULT NULL,
  `CREATED_BY` INT(11) NULL DEFAULT NULL,
  `CREATED_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` INT(11) NULL DEFAULT NULL,
  `UPDATED_DATE` TIMESTAMP NULL DEFAULT NULL,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`action_questionary_answer_id`),
  INDEX `action_questionary_answer_fk1` (`action_id` ASC),
  INDEX `action_questionary_answer_fk2` (`answer_id` ASC),
  CONSTRAINT `action_questionary_answer_fk1`
    FOREIGN KEY (`action_id`)
    REFERENCES `actions` (`actionId`),
  CONSTRAINT `action_questionary_answer_fk2`
    FOREIGN KEY (`answer_id`)
    REFERENCES `questionary_answer` (`questionary_answer_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table actioncode_file
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `actioncode_file` (
  `actioncode_file_id` INT(11) NOT NULL AUTO_INCREMENT,
  `file_id` INT(11) NOT NULL,
  `actioncode_id` INT(11) NOT NULL,
  `frequency_type_id` INT(11) NULL DEFAULT NULL,
  `start_date` DATE NULL DEFAULT NULL,
  `action_id` INT(11) NULL DEFAULT NULL,
  `CREATED_BY` INT(11) NULL DEFAULT NULL,
  `CREATED_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` INT(11) NULL DEFAULT NULL,
  `UPDATED_DATE` TIMESTAMP NULL DEFAULT NULL,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`actioncode_file_id`),
  UNIQUE INDEX `actioncode_file_uk1` (`file_id` ASC, `actioncode_id` ASC),
  INDEX `actioncode_file_fk2` (`actioncode_id` ASC),
  INDEX `actioncode_file_fk3` (`frequency_type_id` ASC),
  INDEX `actioncode_file_fk4` (`action_id` ASC),
  CONSTRAINT `actioncode_file_fk1`
    FOREIGN KEY (`file_id`)
    REFERENCES `files` (`fileId`),
  CONSTRAINT `actioncode_file_fk2`
    FOREIGN KEY (`actioncode_id`)
    REFERENCES `actioncodes` (`actcId`),
  CONSTRAINT `actioncode_file_fk3`
    FOREIGN KEY (`frequency_type_id`)
    REFERENCES `frequency_type` (`frequency_type_id`),
  CONSTRAINT `actioncode_file_fk4`
    FOREIGN KEY (`action_id`)
    REFERENCES `actions` (`actionId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table actioncode_priority
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `actioncode_priority` (
  `actioncode_id` INT(11) NOT NULL,
  `p_0` INT(11) NOT NULL,
  `p_7` INT(11) NOT NULL,
  `p_14` INT(11) NOT NULL,
  `p_21` INT(11) NOT NULL,
  PRIMARY KEY (`actioncode_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table actioncode_service
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `actioncode_service` (
  `service_id` INT(11) NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(32) NOT NULL,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `CREATED_BY` INT(11) NULL DEFAULT NULL,
  `CREATED_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` INT(11) NULL DEFAULT NULL,
  `UPDATED_DATE` TIMESTAMP NULL DEFAULT NULL,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`service_id`),
  UNIQUE INDEX `actioncode_service_uk1` (`code` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table actioncodes
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `actioncodes` (
  `actcId` INT(11) NOT NULL AUTO_INCREMENT,
  `actcCode` VARCHAR(30) NOT NULL,
  `actcDefaultNotation` VARCHAR(255) NULL DEFAULT NULL,
  `actcType` INT(11) NOT NULL,
  `actcActive` BIT(1) NULL DEFAULT NULL,
  `actcDirect` INT(11) NULL DEFAULT NULL,
  `actcTemplateId` INT(11) NULL DEFAULT NULL,
  `actcWorkGroupId` INT(11) NULL DEFAULT NULL,
  `TP_STATUS_ID` INT(11) NULL DEFAULT NULL,
  `REC_STATUS_ID` INT(11) NULL DEFAULT NULL,
  `BILLABLE` CHAR(1) NOT NULL DEFAULT 'N',
  `fixed_rate` DECIMAL(19,2) NULL DEFAULT NULL,
  `allow_feedback` CHAR(1) NOT NULL DEFAULT 'N',
  `send_feedback` CHAR(1) NOT NULL DEFAULT 'N',
  `rejectable` CHAR(1) NOT NULL DEFAULT 'N',
  `actcRestricted` BIT(1) NOT NULL DEFAULT b'0',
  `date_closed_delay` CHAR(1) NOT NULL DEFAULT 'N',
  `date_closed_delay_advice` INT(11) NOT NULL DEFAULT '0',
  `auto_complete` CHAR(1) NOT NULL DEFAULT 'N',
  `questionary_id` INT(11) NULL DEFAULT NULL,
  `file_type_id` INT(11) NULL DEFAULT NULL,
  `client_id` INT(11) NULL DEFAULT NULL,
  `attach_documents` CHAR(1) NOT NULL DEFAULT 'N',
  `outcome_id` INT(11) NULL DEFAULT NULL,
  `service_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`actcId`),
  UNIQUE INDEX `ACTIONCODES_UK1` (`actcCode` ASC),
  INDEX `ACTIONCODES_FK1` (`TP_STATUS_ID` ASC),
  INDEX `ACTIONCODES_FK2` (`REC_STATUS_ID` ASC),
  INDEX `actioncodes_fk3` (`questionary_id` ASC),
  INDEX `actioncodes_idx1` (`BILLABLE` ASC),
  INDEX `actioncodes_fk4` (`file_type_id` ASC),
  INDEX `actioncodes_fk5` (`client_id` ASC),
  INDEX `actioncodes_fk6` (`outcome_id` ASC),
  INDEX `actioncodes_fk7` (`service_id` ASC),
  CONSTRAINT `ACTIONCODES_FK1`
    FOREIGN KEY (`TP_STATUS_ID`)
    REFERENCES `tpstatus` (`statusId`),
  CONSTRAINT `ACTIONCODES_FK2`
    FOREIGN KEY (`REC_STATUS_ID`)
    REFERENCES `rec_status` (`REC_STATUS_ID`),
  CONSTRAINT `actioncodes_fk3`
    FOREIGN KEY (`questionary_id`)
    REFERENCES `questionary` (`questionary_id`),
  CONSTRAINT `actioncodes_fk4`
    FOREIGN KEY (`file_type_id`)
    REFERENCES `file_type` (`file_type_id`),
  CONSTRAINT `actioncodes_fk5`
    FOREIGN KEY (`client_id`)
    REFERENCES `clients` (`clientId`),
  CONSTRAINT `actioncodes_fk6`
    FOREIGN KEY (`outcome_id`)
    REFERENCES `actionoutcomes` (`outId`),
  CONSTRAINT `actioncodes_fk7`
    FOREIGN KEY (`service_id`)
    REFERENCES `actioncode_service` (`service_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table actionoutcomes
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `actionoutcomes` (
  `outId` INT(11) NOT NULL AUTO_INCREMENT,
  `outName` VARCHAR(100) NULL DEFAULT NULL,
  `outFixed` BIT(1) NOT NULL,
  PRIMARY KEY (`outId`),
  UNIQUE INDEX `actionoutcomes_uk1` (`outName` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table actions
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `actions` (
  `actionId` INT(11) NOT NULL AUTO_INCREMENT,
  `actionCreatedBy` INT(11) NULL DEFAULT NULL,
  `actionDueDate` DATETIME NOT NULL,
  `actionCodeId` INT(11) NULL DEFAULT NULL,
  `actionNotation` TEXT NULL DEFAULT NULL,
  `actionOutcomeId` INT(11) NULL DEFAULT NULL,
  `actionDateCompleted` DATETIME NULL DEFAULT NULL,
  `actionCompletedBy` INT(11) NULL DEFAULT NULL,
  `actionLetterId` INT(11) NULL DEFAULT NULL,
  `actionFileId` INT(11) NULL DEFAULT NULL,
  `actionWorkGroupId` INT(11) NULL DEFAULT NULL,
  `actionDestination` VARCHAR(255) NULL DEFAULT NULL,
  `actionSubject` VARCHAR(255) NULL DEFAULT NULL,
  `LOGICALLY_DELETED` CHAR(1) NULL DEFAULT NULL,
  `BILLABLE_UNIT` INT(11) NULL DEFAULT NULL,
  `INVOICE_ID` INT(11) NULL DEFAULT NULL,
  `CREATED_BY` INT(11) NULL DEFAULT NULL,
  `CREATED_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` INT(11) NULL DEFAULT NULL,
  `UPDATED_DATE` TIMESTAMP NULL DEFAULT NULL,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  `BILLING_NOTE` TEXT NULL DEFAULT NULL,
  `BILLABLE_AMOUNT` DECIMAL(19,2) NULL DEFAULT NULL,
  `BILLABLE_GST_AMOUNT` DECIMAL(19,2) NULL DEFAULT NULL,
  `BILLING_USER_AMOUNT` DECIMAL(19,2) NULL DEFAULT NULL,
  `EXCLUDE_FROM_INVOICE` CHAR(1) NULL DEFAULT NULL,
  `DEFER_FROM_INVOICE` CHAR(1) NULL DEFAULT NULL,
  `document_id` INT(11) NULL DEFAULT NULL,
  `assigned_to` INT(11) NULL DEFAULT NULL,
  `parent_id` INT(11) NULL DEFAULT NULL,
  `claimed_by` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`actionId`),
  INDEX `ACTIONS_FK3` (`actionWorkGroupId` ASC),
  INDEX `ACTIONS_FK4` (`actionCreatedBy` ASC),
  INDEX `ACTIONS_FK5` (`actionCompletedBy` ASC),
  INDEX `ACTIONS_FK6` (`actionLetterId` ASC),
  INDEX `ACTIONS_FK7` (`actionOutcomeId` ASC),
  INDEX `ACTIONS_FK8` (`INVOICE_ID` ASC),
  INDEX `actions_fk9` (`document_id` ASC),
  INDEX `ACTIONS_IDX3` (`actionDateCompleted` ASC, `actionCompletedBy` ASC),
  INDEX `ACTIONS_IDX4` (`CREATED_DATE` ASC, `CREATED_BY` ASC),
  INDEX `actions_fk2` (`actionCodeId` ASC),
  INDEX `actions_idx1` (`EXCLUDE_FROM_INVOICE` ASC),
  INDEX `ACTIONS_IDX5` (`actionFileId` ASC),
  INDEX `ACTIONS_IDX6` (`actionDateCompleted` ASC),
  INDEX `actions_fk10` (`parent_id` ASC),
  CONSTRAINT `ACTIONS_FK3`
    FOREIGN KEY (`actionWorkGroupId`)
    REFERENCES `workgroups` (`wgroupId`),
  CONSTRAINT `ACTIONS_FK4`
    FOREIGN KEY (`actionCreatedBy`)
    REFERENCES `users` (`userId`),
  CONSTRAINT `ACTIONS_FK5`
    FOREIGN KEY (`actionCompletedBy`)
    REFERENCES `users` (`userId`),
  CONSTRAINT `ACTIONS_FK6`
    FOREIGN KEY (`actionLetterId`)
    REFERENCES `letters` (`letterId`),
  CONSTRAINT `ACTIONS_FK7`
    FOREIGN KEY (`actionOutcomeId`)
    REFERENCES `actionoutcomes` (`outId`),
  CONSTRAINT `ACTIONS_FK8`
    FOREIGN KEY (`INVOICE_ID`)
    REFERENCES `invoices` (`invoiceId`),
  CONSTRAINT `actions_fk1`
    FOREIGN KEY (`actionFileId`)
    REFERENCES `files` (`fileId`),
  CONSTRAINT `actions_fk10`
    FOREIGN KEY (`parent_id`)
    REFERENCES `actions` (`actionId`),
  CONSTRAINT `actions_fk2`
    FOREIGN KEY (`actionCodeId`)
    REFERENCES `actioncodes` (`actcId`),
  CONSTRAINT `actions_fk9`
    FOREIGN KEY (`document_id`)
    REFERENCES `document` (`document_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table actiontransitions
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `actiontransitions` (
  `acttId` INT(11) NOT NULL AUTO_INCREMENT,
  `acttCodeId` INT(11) NULL DEFAULT NULL,
  `acttOutcomeId` INT(11) NULL DEFAULT NULL,
  `acttNextCodeId` INT(11) NOT NULL,
  `acttNextDueDays` INT(11) NULL DEFAULT NULL,
  `next_due_days_cron` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`acttId`),
  UNIQUE INDEX `actiontransitions_uk1` (`acttCodeId` ASC, `acttOutcomeId` ASC, `acttNextCodeId` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table addresses
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `addresses` (
  `addressId` INT(11) NOT NULL AUTO_INCREMENT,
  `addressStreet1` VARCHAR(255) NULL DEFAULT NULL,
  `addressStreet2` VARCHAR(255) NULL DEFAULT NULL,
  `addressSuburb` VARCHAR(200) NULL DEFAULT NULL,
  `addressState` VARCHAR(50) NULL DEFAULT NULL,
  `addressPostcode` VARCHAR(20) NULL DEFAULT NULL,
  `STATE_ID` INT(11) NOT NULL DEFAULT '1',
  `datawash` CHAR(1) NULL DEFAULT NULL,
  `link_address_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`addressId`),
  INDEX `ADDRESSES_FK1` (`STATE_ID` ASC),
  INDEX `addresses_fk2` (`link_address_id` ASC),
  CONSTRAINT `ADDRESSES_FK1`
    FOREIGN KEY (`STATE_ID`)
    REFERENCES `state` (`STATE_ID`),
  CONSTRAINT `addresses_fk2`
    FOREIGN KEY (`link_address_id`)
    REFERENCES `addresses` (`addressId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table audit_type
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `audit_type` (
  `audit_type_id` INT(11) NOT NULL,
  `name` VARCHAR(32) NOT NULL,
  `description` VARCHAR(128) NULL DEFAULT NULL,
  PRIMARY KEY (`audit_type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table bank_client
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank_client` (
  `bank_id` INT(11) NOT NULL,
  `client_id` INT(11) NOT NULL,
  PRIMARY KEY (`bank_id`, `client_id`),
  INDEX `bank_client_fk2` (`client_id` ASC),
  CONSTRAINT `bank_client_fk1`
    FOREIGN KEY (`bank_id`)
    REFERENCES `banks` (`bankId`),
  CONSTRAINT `bank_client_fk2`
    FOREIGN KEY (`client_id`)
    REFERENCES `clients` (`clientId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table bank_errors
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank_errors` (
  `errorId` INT(11) NOT NULL AUTO_INCREMENT,
  `errorDate` DATE NULL DEFAULT NULL,
  `errorBankId` INT(11) NULL DEFAULT NULL,
  `errorAmount` DECIMAL(19,2) NOT NULL DEFAULT '0.00',
  `errorType` INT(11) NULL DEFAULT NULL,
  `errorDatePresented` DATE NULL DEFAULT NULL,
  `EXPLANATION` TEXT NULL DEFAULT NULL,
  `CREATED_BY` INT(11) NULL DEFAULT NULL,
  `CREATED_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` INT(11) NULL DEFAULT NULL,
  `UPDATED_DATE` TIMESTAMP NULL DEFAULT NULL,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`errorId`),
  INDEX `BANK_ERRORS_FK1` (`errorBankId` ASC),
  CONSTRAINT `BANK_ERRORS_FK1`
    FOREIGN KEY (`errorBankId`)
    REFERENCES `banks` (`bankId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table bankdeposits
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `bankdeposits` (
  `depositId` INT(11) NOT NULL AUTO_INCREMENT,
  `depositDate` DATE NULL DEFAULT NULL,
  `depositNumber` VARCHAR(50) NULL DEFAULT NULL,
  `depositBankId` INT(11) NULL DEFAULT NULL,
  `depositAmount` FLOAT(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`depositId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table bankreconciliations
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `bankreconciliations` (
  `bankRecId` INT(11) NOT NULL AUTO_INCREMENT,
  `bankRecBankId` INT(11) NULL DEFAULT NULL,
  `bankRecDate` DATE NULL DEFAULT NULL,
  `bankRecSysBalance` DECIMAL(19,2) NULL DEFAULT NULL,
  `bankRecBankBalance` DECIMAL(19,2) NULL DEFAULT NULL,
  PRIMARY KEY (`bankRecId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table bankrecpresented
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `bankrecpresented` (
  `stateId` INT(11) NOT NULL AUTO_INCREMENT,
  `bankRecId` INT(11) NOT NULL,
  `paymentId` INT(11) NOT NULL,
  `paymentType` VARCHAR(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`stateId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table bankrecunpresented
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `bankrecunpresented` (
  `stateId` INT(11) NOT NULL AUTO_INCREMENT,
  `bankRecId` INT(11) NOT NULL,
  `paymentId` INT(11) NOT NULL,
  `paymentType` VARCHAR(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`stateId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table banks
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `banks` (
  `bankId` INT(11) NOT NULL AUTO_INCREMENT,
  `bankName` VARCHAR(255) NULL DEFAULT NULL,
  `bankBalance` DECIMAL(19,2) NOT NULL,
  `DESCRIPTION` VARCHAR(255) NULL DEFAULT NULL,
  `BSB` VARCHAR(10) NULL DEFAULT NULL,
  `ACCOUNT_NAME` VARCHAR(255) NULL DEFAULT NULL,
  `ACCOUNT_NUMBER` VARCHAR(50) NULL DEFAULT NULL,
  `NEXT_CHEQUE_NO` INT(11) NOT NULL DEFAULT '100000',
  `CREATED_BY` INT(11) NULL DEFAULT NULL,
  `CREATED_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` INT(11) NULL DEFAULT NULL,
  `UPDATED_DATE` TIMESTAMP NULL DEFAULT NULL,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  `next_eft_no` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`bankId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table billing_action
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `billing_action` (
  `ACTION_CODE_ID` INT(11) NOT NULL,
  `CLIENT_ID` INT(11) NOT NULL,
  `BILLING_AMOUNT` DECIMAL(19,2) NOT NULL DEFAULT '0.00',
  `GST_FREE` BIT(1) NULL DEFAULT b'0',
  PRIMARY KEY (`ACTION_CODE_ID`, `CLIENT_ID`),
  INDEX `BILLING_INFO_ACTION_FK2` (`CLIENT_ID` ASC),
  CONSTRAINT `BILLING_ACTION_FK1`
    FOREIGN KEY (`ACTION_CODE_ID`)
    REFERENCES `actioncodes` (`actcId`),
  CONSTRAINT `BILLING_ACTION_FK2`
    FOREIGN KEY (`CLIENT_ID`)
    REFERENCES `clients` (`clientId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table billing_client
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `billing_client` (
  `feeId` INT(11) NOT NULL AUTO_INCREMENT,
  `feeBillingInfoId` INT(11) NULL DEFAULT NULL,
  `feeFlat` BIT(1) NOT NULL,
  `feeValue` DECIMAL(19,2) NOT NULL DEFAULT '0.00',
  `feeTPStatus` INT(11) NULL DEFAULT NULL,
  `FILE_STATUS` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`feeId`),
  INDEX `BILLINGINFOFEES_FK1` (`feeBillingInfoId` ASC),
  CONSTRAINT `BILLING_CLIENT_FK1`
    FOREIGN KEY (`feeBillingInfoId`)
    REFERENCES `billing_info_client` (`billingId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table billing_file
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `billing_file` (
  `feeId` INT(11) NOT NULL AUTO_INCREMENT,
  `feeFlat` BIT(1) NOT NULL,
  `feeValue` DECIMAL(19,2) NOT NULL DEFAULT '0.00',
  `hold_funds` CHAR(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`feeId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table billing_info_client
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `billing_info_client` (
  `billingId` INT(11) NOT NULL AUTO_INCREMENT,
  `billingMethod` VARCHAR(50) NULL DEFAULT NULL,
  `billingRecoveredLimit` DECIMAL(19,2) NULL DEFAULT NULL,
  `billingClientPaysSearches` BIT(1) NULL DEFAULT NULL,
  `billingClientPaysLegal` BIT(1) NULL DEFAULT NULL,
  `billingLegalLimit` DECIMAL(19,2) NULL DEFAULT NULL,
  `billingLegalNotes` TEXT NULL DEFAULT NULL,
  `billingIncludeCheque` BIT(1) NOT NULL,
  `DSCNT_INTNL` DECIMAL(19,2) NULL DEFAULT NULL,
  `DSCNT_CLNT` DECIMAL(19,2) NULL DEFAULT NULL,
  `DEDUCT_FEES` CHAR(1) NOT NULL DEFAULT 'N',
  `BILLING_PHOTOCOPY` DECIMAL(19,2) NULL DEFAULT NULL,
  `BILLING_FAX` DECIMAL(19,2) NULL DEFAULT NULL,
  `BILLING_PHONE_CALL` DECIMAL(19,2) NULL DEFAULT NULL,
  `billing_parent_action` CHAR(1) NOT NULL DEFAULT 'N',
  `billing_parent_commission` CHAR(1) NOT NULL DEFAULT 'N',
  `eft` CHAR(1) NOT NULL DEFAULT 'N',
  `eft_bank_id` INT(11) NULL DEFAULT NULL,
  `event_no_required` CHAR(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`billingId`),
  INDEX `billing_info_client_fk1` (`eft_bank_id` ASC),
  CONSTRAINT `billing_info_client_fk1`
    FOREIGN KEY (`eft_bank_id`)
    REFERENCES `eft_banks` (`bankId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table billing_user
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `billing_user` (
  `USER_ID` INT(11) NOT NULL,
  `CLIENT_ID` INT(11) NOT NULL,
  `BILLING_AMOUNT` DECIMAL(19,2) NOT NULL DEFAULT '0.00',
  `GST_FREE` CHAR(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`USER_ID`, `CLIENT_ID`),
  INDEX `BILLING_USER_FK2` (`CLIENT_ID` ASC),
  CONSTRAINT `BILLING_USER_FK1`
    FOREIGN KEY (`USER_ID`)
    REFERENCES `users` (`userId`),
  CONSTRAINT `BILLING_USER_FK2`
    FOREIGN KEY (`CLIENT_ID`)
    REFERENCES `clients` (`clientId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table business_review
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `business_review` (
  `business_review_id` INT(11) NOT NULL AUTO_INCREMENT,
  `file_id` INT(11) NOT NULL,
  `weekday` INT(1) NOT NULL,
  `part_day` DECIMAL(4,2) NOT NULL,
  `CREATED_BY` INT(11) NULL DEFAULT NULL,
  `CREATED_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` INT(11) NULL DEFAULT NULL,
  `UPDATED_DATE` TIMESTAMP NULL DEFAULT NULL,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`business_review_id`),
  UNIQUE INDEX `business_review_uk1` (`file_id` ASC, `weekday` ASC),
  CONSTRAINT `business_review_fk1`
    FOREIGN KEY (`file_id`)
    REFERENCES `files` (`fileId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table causeofloss
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `causeofloss` (
  `lossId` INT(11) NOT NULL AUTO_INCREMENT,
  `lossDebtTypeId` INT(11) NULL DEFAULT NULL,
  `lossAddressId` INT(11) NULL DEFAULT NULL,
  `lossDate` DATE NULL DEFAULT NULL,
  `LOSS_TYPE_ID` INT(11) NULL DEFAULT NULL,
  `LOSS_DESC_ID` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`lossId`),
  INDEX `CAUSE_OF_LOSS_FK1` (`LOSS_TYPE_ID` ASC),
  INDEX `CAUSE_OF_LOSS_FK2` (`LOSS_DESC_ID` ASC),
  CONSTRAINT `CAUSE_OF_LOSS_FK1`
    FOREIGN KEY (`LOSS_TYPE_ID`)
    REFERENCES `loss_type` (`LOSS_TYPE_ID`),
  CONSTRAINT `CAUSE_OF_LOSS_FK2`
    FOREIGN KEY (`LOSS_DESC_ID`)
    REFERENCES `loss_desc` (`LOSS_DESC_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table cheques
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `cheques` (
  `chequeId` INT(11) NOT NULL AUTO_INCREMENT,
  `chequeBankId` INT(11) NULL DEFAULT NULL,
  `chequeDate` DATE NULL DEFAULT NULL,
  `chequeType` INT(11) NOT NULL,
  `chequeAmount` DECIMAL(19,2) NOT NULL DEFAULT '0.00',
  `chequeDatePrinted` DATETIME NULL DEFAULT NULL,
  `chequePayee` VARCHAR(255) NULL DEFAULT NULL,
  `chequeNumber` INT(11) NULL DEFAULT NULL,
  `chequeCancelReason` TEXT NULL DEFAULT NULL,
  `chequeDateCanceled` DATETIME NULL DEFAULT NULL,
  `chequeDatePresented` DATE NULL DEFAULT NULL,
  `CREATED_BY` INT(11) NULL DEFAULT NULL,
  `CREATED_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` INT(11) NULL DEFAULT NULL,
  `UPDATED_DATE` TIMESTAMP NULL DEFAULT NULL,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  `CHEQUE_FEE_ID` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`chequeId`),
  INDEX `CHEQUES_FK1` (`chequeBankId` ASC),
  INDEX `CHEQUES_FK2` (`CHEQUE_FEE_ID` ASC),
  CONSTRAINT `CHEQUES_FK1`
    FOREIGN KEY (`chequeBankId`)
    REFERENCES `banks` (`bankId`),
  CONSTRAINT `CHEQUES_FK2`
    FOREIGN KEY (`CHEQUE_FEE_ID`)
    REFERENCES `cheques` (`chequeId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table client_notification
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `client_notification` (
  `client_id` INT(11) NOT NULL,
  `close_file_advice` CHAR(1) NOT NULL DEFAULT 'Y',
  `write_off_advice` CHAR(1) NOT NULL DEFAULT 'Y',
  `new_file_notification` CHAR(1) NOT NULL DEFAULT 'N',
  `close_file_advice_rule` VARCHAR(512) NULL DEFAULT NULL,
  `write_off_advice_rule` VARCHAR(512) NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`),
  CONSTRAINT `client_notification_fk1`
    FOREIGN KEY (`client_id`)
    REFERENCES `clients` (`clientId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table clientcontacts
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `clientcontacts` (
  `contactId` INT(11) NOT NULL,
  `contactOrder` INT(9) NOT NULL DEFAULT '0',
  `contactClientId` INT(11) NULL DEFAULT NULL,
  `contactPosition` VARCHAR(255) NULL DEFAULT NULL,
  `contactPostalAddressId` INT(11) NULL DEFAULT NULL,
  `contactType` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`contactId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table clientinvoices
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `clientinvoices` (
  `invoiceId` INT(11) NOT NULL AUTO_INCREMENT,
  `invoiceClientId` INT(11) NULL DEFAULT NULL,
  `invoiceDateCreated` DATE NULL DEFAULT NULL,
  `invoiceAmount` DECIMAL(19,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`invoiceId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table clients
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `clients` (
  `clientId` INT(11) NOT NULL AUTO_INCREMENT,
  `clientName` VARCHAR(255) NULL DEFAULT NULL,
  `clientTradingName` VARCHAR(255) NULL DEFAULT NULL,
  `clientHowTrading` VARCHAR(255) NULL DEFAULT NULL,
  `clientABN` VARCHAR(255) NULL DEFAULT NULL,
  `clientACN` VARCHAR(255) NULL DEFAULT NULL,
  `clientCreatedBy` INT(11) NULL DEFAULT NULL,
  `clientCreatedDate` DATETIME NULL DEFAULT NULL,
  `clientState` VARCHAR(255) NULL DEFAULT NULL,
  `clientOfficeName` VARCHAR(255) NULL DEFAULT NULL,
  `clientOfficeAddressId` INT(11) NULL DEFAULT NULL,
  `clientDefaultPOL` VARCHAR(255) NULL DEFAULT NULL,
  `clientDefaultLetterId` INT(11) NULL DEFAULT NULL,
  `clientPrimaryContactId` INT(11) NULL DEFAULT NULL,
  `clientBillingId` INT(11) NULL DEFAULT NULL,
  `initial_action_code_id` INT(11) NULL DEFAULT NULL,
  `email_disabled` CHAR(1) NOT NULL DEFAULT 'N',
  `parent_client_id` INT(11) NULL DEFAULT NULL,
  `email_from` VARCHAR(50) NULL DEFAULT NULL,
  `repayment_updates` CHAR(1) NOT NULL DEFAULT 'N',
  `exportable` CHAR(1) NOT NULL DEFAULT 'N',
  `system_code` VARCHAR(10) NULL DEFAULT NULL,
  `supplier_code` VARCHAR(10) NULL DEFAULT NULL,
  `tier2_client_id` INT(11) NULL DEFAULT NULL,
  `alt_client_id` VARCHAR(50) NULL DEFAULT NULL,
  `file_reference_pattern` VARCHAR(50) NULL DEFAULT NULL,
  `file_overdue_kpi` INT(11) NOT NULL DEFAULT '0',
  `file_qa_kpi` INT(11) NOT NULL DEFAULT '20',
  `directory_template_id` INT(11) NULL DEFAULT NULL,
  `file_type_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`clientId`),
  INDEX `CLIENTS_FK1` (`clientBillingId` ASC),
  INDEX `clients_fk3` (`initial_action_code_id` ASC),
  INDEX `clients_fk2` (`parent_client_id` ASC),
  INDEX `clients_fk4` (`tier2_client_id` ASC),
  INDEX `clients_idx1` (`clientBillingId` ASC),
  INDEX `clients_fk5` (`directory_template_id` ASC),
  INDEX `clients_fk6` (`file_type_id` ASC),
  CONSTRAINT `CLIENTS_FK1`
    FOREIGN KEY (`clientBillingId`)
    REFERENCES `billing_info_client` (`billingId`),
  CONSTRAINT `clients_fk2`
    FOREIGN KEY (`parent_client_id`)
    REFERENCES `clients` (`clientId`),
  CONSTRAINT `clients_fk3`
    FOREIGN KEY (`initial_action_code_id`)
    REFERENCES `actioncodes` (`actcId`),
  CONSTRAINT `clients_fk4`
    FOREIGN KEY (`tier2_client_id`)
    REFERENCES `clients` (`clientId`),
  CONSTRAINT `clients_fk5`
    FOREIGN KEY (`directory_template_id`)
    REFERENCES `templates` (`tempId`),
  CONSTRAINT `clients_fk6`
    FOREIGN KEY (`file_type_id`)
    REFERENCES `file_type` (`file_type_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table clientusers
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `clientusers` (
  `userId` INT(11) NOT NULL,
  `clientId` INT(11) NOT NULL,
  PRIMARY KEY (`userId`, `clientId`),
  INDEX `CLIENTUSERS_FK1` (`clientId` ASC),
  CONSTRAINT `CLIENTUSERS_FK1`
    FOREIGN KEY (`clientId`)
    REFERENCES `clients` (`clientId`),
  CONSTRAINT `CLIENTUSERS_FK2`
    FOREIGN KEY (`userId`)
    REFERENCES `users` (`userId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table closecodes
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `closecodes` (
  `closeId` INT(11) NOT NULL AUTO_INCREMENT,
  `CODE` VARCHAR(20) NULL DEFAULT NULL,
  `DESCRIPTION` VARCHAR(500) NULL DEFAULT NULL,
  PRIMARY KEY (`closeId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table config
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `config` (
  `configKey` VARCHAR(50) NOT NULL DEFAULT '',
  `configValue` VARCHAR(255) NOT NULL,
  `env` VARCHAR(32) NULL DEFAULT NULL,
  `config_id` INT(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`config_id`),
  UNIQUE INDEX `config_uk1` (`configKey` ASC, `env` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table contacts
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `contacts` (
  `contactId` INT(11) NOT NULL AUTO_INCREMENT,
  `contactSalutation` VARCHAR(255) NULL DEFAULT NULL,
  `contactInitials` VARCHAR(255) NULL DEFAULT NULL,
  `contactFirstName` VARCHAR(255) NULL DEFAULT NULL,
  `contactLastName` VARCHAR(255) NULL DEFAULT NULL,
  `contactEmail` VARCHAR(255) NULL DEFAULT NULL,
  `contactPhone` VARCHAR(255) NULL DEFAULT NULL,
  `contactFax` VARCHAR(255) NULL DEFAULT NULL,
  `contactMobile` VARCHAR(255) NULL DEFAULT NULL,
  `contactWorkPhone` VARCHAR(255) NULL DEFAULT NULL,
  `contactAddressId` INT(11) NULL DEFAULT NULL,
  `POSTAL_ADDRESS_ID` INT(11) NULL DEFAULT NULL,
  `comment` VARCHAR(512) NULL DEFAULT NULL,
  `datawash` CHAR(1) NULL DEFAULT NULL,
  `link_contact_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`contactId`),
  INDEX `contacts_fk1` (`link_contact_id` ASC),
  CONSTRAINT `contacts_fk1`
    FOREIGN KEY (`link_contact_id`)
    REFERENCES `contacts` (`contactId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table contacttypes
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `contacttypes` (
  `ctypeId` INT(11) NOT NULL,
  `ctypeName` VARCHAR(100) NULL DEFAULT NULL,
  `ctypeAmount` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ctypeId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table country
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `country` (
  `country_id` CHAR(2) NOT NULL,
  `country_name` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`country_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table dashboard
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dashboard` (
  `dashboard_id` INT(11) NOT NULL AUTO_INCREMENT,
  `dashboard_date` DATE NOT NULL,
  `dashboard_data` TEXT NULL DEFAULT NULL,
  `dashboard_valid` CHAR(1) NOT NULL DEFAULT 'N',
  `CREATED_BY` INT(11) NULL DEFAULT NULL,
  `CREATED_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` INT(11) NULL DEFAULT NULL,
  `UPDATED_DATE` TIMESTAMP NULL DEFAULT NULL,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dashboard_id`),
  UNIQUE INDEX `dashboard_uk1` (`dashboard_date` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table dbversion
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbversion` (
  `DBVERSION` VARCHAR(32) NOT NULL,
  `PREV_DBVERSION` VARCHAR(32) NULL DEFAULT NULL,
  `CREATED_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`DBVERSION`),
  INDEX `DBVERSION_FK1` (`PREV_DBVERSION` ASC),
  CONSTRAINT `DBVERSION_FK1`
    FOREIGN KEY (`PREV_DBVERSION`)
    REFERENCES `dbversion` (`DBVERSION`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table debtor
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `debtor` (
  `DEBTOR_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `REFERENCE` VARCHAR(50) NOT NULL,
  `NAME` VARCHAR(255) NOT NULL,
  `CLIENT_ID` INT(11) NOT NULL,
  `CONTACT_ID` INT(11) NOT NULL,
  `CREATED_BY` INT(11) NOT NULL,
  `CREATED_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` INT(11) NULL DEFAULT NULL,
  `UPDATED_DATE` TIMESTAMP NULL DEFAULT NULL,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  `LEGAL_NAME` VARCHAR(255) NULL DEFAULT NULL,
  `TRADING_NAME` VARCHAR(255) NULL DEFAULT NULL,
  `ABN` VARCHAR(20) NULL DEFAULT NULL,
  `ACN` VARCHAR(20) NULL DEFAULT NULL,
  `NOTES` TEXT NULL DEFAULT NULL,
  `LEGAL_TYPE_ID` INT(11) NULL DEFAULT NULL,
  `DEBT_TYPE_ID` INT(11) NULL DEFAULT NULL,
  `LOGICALLY_DELETED` CHAR(1) NULL DEFAULT NULL,
  PRIMARY KEY (`DEBTOR_ID`),
  INDEX `DEBTOR_FK2` (`CONTACT_ID` ASC),
  INDEX `DEBTOR_FK3` (`LEGAL_TYPE_ID` ASC),
  INDEX `DEBTOR_FK4` (`DEBT_TYPE_ID` ASC),
  INDEX `DEBTOR_FK1` (`CLIENT_ID` ASC),
  CONSTRAINT `DEBTOR_FK1`
    FOREIGN KEY (`CLIENT_ID`)
    REFERENCES `clients` (`clientId`),
  CONSTRAINT `DEBTOR_FK2`
    FOREIGN KEY (`CONTACT_ID`)
    REFERENCES `contacts` (`contactId`),
  CONSTRAINT `DEBTOR_FK3`
    FOREIGN KEY (`LEGAL_TYPE_ID`)
    REFERENCES `legal_type` (`LEGAL_TYPE_ID`),
  CONSTRAINT `DEBTOR_FK4`
    FOREIGN KEY (`DEBT_TYPE_ID`)
    REFERENCES `debttypes` (`typeId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table debttypes
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `debttypes` (
  `typeId` INT(11) NOT NULL AUTO_INCREMENT,
  `typeName` VARCHAR(50) NULL DEFAULT NULL,
  `typeInsuredDetails` BIT(1) NULL DEFAULT NULL,
  `typeTPP` BIT(1) NULL DEFAULT NULL,
  `typeTPO` BIT(1) NULL DEFAULT NULL,
  `typeTPI` BIT(1) NULL DEFAULT NULL,
  `POLICE_REPORT` CHAR(1) NOT NULL DEFAULT 'Y',
  `pol` CHAR(1) NOT NULL DEFAULT 'Y',
  `workgroup_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`typeId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table disbursement
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `disbursement` (
  `DISBURSEMENT_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `DISBURSEMENT_TYPE` INT(11) NOT NULL,
  `DISBURSEMENT_DATE` DATE NULL DEFAULT NULL,
  `DISBURSEMENT_AMOUNT` DECIMAL(19,2) NOT NULL DEFAULT '0.00',
  `DISBURSEMENT_GST` DECIMAL(19,2) NOT NULL DEFAULT '0.00',
  `DISBURSEMENT_NUMBER` VARCHAR(50) NULL DEFAULT NULL,
  `DISBURSEMENT_EXPLANATION` TEXT NULL DEFAULT NULL,
  `SUPPLIER_ID` INT(11) NULL DEFAULT NULL,
  `CREATED_BY` INT(11) NULL DEFAULT NULL,
  `CREATED_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` INT(11) NULL DEFAULT NULL,
  `UPDATED_DATE` TIMESTAMP NULL DEFAULT NULL,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  `document_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`DISBURSEMENT_ID`),
  INDEX `disbursement_fk1` (`SUPPLIER_ID` ASC),
  INDEX `disbursement_fk2` (`document_id` ASC),
  CONSTRAINT `disbursement_fk1`
    FOREIGN KEY (`SUPPLIER_ID`)
    REFERENCES `suppliers` (`supplierId`),
  CONSTRAINT `disbursement_fk2`
    FOREIGN KEY (`document_id`)
    REFERENCES `document` (`document_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table document
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `document` (
  `document_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `content` MEDIUMBLOB NOT NULL,
  `content_type` VARCHAR(128) NULL DEFAULT NULL,
  `created_by` INT(11) NULL DEFAULT NULL,
  `created_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` INT(11) NULL DEFAULT NULL,
  `updated_date` TIMESTAMP NULL DEFAULT NULL,
  `lock_version` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`document_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table eft_banks
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `eft_banks` (
  `bankId` INT(11) NOT NULL AUTO_INCREMENT,
  `bankName` VARCHAR(255) NULL DEFAULT NULL,
  `bankBalance` DECIMAL(19,2) NOT NULL,
  `DESCRIPTION` VARCHAR(255) NULL DEFAULT NULL,
  `BSB` VARCHAR(10) NULL DEFAULT NULL,
  `ACCOUNT_NAME` VARCHAR(255) NULL DEFAULT NULL,
  `ACCOUNT_NUMBER` VARCHAR(50) NULL DEFAULT NULL,
  `CREATED_BY` INT(11) NULL DEFAULT NULL,
  `CREATED_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` INT(11) NULL DEFAULT NULL,
  `UPDATED_DATE` TIMESTAMP NULL DEFAULT NULL,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bankId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table expect_rec
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `expect_rec` (
  `EXPECT_REC_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `EXPECT_DATE` DATE NULL DEFAULT NULL,
  `EXPECT_AMOUNT` FLOAT(10,2) NULL DEFAULT NULL,
  `RECEIVED_BY` INT(11) NULL DEFAULT NULL,
  `RECEIVED_DATE` DATE NULL DEFAULT NULL,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`EXPECT_REC_ID`),
  INDEX `EXPECT_REC_FK1` (`RECEIVED_BY` ASC),
  CONSTRAINT `EXPECT_REC_FK1`
    FOREIGN KEY (`RECEIVED_BY`)
    REFERENCES `users` (`userId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table file_contact
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `file_contact` (
  `contactId` INT(11) NOT NULL,
  `fileId` INT(11) NOT NULL,
  `contactPosition` VARCHAR(255) NULL DEFAULT NULL,
  `contactType` INT(11) NULL DEFAULT NULL,
  `companyName` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`contactId`),
  INDEX `file_contact_fk1` (`fileId` ASC),
  CONSTRAINT `file_contact_fk1`
    FOREIGN KEY (`fileId`)
    REFERENCES `files` (`fileId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table file_property
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `file_property` (
  `file_property_id` INT(11) NOT NULL AUTO_INCREMENT,
  `file_id` INT(11) NOT NULL,
  `prop_key` VARCHAR(64) NOT NULL,
  `prop_desc` VARCHAR(128) NULL DEFAULT NULL,
  `prop_value` VARCHAR(256) NULL DEFAULT NULL,
  `prop_fixed` CHAR(1) NOT NULL DEFAULT 'Y',
  `CREATED_BY` INT(11) NULL DEFAULT NULL,
  `CREATED_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` INT(11) NULL DEFAULT NULL,
  `UPDATED_DATE` TIMESTAMP NULL DEFAULT NULL,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`file_property_id`),
  UNIQUE INDEX `file_property_uk1` (`file_id` ASC, `prop_key` ASC),
  CONSTRAINT `file_property_fk1`
    FOREIGN KEY (`file_id`)
    REFERENCES `files` (`fileId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table file_type
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `file_type` (
  `file_type_id` INT(11) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `background_color` VARCHAR(32) NULL DEFAULT NULL,
  PRIMARY KEY (`file_type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table file_type_mapping
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `file_type_mapping` (
  `file_type_mapping_id` INT(11) NOT NULL AUTO_INCREMENT,
  `file_type_id` INT(11) NOT NULL,
  `debt_type_id` INT(11) NOT NULL,
  `loss_type_id` INT(11) NOT NULL,
  `loss_desc_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`file_type_mapping_id`),
  UNIQUE INDEX `file_type_mapping_uk1` (`debt_type_id` ASC, `loss_type_id` ASC, `loss_desc_id` ASC),
  INDEX `file_type_mapping_fk1` (`file_type_id` ASC),
  INDEX `file_type_mapping_fk3` (`loss_type_id` ASC),
  INDEX `file_type_mapping_fk4` (`loss_desc_id` ASC),
  CONSTRAINT `file_type_mapping_fk1`
    FOREIGN KEY (`file_type_id`)
    REFERENCES `file_type` (`file_type_id`),
  CONSTRAINT `file_type_mapping_fk2`
    FOREIGN KEY (`debt_type_id`)
    REFERENCES `debttypes` (`typeId`),
  CONSTRAINT `file_type_mapping_fk3`
    FOREIGN KEY (`loss_type_id`)
    REFERENCES `loss_type` (`LOSS_TYPE_ID`),
  CONSTRAINT `file_type_mapping_fk4`
    FOREIGN KEY (`loss_desc_id`)
    REFERENCES `loss_desc` (`LOSS_DESC_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table files
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `files` (
  `fileId` INT(11) NOT NULL AUTO_INCREMENT,
  `fileClientId` INT(11) NULL DEFAULT NULL,
  `fileClientContactId` INT(11) NULL DEFAULT NULL,
  `fileContactId` INT(11) NULL DEFAULT NULL,
  `fileAgentId` INT(11) NULL DEFAULT NULL,
  `fileReference` VARCHAR(50) NULL DEFAULT NULL,
  `fileCauseLossId` INT(11) NULL DEFAULT NULL,
  `fileInsuredDetailsId` INT(11) NULL DEFAULT NULL,
  `fileTPD` INT(11) NULL DEFAULT NULL,
  `fileTPP` INT(11) NULL DEFAULT NULL,
  `fileTPO` INT(11) NULL DEFAULT NULL,
  `fileTPI` INT(11) NULL DEFAULT NULL,
  `fileTPR` INT(11) NULL DEFAULT NULL,
  `filePoliceReportId` INT(11) NULL DEFAULT NULL,
  `fileDateReceived` DATE NULL DEFAULT NULL,
  `fileAmountClaimed` DECIMAL(19,2) NOT NULL DEFAULT '0.00',
  `fileAmountEstimated` DECIMAL(19,2) NOT NULL DEFAULT '0.00',
  `fileAmountRecovered` DECIMAL(19,2) NOT NULL DEFAULT '0.00',
  `fileTrustBalance` DECIMAL(19,2) NOT NULL DEFAULT '0.00',
  `fileMotorcare` BIT(1) NOT NULL DEFAULT b'0',
  `fileStatus` INT(11) NOT NULL,
  `fileWorkGroupId` INT(11) NOT NULL,
  `fileTPStatusId` INT(11) NULL DEFAULT NULL,
  `fileBillingFeeId` INT(11) NULL DEFAULT NULL,
  `INCIDENT_DETAILS_ID` INT(11) NULL DEFAULT NULL,
  `REC_STATUS_ID` INT(11) NULL DEFAULT NULL,
  `EXPECT_REC_ID` INT(11) NULL DEFAULT NULL,
  `LEGALS_COMMENCED` CHAR(1) NOT NULL DEFAULT 'N',
  `DEBTOR_ID` INT(11) NULL DEFAULT NULL,
  `CREATED_BY` INT(11) NULL DEFAULT NULL,
  `CREATED_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` INT(11) NULL DEFAULT NULL,
  `UPDATED_DATE` TIMESTAMP NULL DEFAULT NULL,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  `BILLING_USER_ID` INT(11) NULL DEFAULT NULL,
  `jurisdiction_id` INT(11) NULL DEFAULT NULL,
  `max_hourly_rate` DECIMAL(19,2) NULL DEFAULT NULL,
  `parent_file_id` INT(11) NULL DEFAULT NULL,
  `amount_insured_loss` DECIMAL(19,2) NULL DEFAULT NULL,
  `amount_uninsured_loss` DECIMAL(19,2) NULL DEFAULT NULL,
  `amount_insured_excess` DECIMAL(19,2) NULL DEFAULT NULL,
  `amount_gst_recover` DECIMAL(19,2) NULL DEFAULT NULL,
  `trade_practices_action` CHAR(1) NOT NULL DEFAULT 'N',
  `date_closed` DATETIME NULL DEFAULT NULL,
  `date_opened` DATETIME NULL DEFAULT NULL,
  `rec_status_updated_date` TIMESTAMP NULL DEFAULT NULL,
  `rec_status_updated_by` INT(11) NULL DEFAULT NULL,
  `event_no` VARCHAR(50) NULL DEFAULT NULL,
  `amount_target` DECIMAL(19,2) NULL DEFAULT NULL,
  `date_closed_final` DATETIME NULL DEFAULT NULL,
  `date_archived` DATETIME NULL DEFAULT NULL,
  `amount_owing` DECIMAL(19,2) NULL DEFAULT NULL,
  `date_stage2` DATETIME NULL DEFAULT NULL,
  `manager_id` INT(11) NULL DEFAULT NULL,
  `team_leader_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`fileId`),
  UNIQUE INDEX `FILES_UK1` (`fileReference` ASC),
  INDEX `FILES_FK1` (`INCIDENT_DETAILS_ID` ASC),
  INDEX `FILES_FK2` (`REC_STATUS_ID` ASC),
  INDEX `FILES_FK3` (`EXPECT_REC_ID` ASC),
  INDEX `FILES_FK4` (`fileClientId` ASC),
  INDEX `FILES_IDX1` (`fileWorkGroupId` ASC),
  INDEX `USERS_FK5` (`fileAgentId` ASC),
  INDEX `FILES_FK6` (`fileBillingFeeId` ASC),
  INDEX `FILES_FK8` (`fileTPStatusId` ASC),
  INDEX `FILES_FK9` (`DEBTOR_ID` ASC),
  INDEX `FILES_FK11` (`fileTPD` ASC),
  INDEX `FILES_FK12` (`BILLING_USER_ID` ASC),
  INDEX `files_fk13` (`jurisdiction_id` ASC),
  INDEX `FILES_FK10` (`parent_file_id` ASC),
  INDEX `files_idx4` (`fileStatus` ASC),
  INDEX `FILES_FK14` (`manager_id` ASC),
  INDEX `FILES_FK15` (`team_leader_id` ASC),
  CONSTRAINT `FILES_FK1`
    FOREIGN KEY (`INCIDENT_DETAILS_ID`)
    REFERENCES `incident_details` (`INCIDENT_DETAILS_ID`),
  CONSTRAINT `FILES_FK10`
    FOREIGN KEY (`parent_file_id`)
    REFERENCES `files` (`fileId`),
  CONSTRAINT `FILES_FK11`
    FOREIGN KEY (`fileTPD`)
    REFERENCES `tpdebtors` (`tpdId`),
  CONSTRAINT `FILES_FK12`
    FOREIGN KEY (`BILLING_USER_ID`)
    REFERENCES `users` (`userId`),
  CONSTRAINT `FILES_FK14`
    FOREIGN KEY (`manager_id`)
    REFERENCES `users` (`userId`),
  CONSTRAINT `FILES_FK15`
    FOREIGN KEY (`team_leader_id`)
    REFERENCES `users` (`userId`),
  CONSTRAINT `FILES_FK2`
    FOREIGN KEY (`REC_STATUS_ID`)
    REFERENCES `rec_status` (`REC_STATUS_ID`),
  CONSTRAINT `FILES_FK3`
    FOREIGN KEY (`EXPECT_REC_ID`)
    REFERENCES `expect_rec` (`EXPECT_REC_ID`),
  CONSTRAINT `FILES_FK4`
    FOREIGN KEY (`fileClientId`)
    REFERENCES `clients` (`clientId`),
  CONSTRAINT `FILES_FK6`
    FOREIGN KEY (`fileBillingFeeId`)
    REFERENCES `billing_file` (`feeId`),
  CONSTRAINT `FILES_FK7`
    FOREIGN KEY (`fileWorkGroupId`)
    REFERENCES `workgroups` (`wgroupId`),
  CONSTRAINT `FILES_FK8`
    FOREIGN KEY (`fileTPStatusId`)
    REFERENCES `tpstatus` (`statusId`),
  CONSTRAINT `FILES_FK9`
    FOREIGN KEY (`DEBTOR_ID`)
    REFERENCES `debtor` (`DEBTOR_ID`),
  CONSTRAINT `USERS_FK5`
    FOREIGN KEY (`fileAgentId`)
    REFERENCES `users` (`userId`),
  CONSTRAINT `files_fk13`
    FOREIGN KEY (`jurisdiction_id`)
    REFERENCES `state` (`STATE_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table files_aud
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `files_aud` (
  `fileId` INT(11) NOT NULL,
  `fileClientId` INT(11) NULL DEFAULT NULL,
  `fileClientContactId` INT(11) NULL DEFAULT NULL,
  `fileContactId` INT(11) NULL DEFAULT NULL,
  `fileAgentId` INT(11) NULL DEFAULT NULL,
  `fileReference` VARCHAR(50) NULL DEFAULT NULL,
  `fileCauseLossId` INT(11) NULL DEFAULT NULL,
  `fileInsuredName` VARCHAR(100) NULL DEFAULT NULL,
  `fileInsuredDetailsId` INT(11) NULL DEFAULT NULL,
  `fileTPD` INT(11) NULL DEFAULT NULL,
  `fileTPP` INT(11) NULL DEFAULT NULL,
  `fileTPO` INT(11) NULL DEFAULT NULL,
  `fileTPI` INT(11) NULL DEFAULT NULL,
  `fileTPR` INT(11) NULL DEFAULT NULL,
  `filePoliceReportId` INT(11) NULL DEFAULT NULL,
  `fileDateReceived` DATE NULL DEFAULT NULL,
  `fileAmountClaimed` DECIMAL(19,2) NULL DEFAULT NULL,
  `fileAmountEstimated` DECIMAL(19,2) NULL DEFAULT NULL,
  `fileAmountRecovered` DECIMAL(19,2) NULL DEFAULT NULL,
  `fileTrustBalance` DECIMAL(19,2) NULL DEFAULT NULL,
  `fileMotorcare` BIT(1) NULL DEFAULT NULL,
  `fileStatus` INT(11) NULL DEFAULT NULL,
  `fileWorkGroupId` INT(11) NULL DEFAULT NULL,
  `fileTPStatusId` INT(11) NULL DEFAULT NULL,
  `fileBillingFeeId` INT(11) NULL DEFAULT NULL,
  `INCIDENT_DETAILS_ID` INT(11) NULL DEFAULT NULL,
  `REC_STATUS_ID` INT(11) NULL DEFAULT NULL,
  `EXPECT_REC_ID` INT(11) NULL DEFAULT NULL,
  `LEGALS_COMMENCED` CHAR(1) NULL DEFAULT NULL,
  `DEBTOR_ID` INT(11) NULL DEFAULT NULL,
  `CREATED_BY` INT(11) NULL DEFAULT NULL,
  `CREATED_DATE` TIMESTAMP NULL DEFAULT NULL,
  `UPDATED_BY` INT(11) NULL DEFAULT NULL,
  `UPDATED_DATE` TIMESTAMP NULL DEFAULT NULL,
  `LOCK_VERSION` INT(11) NULL DEFAULT NULL,
  `BILLING_USER_ID` INT(11) NULL DEFAULT NULL,
  `jurisdiction_id` INT(11) NULL DEFAULT NULL,
  `max_hourly_rate` DECIMAL(19,2) NULL DEFAULT NULL,
  `parent_file_id` INT(11) NULL DEFAULT NULL,
  `amount_insured_loss` DECIMAL(19,2) NULL DEFAULT NULL,
  `amount_uninsured_loss` DECIMAL(19,2) NULL DEFAULT NULL,
  `amount_insured_excess` DECIMAL(19,2) NULL DEFAULT NULL,
  `amount_gst_recover` DECIMAL(19,2) NULL DEFAULT NULL,
  `trade_practices_action` CHAR(1) NULL DEFAULT NULL,
  `date_closed` DATETIME NULL DEFAULT NULL,
  `date_opened` DATETIME NULL DEFAULT NULL,
  `rec_status_updated_date` TIMESTAMP NULL DEFAULT NULL,
  `rec_status_updated_by` INT(11) NULL DEFAULT NULL,
  `event_no` VARCHAR(50) NULL DEFAULT NULL,
  `amount_target` DECIMAL(19,2) NULL DEFAULT NULL,
  `date_closed_final` DATETIME NULL DEFAULT NULL,
  `date_archived` DATETIME NULL DEFAULT NULL,
  `amount_owing` DECIMAL(19,2) NULL DEFAULT NULL,
  `rev_id` INT(11) NOT NULL,
  `rev_type` TINYINT(4) NOT NULL,
  `date_stage2` DATETIME NULL DEFAULT NULL,
  `manager_id` INT(11) NULL DEFAULT NULL,
  `team_leader_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`fileId`, `rev_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table filesuppliers
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `filesuppliers` (
  `fileId` INT(11) NOT NULL,
  `supplierId` INT(11) NOT NULL,
  `SORT_ORDER` INT(11) NOT NULL DEFAULT '0',
  `SUPPLIER_FILE_REFERENCE` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`fileId`, `supplierId`),
  INDEX `FILE_SUPPLIERS_FK2` (`supplierId` ASC),
  CONSTRAINT `FILE_SUPPLIERS_FK1`
    FOREIGN KEY (`fileId`)
    REFERENCES `files` (`fileId`),
  CONSTRAINT `FILE_SUPPLIERS_FK2`
    FOREIGN KEY (`supplierId`)
    REFERENCES `suppliers` (`supplierId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table frequency_type
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `frequency_type` (
  `frequency_type_id` INT(11) NOT NULL,
  `description` VARCHAR(64) NOT NULL,
  `cron` VARCHAR(32) NULL DEFAULT NULL,
  PRIMARY KEY (`frequency_type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table gst_type
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `gst_type` (
  `gst_type_id` INT(11) NOT NULL,
  `name` VARCHAR(10) NOT NULL,
  `description` VARCHAR(50) NOT NULL,
  `gst` DECIMAL(19,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`gst_type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table hibernate_sequences
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `hibernate_sequences` (
  `sequence_name` VARCHAR(32) NOT NULL,
  `next_val` INT(11) NOT NULL,
  PRIMARY KEY (`sequence_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table import_file
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `import_file` (
  `import_file_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `status` CHAR(1) NULL DEFAULT NULL,
  `status_description` VARCHAR(2048) NULL DEFAULT NULL,
  `source` VARCHAR(255) NULL DEFAULT NULL,
  `CREATED_BY` INT(11) NULL DEFAULT NULL,
  `CREATED_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` INT(11) NULL DEFAULT NULL,
  `UPDATED_DATE` TIMESTAMP NULL DEFAULT NULL,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`import_file_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table incident_details
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `incident_details` (
  `INCIDENT_DETAILS_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `INCIDENT_DATE` DATETIME NOT NULL,
  `LOCATION` VARCHAR(250) NULL DEFAULT NULL,
  `DESCRIPTION` TEXT NULL DEFAULT NULL,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`INCIDENT_DETAILS_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table info_request
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `info_request` (
  `info_request_id` INT(11) NOT NULL AUTO_INCREMENT,
  `file_id` INT(11) NOT NULL,
  `notation` TEXT NOT NULL,
  `who_from` VARCHAR(255) NOT NULL,
  `date_requested` DATE NOT NULL,
  `date_received` DATE NULL DEFAULT NULL,
  `LOGICALLY_DELETED` CHAR(1) NULL DEFAULT NULL,
  `CREATED_BY` INT(11) NULL DEFAULT NULL,
  `CREATED_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` INT(11) NULL DEFAULT NULL,
  `UPDATED_DATE` TIMESTAMP NULL DEFAULT NULL,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`info_request_id`),
  INDEX `info_request_fk1` (`file_id` ASC),
  INDEX `info_request_idx1` (`who_from` ASC),
  CONSTRAINT `info_request_fk1`
    FOREIGN KEY (`file_id`)
    REFERENCES `files` (`fileId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table insureddetails
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `insureddetails` (
  `insdetId` INT(11) NOT NULL AUTO_INCREMENT,
  `insdetContactId` INT(11) NULL DEFAULT NULL,
  `LICENCE_NUMBER` VARCHAR(20) NULL DEFAULT NULL,
  `REGO_NUMBER` VARCHAR(20) NULL DEFAULT NULL,
  `VEHICLE_MAKE` VARCHAR(64) NULL DEFAULT NULL,
  `VEHICLE_MODEL` VARCHAR(64) NULL DEFAULT NULL,
  `LOSS_DESCRIPTION` VARCHAR(2000) NULL DEFAULT NULL,
  PRIMARY KEY (`insdetId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table invoices
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `invoices` (
  `invoiceId` INT(11) NOT NULL AUTO_INCREMENT,
  `invoiceClientId` INT(11) NULL DEFAULT NULL,
  `invoiceDate` DATETIME NULL DEFAULT NULL,
  `invoiceAmount` DECIMAL(19,2) NOT NULL DEFAULT '0.00',
  `invoiceFee` DECIMAL(19,2) NOT NULL DEFAULT '0.00',
  `invoiceAuthorisedBy` INT(11) NULL DEFAULT NULL,
  `invoiceDateAuthorised` DATETIME NULL DEFAULT NULL,
  `invoiceFileId` INT(11) NULL DEFAULT NULL,
  `invoiceCCFee` DECIMAL(19,2) NOT NULL DEFAULT '0.00',
  `invoiceGST` DECIMAL(19,2) NOT NULL DEFAULT '0.00',
  `invoiceBillingFeeId` INT(11) NULL DEFAULT NULL,
  `invoiceChequeId` INT(11) NULL DEFAULT NULL,
  `FEE_FLAT` CHAR(1) NULL DEFAULT NULL,
  `AMOUNT_RECOVERED` DECIMAL(19,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`invoiceId`),
  INDEX `INVOICES_FK1` (`invoiceBillingFeeId` ASC),
  INDEX `INVOICES_FK2` (`invoiceClientId` ASC),
  INDEX `INVOICES_FK3` (`invoiceAuthorisedBy` ASC),
  INDEX `INVOICES_FK4` (`invoiceFileId` ASC),
  INDEX `INVOICES_FK5` (`invoiceChequeId` ASC),
  CONSTRAINT `INVOICES_FK1`
    FOREIGN KEY (`invoiceBillingFeeId`)
    REFERENCES `billing_file` (`feeId`),
  CONSTRAINT `INVOICES_FK2`
    FOREIGN KEY (`invoiceClientId`)
    REFERENCES `clients` (`clientId`),
  CONSTRAINT `INVOICES_FK3`
    FOREIGN KEY (`invoiceAuthorisedBy`)
    REFERENCES `users` (`userId`),
  CONSTRAINT `INVOICES_FK4`
    FOREIGN KEY (`invoiceFileId`)
    REFERENCES `files` (`fileId`),
  CONSTRAINT `INVOICES_FK5`
    FOREIGN KEY (`invoiceChequeId`)
    REFERENCES `cheques` (`chequeId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table journals
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `journals` (
  `journalId` INT(11) NOT NULL AUTO_INCREMENT,
  `journalDate` DATE NULL DEFAULT NULL,
  `journalAmount` DECIMAL(19,2) NOT NULL DEFAULT '0.00',
  `journalExplanation` TEXT NULL DEFAULT NULL,
  `journalStatus` INT(11) NOT NULL,
  `journalFromFileId` INT(11) NULL DEFAULT NULL,
  `journalToFileId` INT(11) NULL DEFAULT NULL,
  `journalCreatedBy` INT(11) NULL DEFAULT NULL,
  `journalAuthorisedBy` INT(11) NULL DEFAULT NULL,
  `journalDateAuthorised` DATE NULL DEFAULT NULL,
  `PAYEE` VARCHAR(100) NULL DEFAULT NULL,
  `BANK_ID` INT(11) NULL DEFAULT NULL,
  `CREATED_BY` INT(11) NULL DEFAULT NULL,
  `CREATED_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` INT(11) NULL DEFAULT NULL,
  `UPDATED_DATE` TIMESTAMP NULL DEFAULT NULL,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`journalId`),
  INDEX `JOURNALS_FK1` (`BANK_ID` ASC),
  CONSTRAINT `JOURNALS_FK1`
    FOREIGN KEY (`BANK_ID`)
    REFERENCES `banks` (`bankId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table legal_type
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `legal_type` (
  `LEGAL_TYPE_ID` INT(11) NOT NULL,
  `NAME` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`LEGAL_TYPE_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table letters
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `letters` (
  `letterId` INT(11) NOT NULL AUTO_INCREMENT,
  `letterName` VARCHAR(255) NULL DEFAULT NULL,
  `letterBody` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`letterId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table links
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `links` (
  `links_id` INT(11) NOT NULL AUTO_INCREMENT,
  `links_title` VARCHAR(255) NULL DEFAULT NULL,
  `links_date` DATE NULL DEFAULT NULL,
  `links_date_end` DATE NULL DEFAULT NULL,
  `links_text` TEXT NOT NULL,
  `CREATED_BY` INT(11) NULL DEFAULT NULL,
  `CREATED_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` INT(11) NULL DEFAULT NULL,
  `UPDATED_DATE` TIMESTAMP NULL DEFAULT NULL,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`links_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loss_desc
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loss_desc` (
  `LOSS_DESC_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` VARCHAR(50) NOT NULL,
  `CREATED_BY` INT(11) NOT NULL,
  `CREATED_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`LOSS_DESC_ID`),
  INDEX `LOSS_DESC_FK1` (`CREATED_BY` ASC),
  CONSTRAINT `LOSS_DESC_FK1`
    FOREIGN KEY (`CREATED_BY`)
    REFERENCES `users` (`userId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loss_type
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loss_type` (
  `LOSS_TYPE_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` VARCHAR(50) NOT NULL,
  `CREATED_BY` INT(11) NOT NULL,
  `CREATED_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`LOSS_TYPE_ID`),
  INDEX `LOSS_TYPE_FK1` (`CREATED_BY` ASC),
  CONSTRAINT `LOSS_TYPE_FK1`
    FOREIGN KEY (`CREATED_BY`)
    REFERENCES `users` (`userId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table news
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `news` (
  `news_id` INT(11) NOT NULL AUTO_INCREMENT,
  `news_title` VARCHAR(255) NULL DEFAULT NULL,
  `news_date` DATE NOT NULL,
  `news_date_end` DATE NULL DEFAULT NULL,
  `news_text` TEXT NOT NULL,
  `CREATED_BY` INT(11) NULL DEFAULT NULL,
  `CREATED_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` INT(11) NULL DEFAULT NULL,
  `UPDATED_DATE` TIMESTAMP NULL DEFAULT NULL,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`news_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table notes
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `notes` (
  `noteId` INT(11) NOT NULL AUTO_INCREMENT,
  `noteDate` DATETIME NULL DEFAULT NULL,
  `noteCreatedBy` INT(11) NULL DEFAULT NULL,
  `noteText` TEXT NULL DEFAULT NULL,
  `noteFileId` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`noteId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table pol_documents
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `pol_documents` (
  `poldocId` INT(11) NOT NULL AUTO_INCREMENT,
  `poldocName` VARCHAR(255) NULL DEFAULT NULL,
  `poldocSign` CHAR(1) NOT NULL DEFAULT '+',
  PRIMARY KEY (`poldocId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table pol_type_docs
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `pol_type_docs` (
  `poltId` INT(11) NOT NULL,
  `poldocId` INT(11) NOT NULL,
  PRIMARY KEY (`poltId`, `poldocId`),
  INDEX `POL_TYPE_DOCS_FK2` (`poldocId` ASC),
  CONSTRAINT `POL_TYPE_DOCS_FK1`
    FOREIGN KEY (`poltId`)
    REFERENCES `pol_types` (`poltId`),
  CONSTRAINT `POL_TYPE_DOCS_FK2`
    FOREIGN KEY (`poldocId`)
    REFERENCES `pol_documents` (`poldocId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table pol_types
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `pol_types` (
  `poltId` INT(11) NOT NULL AUTO_INCREMENT,
  `poltName` VARCHAR(255) NULL DEFAULT NULL,
  `poltActive` BIT(1) NOT NULL,
  PRIMARY KEY (`poltId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table policereports
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `policereports` (
  `policeRepId` INT(11) NOT NULL AUTO_INCREMENT,
  `policeRepNumber` VARCHAR(50) NULL DEFAULT NULL,
  `policeRepOfficerName` VARCHAR(50) NULL DEFAULT NULL,
  `policeRepStationName` VARCHAR(50) NULL DEFAULT NULL,
  `policeRepStationPhone` VARCHAR(20) NULL DEFAULT NULL,
  `policeRepStationFax` VARCHAR(20) NULL DEFAULT NULL,
  `policeRepStationEmail` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`policeRepId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table proof_of_loss
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `proof_of_loss` (
  `polId` INT(11) NOT NULL AUTO_INCREMENT,
  `polFileId` INT(11) NOT NULL,
  `polType` INT(11) NULL DEFAULT NULL,
  `POL_COMPLETED` CHAR(1) NOT NULL DEFAULT 'N',
  `AMOUNT_OK` CHAR(1) NOT NULL DEFAULT 'N',
  `ASSESSOR_OK` CHAR(1) NULL DEFAULT NULL,
  `QUOTE_OK` CHAR(1) NULL DEFAULT NULL,
  `INVOICE_OK` CHAR(1) NULL DEFAULT NULL,
  `PAV_OK` CHAR(1) NULL DEFAULT NULL,
  `SALVAGE_OK` CHAR(1) NULL DEFAULT NULL,
  `TOW_INVOICE_OK` CHAR(1) NULL DEFAULT NULL,
  `UPDATED_BY` INT(11) NOT NULL,
  `UPDATED_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  `DEMURRAGE_OK` CHAR(1) NULL DEFAULT NULL,
  PRIMARY KEY (`polId`),
  INDEX `PROOF_OF_LOSS_FK2` (`polType` ASC),
  INDEX `PROOF_OF_LOSS_FK3` (`UPDATED_BY` ASC),
  INDEX `PROOF_OF_LOSS_IDX1` (`polFileId` ASC),
  INDEX `PROOF_OF_LOSS_IDX2` (`UPDATED_DATE` ASC),
  CONSTRAINT `PROOF_OF_LOSS_FK1`
    FOREIGN KEY (`polFileId`)
    REFERENCES `files` (`fileId`),
  CONSTRAINT `PROOF_OF_LOSS_FK2`
    FOREIGN KEY (`polType`)
    REFERENCES `pol_types` (`poltId`),
  CONSTRAINT `PROOF_OF_LOSS_FK3`
    FOREIGN KEY (`UPDATED_BY`)
    REFERENCES `users` (`userId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table proof_of_loss_docs
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `proof_of_loss_docs` (
  `docId` INT(11) NOT NULL AUTO_INCREMENT,
  `docPOL` INT(11) NULL DEFAULT NULL,
  `docType` INT(11) NULL DEFAULT NULL,
  `docSubtotal` DECIMAL(19,2) NULL DEFAULT NULL,
  `docGST` DECIMAL(19,2) NULL DEFAULT NULL,
  `docSupplier` VARCHAR(255) NULL DEFAULT NULL,
  `docNotes` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`docId`),
  INDEX `PROOF_OF_LOSS_DOCS_FK1` (`docPOL` ASC),
  INDEX `PROOF_OF_LOSS_DOCS_FK2` (`docType` ASC),
  CONSTRAINT `PROOF_OF_LOSS_DOCS_FK1`
    FOREIGN KEY (`docPOL`)
    REFERENCES `proof_of_loss` (`polId`),
  CONSTRAINT `PROOF_OF_LOSS_DOCS_FK2`
    FOREIGN KEY (`docType`)
    REFERENCES `pol_documents` (`poldocId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table public_holiday
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `public_holiday` (
  `PUBLIC_HOLIDAY_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `START_DATE` DATE NOT NULL,
  `END_DATE` DATE NOT NULL,
  `STATE` VARCHAR(3) NULL DEFAULT NULL,
  `DESCRIPTION` VARCHAR(250) NULL DEFAULT NULL,
  `CREATED_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`PUBLIC_HOLIDAY_ID`)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table quality_rating
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `quality_rating` (
  `quality_rating_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `active` CHAR(1) NOT NULL DEFAULT 'Y',
  `CREATED_BY` INT(11) NULL DEFAULT NULL,
  `CREATED_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` INT(11) NULL DEFAULT NULL,
  `UPDATED_DATE` TIMESTAMP NULL DEFAULT NULL,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  `priority` INT(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`quality_rating_id`),
  UNIQUE INDEX `quality_rating_uk1` (`name` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table question_type
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `question_type` (
  `question_type_id` INT(11) NOT NULL,
  `question_type_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`question_type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table questionary
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `questionary` (
  `questionary_id` INT(11) NOT NULL,
  `questionary_name` VARCHAR(255) NOT NULL,
  `questionary_description` VARCHAR(512) NULL DEFAULT NULL,
  `CREATED_BY` INT(11) NULL DEFAULT NULL,
  `CREATED_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` INT(11) NULL DEFAULT NULL,
  `UPDATED_DATE` TIMESTAMP NULL DEFAULT NULL,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  `questionary_optional` CHAR(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`questionary_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table questionary_answer
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `questionary_answer` (
  `questionary_answer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `question_id` INT(11) NOT NULL,
  `next_question_id` INT(11) NULL DEFAULT NULL,
  `answer_order` INT(11) NOT NULL,
  `answer_name` VARCHAR(512) NOT NULL,
  `answer_record_reason` CHAR(1) NOT NULL DEFAULT 'N',
  `answer_spel` VARCHAR(512) NULL DEFAULT NULL,
  `outcome_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`questionary_answer_id`),
  INDEX `questionary_answer_fk1` (`question_id` ASC),
  INDEX `questionary_answer_fk2` (`next_question_id` ASC),
  INDEX `questionary_answer_fk3` (`outcome_id` ASC),
  CONSTRAINT `questionary_answer_fk1`
    FOREIGN KEY (`question_id`)
    REFERENCES `questionary_question` (`questionary_question_id`),
  CONSTRAINT `questionary_answer_fk2`
    FOREIGN KEY (`next_question_id`)
    REFERENCES `questionary_question` (`questionary_question_id`),
  CONSTRAINT `questionary_answer_fk3`
    FOREIGN KEY (`outcome_id`)
    REFERENCES `actionoutcomes` (`outId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table questionary_question
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `questionary_question` (
  `questionary_question_id` INT(11) NOT NULL AUTO_INCREMENT,
  `questionary_id` INT(11) NOT NULL,
  `question_order` INT(11) NOT NULL,
  `question_type_id` INT(11) NOT NULL,
  `question_name` VARCHAR(255) NOT NULL,
  `question_description` VARCHAR(512) NULL DEFAULT NULL,
  PRIMARY KEY (`questionary_question_id`),
  INDEX `questionary_question_fk1` (`question_type_id` ASC),
  INDEX `questionary_question_fk2` (`questionary_id` ASC),
  CONSTRAINT `questionary_question_fk1`
    FOREIGN KEY (`question_type_id`)
    REFERENCES `question_type` (`question_type_id`),
  CONSTRAINT `questionary_question_fk2`
    FOREIGN KEY (`questionary_id`)
    REFERENCES `questionary` (`questionary_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table rec_status
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `rec_status` (
  `REC_STATUS_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `REC_STATUS_NAME` VARCHAR(50) NOT NULL,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`REC_STATUS_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table receipts
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `receipts` (
  `receiptId` INT(11) NOT NULL,
  `receiptBankId` INT(11) NULL DEFAULT NULL,
  `receiptDate` DATE NULL DEFAULT NULL,
  `receiptType` INT(11) NOT NULL,
  `receiptAmount` DECIMAL(19,2) NOT NULL DEFAULT '0.00',
  `receiptDatePrinted` DATETIME NULL DEFAULT NULL,
  `receiptPayee` VARCHAR(50) NULL DEFAULT NULL,
  `receiptChequeNumber` VARCHAR(20) NULL DEFAULT NULL,
  `receiptDepositId` INT(11) NULL DEFAULT NULL,
  `receiptDatePresented` DATE NULL DEFAULT NULL,
  `CREATED_BY` INT(11) NULL DEFAULT NULL,
  `CREATED_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` INT(11) NULL DEFAULT NULL,
  `UPDATED_DATE` TIMESTAMP NULL DEFAULT NULL,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`receiptId`),
  INDEX `RECEIPTS_FK1` (`receiptBankId` ASC),
  CONSTRAINT `RECEIPTS_FK1`
    FOREIGN KEY (`receiptBankId`)
    REFERENCES `banks` (`bankId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table repayment
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `repayment` (
  `REPAYMENT_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `FILE_ID` INT(11) NOT NULL,
  `INITIAL_AMOUNT` DECIMAL(19,2) NOT NULL DEFAULT '0.00',
  `FEE` DECIMAL(19,2) NOT NULL DEFAULT '0.00',
  `INITIAL_DATE` DATE NULL DEFAULT NULL,
  `START_DATE` DATE NULL DEFAULT NULL,
  `AMOUNT` DECIMAL(19,2) NOT NULL DEFAULT '0.00',
  `FREQUENCY` INT(11) NOT NULL,
  `FREQUENCY_TYPE` INT(11) NOT NULL,
  `COMMENT` TEXT NULL DEFAULT NULL,
  `PAYMENT_METHOD` INT(11) NOT NULL,
  `PAYMENT_REFERENCE` VARCHAR(64) NULL DEFAULT NULL,
  `SIGNED_AGREE` BIT(1) NULL DEFAULT NULL,
  `STOP_REMINDER` BIT(1) NULL DEFAULT NULL,
  `NEXT_ID` INT(11) NULL DEFAULT NULL,
  `CREATED_BY` INT(11) NOT NULL,
  `CREATED_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  `AMOUNT_OWING` DECIMAL(19,2) NOT NULL DEFAULT '0.00',
  `STOP_OVERDUE` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`REPAYMENT_ID`),
  INDEX `REPAYMENT_FK1` (`FILE_ID` ASC),
  INDEX `REPAYMENT_FK2` (`CREATED_BY` ASC),
  INDEX `REPAYMENT_FK3` (`NEXT_ID` ASC),
  CONSTRAINT `REPAYMENT_FK1`
    FOREIGN KEY (`FILE_ID`)
    REFERENCES `files` (`fileId`),
  CONSTRAINT `REPAYMENT_FK2`
    FOREIGN KEY (`CREATED_BY`)
    REFERENCES `users` (`userId`),
  CONSTRAINT `REPAYMENT_FK3`
    FOREIGN KEY (`NEXT_ID`)
    REFERENCES `repayment` (`REPAYMENT_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table repayment_schedule
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `repayment_schedule` (
  `REPAYMENT_SCHEDULE_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `REPAYMENT_ID` INT(11) NOT NULL,
  `DUE_DATE` DATE NOT NULL,
  `AMOUNT` DECIMAL(19,2) NOT NULL DEFAULT '0.00',
  `PAID_DATE` DATE NULL DEFAULT NULL,
  `PAID_AMOUNT` DECIMAL(19,2) NOT NULL DEFAULT '0.00',
  `CREATED_BY` INT(11) NOT NULL,
  `CREATED_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`REPAYMENT_SCHEDULE_ID`),
  INDEX `REPAYMENT_SCHEDULE_FK1` (`REPAYMENT_ID` ASC),
  INDEX `REPAYMENT_SCHEDULE_FK2` (`CREATED_BY` ASC),
  CONSTRAINT `REPAYMENT_SCHEDULE_FK1`
    FOREIGN KEY (`REPAYMENT_ID`)
    REFERENCES `repayment` (`REPAYMENT_ID`),
  CONSTRAINT `REPAYMENT_SCHEDULE_FK2`
    FOREIGN KEY (`CREATED_BY`)
    REFERENCES `users` (`userId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table revinfo
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `revinfo` (
  `rev_id` INT(11) NOT NULL AUTO_INCREMENT,
  `rev_tstmp` BIGINT(20) NOT NULL,
  PRIMARY KEY (`rev_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table securitygroups
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `securitygroups` (
  `groupId` INT(11) NOT NULL AUTO_INCREMENT,
  `groupName` VARCHAR(50) NULL DEFAULT NULL,
  `file_type_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`groupId`),
  UNIQUE INDEX `securitygroups_uk1` (`file_type_id` ASC),
  CONSTRAINT `securitygroups_fk1`
    FOREIGN KEY (`file_type_id`)
    REFERENCES `file_type` (`file_type_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table state
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `state` (
  `STATE_ID` INT(11) NOT NULL,
  `STATE` VARCHAR(10) NOT NULL,
  `COUNTRY` CHAR(2) NULL DEFAULT NULL,
  `STATUTE_BARRED_MONTHS` INT(11) NOT NULL,
  PRIMARY KEY (`STATE_ID`),
  INDEX `state_fk1` (`COUNTRY` ASC),
  CONSTRAINT `state_fk1`
    FOREIGN KEY (`COUNTRY`)
    REFERENCES `country` (`country_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table supplier_service
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `supplier_service` (
  `supplier_service_id` INT(11) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `myob_inventory_type` VARCHAR(10) NULL DEFAULT NULL,
  `myob_account_number` INT(11) NOT NULL,
  `gst_type_id` INT(11) NOT NULL,
  `active` CHAR(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`supplier_service_id`),
  INDEX `supplier_service_fk1` (`gst_type_id` ASC),
  CONSTRAINT `supplier_service_fk1`
    FOREIGN KEY (`gst_type_id`)
    REFERENCES `gst_type` (`gst_type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table supplierinvoices
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `supplierinvoices` (
  `invoiceId` INT(11) NOT NULL AUTO_INCREMENT,
  `invoiceSupplierId` INT(11) NULL DEFAULT NULL,
  `invoiceNumber` VARCHAR(50) NULL DEFAULT NULL,
  `invoiceFileId` INT(11) NOT NULL,
  `invoiceDescription` TEXT NULL DEFAULT NULL,
  `invoiceSubtotal` DECIMAL(19,2) NOT NULL DEFAULT '0.00',
  `invoiceGST` DECIMAL(19,2) NOT NULL DEFAULT '0.00',
  `invoiceAuthorisedBy` INT(11) NULL DEFAULT NULL,
  `invoiceWhoPays` INT(11) NULL DEFAULT NULL,
  `invoiceDateExported` DATETIME NULL DEFAULT NULL,
  `invoiceDateEntered` DATETIME NULL DEFAULT NULL,
  `invoiceEnteredBy` INT(11) NULL DEFAULT NULL,
  `invoiceClientInvoiceId` INT(11) NULL DEFAULT NULL,
  `INVOICE_DATE` DATE NULL DEFAULT NULL,
  `document_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`invoiceId`),
  UNIQUE INDEX `invoiceNumber` (`invoiceSupplierId` ASC, `invoiceNumber` ASC),
  INDEX `SUPPLIERINVOICES_FK2` (`invoiceFileId` ASC),
  INDEX `SUPPLIERINVOICES_FK3` (`invoiceAuthorisedBy` ASC),
  INDEX `SUPPLIERINVOICES_FK4` (`invoiceEnteredBy` ASC),
  INDEX `supplierinvoices_fk5` (`document_id` ASC),
  CONSTRAINT `SUPPLIERINVOICES_FK1`
    FOREIGN KEY (`invoiceSupplierId`)
    REFERENCES `suppliers` (`supplierId`),
  CONSTRAINT `SUPPLIERINVOICES_FK2`
    FOREIGN KEY (`invoiceFileId`)
    REFERENCES `files` (`fileId`),
  CONSTRAINT `SUPPLIERINVOICES_FK3`
    FOREIGN KEY (`invoiceAuthorisedBy`)
    REFERENCES `users` (`userId`),
  CONSTRAINT `SUPPLIERINVOICES_FK4`
    FOREIGN KEY (`invoiceEnteredBy`)
    REFERENCES `users` (`userId`),
  CONSTRAINT `supplierinvoices_fk5`
    FOREIGN KEY (`document_id`)
    REFERENCES `document` (`document_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table suppliers
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `suppliers` (
  `supplierId` INT(11) NOT NULL AUTO_INCREMENT,
  `supplierName` VARCHAR(50) NULL DEFAULT NULL,
  `supplierTradingName` VARCHAR(50) NULL DEFAULT NULL,
  `supplierHowTrading` INT(11) NOT NULL,
  `supplierABN` VARCHAR(50) NULL DEFAULT NULL,
  `supplierACN` VARCHAR(50) NULL DEFAULT NULL,
  `supplierTypeId` INT(11) NULL DEFAULT NULL,
  `supplierPrimaryContactId` INT(11) NULL DEFAULT NULL,
  `supplierPayableContactId` INT(11) NULL DEFAULT NULL,
  `supplierAddressId` INT(11) NULL DEFAULT NULL,
  `supplierPostalAddressId` INT(11) NULL DEFAULT NULL,
  `supplierCreatedBy` INT(11) NULL DEFAULT NULL,
  `supplierDateCreated` DATETIME NULL DEFAULT NULL,
  `supplier_service_id` INT(11) NULL DEFAULT NULL,
  `myob_card_name` VARCHAR(250) NULL DEFAULT NULL,
  PRIMARY KEY (`supplierId`),
  INDEX `suppliers_fk1` (`supplier_service_id` ASC),
  CONSTRAINT `suppliers_fk1`
    FOREIGN KEY (`supplier_service_id`)
    REFERENCES `supplier_service` (`supplier_service_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table suppliertypes
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `suppliertypes` (
  `suptId` INT(11) NOT NULL AUTO_INCREMENT,
  `suptName` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`suptId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table supplierusers
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `supplierusers` (
  `userId` INT(11) NOT NULL,
  `supplierId` INT(11) NOT NULL,
  PRIMARY KEY (`userId`, `supplierId`),
  INDEX `SUPPLIER_USERS_FK2` (`supplierId` ASC),
  CONSTRAINT `SUPPLIER_USERS_FK1`
    FOREIGN KEY (`userId`)
    REFERENCES `users` (`userId`),
  CONSTRAINT `SUPPLIER_USERS_FK2`
    FOREIGN KEY (`supplierId`)
    REFERENCES `suppliers` (`supplierId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table system_access
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `system_access` (
  `SECURITY_GROUP_ID` INT(11) NOT NULL,
  `SYSTEM_FUNCTION_ID` INT(11) NOT NULL,
  PRIMARY KEY (`SECURITY_GROUP_ID`, `SYSTEM_FUNCTION_ID`),
  INDEX `SYSTEM_ACCESS_FK2` (`SYSTEM_FUNCTION_ID` ASC),
  CONSTRAINT `SYSTEM_ACCESS_FK1`
    FOREIGN KEY (`SECURITY_GROUP_ID`)
    REFERENCES `securitygroups` (`groupId`),
  CONSTRAINT `SYSTEM_ACCESS_FK2`
    FOREIGN KEY (`SYSTEM_FUNCTION_ID`)
    REFERENCES `system_function` (`SYSTEM_FUNCTION_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table system_function
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `system_function` (
  `SYSTEM_FUNCTION_ID` INT(11) NOT NULL,
  `MODULE` VARCHAR(50) NOT NULL,
  `NAME` VARCHAR(100) NOT NULL,
  `DESCRIPTION` VARCHAR(255) NOT NULL,
  `QUERY` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`SYSTEM_FUNCTION_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table templates
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `templates` (
  `tempId` INT(11) NOT NULL AUTO_INCREMENT,
  `tempType` INT(11) NOT NULL,
  `tempName` VARCHAR(255) NULL DEFAULT NULL,
  `tempBody` TEXT NULL DEFAULT NULL,
  `tempContentType` VARCHAR(128) NULL DEFAULT NULL,
  `TEMP_CONTENT` MEDIUMBLOB NULL DEFAULT NULL,
  `internal` CHAR(1) NOT NULL DEFAULT 'Y',
  `content_name` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`tempId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table tpdebtors
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tpdebtors` (
  `tpdId` INT(11) NOT NULL AUTO_INCREMENT,
  `tpdContactId` INT(11) NULL DEFAULT NULL,
  `NAME` VARCHAR(255) NULL DEFAULT NULL,
  `LEGAL_NAME` VARCHAR(255) NULL DEFAULT NULL,
  `TRADING_NAME` VARCHAR(255) NULL DEFAULT NULL,
  `ABN` VARCHAR(20) NULL DEFAULT NULL,
  `ACN` VARCHAR(20) NULL DEFAULT NULL,
  `next_tpd_id` INT(11) NULL DEFAULT NULL,
  `bank_details` VARCHAR(512) NULL DEFAULT NULL,
  PRIMARY KEY (`tpdId`),
  INDEX `tpdContactId` (`tpdContactId` ASC),
  INDEX `tpdebtors_fk1` (`next_tpd_id` ASC),
  CONSTRAINT `tpdebtors_fk1`
    FOREIGN KEY (`next_tpd_id`)
    REFERENCES `tpdebtors` (`tpdId`),
  CONSTRAINT `tpdebtors_ibfk_1`
    FOREIGN KEY (`tpdContactId`)
    REFERENCES `contacts` (`contactId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table tpi
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tpi` (
  `tpiId` INT(11) NOT NULL AUTO_INCREMENT,
  `tpiName` VARCHAR(50) NULL DEFAULT NULL,
  `CONTACT_PHONE` VARCHAR(255) NULL DEFAULT NULL,
  `CONTACT_ID` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`tpiId`),
  UNIQUE INDEX `tpi_uk1` (`tpiName` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table tpinsurers
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tpinsurers` (
  `tpiId` INT(11) NOT NULL AUTO_INCREMENT,
  `tpiTPI` INT(11) NULL DEFAULT NULL,
  `tpiContactId` INT(11) NULL DEFAULT NULL,
  `tpiPolicyNumber` VARCHAR(100) NULL DEFAULT NULL,
  `tpiClaimNumber` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`tpiId`),
  INDEX `TPINSURERS_FK1` (`tpiTPI` ASC),
  INDEX `TPINSURERS_FK2` (`tpiContactId` ASC),
  CONSTRAINT `TPINSURERS_FK1`
    FOREIGN KEY (`tpiTPI`)
    REFERENCES `tpi` (`tpiId`),
  CONSTRAINT `TPINSURERS_FK2`
    FOREIGN KEY (`tpiContactId`)
    REFERENCES `contacts` (`contactId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table tpowners
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tpowners` (
  `tpoId` INT(11) NOT NULL AUTO_INCREMENT,
  `tpoContactId` INT(11) NULL DEFAULT NULL,
  `tpoName` VARCHAR(100) NULL DEFAULT NULL,
  `tpoCompanyName` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`tpoId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table tpproperties
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tpproperties` (
  `tppId` INT(11) NOT NULL AUTO_INCREMENT,
  `tppLicenceNumber` VARCHAR(20) NULL DEFAULT NULL,
  `tppRegoNumber` VARCHAR(20) NULL DEFAULT NULL,
  `tppVehicleMake` VARCHAR(50) NULL DEFAULT NULL,
  `tppVehicleModel` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`tppId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table tprepresentatives
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tprepresentatives` (
  `tprId` INT(11) NOT NULL AUTO_INCREMENT,
  `tprContactId` INT(11) NULL DEFAULT NULL,
  `tprName` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`tprId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table tpstatus
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tpstatus` (
  `statusId` INT(11) NOT NULL AUTO_INCREMENT,
  `statusName` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`statusId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table transaction_type
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `transaction_type` (
  `TRANSACTION_TYPE_ID` INT(11) NOT NULL,
  `FACTOR` INT(11) NOT NULL DEFAULT '1',
  `CODE` VARCHAR(32) NULL DEFAULT NULL,
  `DESCRIPTION` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`TRANSACTION_TYPE_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table transactions
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `transactions` (
  `transId` INT(11) NOT NULL AUTO_INCREMENT,
  `transFileId` INT(11) NULL DEFAULT NULL,
  `transExplanation` TEXT NULL DEFAULT NULL,
  `transAmount` DECIMAL(19,2) NOT NULL DEFAULT '0.00',
  `transType` INT(11) NOT NULL,
  `transDate` DATE NOT NULL,
  `transOwnerId` INT(11) NULL DEFAULT NULL,
  `transOwnerType` VARCHAR(50) NULL DEFAULT NULL,
  `transInvoiceId` INT(11) NULL DEFAULT NULL,
  `transGST` DECIMAL(19,2) NOT NULL DEFAULT '0.00',
  `transFee` DECIMAL(19,2) NOT NULL DEFAULT '0.00',
  `RECOVERED_BY` VARCHAR(10) NULL DEFAULT NULL,
  `JOURNALLED` CHAR(1) NOT NULL DEFAULT 'N',
  `CREATED_BY` INT(11) NULL DEFAULT NULL,
  `CREATED_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` INT(11) NULL DEFAULT NULL,
  `UPDATED_DATE` TIMESTAMP NULL DEFAULT NULL,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  `REVERSE_ID` INT(11) NULL DEFAULT NULL,
  `UNITS` INT(11) NULL DEFAULT NULL,
  `UNIT_PRICE` DECIMAL(19,2) NULL DEFAULT NULL,
  `exclude_from_invoice` CHAR(1) NULL DEFAULT NULL,
  `defer_from_invoice` CHAR(1) NULL DEFAULT NULL,
  `gst_type_id` INT(11) NULL DEFAULT NULL,
  `supplier_service_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`transId`),
  INDEX `TRANSACTIONS_FK1` (`transFileId` ASC),
  INDEX `TRANSACTIONS_FK2` (`transType` ASC),
  INDEX `TRANSACTIONS_FK3` (`transInvoiceId` ASC),
  INDEX `TRANSACTIONS_IDX1` (`transOwnerType` ASC),
  INDEX `TRANSACTIONS_FK4` (`REVERSE_ID` ASC),
  INDEX `transactions_fk5` (`gst_type_id` ASC),
  INDEX `transactions_fk6` (`supplier_service_id` ASC),
  INDEX `transactions_idx4` (`transDate` ASC),
  INDEX `transactions_idx5` (`transOwnerId` ASC, `transOwnerType` ASC),
  CONSTRAINT `TRANSACTIONS_FK1`
    FOREIGN KEY (`transFileId`)
    REFERENCES `files` (`fileId`),
  CONSTRAINT `TRANSACTIONS_FK2`
    FOREIGN KEY (`transType`)
    REFERENCES `transaction_type` (`TRANSACTION_TYPE_ID`),
  CONSTRAINT `TRANSACTIONS_FK3`
    FOREIGN KEY (`transInvoiceId`)
    REFERENCES `invoices` (`invoiceId`),
  CONSTRAINT `TRANSACTIONS_FK4`
    FOREIGN KEY (`REVERSE_ID`)
    REFERENCES `transactions` (`transId`),
  CONSTRAINT `transactions_fk5`
    FOREIGN KEY (`gst_type_id`)
    REFERENCES `gst_type` (`gst_type_id`),
  CONSTRAINT `transactions_fk6`
    FOREIGN KEY (`supplier_service_id`)
    REFERENCES `supplier_service` (`supplier_service_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table user_audit
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `user_audit` (
  `user_audit_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `audit_type_id` INT(11) NOT NULL,
  `created_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` VARCHAR(1024) NULL DEFAULT NULL,
  PRIMARY KEY (`user_audit_id`),
  UNIQUE INDEX `user_audit_uk1` (`user_id` ASC, `audit_type_id` ASC, `created_date` ASC),
  INDEX `user_audit_fk2` (`audit_type_id` ASC),
  CONSTRAINT `user_audit_fk1`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`userId`),
  CONSTRAINT `user_audit_fk2`
    FOREIGN KEY (`audit_type_id`)
    REFERENCES `audit_type` (`audit_type_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table user_notification
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `user_notification` (
  `userId` INT(11) NOT NULL,
  `close_file_advice` CHAR(1) NOT NULL DEFAULT 'Y',
  `write_off_advice` CHAR(1) NOT NULL DEFAULT 'Y',
  `close_file_advice_rule` VARCHAR(512) NULL DEFAULT NULL,
  `write_off_advice_rule` VARCHAR(512) NULL DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `USER_NOTIFICATION_FK1`
    FOREIGN KEY (`userId`)
    REFERENCES `users` (`userId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table user_type
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `user_type` (
  `USER_TYPE_ID` INT(11) NOT NULL,
  `USER_TYPE_NAME` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`USER_TYPE_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table user_workgroup
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `user_workgroup` (
  `USER_ID` INT(11) NOT NULL,
  `WORKGROUP_ID` INT(11) NOT NULL,
  `WORKGROUP_RESPONSIBLE` CHAR(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`USER_ID`, `WORKGROUP_ID`),
  INDEX `USER_WORKGROUP_FK2` (`WORKGROUP_ID` ASC),
  CONSTRAINT `USER_WORKGROUP_FK1`
    FOREIGN KEY (`USER_ID`)
    REFERENCES `users` (`userId`),
  CONSTRAINT `USER_WORKGROUP_FK2`
    FOREIGN KEY (`WORKGROUP_ID`)
    REFERENCES `workgroups` (`wgroupId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table useractivities
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `useractivities` (
  `activityId` INT(11) NOT NULL AUTO_INCREMENT,
  `activityType` INT(11) NULL DEFAULT NULL,
  `activityDate` DATETIME NULL DEFAULT NULL,
  `activityUserId` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`activityId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table users
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `users` (
  `userId` INT(11) NOT NULL AUTO_INCREMENT,
  `userLogin` VARCHAR(50) NULL DEFAULT NULL,
  `userPassword` VARCHAR(50) NULL DEFAULT NULL,
  `userName` VARCHAR(100) NULL DEFAULT NULL,
  `userEmail` VARCHAR(100) NULL DEFAULT NULL,
  `userPhone` VARCHAR(20) NULL DEFAULT NULL,
  `userSecurityGroupId` INT(11) NOT NULL,
  `userType` INT(11) NOT NULL,
  `userPasswordExpireDate` DATE NULL DEFAULT NULL,
  `userStatus` INT(11) NULL DEFAULT '1',
  `PARENT_USER_ID` INT(11) NULL DEFAULT NULL,
  `DEFAULT_RATE` DECIMAL(19,2) NULL DEFAULT NULL,
  `BUDGET_UNITS` INT(11) NULL DEFAULT NULL,
  `CREATED_BY` INT(11) NULL DEFAULT NULL,
  `CREATED_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` INT(11) NULL DEFAULT NULL,
  `UPDATED_DATE` TIMESTAMP NULL DEFAULT NULL,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  `userCreatedBy` INT(11) NULL DEFAULT NULL,
  `userCreatedDate` DATETIME NULL DEFAULT NULL,
  `report_schedule` TEXT NULL DEFAULT NULL,
  `country` CHAR(2) NULL DEFAULT NULL,
  `password_encrypted` CHAR(1) NOT NULL DEFAULT 'N',
  `ftp_username_host` VARCHAR(100) NULL DEFAULT NULL,
  `ftp_pathname` VARCHAR(100) NULL DEFAULT NULL,
  `ssh_identity` VARCHAR(100) NULL DEFAULT NULL,
  `alt_user_id` VARCHAR(50) NULL DEFAULT NULL,
  `user_initials` CHAR(3) NULL DEFAULT NULL,
  `email_alt` VARCHAR(100) NULL DEFAULT NULL,
  `idp` CHAR(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`userId`),
  INDEX `USERS_FK1` (`userSecurityGroupId` ASC),
  INDEX `USERS_FK4` (`PARENT_USER_ID` ASC),
  INDEX `users_fk6` (`country` ASC),
  CONSTRAINT `USERS_FK1`
    FOREIGN KEY (`userSecurityGroupId`)
    REFERENCES `securitygroups` (`groupId`),
  CONSTRAINT `USERS_FK4`
    FOREIGN KEY (`PARENT_USER_ID`)
    REFERENCES `users` (`userId`),
  CONSTRAINT `users_fk6`
    FOREIGN KEY (`country`)
    REFERENCES `country` (`country_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- ----------------------------------------------------------------------------
-- Table user_device
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `user_device` (
  user_device_id int(11)      NOT NULL AUTO_INCREMENT,
  user_id        int(11)      NOT NULL,
  device         varchar(128) NOT NULL,
  created_date   timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT user_device_pk PRIMARY KEY (user_device_id),
  UNIQUE INDEX `user_device_uk1` (`user_id` ASC, `device` ASC),
  CONSTRAINT `user_device_fk1`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`userId`))
ENGINE=InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARSET=utf8;


-- ----------------------------------------------------------------------------
-- Table witnesses
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `witnesses` (
  `witnessId` INT(11) NOT NULL AUTO_INCREMENT,
  `witnessFileId` INT(11) NULL DEFAULT NULL,
  `witnessContactId` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`witnessId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table woauth_limit
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `woauth_limit` (
  `WOAUTH_LIMIT_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `LIMIT_MIN` INT(11) NOT NULL,
  `LIMIT_MAX` INT(11) NULL DEFAULT NULL,
  `SECURITY_GROUP_ID` INT(11) NOT NULL,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`WOAUTH_LIMIT_ID`),
  INDEX `WOAUTH_LIMIT_FK1` (`SECURITY_GROUP_ID` ASC),
  CONSTRAINT `WOAUTH_LIMIT_FK1`
    FOREIGN KEY (`SECURITY_GROUP_ID`)
    REFERENCES `securitygroups` (`groupId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table wodata
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `wodata` (
  `WODATA_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `WO_TYPE` VARCHAR(10) NOT NULL DEFAULT 'WO',
  `FILE_ID` INT(11) NOT NULL,
  `WO_DATE` DATE NOT NULL,
  `WO_AMOUNT` DECIMAL(19,2) NOT NULL DEFAULT '0.00',
  `REASON` TEXT NOT NULL,
  `REQUESTED_BY` INT(11) NOT NULL,
  `REQUESTED_DATE` DATE NOT NULL,
  `AUTHORISED_BY` INT(11) NULL DEFAULT NULL,
  `AUTHORISED_DATE` DATE NULL DEFAULT NULL,
  `STATUS` CHAR(1) NULL DEFAULT NULL,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  `CLOSE_CODE_ID` INT(11) NULL DEFAULT NULL,
  `parent_wodata_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`WODATA_ID`),
  INDEX `WODATA_FK1` (`FILE_ID` ASC),
  INDEX `WODATA_FK2` (`REQUESTED_BY` ASC),
  INDEX `WODATA_FK3` (`AUTHORISED_BY` ASC),
  INDEX `WODATA_FK4` (`CLOSE_CODE_ID` ASC),
  CONSTRAINT `WODATA_FK1`
    FOREIGN KEY (`FILE_ID`)
    REFERENCES `files` (`fileId`),
  CONSTRAINT `WODATA_FK2`
    FOREIGN KEY (`REQUESTED_BY`)
    REFERENCES `users` (`userId`),
  CONSTRAINT `WODATA_FK3`
    FOREIGN KEY (`AUTHORISED_BY`)
    REFERENCES `users` (`userId`),
  CONSTRAINT `WODATA_FK4`
    FOREIGN KEY (`CLOSE_CODE_ID`)
    REFERENCES `closecodes` (`closeId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table wodata_action
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `wodata_action` (
  `WODATA_ACTION_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `WO_TYPE` VARCHAR(10) NOT NULL DEFAULT 'WO',
  `ACTION_CODE` VARCHAR(20) NOT NULL,
  `ACTION_NOTATION` VARCHAR(250) NOT NULL,
  `LOCK_VERSION` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`WODATA_ACTION_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table wodata_action_taken
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `wodata_action_taken` (
  `WODATA_ID` INT(11) NOT NULL,
  `WODATA_ACTION_ID` INT(11) NOT NULL,
  PRIMARY KEY (`WODATA_ID`, `WODATA_ACTION_ID`),
  INDEX `WODATA_ACTION_TAKEN_FK2` (`WODATA_ACTION_ID` ASC),
  CONSTRAINT `WODATA_ACTION_TAKEN_FK1`
    FOREIGN KEY (`WODATA_ID`)
    REFERENCES `wodata` (`WODATA_ID`),
  CONSTRAINT `WODATA_ACTION_TAKEN_FK2`
    FOREIGN KEY (`WODATA_ACTION_ID`)
    REFERENCES `wodata_action` (`WODATA_ACTION_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table workgroups
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `workgroups` (
  `wgroupId` INT(11) NOT NULL AUTO_INCREMENT,
  `wgroupName` VARCHAR(100) NULL DEFAULT NULL,
  `ACTIVE` CHAR(1) NOT NULL DEFAULT 'Y',
  `date_closed_delay` CHAR(1) NOT NULL DEFAULT 'N',
  `date_closed_delay_advice` INT(11) NOT NULL DEFAULT '0',
  `background_color` VARCHAR(32) NULL DEFAULT NULL,
  PRIMARY KEY (`wgroupId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Routine getActionPriority
-- ----------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION `getActionPriority`(action_id INT) RETURNS int(11)
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
CREATE FUNCTION `getChequeId`(cheque_type INT, cheque_date DATE, bank_id INT, cheque_payee varchar(50), cheque_number INT) RETURNS int(11)
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
CREATE FUNCTION `getCompletedActions`(file_id INT) RETURNS int(11)
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
CREATE FUNCTION `getCompletedActions4Client`(client_id INT, file_status INT, date_start DATE, date_end DATE) RETURNS int(11)
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

CREATE FUNCTION `getFileAverageDaysOpen4Client`(client_id INT, file_status INT, date_start DATE, date_end DATE) RETURNS int(11)
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
CREATE FUNCTION `getOwnerBank`(ownerId INT, ownerType VARCHAR(50)) RETURNS int(11)
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
CREATE FUNCTION `getWorkingDays`(date_end DATE, date_start DATE) RETURNS int(11)
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
CREATE FUNCTION `updateBillingFile`(file_id INT, fee_flat INT, fee_value INT) RETURNS int(11)
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

SET FOREIGN_KEY_CHECKS = 1;
