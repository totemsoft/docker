-- USE elixirdb;

-- In MySQL 8.0, XA RECOVER is permitted only to users who have the XA_RECOVER_ADMIN privilege,
-- which is expected to be granted only to administrative users who have need for it.
GRANT XA_RECOVER_ADMIN ON *.* TO 'elixir'@'%';
FLUSH PRIVILEGES;

-- --------------------------------------------------------
--
-- Dumping data for table DBVERSION
--

INSERT INTO dbversion (DBVERSION, PREV_DBVERSION) VALUES ('ELIXIR.03.001', NULL);

-- --------------------------------------------------------
--
-- Dumping data for table actioncodes
--

INSERT INTO actioncodes (actcCode, actcDefaultNotation, actcType, actcActive, actcDirect, actcTemplateId, actcWorkGroupId, actcRestricted) VALUES
('Diary', '', 7, 1, NULL, NULL, NULL, 0),
('EMAIL', 'Email', 7, 1, NULL, NULL, 2, 0),
('SMS', '', 8, 1, NULL, NULL, NULL, 0)
;

-- --------------------------------------------------------
--
-- Dumping data for table actionoutcomes
--

INSERT INTO actionoutcomes (outId, outName, outFixed) VALUES
(1, 'No Answer', b'0'),
(2, 'Disconnected Lines', b'0'),
(3, 'Answering Machine', b'0'),
(4, 'Answered', b'0'),
(5, 'Answered - not available LMTCB', b'0'),
(1001, 'Default', b'1'),
(1002, 'Authorise Modification', b'1'),
(1004, 'Incorrect number', b'0'),
(1005, 'Not known at address', b'0'),
(1006, 'TP insured - NCL', b'0'),
(1007, 'TP insured - Claim Lodged', b'0'),
(1008, 'TP Uninsured - Positive', b'0'),
(1009, 'Disputed Liability', b'0'),
(1010, 'Disputed Quantum', b'0'),
(1011, 'TP Uninsured - poor intentions', b'0'),
(1012, 'No Claim Lodged', b'0'),
(1013, 'No XS Paid', b'0'),
(1014, 'Authority Not Returned', b'0'),
(1015, 'Authority Received', b'0')
;

-- --------------------------------------------------------
--
-- Dumping data for table audit_type
--

INSERT INTO audit_type (audit_type_id, name) VALUES (1, 'LOGIN');
INSERT INTO audit_type (audit_type_id, name) VALUES (2, 'LOGOUT');

-- --------------------------------------------------------
--
-- Dumping data for table closecodes
--

INSERT INTO closecodes (closeId, CODE, DESCRIPTION) VALUES
(1, 'PRD', 'Partial Recovery - Discounted'),
(2, 'FRR', 'Full Recovery - Repayment'),
(3, 'PRR', 'Partial Recovery - Repayment'),
(4, 'RD2C', 'Recovery - Direct to Client'),
(5, 'TBP', 'Third Party Bankrupt'),
(6, 'UE2P', 'Uneconomical to pursue'),
(7, 'CUCI', 'Closed - under clients instructions'),
(8, 'NLTP', 'Non-locate Third Party'),
(9, 'IAF', 'Insured At Fault'),
(10, 'CCVC', 'Closed - Client vs Client'),
(11, 'EBO', 'Each Bear Own'),
(12, 'NRP', 'No Recovery Potential'),
(13, 'NPOLA', 'No Proof of Loss Available'),
(14, 'RUS51', 'Recovery under S51'),
(15, 'RUS54', 'Recovery under S54'),
(16, 'LFR', 'Legals - Full Recovery'),
(17, 'LUS', 'Legals - Unsuccessful'),
(18, 'LPR', 'Legals - Partial Recovery'),
(19, 'LNE', 'Legals - Not economical'),
(20, 'LDM', 'Legals - Defended Matter'),
(21, 'LSOCUS', 'Legals - SOC unserved'),
(22, 'LJNE', 'Legasls - Judgment not enforced'),
(23, 'FR', 'Full Recovery'),
(24, 'COBPBSPO', 'Court order being pursued by State Penalties Office'),
(25, 'NRFH', 'No Recovery - Financial Hardship')
;

-- --------------------------------------------------------
--
-- Dumping data for table config
--

INSERT INTO config (configKey, configValue) VALUES
('company.name', 'TBD'),
('fee.gst', '10'),
('fee.cc', '20'),
('fee.billingPhotocopy', '0.20'),
('fee.billingFax', '0.50'),
('fee.billingPhoneCall', '0.50'),
('company.address.street1', 'TBD'),
('company.address.street2', 'TBD'),
('company.address.suburb', 'TBD'),
('company.address.state', 'TBD'),
('company.address.postcode', 'TBD'),
('financial.disbursement','25,26,27,28,29,35'),
('financial.discount','12,24'),
('financial.fee','21'),
('financial.journal','14,15'),
('financial.receipt','1,2,3,4,5,6,7,8,13,14,15,16,17,22,38'),
('financial.refund','32'),
('financial.repayment','1,2,3,4,5,6,7,8,13,15,16'),
('financial.reversal','10,31,32,39'),
('financial.reversible','9,21,22,36'),
('financial.trustBalance','1,2,3,4,5,6,7,8,9,10,14,15,16,17,21,22,30,31,32,33,36,37,38,39'),
('financial.writeoff','11,23'),
('links.host','https://lana.elixirlegal.com'),
('links.publicHolidays','https://data.gov.au/data/api/3/action/datastore_search?resource_id=31eec35e-1de6-4f04-9703-9be1d43d405b&limit=200')
;


-- --------------------------------------------------------
--
-- Dumping data for table contacttypes
--


-- --------------------------------------------------------
--
-- Dumping data for table debttypes
--

