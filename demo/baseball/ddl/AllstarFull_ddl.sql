-- ----------------------------
--  Table structure for `AllstarFull`
-- ----------------------------
-- DROP TABLE IF EXISTS `AllstarFull`;
CREATE TABLE IF NOT EXISTS `AllstarFull` (
  `playerID` varchar(64) NOT NULL,
  `yearID` int(11) NOT NULL,
  `gameNum` int(11) DEFAULT NULL,
  `gameID` varchar(64) NOT NULL,
  `teamID` varchar(64) NOT NULL,
  `lgID` varchar(64) NOT NULL,
  `GP` int(11) DEFAULT NULL,
  `startingPos` varchar(64) DEFAULT NULL,
  PRIMARY KEY(`playerID`, `yearID`, `gameID`, `teamID`, `lgID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

