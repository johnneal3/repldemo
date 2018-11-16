-- ----------------------------
--  Table structure for `Salaries`
-- ----------------------------
-- DROP TABLE IF EXISTS `Salaries`;
CREATE TABLE IF NOT EXISTS `Salaries` (
  `yearID` int(11) NOT NULL,
  `teamID` varchar(64) NOT NULL,
  `lgID` varchar(64) NOT NULL,
  `playerID` varchar(64) NOT NULL,
  `salary` int(11) DEFAULT NULL,
  PRIMARY KEY(`yearID`, `teamID`, `lgID`, `playerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