INSERT INTO debttypes (typeId, typeName, typeInsuredDetails, typeTPP, typeTPO, typeTPI, POLICE_REPORT, pol) VALUES
(1, 'Insurance', 1, 1, 1, 1, 'Y', 'Y'),
(2, 'Commercial', 0, 0, 0, 0, 'N', 'Y'),
(3, 'Assessing', 1, 0, 0, 0, 'N', 'N')
;

-- --------------------------------------------------------
--
-- Dumping data for table gst_type
--

INSERT INTO gst_type (gst_type_id, name, description, gst) VALUES
(1, 'GST', 'GST Included in Service', 10.0),
(2, 'FRE', 'GST Free', 0.0)
;

-- --------------------------------------------------------
--
-- Dumping data for table legal_type
--

INSERT INTO legal_type (LEGAL_TYPE_ID, NAME) VALUES
(1, 'Company'),
(2, 'Partnership'),
(3, 'Individual')
;

-- --------------------------------------------------------
--
-- Dumping data for table file_type
--
INSERT INTO file_type (file_type_id, name, background_color) VALUES
  (1, 'Legal', 'rgba(44, 143, 52, 0.89)'),
  (2, 'Business Interruption', 'rgba(143, 52, 44, 0.89)'),
  (3, 'Accounting', 'rgba(59, 143, 44, 0.89)'),
  (4, 'Insurance Broker Group', 'rgba(44, 143, 52, 0.89)')
;

-- --------------------------------------------------------
--
-- Dumping data for table question_type
--
INSERT INTO question_type (question_type_id, question_type_name) VALUES (1, 'Checkbox');
INSERT INTO question_type (question_type_id, question_type_name) VALUES (2, 'Radio');
INSERT INTO question_type (question_type_id, question_type_name) VALUES (3, 'Text');
INSERT INTO question_type (question_type_id, question_type_name) VALUES (4, 'Textarea');
INSERT INTO question_type (question_type_id, question_type_name) VALUES (5, 'Date');
INSERT INTO question_type (question_type_id, question_type_name) VALUES (6, 'Dropdown');
INSERT INTO question_type (question_type_id, question_type_name) VALUES (7, 'Title');

-- --------------------------------------------------------
--
-- Dumping data for table securitygroups
--

INSERT INTO securitygroups (groupId, groupName, file_type_id) VALUES
(1, 'Administrator', null),
(2, 'External User', null),
(3, 'Director', null),
(4, 'Operations Manager', null),
(5, 'Operations Team Leader', null),
(6, 'Operations Team', null),
(7, 'Admin Manager', null),
(8, 'Admin Team', null),
(9, 'Client Authorised', null),
(10, 'Client', null),
(11, 'Agent', null),
(12, 'Supplier', null),
(13, 'system', null),
(14, 'Legal', 1),
(15, 'Business Interruption', 2),
(16, 'Accounting', 3),
(17, 'Insurance Broker Group', 4)
;

-- --------------------------------------------------------
--
-- Dumping data for table USER_TYPE
--

INSERT INTO user_type (USER_TYPE_ID, USER_TYPE_NAME) VALUES
(1, 'Staff'),
(2, 'Client'),
(3, 'Agent'),
(4, 'Supplier'),
(5, 'System'),
(6, 'Staff Client'),
(7, 'Insured')
;

-- --------------------------------------------------------
--
-- Dumping data for table users
--

INSERT INTO users
  (userLogin, userPassword, userName, userEmail, userPhone, userSecurityGroupId, userType, userPasswordExpireDate)
VALUES
  ('admin',  NULL, 'Ad Min',     'admin@totemsoft.com.au', NULL,  1, 1, NULL),
  ('system', NULL, 'System User', NULL,                    NULL, 13, 5, NULL)
;

-- --------------------------------------------------------
--
-- Dumping data for table LOSS_TYPE
--
INSERT INTO loss_type (LOSS_TYPE_ID, DESCRIPTION, CREATED_BY) VALUES
  (1, 'Motor Vehicle', 1),
  (2, 'Property', 1),
  (3, 'Major Loss', 1),
  (4, 'Heavy Machinery', 1),
  (5, 'Liability', 1),
  (6, 'Legal Insurserv', 1),
  (7, 'Marine', 1),
  (8, 'Commercial', 1),
  (9, 'Business Interruption', 1)
;

-- --------------------------------------------------------
--
-- Dumping data for table file_type_mapping
--
INSERT INTO file_type_mapping (file_type_id, debt_type_id, loss_type_id, loss_desc_id) VALUES
  (2, 3, 9, null),
  (4, 1, 1, null),
  (4, 1, 2, null)
;

-- --------------------------------------------------------
--
-- Dumping data for table pol_documents
--

INSERT INTO pol_documents (poldocId, poldocName, poldocSign) VALUES
(1, 'Invoice', '+'),
(2, 'Quote', '+'),
(3, 'Assessors Report', '+'),
(4, 'Tow Invoice', '+'),
(5, 'Supp Invoice', '+'),
(6, 'Supp Quote', '+'),
(7, 'PAV', '+'),
(8, 'Salvage', '-'),
(9, 'Shipping', '+'),
(10, 'Legal costs', '+'),
(11, 'Demurrage', '-');

-- --------------------------------------------------------
--
-- Dumping data for table pol_types
--

INSERT INTO pol_types (poltId, poltName, poltActive) VALUES
(1, 'Repairs Only', 1),
(2, 'Repairs Only + Total Loss', 1),
(3, 'Total Loss', 1),
(4, 'Property', 1),
(5, 'Demurrage', 1),
(6, 'Commercial', 1);

-- --------------------------------------------------------
--
-- Dumping data for table pol_type_docs
--

