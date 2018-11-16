-- ----------------------------
--  Table structure for `CollegePlaying`
-- ----------------------------
-- DROP TABLE IF EXISTS `CollegePlaying`;
CREATE TABLE IF NOT EXISTS `CollegePlaying` (
  `playerID` varchar(64) NOT NULL,
  `schoolID` varchar(64) NOT NULL,
  `yearID` int(11) NOT NULL,
  PRIMARY KEY(`playerID`, `schoolID`, `yearID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

