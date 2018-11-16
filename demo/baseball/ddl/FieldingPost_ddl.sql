-- ----------------------------
--  Table structure for `FieldingPost`
-- ----------------------------
-- DROP TABLE IF EXISTS `FieldingPost`;
CREATE TABLE IF NOT EXISTS `FieldingPost` (
  `playerID` varchar(64) NOT NULL,
  `yearID` int(11) NOT NULL,
  `teamID` varchar(64) NOT NULL,
  `lgID` varchar(64) NOT NULL,
  `roundID` varchar(64) DEFAULT NULL,
  `POS` varchar(64) DEFAULT NULL,
  `G` int(11) DEFAULT NULL,
  `GS` int(11) DEFAULT NULL,
  `InnOuts` int(11) DEFAULT NULL,
  `PO` int(11) DEFAULT NULL,
  `A` int(11) DEFAULT NULL,
  `E` int(11) DEFAULT NULL,
  `DP` int(11) DEFAULT NULL,
  `TP` int(11) DEFAULT NULL,
  `PB` varchar(64) DEFAULT NULL,
  `SB` varchar(64) DEFAULT NULL,
  `CS` varchar(64) DEFAULT NULL,
  PRIMARY KEY(`playerID`, `yearID`, `teamID`, `lgID`, `roundID`, `POS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