INSERT INTO pol_type_docs (poltId, poldocId) VALUES
(1, 1),
(2, 1),
(4, 1),
(5, 1),
(6, 1),
(1, 2),
(2, 2),
(4, 2),
(5, 2),
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(1, 4),
(2, 4),
(3, 4),
(2, 7),
(3, 7),
(2, 8),
(3, 8),
(5, 9),
(6, 9),
(1, 10),
(2, 10),
(3, 10),
(4, 10),
(5, 10),
(6, 10);

-- --------------------------------------------------------
--
-- Dumping data for table REC_STATUS
--

INSERT INTO rec_status (REC_STATUS_ID, REC_STATUS_NAME) VALUES
(1, 'New File'),
(2, 'Searching'),
(3, 'Instalment'),
(4, 'Legal action commenced'),
(5, 'Positive negotiations'),
(6, 'Denying liability'),
(7, 'Awaiting Payment'),
(8, 'Determining liability'),
(10, 'Appointed experts to determine liability'),
(11, 'Insured At Fault'),
(12, 'Poor recovery prospects');

-- --------------------------------------------------------
--
-- Dumping data for table country
--
INSERT INTO country (country_id, country_name) VALUES ('AU', 'Australia');
INSERT INTO country (country_id, country_name) VALUES ('NZ', 'New Zealand');
INSERT INTO country (country_id, country_name) VALUES ('US', 'United States of America');

-- --------------------------------------------------------
--
-- Dumping data for table state
--
INSERT INTO state (STATE_ID, STATE, STATUTE_BARRED_MONTHS) VALUES (1, '-', 36);
INSERT INTO state (STATE_ID, STATE, COUNTRY, STATUTE_BARRED_MONTHS) VALUES (2, 'ACT', 'AU', 70);
INSERT INTO state (STATE_ID, STATE, COUNTRY, STATUTE_BARRED_MONTHS) VALUES (3, 'NSW', 'AU', 70);
INSERT INTO state (STATE_ID, STATE, COUNTRY, STATUTE_BARRED_MONTHS) VALUES (4, 'NT', 'AU', 36);
INSERT INTO state (STATE_ID, STATE, COUNTRY, STATUTE_BARRED_MONTHS) VALUES (5, 'QLD', 'AU', 70);
INSERT INTO state (STATE_ID, STATE, COUNTRY, STATUTE_BARRED_MONTHS) VALUES (6, 'SA', 'AU', 70);
INSERT INTO state (STATE_ID, STATE, COUNTRY, STATUTE_BARRED_MONTHS) VALUES (7, 'TAS', 'AU', 70);
INSERT INTO state (STATE_ID, STATE, COUNTRY, STATUTE_BARRED_MONTHS) VALUES (8, 'VIC', 'AU', 70);
INSERT INTO state (STATE_ID, STATE, COUNTRY, STATUTE_BARRED_MONTHS) VALUES (9, 'WA', 'AU', 70);
INSERT INTO state (STATE_ID, STATE, COUNTRY, STATUTE_BARRED_MONTHS) VALUES (10, 'NZ', 'NZ', 70);

-- --------------------------------------------------------
--
-- Dumping data for table supplier_service
--

INSERT INTO supplier_service (supplier_service_id, name, myob_inventory_type, myob_account_number, gst_type_id) VALUES (1, 'Process server fees', '3', 51300, 1);
INSERT INTO supplier_service (supplier_service_id, name, myob_inventory_type, myob_account_number, gst_type_id) VALUES (2, 'Court filing fees', '2', 51200, 2);
INSERT INTO supplier_service (supplier_service_id, name, myob_inventory_type, myob_account_number, gst_type_id) VALUES (3, 'Court appearance fees', '5', 51500, 1);
INSERT INTO supplier_service (supplier_service_id, name, myob_inventory_type, myob_account_number, gst_type_id) VALUES (4, 'Agent field call', '5', 51500, 1);
INSERT INTO supplier_service (supplier_service_id, name, myob_inventory_type, myob_account_number, gst_type_id) VALUES (5, 'Conduct money', '5', 51500, 1);

-- --------------------------------------------------------
--
-- Dumping data for table suppliertypes
--

INSERT INTO suppliertypes (suptId, suptName) VALUES
(1, 'Agent'),
(2, 'Solicitor'),
(3, 'Other'),
(4, 'Process Server')
;

-- --------------------------------------------------------
--
-- Dumping data for table templates
--

INSERT INTO templates (tempType, tempName, tempBody, tempContentType, internal) VALUES
(13, 'File Report', 'File Report (rev676)', NULL, 'N'),
(14, 'Invoice', 'Invoice (rev584)', NULL, 'Y'),
(15, 'Invoice Summary', 'Invoice Summary (rev584)', NULL, 'Y'),
(16, 'Cheque', 'Cheque (rev589)', NULL, 'Y')
;


