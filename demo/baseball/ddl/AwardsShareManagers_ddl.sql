-- ----------------------------
--  Table structure for `AwardsShareManagers`
-- ----------------------------
-- DROP TABLE IF EXISTS `AwardsShareManagers`;
CREATE TABLE IF NOT EXISTS `AwardsShareManagers` (
  `awardID` varchar(64) NOT NULL,
  `yearID` int(11) NOT NULL,
  `lgID` varchar(64) NOT NULL,
  `playerID` varchar(64) NOT NULL,
  `pointsWon` int(11) DEFAULT NULL,
  `pointsMax` int(11) DEFAULT NULL,
  `votesFirst` int(11) DEFAULT NULL,
  PRIMARY KEY(`awardID`, `yearID`, `lgID`, `playerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

