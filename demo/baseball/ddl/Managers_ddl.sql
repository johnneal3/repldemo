-- ----------------------------
--  Table structure for `Managers`
-- ----------------------------
-- DROP TABLE IF EXISTS `Managers`;
CREATE TABLE IF NOT EXISTS `Managers` (
  `playerID` varchar(64) NOT NULL,
  `yearID` int(11) NOT NULL,
  `teamID` varchar(64) NOT NULL,
  `lgID` varchar(64) NOT NULL,
  `inseasonID` int(11) DEFAULT NULL,
  `G` int(11) DEFAULT NULL,
  `W` int(11) DEFAULT NULL,
  `L` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `plyrMgr` varchar(64) DEFAULT NULL,
  PRIMARY KEY(`playerID`, `yearID`, `teamID`, `lgID`, `inseasonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