INSERT INTO templates (tempType, tempName, tempBody, tempContentType, internal) VALUES
(11, 'OpenFileSummary', 'OpenFileSummary (default)', 'text/xml', 'N'),
(11, 'RecoveredFundsTriangulation', 'RecoveredFundsTriangulation (default)', 'text/xml', 'N'),
(11, 'BankErrors', 'BankErrors (default)', NULL, 'Y'),
(11, 'FileDishonouredCheques', 'FileDishonouredCheques (default)', NULL, 'Y'),
(11, 'FileDishonouredChequesSummary', 'FileDishonouredChequesSummary (default)', 'text/xml', 'Y'),
(11, 'FileTrustBalance', 'FileTrustBalance (default)', 'text/xml', 'Y'),
(11, 'FileTrustCheques', 'FileTrustCheques (default)', 'text/xml', 'Y'),
(11, 'FileTrustChequesSummary', 'FileTrustChequesSummary (default)', 'text/xml', 'Y'),
(11, 'FileTrustJournals', 'FileTrustJournals (default)', 'text/xml', 'Y'),
(11, 'FileTrustReceipts', 'FileTrustReceipts (default)', 'text/xml', 'Y'),
(11, 'TrustLedger', 'TrustLedger (default)', 'text/xml', 'Y'),
(11, 'TrustReceiptsDetail', 'TrustReceiptsDetail (default)', NULL, 'N'),
(11, 'TrustReceiptsSummary', 'TrustReceiptsSummary (default)', 'text/xml', 'Y'),
(11, 'TrustReceiptsSummaryClosedFiles', 'TrustReceiptsSummaryClosedFiles (default)', 'text/xml', 'Y'),
(11, 'StaffPerformance', 'StaffPerformance (default)', NULL, 'Y'),
(11, 'StaffPerformanceDetail', 'StaffPerformanceDetail (default)', NULL, 'Y'),
(11, 'OpenFileStatistics', 'OpenFileStatistics (default)', NULL, 'N'),
(11, 'ClosedFileStatistics', 'ClosedFileStatistics (default)', NULL, 'N'),
(11, 'ClosedFile', 'ClosedFile (default)', NULL, 'Y'),
(11, 'ClosedFileSummary', 'ClosedFileSummary (default)', NULL, 'N'),
(11, 'FileReceived', 'FileReceived (default)', NULL, 'N'),
(11, 'ActionCodeList', 'ActionCodeList (default)', NULL, 'Y'),
(11, 'SolicitorInvoiceCoverSheet', 'SolicitorInvoiceCoverSheet (default)', 'application/xml', 'N'),
(11, 'ClosedFilePerformance', 'ClosedFilePerformance (default)', NULL, 'N'),
(11, 'ClientTrustReceiptsSummary', 'ClientTrustReceiptsSummary (default)', NULL, 'N'),
(11, 'ClientFileReceived', 'ClientFileReceived (default)', NULL, 'N'),
(11, 'ClientClosedFile', 'ClientClosedFile (default)', NULL, 'N'),
(11, 'ClientFileSummary', 'ClientFileSummary (default)', NULL, 'N'),
(11, 'StaffPerformanceWIP', 'StaffPerformanceWIP (default)', 'text/xml', 'Y'),
(11, 'WorkgroupPerformanceWIP', 'WorkgroupPerformanceWIP (default)', 'text/xml', 'Y'),
(11, 'WorkgroupPerformance', 'WorkgroupPerformance (default)', 'text/xml', 'Y'),
(11, 'WorkgroupPerformanceDetail', 'WorkgroupPerformanceDetail (default)', 'text/xml', 'Y'),
(11, 'ClientExecutiveSummary', 'ClientExecutiveSummary (default)', 'text/xml', 'Y'),
(11, 'FileReceivedByLossType', 'FileReceivedByLossType (default)', NULL, 'Y'),
(11, 'FileClosedByLossType', 'FileClosedByLossType (default)', NULL, 'Y'),
(11, 'ClientActionSummary', 'How many actions have been done on files at a given point in time', NULL, 'Y'),
(11, 'FileTrustChequesEFT', 'File Trust EFT Cheques', 'text/xml', 'Y'),
(11, 'StaffPerformanceFeedback', 'Staff Quality Report', NULL, 'Y'),
(11, 'StaffPerformanceFeedbackDetail', 'Staff Quality Details Report', NULL, 'Y'),
(11, 'UserAudit', 'User Audit (Login/Logout)', NULL, 'Y')
;

-- --------------------------------------------------------
--
-- Dumping data for table transaction_type
--

INSERT INTO transaction_type (TRANSACTION_TYPE_ID, FACTOR, CODE, DESCRIPTION) VALUES
( 1, +1, 'RCA',  'Receipt Cash'),
( 2, +1, 'RCH',  'Receipt Cheque'),
( 3, +1, 'RDD',  'Receipt Direct Debit'),
( 4, +1, 'RCC',  'Receipt Credit Card'),
( 5, +1, 'RBP',  'Receipt BPay'),
( 6, -1, 'RREV', 'Receipt Reversed'),
( 7, +1, 'RINC', 'Receipt Increase'),
( 8, +1, 'RDEC', 'Receipt Decrease'),
( 9, -1, 'CHQ',  'Cheque'),
(10, +1, 'CHQR', 'Cheque Reversal'),
(11, +1, 'WO',   'Write Off'),
(12, +1, 'DISC', 'Discount allowed on file'),
(13, +1, 'D2C',  'Direct to Client Receipt - funds remitted by debtor to client'),
(14, -1, 'JNLF', 'Journal deducting money from Debtor'),
(15, +1, 'JNLT', 'Journal adding money to Debtor'),
(16, -1, 'DISH', 'Dishonoured Cheque'),
(17, +1, 'OB',   'Opening Balance'),
(18, +1, 'OBR',  'Opening Balance Unpresented Receipt'),
(19, -1, 'OBC',  'Opening Balance Unpresented Cheque'),
(20, +1, 'INV', 'Invoice transaction'),
(21, -1, 'CHQ_FEE', 'Cheque for Fees'),
(22, -1, 'CHQ_REF', 'Cheque Refund'),
(23, -1, 'WOR', 'Write Off Reversal'),
(24, -1, 'DISCR', 'Discount Reversal'),
(25, -1, 'DISB_CHEQUE_REQUEST', 'Non System Cheques'),
(26, -1, 'DISB_SUPPLIER_FEE', 'Supplier Fees'),
(27, -1, 'DISB_PHOTOCOPY', 'Photocopying'),
(28, -1, 'DISB_FAX', 'Faxes'),
(29, -1, 'DISB_PHONE_CALL', 'Phone Calls'),
(30, +1, 'RFR', 'Receipt File Refund'),
(31, +1, 'CHQ_FEE_REV', 'Cheque for fees Reversal'),
(32, +1, 'CHQ_REF_REV', 'Cheque refund Reversal'),
(33, +1, 'RFRC', 'Receipt File Refund Cheque'),
(34, +1, 'DISC_ACTION', 'Discount allowed on actions'),
(35, +1, 'DISC_TRANSACTION', 'Discount allowed on transactions'),
(36, -1, 'CHQ_EFT', 'Cheque EFT remittance'),
(37, -1, 'CHQ_EFT_OVER', 'Cheque EFT Over remittance'),
(38, -1, 'CHQ_EFT_REF', 'Cheque Refund EFT'),
(39, +1, 'CHQ_EFT_REV', 'Cheque EFT Reversal')
;

