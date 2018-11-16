-- ----------------------------
--  Table structure for `ManagersHalf`
-- ----------------------------
-- DROP TABLE IF EXISTS `ManagersHalf`;
CREATE TABLE IF NOT EXISTS `ManagersHalf` (
  `playerID` varchar(64) NOT NULL,
  `yearID` int(11) NOT NULL,
  `teamID` varchar(64) NOT NULL,
  `lgID` varchar(64) NOT NULL,
  `inseason` int(11) DEFAULT NULL,
  `halfID` int(11) DEFAULT NULL,
  `G` int(11) DEFAULT NULL,
  `W` int(11) DEFAULT NULL,
  `L` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  PRIMARY KEY(`playerID`, `yearID`, `teamID`, `lgID`, `halfID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

