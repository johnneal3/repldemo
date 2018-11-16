-- ----------------------------
--  Table structure for `TeamsFranchises`
-- ----------------------------
-- DROP TABLE IF EXISTS `TeamsFranchises`;
CREATE TABLE IF NOT EXISTS `TeamsFranchises` (
  `franchID` varchar(64) NOT NULL,
  `franchName` varchar(64) DEFAULT NULL,
  `active` varchar(64) DEFAULT NULL,
  `NAassoc` varchar(64) DEFAULT NULL,
  PRIMARY KEY(`franchID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