-- --------------------------------------------------------
--
-- Dumping data for table wodata_action
--

INSERT INTO wodata_action (ACTION_CODE, ACTION_NOTATION, WO_TYPE) VALUES
('ABANDONED', 'Recovery Abandoned (see narrative for detailed explanation)', 'WO'),
('DETERMINED', 'Determined Client vs Client recovery', 'WO'),
('EXHAUSTED', 'Exhausted location search avenues', 'WO'),
('CIRCUMSTANCES', 'Third party financial circumstances do not warrant further action', 'WO'),
('BANKRUPT', 'Third party bankrupt', 'WO'),
('XCELERATE', 'Client has instructed Xcelerate to abandon recovery', 'WO'),
('LIABILITY', 'Insured considered to bear majority of liability for accident', 'WO'),
('DETERMINED', 'Determined Client vs Client recovery', 'DISC');

-- --------------------------------------------------------
--
-- Dumping data for table workgroups
--

INSERT INTO workgroups (wgroupId, wgroupName, ACTIVE) VALUES
(1, 'File Loading', 'Y'),
(2, 'Call Centre', 'Y'),
(3, 'Settlement Centre', 'Y'),
(4, 'Legal Team', 'Y'),
(5, 'system', 'N'),
(6, 'Agent', 'Y'),
(7, 'Client', 'Y'),
(8, 'Proof of Loss', 'Y'),
(9, 'Supplier', 'Y'),
(10, 'Property', 'Y'),
(11, 'Major Loss', 'Y'),
(12, 'Instalments', 'Y'),
(13, 'Search', 'Y'),
(14, 'InsRev', 'Y'),
(15, 'Call Centre 2', 'Y'),
(16, 'Call Centre 3', 'Y'),
(17, 'Rental Default', 'Y'),
(18, 'Denial', 'Y')
;

