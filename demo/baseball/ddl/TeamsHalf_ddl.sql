-- ----------------------------
--  Table structure for `TeamsHalf`
-- ----------------------------
-- DROP TABLE IF EXISTS `TeamsHalf`;
CREATE TABLE IF NOT EXISTS `TeamsHalf` (
  `yearID` int(11) NOT NULL,
  `lgID` varchar(64) NOT NULL,
  `teamID` varchar(64) NOT NULL,
  `HalfID` int(11) DEFAULT NULL,
  `divID` varchar(64) NOT NULL,
  `DivWin` varchar(64) DEFAULT NULL,
  `Rank` int(11) DEFAULT NULL,
  `G` int(11) DEFAULT NULL,
  `W` int(11) DEFAULT NULL,
  `L` int(11) DEFAULT NULL,
  PRIMARY KEY(`yearID`, `lgID`, `teamID`, `HalfID`, `divID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

