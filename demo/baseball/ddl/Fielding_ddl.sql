-- ----------------------------
--  Table structure for `Fielding`
-- ----------------------------
-- DROP TABLE IF EXISTS `Fielding`;
CREATE TABLE IF NOT EXISTS `Fielding` (
  `playerID` varchar(64) NOT NULL,
  `yearID` int(11) NOT NULL,
  `stintID` int(11) DEFAULT NULL,
  `teamID` varchar(64) NOT NULL,
  `lgID` varchar(64) NOT NULL,
  `POS` varchar(64) DEFAULT NULL,
  `G` int(11) DEFAULT NULL,
  `GS` varchar(64) DEFAULT NULL,
  `InnOuts` varchar(64) DEFAULT NULL,
  `PO` int(11) DEFAULT NULL,
  `A` int(11) DEFAULT NULL,
  `E` int(11) DEFAULT NULL,
  `DP` int(11) DEFAULT NULL,
  `PB` varchar(64) DEFAULT NULL,
  `WP` varchar(64) DEFAULT NULL,
  `SB` varchar(64) DEFAULT NULL,
  `CS` varchar(64) DEFAULT NULL,
  `ZR` varchar(64) DEFAULT NULL,
  PRIMARY KEY(`playerID`, `yearID`, `stintid`, `teamID`, `lgID`, `POS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