--
-- system_function
--
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION, QUERY) VALUES
(1, '/', '/main', 'Main screen access', NULL),
(2, '/', '/windowsStatus', 'Windows Status', NULL),
(3, '/', '/searchFile', 'Search File', NULL),
(4, '/', '/editContact', 'Edit Contact', NULL),
(5, '/', '/editBilling', 'Edit Billing', NULL),
(6, '/', '/getContacts', 'Get Contacts', NULL),
(7, '/', '/filter', 'Filter data (ajax request)', NULL),
(8, '/', '/main', 'Get File Documents', 'parameter=getFileDocuments')
(9, '/', '/main', 'File/Entity Services', 'parameter=getActionCodeService')
(101, '/', '/mytodo', 'My ToDo', 'parameter=searchMyToDo')
(102, '/', '/toDoToday', 'ToDo Today', NULL),
(103, '/', '/exportMyToDo2Csv', 'Export My ToDo to Csv', NULL),
(104, '/', '/mytodo', 'My ToDo - Search Bulk Action', 'parameter=searchBulkAction')
(105, '/', '/mytodo', 'My ToDo - Complete Bulk Action', 'parameter=completeBulkAction')
(201, '/', '/listClients', 'List all Clients', NULL),
(202, '/', '/editClient', 'Edit Client', NULL),
(301, '/', '/listFiles', 'List all Files', NULL),
(302, '/', '/viewFile', 'View File', NULL),
(303, '/', '/listAgentFiles', 'List Agent Files', NULL),
(304, '/', '/listSupplierFiles', 'List Supplier Files', NULL),
(305, '/', '/editFile', 'Edit File', NULL),
(306, '/', '/editFileInfo', 'Edit File Info', NULL),
(307, '/', '/editThirdParties', 'Edit Third Parties', NULL),
(308, '/', '/editPolice', 'Edit Police', NULL),
(309, '/', '/editFileSimple', 'Edit File Simple', NULL),
(310, '/', '/editPoliceSimple', 'Edit Police Simple', NULL),
(311, '/', '/editFileStatus', 'Edit File Status', NULL),
(312, '/', '/editThirdPartiesSimple', 'Edit Third Parties Simple', NULL),
(313, '/', '/editMatterDetails', 'Edit Incident Details Simple', NULL),
(314, '/', '/editInsuredDetails', 'Edit Insured Details', NULL),
(315, '/', '/editClientDetails', 'Edit Client Details (for File)', NULL),
(316, '/', '/editUserDetailsSimple', 'Edit User Details Simple', NULL),
(317, '/', '/completeAction', 'Complete Action', NULL),
(318, '/', '/editAction', 'Edit Action', NULL),
(319, '/', '/editWriteOffRequest', 'Edit Write-Off Request', NULL),
(320, '/', '/editDiscountRequest', 'Edit Discount Request', NULL),
(321, '/', '/editCloseFile', 'Edit Close File', NULL),
(322, '/', '/editFileNote', 'Edit File Note', NULL),
(323, '/', '/editFileSuppliers', 'Edit File Suppliers', NULL),
(324, '/', '/editFileSupplier', 'Edit File Supplier', NULL),
(325, '/', '/editMessage', 'Edit Message', NULL),
(326, '/', '/editMailIn', 'Edit MailIn', NULL),
(327, '/', '/completeMessage', 'Complete Message', NULL),
(328, '/', '/quickAction', 'Quick Action', NULL),
(329, '/', '/printLetter', 'Print Letter', NULL),
(330, '/', '/editLetter', 'Edit Letter', NULL),
(331, '/', '/listLetters', 'List Letters', NULL),
(332, '/', '/listRepayments', 'ListRepayments', NULL),
(333, '/', '/editRepayment', 'EditRepayment', NULL),
(334, '/', '/viewRepaymentPerformance', 'ViewRepaymentPerformance', NULL),
(335, '/', '/printBankDeposit', 'PrintBankDeposit', NULL),
(337, '/', '/printLetters', 'Print Bulk Letters', NULL),
(338, '/', '/completeAction', 'Complete Action (Authorise Write Off Request)', 'parameter=authorise&type=9')
(339, '/', '/completeAction', 'Complete Action (Authorise Discount Request)', 'parameter=authorise&type=10')
(340, '/', '/completeAction', 'Complete Action (Authorise File Close Request)', 'parameter=authorise&type=12')
(341, '/', '/reopenFile', 'Reopen File', NULL),
(342, '/', '/renameFile', 'Rename File', NULL),
(343, '/', '/download', 'Download Action Document', 'parameter=actionDocument')
(344, '/', '/multiAction', 'Multiple Actions Entry', NULL),
(345, '/', '/download', 'Download File Document', 'parameter=fileDocument')
(346, '/', '/editActionCompleted', 'Edit Completed Action', NULL),
(347, '/', '/viewMultiFile', 'View Multi File', NULL),
(348, '/', '/editFileContact', 'Edit File Contact', NULL),
(349, '/', '/businessReview', 'Business Review', NULL),
(350, '/', '/infoRequired', 'Information Required', NULL),
(351, '/', '/fileProperties', 'File Properties', NULL),
(352, '/', '/findActionTree', 'Find Action (Tree)', NULL),
(353, '/', '/findActionCompletedTree', 'Find Completed Action (Tree)', NULL),
(354, '/', '/findAction', 'Find Action', NULL),
(355, '/', '/findActionCompleted', 'Find Completed Action', NULL),
(356, '/', '/documentStructure', 'Create Document Structure', NULL),
(357, '/', '/removeAction', 'Remove Action', NULL),
(358, '/', '/main', 'Edit File/Entity Services', 'parameter=editActionCodeService')
(359, '/', '/survey', 'Survey', NULL),
(360, '/', '/editMultiFile', 'Edit Multi File', NULL),
(361, '/', '/homepage', 'Homepage', NULL),
(401, '/', '/listPOL', 'List all POL', NULL),
(402, '/', '/editFilePOL', 'EditFilePOL', NULL),
(403, '/', '/editFilePOLComplete', 'EditFilePOLComplete', NULL),
(501, '/', '/listReports', 'List all Reports', NULL),
(502, '/', '/generateReport', 'GenerateReport', NULL),
(503, '/', '/printReport', 'PrintReport', NULL),
(504, '/', '/exportReport', 'ExportReport', NULL),
(505, '/', '/printFileReport', 'PrintFileReport', NULL),
(506, '/', '/reportCompHealth', 'ReportCompHealth', NULL),
(507, '/', '/exportInvoices', 'ExportInvoices', NULL),
(508, '/', '/editReportCriteria', 'Edit Report Criteria', NULL),
(509, '/', '/viewClientHierarchy', 'View Client Hierarchy', NULL),
(510, '/', '/editClientHierarchy', 'Edit Client Hierarchy', NULL),
(601, '/', '/listMessages', 'List all Messages', NULL),
(701, '/', '/listSuppliers', 'List all Suppliers', NULL),
(702, '/', '/editSupplier', 'EditSupplier', NULL),
(703, '/', '/listSupplierInvoices', 'ListSupplierInvoices', NULL),
(704, '/', '/editSupplierInvoice', 'EditSupplierInvoice', NULL),
(705, '/', '/addSupplierInvoice', 'AddSupplierInvoice', NULL),
(706, '/', '/getSupplierFiles', 'GetSupplierFiles', NULL),
(707, '/', '/authoriseInvoice', 'AuthoriseInvoice', NULL),
(708, '/', '/viewSupplierInvoice', 'ViewSupplierInvoice', NULL),
(709, '/', '/exportSupplierInvoices', 'ExportSupplierInvoices', NULL),
(710, '/', '/sendSupplierInvoices', 'SendSupplierInvoices', NULL),
(801, '/', '/financials', 'Financials', NULL),
(802, '/', '/editReceipt', 'EditReceipt', NULL),
(803, '/', '/listReceipts', 'ListReceipts', NULL),
(804, '/', '/editCheque', 'EditCheque', NULL),
(805, '/', '/printReceipts', 'PrintReceipts', NULL),
(806, '/', '/printCheques', 'PrintCheques', NULL),
(807, '/', '/listCheques', 'ListCheques', NULL),
(808, '/', '/cancelCheque', 'CancelCheque', NULL),
(809, '/', '/listJournals', 'ListJournals', NULL),
(810, '/', '/editJournal', 'EditJournal', NULL),
(811, '/', '/bankDeposit', 'BankDeposit', NULL),
(812, '/', '/bankReconciliation', 'BankReconciliation', NULL),
(813, '/', '/printBankRec', 'PrintBankRec', NULL),
(814, '/', '/editBankError', 'EditBankError', NULL),
(815, '/', '/editChequeRev', 'EditChequeRev', NULL),
(816, '/', '/getCheque', 'GetCheque', NULL),
(817, '/', '/listInvoices', 'ListInvoices', NULL),
(818, '/', '/listFlatFeeFiles', 'ListFlatFeeFiles', NULL),
(819, '/', '/listCommissionBasedFiles', 'ListCommissionBasedFiles', NULL),
(820, '/', '/listActionsBillable', 'ListActionsBillable', NULL),
(821, '/', '/editTransactionRev', 'Edit Transaction - Reverse', NULL),
(822, '/', '/listActionsBillable', 'Create Action Invoice', 'parameter=createInvoices')
(823, '/', '/listInvoices', 'Delete Invoice', 'parameter=removeInvoice')
(824, '/', '/listDisbursements', 'List Disbursements', NULL),
(825, '/', '/editDisbursement', 'Edit Disbursement', NULL),
(826, '/', '/listFileInvoice', 'List File Invoices', NULL),
(827, '/', '/editFileInvoice', 'Edit File Invoice', NULL),
(828, '/', '/mailin', 'Mail In Manager', NULL),
(900, '/setup', '/', 'Setup (All)', NULL),
(901, '/setup', '/setup', 'Setup', NULL),
(902, '/setup', '/listPOLTypes', 'ListPOLTypes', NULL),
(903, '/setup', '/editPOLType', 'EditPOLType', NULL),
(904, '/setup', '/listActionCodes', 'ListActionCodes', NULL),
(905, '/setup', '/editActionCode', 'EditActionCode', NULL),
(906, '/setup', '/listActionsFlow', 'ListActionsFlow', NULL),
(907, '/setup', '/editActionsFlow', 'EditActionsFlow', NULL),
(908, '/setup', '/listActionOutcomes', 'ListActionOutcomes', NULL),
(909, '/setup', '/editActionOutcome', 'EditActionOutcome', NULL),
(910, '/setup', '/listWorkGroups', 'ListWorkGroups', NULL),
(911, '/setup', '/editWorkGroup', 'EditWorkGroup', NULL),
(912, '/setup', '/listSecurityGroups', 'ListSecurityGroups', NULL),
(913, '/setup', '/editSecurityGroup', 'EditSecurityGroup', NULL),
(914, '/setup', '/listWriteOffLimit', 'ListWriteOffLimit', NULL),
(915, '/setup', '/editWriteOffLimit', 'EditWriteOffLimit', NULL),
(916, '/setup', '/listTPI', 'ListTPI', NULL),
(917, '/setup', '/editTPI', 'EditTPI', NULL),
(918, '/setup', '/listRecStatus', 'ListRecStatus', NULL),
(919, '/setup', '/editRecStatus', 'EditRecStatus', NULL),
(920, '/setup', '/listCloseCode', 'ListCloseCode', NULL),
(921, '/setup', '/editCloseCode', 'EditCloseCode', NULL),
(922, '/setup', '/listSupplierTypes', 'ListSupplierTypes', NULL),
(923, '/setup', '/editSupplierType', 'EditSupplierType', NULL),
(924, '/setup', '/listBanks', 'ListBanks', NULL),
(925, '/setup', '/editBank', 'EditBank', NULL),
(926, '/', '/listBankDeposits', 'ListBankDeposits', NULL),
(927, '/', '/viewBankDeposit', 'ViewBankDeposit', NULL),
(928, '/setup', '/listTask', 'ListTask', NULL),
(929, '/setup', '/listTemplates', 'ListTemplates', NULL),
(930, '/setup', '/editTemplate', 'Edit Template', NULL),
(931, '/setup', '/listSupplierServices', 'List Supplier Services', NULL),
(932, '/setup', '/editSupplierService', 'Edit Supplier Service', NULL),
(933, '/setup', '/fileType', 'Edit File Type', NULL),
(934, '/setup', '/actionCodeService', 'Find/Edit Action Code Services', NULL),
(1001, '/', '/listUsers', 'List all Users', NULL),
(1002, '/', '/editUser', 'EditUser', NULL),
(1003, '/', '/editMyInfo', 'EditMyInfo', NULL),
(1004, '/', '/changePassword', 'ChangePassword', NULL),
(1005, '/', '/resetPassword', 'ResetPassword', NULL),
(1101, '/', '/uploadActions', 'UploadActions', NULL),
(1102, '/', '/uploadFiles', 'UploadFiles', NULL),
(1103, '/', '/uploadFilesSave', 'UploadFilesSave', NULL),
(1104, '/', '/uploadFilesValidate', 'UploadFilesValidate', NULL),
(1105, '/', '/uploadUsers', 'UploadUsers', NULL),
(1106, '/', '/uploadSupplierInvoices', 'UploadSupplierInvoices', NULL),
(1107, '/', '/uploadSupplierInvoicesSave', 'UploadSupplierInvoicesSave', NULL),
(1108, '/', '/uploadBPay', 'UploadBPay', NULL),
(1109, '/', '/uploadBPaySave', 'UploadBPaySave', NULL),
(1110, '/', '/uploadDirectDebit', 'UploadDirectDebit', NULL),
(1111, '/', '/uploadDirectDebitSave', 'UploadDirectDebitSave', NULL),
(1200, '/', '/dashboard', 'Dashboard', NULL),
(1300, '/', '/news', 'Latest News', NULL),
(1301, '/', '/news', 'Latest News - add or edit', 'parameter=edit')
(1310, '/', '/links', 'Links', NULL),
(1311, '/', '/links', 'Links - add or edit', 'parameter=edit')
(10000, '/debtor', '/', 'Debtors (All)', NULL),
(10001, '/debtor', '/list', 'List all Debtors', NULL),
(10002, '/debtor', '/edit', 'Edit Debtor', NULL),
(10003, '/debtor', '/view', 'View Debtor', NULL),
(10011, '/debtor', '/upload', 'Upload Debtors', NULL),
(10012, '/debtor', '/uploadSave', 'Upload and Save Debtors', NULL),
(10021, '/debtor', '/listMatter', 'List Matter', NULL),
(10022, '/debtor', '/addMatter', 'Add Matter', NULL),
(10023, '/debtor', '/editMatter', 'Edit Matter', NULL),
(20000, '/timesheet', '/', 'Timesheet (All)', NULL),
(20001, '/timesheet', '/find', 'View Timesheet', NULL),
(20002, '/timesheet', '/list', 'List Timesheet', NULL)
;

