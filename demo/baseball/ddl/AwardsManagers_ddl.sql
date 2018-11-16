-- ----------------------------
--  Table structure for `AwardsManagers`
-- ----------------------------
-- DROP TABLE IF EXISTS `AwardsManagers`;
CREATE TABLE IF NOT EXISTS `AwardsManagers` (
  `playerID` varchar(64) NOT NULL,
  `awardID` varchar(64) NOT NULL,
  `yearID` int(11) NOT NULL,
  `lgID` varchar(64) NOT NULL,
  `tie` varchar(64) DEFAULT NULL,
  `notes` varchar(64) DEFAULT NULL,
  PRIMARY KEY(`playerID`, `awardID`, `yearID`, `lgID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

