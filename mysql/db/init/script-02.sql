-- USE elixirdb;

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
('company.address.postcode', 'TBD');

-- update config set configValue = 'localhost' where configKey = 'mail.host';


-- --------------------------------------------------------
--
-- Dumping data for table contacttypes
--


-- --------------------------------------------------------
--
-- Dumping data for table debttypes
--

INSERT INTO debttypes (typeId, typeName, typeInsuredDetails, typeTPP, typeTPO, typeTPI, POLICE_REPORT) VALUES
(1, 'Insurance', 1, 1, 1, 1, 'N'),
(2, 'Commercial', 0, 0, 0, 0, 'N')
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
-- Dumping data for table securitygroups
--

INSERT INTO securitygroups (groupId, groupName) VALUES
(1, 'Administrator'),
(2, 'External User (One-off)'),
(3, 'Director'),
(4, 'Operations Manager'),
(5, 'Operations Team Leader'),
(6, 'Operations Team'),
(7, 'Admin Manager'),
(8, 'Admin Team'),
(9, 'Client Authorised'),
(10, 'Client'),
(11, 'Agent'),
(12, 'Supplier'),
(13, 'system')
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
(5, 'System');

-- --------------------------------------------------------
--
-- Dumping data for table users
--

INSERT INTO users
  (userLogin, userPassword, userName, userEmail, userPhone, userSecurityGroupId, userType, userPasswordExpireDate)
VALUES
  ('admin', 'Passw0rd', 'admin',      'admin@xir.com.au', NULL,  1, 1, NULL),
  ('system', NULL,      'System User', NULL,              NULL, 13, 5, NULL)
;

-- --------------------------------------------------------
--
-- Dumping data for table LOSS_TYPE
--
INSERT INTO loss_type (LOSS_TYPE_ID, DESCRIPTION, CREATED_BY) VALUES
  (1, 'Motor Vehicle', 1),
  (2, 'Property', 1);

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
(35, +1, 'DISC_TRANSACTION', 'Discount allowed on transactions')
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
DELETE FROM system_access; DELETE FROM system_function;
--
-- system_function
--
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(1, '/', '/main', 'Main screen access');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(2, '/', '/windowsStatus', 'Windows Status');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(3, '/', '/searchFile', 'Search File');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(4, '/', '/editContact', 'Edit Contact');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(5, '/', '/editBilling', 'Edit Billing');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(6, '/', '/getContacts', 'Get Contacts');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(7, '/', '/filter', 'Filter data (ajax request)');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, QUERY, DESCRIPTION) VALUES
(8, '/', '/main', 'parameter=getFileDocuments', 'Get File Documents');

INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, QUERY, DESCRIPTION) VALUES
(101, '/', '/mytodo', 'parameter=searchMyToDo', 'My ToDo');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(102, '/', '/toDoToday', 'ToDo Today');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(103, '/', '/exportMyToDo2Csv', 'Export My ToDo to Csv');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, QUERY, DESCRIPTION) VALUES
(104, '/', '/mytodo', 'parameter=searchBulkAction', 'My ToDo - Search Bulk Action');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, QUERY, DESCRIPTION) VALUES
(105, '/', '/mytodo', 'parameter=completeBulkAction', 'My ToDo - Complete Bulk Action');

INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(201, '/', '/listClients', 'List all Clients');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(202, '/', '/editClient', 'Edit Client');

INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(301, '/', '/listFiles', 'List all Files');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(302, '/', '/viewFile', 'View File');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(303, '/', '/listAgentFiles', 'List Agent Files');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(304, '/', '/listSupplierFiles', 'List Supplier Files');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(305, '/', '/editFile', 'Edit File');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(306, '/', '/editFileInfo', 'Edit File Info');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(307, '/', '/editThirdParties', 'Edit Third Parties');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(308, '/', '/editPolice', 'Edit Police');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(310, '/', '/editPoliceSimple', 'Edit Police Simple');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(311, '/', '/editFileStatus', 'Edit File Status');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(312, '/', '/editThirdPartiesSimple', 'Edit Third Parties Simple');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(313, '/', '/editIncidentDetailsSimple', 'Edit Incident Details Simple');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(314, '/', '/editInsuredDetails', 'Edit Insured Details');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(315, '/', '/editClientDetails', 'Edit Client Details (for File)');
-- UPDATE system_function SET NAME = '/editClientDetails', DESCRIPTION = 'Edit Client Details (for File)' WHERE NAME = '/editClientDetailsSimple';
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(316, '/', '/editUserDetailsSimple', 'Edit User Details Simple');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(317, '/', '/completeAction', 'Complete Action');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(318, '/', '/editAction', 'Edit Action');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(319, '/', '/editWriteOffRequest', 'Edit Write-Off Request');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(320, '/', '/editDiscountRequest', 'Edit Discount Request');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(321, '/', '/editCloseFile', 'Edit Close File');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(322, '/', '/editFileNote', 'Edit File Note');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(323, '/', '/editFileSuppliers', 'Edit File Suppliers');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(324, '/', '/editFileSupplier', 'Edit File Supplier');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(325, '/', '/editMessage', 'Edit Message');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(326, '/', '/editMailIn', 'Edit MailIn');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(327, '/', '/completeMessage', 'Complete Message');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(328, '/', '/quickAction', 'Quick Action');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(329, '/', '/printLetter', 'Print Letter');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(330, '/', '/printLetters', 'Print Letters (bulk)');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(331, '/', '/editLetter', 'Edit Letter');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(332, '/', '/listLetters', 'List Letters');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(333, '/', '/listRepayments', 'ListRepayments');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(334, '/', '/editRepayment', 'EditRepayment');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(335, '/', '/viewRepaymentPerformance', 'ViewRepaymentPerformance');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(336, '/', '/printBankDeposit', 'PrintBankDeposit');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(337, '/', '/printLetters', 'Print Bulk Letters');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, QUERY, DESCRIPTION) VALUES
(338, '/', '/completeAction', 'parameter=authorise&type=9', 'Complete Action (Authorise Write Off Request)');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, QUERY, DESCRIPTION) VALUES
(339, '/', '/completeAction', 'parameter=authorise&type=10', 'Complete Action (Authorise Discount Request)');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, QUERY, DESCRIPTION) VALUES
(340, '/', '/completeAction', 'parameter=authorise&type=12', 'Complete Action (Authorise File Close Request)');

-- INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
-- (309, '/', '/editFileSimple', 'Edit File Simple');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(341, '/', '/reopenFile', 'Reopen File');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(342, '/', '/renameFile', 'Rename File');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, QUERY, DESCRIPTION) VALUES
(343, '/', '/download', 'parameter=actionDocument', 'Download Action Document');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, QUERY, DESCRIPTION) VALUES
(344, '/', '/multiAction', NULL, 'Multiple Actions Entry');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, QUERY, DESCRIPTION) VALUES
(345, '/', '/download', 'parameter=fileDocument', 'Download File Document');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(346, '/', '/editActionCompleted', 'Edit Completed Action');

INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(401, '/', '/listPOL', 'List all POL');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(402, '/', '/editFilePOL', 'EditFilePOL');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(403, '/', '/editFilePOLComplete', 'EditFilePOLComplete');


INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(501, '/', '/listReports', 'List all Reports');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(502, '/', '/generateReport', 'GenerateReport');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(503, '/', '/printReport', 'PrintReport');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(504, '/', '/exportReport', 'ExportReport');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(505, '/', '/printFileReport', 'PrintFileReport');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(506, '/', '/reportCompHealth', 'ReportCompHealth');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(507, '/', '/exportInvoices', 'ExportInvoices');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(508, '/', '/editReportCriteria', 'Edit Report Criteria');


INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(601, '/', '/listMessages', 'List all Messages');

INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(701, '/', '/listSuppliers', 'List all Suppliers');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(702, '/', '/editSupplier', 'EditSupplier');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(703, '/', '/listSupplierInvoices', 'ListSupplierInvoices');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(704, '/', '/editSupplierInvoice', 'EditSupplierInvoice');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(705, '/', '/addSupplierInvoice', 'AddSupplierInvoice');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(706, '/', '/getSupplierFiles', 'GetSupplierFiles');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(707, '/', '/authoriseInvoice', 'AuthoriseInvoice');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(708, '/', '/viewSupplierInvoice', 'ViewSupplierInvoice');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(709, '/', '/exportSupplierInvoices', 'ExportSupplierInvoices');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(710, '/', '/sendSupplierInvoices', 'SendSupplierInvoices');


INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(801, '/', '/financials', 'Financials');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(802, '/', '/editReceipt', 'EditReceipt');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(803, '/', '/listReceipts', 'ListReceipts');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(804, '/', '/editCheque', 'EditCheque');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(805, '/', '/printReceipts', 'PrintReceipts');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(806, '/', '/printCheques', 'PrintCheques');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(807, '/', '/listCheques', 'ListCheques');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(808, '/', '/cancelCheque', 'CancelCheque');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(809, '/', '/listJournals', 'ListJournals');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(810, '/', '/editJournal', 'EditJournal');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(811, '/', '/bankDeposit', 'BankDeposit');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(812, '/', '/bankReconciliation', 'BankReconciliation');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(813, '/', '/printBankRec', 'PrintBankRec');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(814, '/', '/editBankError', 'EditBankError');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(815, '/', '/editChequeRev', 'EditChequeRev');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(816, '/', '/getCheque', 'GetCheque');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(817, '/', '/listInvoices', 'ListInvoices');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(818, '/', '/listFlatFeeFiles', 'ListFlatFeeFiles');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(819, '/', '/listCommissionBasedFiles', 'ListCommissionBasedFiles');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(820, '/', '/listActionsBillable', 'ListActionsBillable');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(821, '/', '/editTransactionRev', 'Edit Transaction - Reverse');

INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(824, '/', '/listDisbursements', 'List Disbursements');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(825, '/', '/editDisbursement', 'Edit Disbursement');


INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(900, '/setup', '/', 'Setup (All)');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(901, '/setup', '/setup', 'Setup');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(902, '/setup', '/listPOLTypes', 'ListPOLTypes');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(903, '/setup', '/editPOLType', 'EditPOLType');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(904, '/setup', '/listActionCodes', 'ListActionCodes');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(905, '/setup', '/editActionCode', 'EditActionCode');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(906, '/setup', '/listActionsFlow', 'ListActionsFlow');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(907, '/setup', '/editActionsFlow', 'EditActionsFlow');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(908, '/setup', '/listActionOutcomes', 'ListActionOutcomes');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(909, '/setup', '/editActionOutcome', 'EditActionOutcome');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(910, '/setup', '/listWorkGroups', 'ListWorkGroups');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(911, '/setup', '/editWorkGroup', 'EditWorkGroup');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(912, '/setup', '/listSecurityGroups', 'ListSecurityGroups');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(913, '/setup', '/editSecurityGroup', 'EditSecurityGroup');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(914, '/setup', '/listWriteOffLimit', 'ListWriteOffLimit');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(915, '/setup', '/editWriteOffLimit', 'EditWriteOffLimit');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(916, '/setup', '/listTPI', 'ListTPI');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(917, '/setup', '/editTPI', 'EditTPI');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(918, '/setup', '/listRecStatus', 'ListRecStatus');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(919, '/setup', '/editRecStatus', 'EditRecStatus');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(920, '/setup', '/listCloseCode', 'ListCloseCode');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(921, '/setup', '/editCloseCode', 'EditCloseCode');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(922, '/setup', '/listSupplierTypes', 'ListSupplierTypes');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(923, '/setup', '/editSupplierType', 'EditSupplierType');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(924, '/setup', '/listBanks', 'ListBanks');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(925, '/setup', '/editBank', 'EditBank');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(926, '/', '/listBankDeposits', 'ListBankDeposits');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(927, '/', '/viewBankDeposit', 'ViewBankDeposit');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(928, '/setup', '/listTask', 'ListTask');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(929, '/setup', '/listTemplates', 'ListTemplates');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(930, '/setup', '/editTemplate', 'Edit Template');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(931, '/setup', '/listSupplierServices', 'List Supplier Services');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(932, '/setup', '/editSupplierService', 'Edit Supplier Service');
-- UPDATE system_function SET MODULE = '/setup' WHERE SYSTEM_FUNCTION_ID >= 900 AND SYSTEM_FUNCTION_ID <= 930;

INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(1001, '/', '/listUsers', 'List all Users');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(1002, '/', '/editUser', 'EditUser');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(1003, '/', '/editMyInfo', 'EditMyInfo');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(1004, '/', '/changePassword', 'ChangePassword');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(1005, '/', '/resetPassword', 'ResetPassword');

INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(1101, '/', '/uploadActions', 'UploadActions');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(1102, '/', '/uploadFiles', 'UploadFiles');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(1103, '/', '/uploadFilesSave', 'UploadFilesSave');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(1104, '/', '/uploadFilesValidate', 'UploadFilesValidate');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(1105, '/', '/uploadUsers', 'UploadUsers');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(1106, '/', '/uploadSupplierInvoices', 'UploadSupplierInvoices');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(1107, '/', '/uploadSupplierInvoicesSave', 'UploadSupplierInvoicesSave');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(1108, '/', '/uploadBPay', 'UploadBPay');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(1109, '/', '/uploadBPaySave', 'UploadBPaySave');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(1110, '/', '/uploadDirectDebit', 'UploadDirectDebit');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(1111, '/', '/uploadDirectDebitSave', 'UploadDirectDebitSave');

-- dashboard
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(1200, '/', '/dashboard', 'Dashboard');

-- debtor
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(10000, '/debtor', '/', 'Debtors (All)');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(10001, '/debtor', '/list', 'List all Debtors');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(10002, '/debtor', '/edit', 'Edit Debtor');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(10003, '/debtor', '/view', 'View Debtor');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(10011, '/debtor', '/upload', 'Upload Debtors');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(10012, '/debtor', '/uploadSave', 'Upload and Save Debtors');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(10021, '/debtor', '/listMatter', 'List Matter');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(10022, '/debtor', '/addMatter', 'Add Matter');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(10023, '/debtor', '/editMatter', 'Edit Matter');

-- timesheet
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(20000, '/timesheet', '/', 'Timesheet (All)');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(20001, '/timesheet', '/find', 'Search Timesheet');
INSERT INTO system_function (SYSTEM_FUNCTION_ID, MODULE, NAME, DESCRIPTION) VALUES
(20002, '/timesheet', '/list', 'List Timesheet');

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

-- --------------------------------------------------------
--
-- Dumping data for table DBVERSION
--

INSERT INTO dbversion (DBVERSION, PREV_DBVERSION) VALUES ('ELIXIR.01.105', NULL);