--
-- system_access
--

--
-- Administrator=1
-- Setup
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (1, 900);

-- User Admin
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (1, 1001);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (1, 1002);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (1, 1003);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (1, 1004);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (1, 1005);

-- timesheet
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (1, 20000);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (1, 20001);

--
-- Director=3
--
-- Home
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 1);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 2);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 3);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 4);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 5);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 6);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 7);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 8);

-- My todo
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 101);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 102);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 103);

INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 201);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 202);

INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 301);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 302);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 303);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 304);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 305);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 306);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 307);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 308);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 310);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 311);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 312);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 313);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 314);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 315);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 316);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 317);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 318);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 319);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 320);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 321);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 322);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 323);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 324);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 325);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 326);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 327);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 328);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 329);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 330);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 331);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 332);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 333);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 334);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 335);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 336);

-- INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 309);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 341);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 342);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 343);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 344);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 345);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 346);

INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 401);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 402);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 403);

INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 501);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 502);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 503);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 504);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 505);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 506);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 507);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 508);

INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 601);

INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 701);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 702);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 703);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 704);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 705);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 706);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 707);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 708);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 709);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 710);

INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 801);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 802);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 803);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 804);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 805);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 806);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 807);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 808);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 809);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 810);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 811);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 812);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 813);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 814);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 815);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 816);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 817);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 818);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 819);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 820);

INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 1003);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 1004);

INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 1101);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 1102);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 1103);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 1104);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 1105);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 1106);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 1107);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 1108);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 1109);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 1110);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 1111);

-- debtor
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 10000);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 10001);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 10002);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 10003);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 10011);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 10012);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 10021);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 10022);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 10023);

-- timesheet
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 20000);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (3, 20001);


--
-- Operations Team=6
--
-- Home
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 1);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 2);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 3);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 4);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 5);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 6);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 7);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 8);

-- My todo
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 101);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 102);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 103);

INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 201);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 202);

INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 301);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 302);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 303);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 304);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 305);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 306);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 307);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 308);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 310);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 311);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 312);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 313);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 314);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 315);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 316);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 317);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 318);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 319);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 320);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 321);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 322);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 323);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 324);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 325);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 326);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 327);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 328);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 329);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 330);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 331);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 332);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 333);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 334);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 335);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 336);

-- INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 309);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 341);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 342);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 343);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 344);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 345);

INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 401);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 402);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 403);

INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 501);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 502);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 503);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 504);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 505);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 506);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 507);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 508);

INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 601);

INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 701);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 702);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 703);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 704);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 705);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 706);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 707);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 708);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 709);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 710);

INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 801);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 802);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 803);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 804);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 805);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 806);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 807);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 808);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 809);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 810);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 811);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 812);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 813);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 814);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 815);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 816);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 817);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 818);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 819);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 820);

INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 1003);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 1004);

INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 1101);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 1102);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 1103);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 1104);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 1105);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 1106);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 1107);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 1108);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 1109);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 1110);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 1111);

-- debtor
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 10000);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 10001);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 10002);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 10003);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 10011);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 10012);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 10021);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 10022);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 10023);

-- timesheet
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 20000);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (6, 20001);


--
-- Client Authorised=9
--
-- Home
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (9, 1);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (9, 2);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (9, 3);
-- INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (9, 4);
-- INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (9, 5);
-- INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (9, 6);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (9, 7);

-- My todo
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (9, 101);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (9, 102);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (9, 103);

INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (9, 302);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (9, 321);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (9, 325);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (9, 326);

INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (9, 402);

INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (9, 505);

INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (9, 801);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (9, 802);

INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (9, 1003);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (9, 1004);


--
-- Client=10
--
-- Home
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (10, 1);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (10, 2);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (10, 3);
-- INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (10, 4);
-- INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (10, 5);
-- INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (10, 6);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (10, 7);

-- My todo
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (10, 101);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (10, 102);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (10, 103);

INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (10, 302);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (10, 321);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (10, 325);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (10, 326);

INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (10, 402);

INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (10, 505);

INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (10, 801);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (10, 802);

INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (10, 1003);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (10, 1004);


-- Debtor
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (10, 10000);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (10, 10001);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (10, 10002);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (10, 10003);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (10, 10011);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (10, 10012);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (10, 10021);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (10, 10022);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (10, 10023);


--
-- Agent=11
--
-- Home
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (11, 1);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (11, 2);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (11, 3);
-- INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (11, 4);
-- INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (11, 5);
-- INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (11, 6);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (11, 7);

-- My todo
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (11, 101);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (11, 102);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (11, 103);

INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (11, 302);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (11, 325);

INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (11, 505);

INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (11, 1003);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (11, 1004);


--
-- Supplier=12
--
-- Home
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (12, 1);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (12, 2);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (12, 3);
-- INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (12, 4);
-- INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (12, 5);
-- INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (12, 6);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (12, 7);

-- My todo
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (12, 101);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (12, 102);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (12, 103);

INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (12, 302);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (12, 325);

INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (12, 505);

INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (12, 1003);
INSERT INTO system_access (SECURITY_GROUP_ID, SYSTEM_FUNCTION_ID) VALUES (12, 1004);
